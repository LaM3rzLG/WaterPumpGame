# Gotchas from practice — building a real GE game

Findings from an extended build session (a `GE`-based tile game: animated
sprite pool, moving masked sprites over a dynamic playfield, palette effects).
All verified against one real `trse -cli` + 2026 `GE.tru` install by building
and running. Treat as strong priors, not universal law — but they cost hours
each to discover.

## TRSE codegen / language

### `Storing writetype index not supported yet` — indexed store of a typed field
`arr[i] := <expr containing a GE::Sprite field>` is a **fatal codegen error**
(`Fatal error on line: N`, no recovery). Hits pointer fields (`Sprite.Data`,
`Sprite.AnimSet`) **and** integer fields (`Sprite.Position`, `Sprite.Size`),
whether assigned directly or inside an expression
(`arr[i] := arr[i] + Sprite.Size` also fails). Also fired on
`array[N] of GE::Sprite` with `Pumpak[i].Data := ...`.

**Workaround — launder through a plain scalar/const first:**
```
poz := Sprite.Position;   arr[i] := poz;                 // OK
const PHASE_SZ = 16;      arr[i] := arr[i] + PHASE_SZ;    // OK  (not `+ Sprite.Size`)
faz0 := Sprite.AnimSet;   arr[i] := faz0;                 // OK  (faz0 is `integer`)
```
Scalar lvalue is always fine: `Sprite.Data := arr[i]`, `faz0 := Sprite.AnimSet`.

**Related, softer:** a `GE::Sprite` byte field as the *direct left operand* of
`/` in an initializer (`gx0 := Meteor.X / 2;`) was observed to produce a
procedure that silently did nothing at runtime, while
`gx0 := (Meteor.X + 1) / 2;` (same field wrapped in an add first) worked. Not
fully pinned down, but the safe habit that fixed it: **launder sprite fields
into plain byte/int locals at the top of the procedure**
(`mx := Meteor.X; my := Meteor.Y;`) and do all arithmetic on the locals.
A build-once `array[N] of integer` phase-pointer / position table (filled from
these laundered scalars) then feeds the per-frame loop with zero field reads.

### `array[N] of GE::Sprite` + per-element `.Init()` → runtime corruption
Declaring a sprite pool as `array[MAX] of GE::Sprite` and calling
`Pumpak[i].Init(...)` in a loop *compiled* (method-call-on-array-element works),
but at **runtime produced total screen garbage**: the per-element `this` pointer
/ array stride is wrong, so `.Init()` (which writes ~39 bytes of class state via
`IX`) scribbles over GE's own globals (`ScreenAddr`, `SpriteListPtr`,
`MemAllocPtr`) — every subsequent draw then targets random memory.
`Pumpak[i].Visible := False` also silently didn't take.

**Do not build a sprite pool as `array of GE::Sprite`.** Use **one shared
"stamp" sprite** (Init once, `Visible` irrelevant) + **parallel data arrays**
(`Pumpa_X[]`, `Pumpa_Y[]`, `Pumpa_Pos[]`, `Pumpa_Faz[]` — SoA), and per element
set `Sprite.Position`/`Sprite.Data` then `Sprite.Put`. Byte-array indexing
(`Pumpa_X[i]`) is also much faster on Z80 than record-array indexing
(`base + i*recsize`, where recsize isn't a power of two).

### Global `boolean` written in one proc, read in another → compiler CRASH
Not an error message — the `trse` process **crashes** (`exit code 3221225477` /
`0xC0000005` access violation) mid-build. Reproduced with a
`KeretFrissitendo: boolean` flag set in one procedure and tested in another.
Fix: keep such flags as **locals**, fold the producer + consumer into a single
procedure. Local booleans are fine. (Byte flags across procs seem OK; the crash
was specific to `boolean`.)

### `mod` exists — the `a - (a/b)*b` dance was over-caution
`a mod b` compiles and works on TVC/Z80. Older project code used
`a - (a/b)*b` because `mod` was "unconfirmed"; both emit the same division
routine. Use `mod`.

### Mixed byte/integer arithmetic overflows in byte context
`Meteor_TriggerFrame := 100 + (Rnd mod 200)` where the target is `integer` but
the RHS is computed in byte: `100 + 199 = 299` wraps. Put one operand in an
`integer` local first, or split into steps (`x := Rnd mod 200; x := x + 100`).

### Compound `if`
`if (A) and (B) then` → `Expected THEN`. Needs `if ((A) and (B)) then`.
`if ((A) and (B) and (C)) then` → `Expected RPAREN but found AND` — only **one
`and` per paren pair**. Three conditions → nested `if`.

### Array size must be a `const`
`array[MAX_PUMPAK] of ...` needs `const MAX_PUMPAK : byte = 160;`, not a plain
`byte` variable. Expressions of consts/literals work (`array[18*30]`).

### `fori` loop keyword
`fori i := 1 to N do ...` — TRSE's counting loop; nests fine
(`fori y:=1 to 18 do fori x:=1 to 30 do begin ... end;`).

### `case` on an indexed array/record field → `Could not find variable`
`case arr[i].Field of ...` (`i` a local loop variable) fails to compile with
`Could not find variable 'i'`, even though the identical expression works
fine inside `if (arr[i].Field = 1) then`. Same family as the writetype-index
issue below — launder through a scalar first:
```
v := arr[i].Field;
case v of
  1: ...
end;
```

### `ldi`/`ldd`/`ldir`/`lddr` silently decrement `BC` — never reuse a "stashed constant" in it
These instructions treat `BC` as their own byte counter and decrement it on
every execution, regardless of what you put there. Loading `BC` once with a
row-stride constant for a hand-rolled sprite blit and reusing it across
several `ldi`s **silently drifts** (each `ldi` steals 1 from it) — the
symptom is a sprite that looks torn apart / smeared sideways on screen, not
a compile error or crash. Reload `ld bc,<stride>` fresh immediately before
every use that follows one or more `ldi`s in the same routine.

### Storing into `array of integer` via a 16-bit index variable → silently broken codegen
`sometab[idx] := value;` where `sometab` is `array[N] of integer` (2-byte
elements) and `idx` is itself `integer` (not `byte`) **compiles cleanly but
generates wrong code**: the emitted sequence loads the array's base address
into `HL`, then the very next instruction **overwrites `HL` with `idx`**,
discarding the base address before it's ever used. The store lands at a
near-random address (derived from whatever `A` held from the *previous*
statement) — total silent failure at runtime, no build or crash error.
Reproduced filling a 540-entry `array[18*30] of integer` lookup table from an
`integer` loop counter; the *read* side of the same table, hand-written in
`asm`, worked fine — only the plain-Rascal `:=` *write* side broke. A
byte-element array with an `integer` index was NOT affected (seen working via
array-of-record decomposition, see above) — this looks specific to needing a
`*2` scale step during the store. **Workaround: hand-write the store in `asm`**,
same `add hl,hl` (double) + base-add technique as a hand-written read:
```
asm("
    ld hl,[MyUnit_idx]
    add hl,hl
    ld bc,MyUnit_sometab
    add hl,bc
    ex de,hl
    ld hl,[MyUnit_value]
    ld a,l
    ld (de),a
    inc de
    ld a,h
    ld (de),a
");
```
(`idx`/`value` must be unit-level `var`s here, not procedure locals — see the
`class`-writing section below for why they need a stable, prefixed name.)

## Writing your own `class` in a custom unit (hand-ASM, GE::Sprite-style)

`class` is a real, working TRSE construct — undocumented in the language
reference, but `GE::Sprite`/`GE::Image` are ordinary examples of it. Worth
declaring your own in a custom `.tru` unit when you want a cheaper,
size-specialized alternative to a generic engine routine (e.g. a `Put()` for
one fixed sprite size, skipping the runtime setup a general-purpose one needs).

**Syntax** — inside a unit's `var` block, shaped like a `record` with
procedures mixed in with the fields:
```pascal
Unit MyUnit;
var
    MySprite = class
                X, Y      : byte;
                Position  : integer;
                Data      : integer;

                procedure SetPosition();
                begin
                    asm("...");
                end;
    end;
```
Field declaration order fixes the `(IX+offset)` layout for hand-written `asm`
methods — byte fields take 1 byte, `integer`/`pointer` take 2 (low byte
first), offsets accumulate from 0 (exactly like `GE::Sprite`'s own documented
field-offset table).

**The `this` pointer is auto-generated per class, not per instance.** TRSE
creates one shared global named `<UnitName>_<ClassName>_this`; every
`instance.Method()` call site compiles to `ld hl,instance; ld
[UnitName_ClassName_this],hl; call UnitName_ClassName_Method`. Read it inside
a hand-written `asm` method body the same way `GE::Sprite`'s own methods do:
`ld IX,[MyUnit_MySprite_this]`, then `(IX+offset)` for fields. (Reverse-
engineered from `GE::Sprite`'s own `asm` bodies — `GE_Sprite_this` is never
explicitly declared anywhere; it's compiler-generated.)

**Unit-level auto-prefixing applies even to your own unit's `asm` text.** By
default TRSE prefixes *every* symbol a `.tru` unit declares with
`<UnitName>_` in the final assembly (disable per-symbol with `@donotprefix`,
or unit-wide with `@donotprefixunit` — see `references/language/directives.md`).
Concretely:
- **Declare with the bare name** (`X`, `MySprite`, `Idx`) — Rascal-level code
  and `global`-parameter declarations in the same unit never spell out the
  prefix themselves.
- **Reference from `asm` with the fully prefixed name** (`[MyUnit_X]`,
  `[MyUnit_MySprite_this]`, `[MyUnit_Idx]`) — raw `asm` text bypasses normal
  symbol resolution, so it needs the name exactly as it lands in the
  compiled output.
- **Don't write the unit's own prefix into a declaration.** Declaring a
  parameter as `MyUnit::Idx : global integer` *inside* `Unit MyUnit` double-
  prefixes it (`MyUnit::Idx` already reads as `MyUnit_Idx`; the automatic
  pass then adds `MyUnit_` again → `MyUnit_MyUnit_Idx`, "could not find
  variable"). The `GE::X`-style qualified parameter names seen inside
  `GE.tru` are that unit's author's own clarity convention, matched against
  pre-existing `GE::X`-style `var`-block globals declared the same way — they
  don't double-prefix *because* of that matching pre-declaration, not because
  self-qualifying is generally safe. Don't copy the style verbatim.

**A `global` parameter needs a pre-existing, separately declared `var` of the
same bare name — `global` binds, it does not create one.** Already documented
in `references/language/keywords.md`'s `global` entry (check it before wiring
up any `global` parameter — it would have saved a full build-error
round-trip here). In a custom unit this means every `global` parameter needs
its own plain `var` line first:
```pascal
var
    Idx  : integer;
    Data : integer;

procedure PutAt(Idx : global integer; Data : global integer);
begin
    asm(" ld hl,[MyUnit_Idx] ... ");
end;
```

**Concrete payoff — a hand-specialized `Put()` beats `GE::Sprite.Put()`.**
`GE::Sprite.Put()` is generic: at runtime it self-modifies a jump target
based on the sprite's actual `Width`/`Height` (~200+ T-states of setup)
before the row-copy loop runs. A `class` written for one fixed, compile-time-
known size skips all of that — fully unroll the row loop, no self-
modification, no runtime size lookup. T-state totals below were obtained by
reading the generated `.asm` and summing Z80 instruction timings (no
oscilloscope/profiler available) — treat as comparative, not certified:
- Generic `GE::Sprite.Put()`, one 2×8-byte (16-byte) sprite: **~811 T-states**
  (~200 T self-modifying setup + ~600 T copy).
- Hand-specialized, fully-unrolled `Put()` for the *same* fixed 2×8 size:
  **~555 T-states** (no setup beyond loading 4 fields via `(IX+d)`).
- Replacing the per-object `SetPosition()` call too (~205 T, a `Y*64`
  shift-multiply) with a **precomputed screen-address lookup table**
  (`array[gridCells] of integer`, filled once at startup, indexed directly by
  grid position instead of recomputed from X/Y) drops the total per-draw cost
  to **~543 T-states** (table lookup + blit, zero multiplies at draw time) —
  this is the same "precompute a grid→screen-address table" trick noted above
  for `GE::Sprite.Position`, just carried all the way through a fully custom
  sprite type instead of piggy-backing on `GE::Sprite`.

### `GE::Sprite.Draw()` (masked) is ~5-8× the per-byte cost of `.Put()` (unmasked)
`Put()` copies with straight-line `ldi`s (~16 T/byte). `Draw()` (masked)
can't: it must read the screen byte, AND it with the mask, OR in the sprite
byte, then write it back — byte by byte (~60-70 T/byte). Combined with a
masked sprite's mask doubling its raw byte count for the same pixel
dimensions, a moving masked overlay (a cursor, say) is inherently far more
expensive per frame than an equivalently-sized unmasked `Put()` stamp —
budget accordingly, and reach for `Draw()`/masking only when the sprite
genuinely needs to show background through it.

### `GE::WriteText`'s glyph lookup is a linear scan, not an index
Locating a character's bitmap in the charset image costs one `add hl,bc; dec
a; jp nz` loop iteration **per unit of `(char code − 32)`** — a digit
('0'-'9', ASCII 48-57) costs 16-25 iterations (~500-600 T-states) just to
find the glyph, before the per-row blit even starts. Redrawing a HUD number
(even just a couple of digits) unconditionally every single frame is not
free — if the value hasn't changed since last frame, skip the `WriteText`
call rather than calling it unconditionally in the main loop.

## GE.tru specifics learned by reading the source

### `Sprite.X` is in BYTES, `Sprite.Y` in pixels
`SetPosition` does `Position := ScreenAddr + Y*64 + X` — `X` is added as a raw
byte offset (GR4: 1 byte = 4 px), `Y` as scanlines. Cursor at
`(gx*2)-1` (byte) is **4 px** left of the cell, not 1 px.

### `Sprite.Position` and `Sprite.Data` are directly writable
`Put`/`Draw` read `IX+6/7` (Position) and `IX+2/3` (Data) only — never
recompute from X/Y. So you can precompute a grid→screen-address table once and
per frame just `Sprite.Position := PosTab[i]; Sprite.Data := PhaseTab[faz];
Sprite.Put` — no `SetPosition`, no multiply.

### Masked sprite (`SpriteType=2`) phase stride is `Width*Height*2`
`Sprite.Size` (set by `Init`) is `Width*Height` only. A masked animation phase
is twice that (mask byte + data byte per pixel-column). Built-in `Animation()`
advances by `2*Size` for masked; manual `AnimSet + faz*Size` lands mid-phase.
Use `AnimSet + faz*(Width*Height*2)`.

### Masked `Draw` needs a background buffer or it corrupts $0000
`Draw` unconditionally writes the saved-background pointer. `Init(..., False)`
→ that pointer is 0 → every `Draw` writes to `$0000` (live system RAM, near the
reset vector). **Always `Init(..., True)` for any sprite you `Draw`.** `Put`
(non-masked) is fine with `False`.

### `RenderAllSprites` — why the rotating-chunk pool exists
`SpriteList` is a fixed **100 slots** (every `Sprite.Init` appends). One
`RenderAllSprites()` call restores every `Visible`+buffered sprite (reverse
init-order), then redraws **every** visible sprite (forward init-order = z-order)
— no dirty tracking. For a big animated pool that's N Puts/frame with no cap;
the manual "rotate a fixed-size chunk of the pool per frame" pattern exists
precisely to bound Puts/frame independent of pool size. `RenderAllSprites` is
right for a handful of moving sprites, not a 60–160 pool.

## Sprite `.bin` format (GR4) — fully decoded

- 3-byte header: `type, width_in_bytes, height_in_rows`.
- `type=1` non-masked: `width` data bytes per row.
- `type=2` masked: `width` **(mask, data)** byte-pairs per row (2× data).
- GR4 = 1 byte / 4 px. Pixel n (0..3, left→right) colour =
  `bit(7-n)*1 + bit(3-n)*2` (high nibble = colour low bit, low nibble = colour
  high bit). Matches `GR4_COLOR0..3 = 0x00,0xF0,0x0F,0xFF`.
- Masked mask byte: a pixel is **transparent** iff its bit is set in *both*
  the high and low nibble position; **opaque** iff clear in both.
  → A masked sprite CAN carry **opaque colour-0 (grey) pixels** (mask 0, data 0):
  the mask decides transparency per pixel, independent of colour. Useful for
  highlights that read only over non-grey content.
- Multi-phase file = header once, then phases concatenated (like `Pumpa.bin`:
  `01 02 08` + 8×16 bytes). `AnimSet := #Data + 3`.

### BMP → `.bin` converter (works well, reusable)
A 4-colour BMP whose palette maps exactly to the game palette
(e.g. `#C0C0C0`→0 grey/transparent, `#000000`→1, `#04FF04`→2, `#0000FF`→3),
width a multiple of 4 px: read with `System.Drawing`, map each pixel RGB→index,
emit header + per-row `(mask,data)` pairs (grey → mask `FF`/data `00`; else
mask `00`, data = colour bits). Multi-phase: loop the BMPs, header once, phases
back-to-back. Hand-authoring pixel art in a PS `char[]` grid + an encoder also
works but the BMP route is faster once the artist iterates.

## Rendering technique (dynamic playfield + moving masked sprite)

- **A moving masked sprite's background buffer goes stale** whenever the
  playfield changes under it between save and restore. Things that self-heal:
  pooled pumps (rotating-chunk redraw), virus (its own random per-frame update).
  Things that **don't**: static tiles (walls). A wall placed under a passing
  sprite gets "erased" by the sprite's next `RestoreBackground` and never comes
  back — needs an explicit "redraw the static layer from map data" pass
  (either a small window around the sprite each frame, or the whole layer once
  when the sprite is done).
- **Two overlapping masked sprites, each with its own buffer** → ghost images /
  holes unless you hand-roll `RenderAllSprites` ordering for the pair:
  `A.Restore; B.Restore;` (reverse z) → redraw the lower animated layer →
  `B: SetPosition/SaveBackground/Draw` → `A: SetPosition/SaveBackground/Draw`
  (A on top, every frame). Each buffer then holds exactly the layers below it.
- **Palette effects are free and instant**: GR4 stores 2-bit indices, not RGB.
  `GE::SetPalette(idx, colour)` reprograms one of 4 registers → every pixel with
  that index recolours on the next raster, no redraw. Good for "meteor
  incoming" (dim a colour), damage flashes, day/night. TVC has 16 fixed colours
  (`PALETTE_*`), no true mid-grey between `GRAY` and `BLACK`.
- **`HUD_NumN` leading-zero trick**: extract each decimal digit and write it
  individually (`IntToStr`/`ByteToStr` of a single 0..9 digit = exactly 1 char)
  at `x, x+2, x+4, ...`. The leading zeros draw themselves; the shorter value
  overwrites the previous longer one's positions → no clear, no flicker. Beats
  `FillRect`-then-write (which flickers when called every frame).

## More lessons (WaterPumpGame, 2026-09-14 .. 09-26)

### `Sprite.RestoreBackground()` restores to `LastPosition`, not `Position`
`SaveBackground` reads from `Position` (IX+6/7), `RestoreBackground` writes to
`LastPosition` (IX+8/9). Nothing syncs them except `UpdateLastPos()` (and `Init`).
In every moving-sprite loop (Restore → Move → Save → Draw) call `UpdateLastPos()`
right after `Draw`, or the sprite "leaves a trail" (old images never erased).

### Overlapping masked sprites: keep the z-order at EVERY draw site
Two masked sprites with their own background buffers (cursor + meteor, two
cursors) only stay clean if each draw follows: top layer Restore → lower layer
Restore → redraw animated background → lower Save+Draw → top Save+Draw. This
includes one-off places (a sprite's *first* appearance, placing an object under
the cursor). One missed site (meteor spawn saving its background while the cursor
was still drawn) left a stuck piece of the cursor on screen.

### Sprite-array field writes: offset bug
`Parts[i].X := ..` on an `array of GE::Sprite`: with a byte index the element
offset (i*39) is truncated to 8 bits (`mul_8x8`), and even with an integer index
one field offset was generated wrong (index added instead of the field offset).
Method calls (`Parts[i].Init/Draw/SetPosition`) are fine. Write fields through a
small asm helper (element = base + i*39, then `(IX+15)` = X, `(IX+16)` = Y).
Check the `.asm` for `call mul_8x8` near such writes.

### Running the whole game in `MEM_48K_VID` ($90 = U0,U1,VID,U3)
After `GE::Init` (which installs GE's own IRQ handler at $38 in U0) GE never calls
the ROM, its internal paging (ClearScreen, back-screen copy) restores the CURRENT
mapping from ($3), and the digi-sound IRQ reads samples with plain `ld a,(hl)`.
So `GE::SetMemory(GE::MEM_48K_VID)` right after `GE::Init` and leaving it on lets
sprite `.bin`s and digi samples live in U3 via `incbin("x.bin", $C000..)` with NO
per-draw paging. Never set it before `GE::Init` (the TVC ROM IRQ would jump into
missing ROM). Caveat: `incbin` at fixed addresses has no overlap check — reserve
slots (e.g. 256 bytes each) and watch the sizes. The `.cas` becomes one block with
padding up to $C000 (longer load).

**Loading a data file into U3 at run time (Befosas, 2026-10-12, confirmed from a
`.dsk` in WinTVC + hbf.rom, NOT fast-load):** `TVC::OpenFile(#Name)` (length-
prefixed name) / `TVC::BlockRead(ptr, len)` / `TVC::CloseFile()` into a buffer
BELOW $8000 (e.g. $7000), before `GE::Init`; then `GE::Init` +
`SetMemory(MEM_48K_VID)` and copy to $Cxxx with a plain TRSE pointer loop
(`Cel[0] := Puffer[0]; Puffer := Puffer + 1; ...` compiles to correct code). Direct
load into U3 is impossible: every `rst $30` call pages SYS into $C000 for its
duration. Use case: one level per file into a fixed map slot (10 levels of 2.5 KB
do not fit in memory). Test program: `Befosas\PalyaTeszt.ras`.

**That padded `.cas` (52 KB, block reaching $E656) does NOT load on a real TVC**
(user report, 2026-10-03/05) — the emulator accepts it, the machine stops with
"No memory". The project's chosen fix is a multi-file loader (small stub + data
files, not built yet). An untested-on-hardware single-file alternative
("stage in U2, copy to U3"), later dropped by the user:
- pack all U3 data into ONE file and `incbin("u3.bin", $7A00)` it right after the
  code (address just above `EndBlock19ef`; the tail may run past $8000 — at load
  time, default paging $70, that is U2 RAM);
- declare every former `incbin(..., $Cxxx)` as `Name : array[size] of byte at $Cxxx`
  (emitted as `equ`, so `#Name`, `#Name+3` and asm references keep working);
- FIRST thing in the init, before `GE::Init`/`SetGraphics`:
  `di / ld a,($3) / push af / ld a,$B0 / out ($2),a / ld hl,Blob / ld de,$C000 /
  ld bc,len / ldir / pop af / out ($2),a / ei` ($B0 = U0,U1,U2,U3).
Result: contiguous `.cas`, no padding (WaterPumpGame: 52 471 -> 30 173 bytes, sound
and levels kept). Needs a 64K machine; code must stay below the blob address.
Generate the variant with a script from the main source instead of hand-editing
(`resources\watervas_build.ps1` in WaterPumpGame). Real-machine result: pending.
Caveat (2026-10-05): after an unrelated unit change the generated variant started
crashing trse.exe (0xC0000005) while the main source still compiled - the compiler
crash is layout-sensitive; unresolved.

### Hand-unrolled blits: COUNT the rows in the generated `.asm`
A fully unrolled 8-row sprite blit (`ldi ldi` + `ex de,hl / ld bc,62 / add hl,bc /
ex de,hl` per row) had only 7 row copies in one routine and 6 in its sibling - for
weeks. It went unnoticed because the old artwork had an empty bottom row; the menu
(GE `Put`) drew the same sprite correctly, which is what gave it away once new art
used the last row. A "torn/incomplete graphics, root cause unknown" report from the
sibling routine was the same bug. After writing or editing unrolled code, count the
copy pairs between the routine's labels in the `.asm` (rows x bytes-per-row `ldi`s),
and test with a sprite that has pixels in the first AND last row/column.

### Free low RAM for runtime-filled arrays: `array[..] of .. at $addr`
Arrays that the program fills itself (map, lookup tables) can be placed outside the
program image: `Map : array[540] of byte at $0BF0;` compiles to an `equ`, costing 0
bytes of the `.bin`. GE-documented free areas: 3056–3655 (only if no ROM file I/O),
3756–5299 (below the stack), 5804–5887, 6624–6638. Fill them only after `GE::Init`.

### Software division/mod is expensive in hot loops
`x mod 30` compiles to `div_16x8` (16-iteration loop) + `mul_8x8`; ~600–1000 T each.
For a random cell use one `Random1` call and scale by shifts:
`x = (rnd_hi * 30) >> 8`, `y = (rnd_lo * 18) >> 8` (≈200 T in asm, tiny bias).
A 6-sample-per-frame virus model went from ~16k T to ~1.5k T per frame this way.

### Main-program procedures with `global` params
`procedure Ir(Ir_X, Ir_Y : global byte; Ir_Szoveg : global ^byte);` works in the
main `.ras` too: declare vars with the same names first; asm refers to them by the
plain name (`[Ir_X]`), no unit prefix. String literals pass fine to `^byte`.

### Raster timing with `GE::SetRasterInterruptPos`
`WaitForSync` = `halt` until the cursor IRQ (default line 239). If a frame redraws a
sprite near the top after a bottom-of-screen sync, the beam catches the half-drawn
state (flicker). Move the IRQ just below the sprite being redrawn
(`SetRasterInterruptPos(spriteY + height)`, max 239) and restore 239 afterwards.
Border colour (`GE::SetBorder`) around code sections is a cheap raster profiler.

### Custom proportional text renderer (replacing `GE::WriteText`)
Font file = 1 byte height + 91 width bytes (ASCII 32..122, 1 or 2 bytes each) + image
(91*2 bytes wide, row-major). The renderer copies only `width` bytes per row
(source stride 182, screen stride 64) and returns the next free column, so HUD
labels/numbers chain (`Ir(x,y,"PUMP:"); HUD_Num3(n, Ir_X, y)`). No pixel shifting,
byte-aligned. Saved ~1.4 KB vs GE text + `ByteToStr/IntToStr`. Note: 4-px-wide
glyphs (3 px + gap) are too small for M/W/Q — the owner rejected small glyphs as
ugly; keep 8 px unless explicitly redesigned.

### Per-line palette change (raster bars) without GE — verified on WinTVC (2026-10-01, `SzinSorok.ras`)
- After `TVC::SetGraphicsMode` (ROM VMODE) the cursor/raster IRQ is NOT at line 239 (observed ~line 173). Call `TVC::SetRasterInterruptPos(239)` right after it, otherwise the line-timed effect starts mid-screen.
- Stable recipe: own minimal ISR at `$38` (`JP isr`; `isr: out ($7),a / ei / ret`), `halt` = sync, then `di` + 72 lines wait (200 T/line) -> visible line 0, then exactly 200 T per line (`out ($61),a` = GRAPHICS2 ink). End the loop at line 239 and go straight back to `halt`.
- Horizontal position of the change: an extra `ld b,10 / djnz` (~125 T) after the 72-line wait moved the colour step into the horizontal blank (no visible step).
- Frame length on TVC: CRTC R4=77, R5=2 -> 78*4+2 = **314 lines = 62800 T** (WinTVC title shows "314i"). Lines after the 239-line IRQ to visible line 0: 74.
- **`halt`-sync jitters 0..3 T per frame** (the CPU tests INT only every 4 T while halted) = 8..16 px horizontal shake in GRAPHICS2. Invisible if colour changes fall in the horizontal blank, but mid-line palette changes shake. Fix (verified, image stands): sync ONCE with `halt`, then run with `di` forever in a cycle-exact 62800 T frame loop (`SzinGyors.ras`).
- Fastest mid-line palette change: preloaded registers + `out (c),r` = 12 T = 6 bytes = 48 px in GRAPHICS2 (14 changes fit in a 200 T line with an `exx`/`djnz` line counter).
- Writing video RAM (ldir) during the blank took ~90 T longer per frame than counted (288 bytes) -> probably VRAM wait states; a per-frame VRAM copy before a timed raster loop shifts/jitters the timing.
- **Stale IRQ before a one-shot `halt` sync:** after a long `di` section (e.g. filling VRAM) a raster IRQ request is already pending, so `ei; halt` wakes immediately at a random point (colours started ~66 lines early). Fix: `out ($7),a` (ack) then `ei; halt; halt` - the second halt is the real sync.
- Verified result (`SzinGyors.ras`, WinTVC): full-screen $FF, 14 x `out (c),r` per 200 T line -> 11 equal 48 px vertical stripes, stable, after one sync + 62800 T frame loop; phase offset after the sync = 4 T put the 1st out at the left edge of the visible area and the 32 T line overhead into the horizontal blank.

- **Function call compared with a VARIABLE in a condition is miscompiled (2026-10-02, WaterPumpGame):** `if (MyFunc(a, b)=px) then ...` -> TRSE loads `px` into B, then `call MyFunc` (which itself uses B), then `cp b` -> wrong result. Always store the result first: `k:=MyFunc(a, b); if (k=px) then ...`. Comparing with a constant (`=0`, `=1`) is fine (`cp n`).
- **`lo` / `hi` are reserved (built-in functions):** using them as variable names gives `Expected 'LPAREN' but found ':='`.
- **Digi sound left on -> `GE::WaitForSync` no longer waits a frame (2026-10-02, WaterPumpGame):** while `DigiSoundOn` is active, `halt` wakes on the ~4 kHz sound interrupt, so any loop using `WaitForSync` (menus, "press a key" waits) runs in "turbo". Always `DigiSoundOff` (or the game's `Digi_Le`) before entering a menu/wait loop - and watch for a sound started in the same frame you leave the game loop.
- **"Any key" on TVC with GE:** after `GE::GetKeyboard()` the 10-byte keyboard matrix at 2897..2906 is active-high (rows 8-9 = joystick 1/2); OR the 10 bytes in asm to detect any key/joystick input.
- **OrgAsm: no negative IX/IY displacement (2026-10-03):** `ld (IX-64),240` fails with "Unknown opcode: ld (**),*" - only positive offsets assemble (`(IX+0..127)`); restructure (point IX lower, or compute the other address into DE).
- **TRSE peephole optimizer touches hand-written asm:** a redundant first line of an `asm("...")` block (e.g. `ld hl,[X]` right after the compiler's own `ld [X],hl`) can be removed. Harmless when truly redundant, but don't rely on an asm line surviving for side effects/timing.
- **TRSE identifiers are case-insensitive (2026-10-03):** `const METEOR_FIGY` and `var Meteor_Figy` collide; assigning the var then fails with "Left value must be either variable or memory address, not a constant". Give consts a distinct name (e.g. `_IDO` suffix).
- **Integer `&` constant is miscompiled (2026-10-03):** `r:=r & 511` on an `integer` loads the mask into DE but emits NO `and` - the value is unchanged. Byte `&` works. Build 16-bit masks from bytes (e.g. `r:=RandomByte; if ((RandomByte & 1)=1) then r:=r+k`).
- **`int:=int+256` optimization emits a bad label** (`ld a,[ varPrefixed_r+1]`, assembly fails) when the var is a local named like `r`. Add through a variable: `k:=256; r:=r+k`. Always read the generated .asm for new integer arithmetic.
- **Compiler crash on `Sprite.Field := var - const` (2026-10-03):** `BombaIkon.Y:=w-1;` made trse.exe crash (exit -1073741819 / 0xC0000005, no message). Compute into a plain var first: `t:=w-1; BombaIkon.Y:=t;`. If the CLI build exits with that code, look for recently added expressions assigned to class/sprite fields.
- **More compiler crashes (0xC0000005, 2026-10-03):** `if (A) then begin .. end else if (B) then begin .. end;` and/or a chain of 4 nested `if .. then if .. then Proc(..)` crashed trse.exe. Flatten: compute a flag byte with simple `if`s, then one `if (flag=1) then ...`.
- **Compiler crash caused by a trailing comment (2026-10-03):** a long trailing `/* ... */` comment with accented letters, parentheses and quotes on an `if` line crashed trse.exe (0xC0000005) - even when the code line itself was commented out with `//` in front. The same line without the comment compiled. When the CLI build crashes, first strip the comments you just added; some earlier "crash" cases may have had the same cause.
- **Unexplained deterministic compiler crashes - how to bisect (2026-10-03):** some small, valid-looking additions in a big program crash trse.exe (0xC0000005) every time (e.g. `X:=0; if (A=1) then X:=1; if (B=1) then X:=1;` in the main loop, or a 2nd call site under nested `if`s), while adding the same number of comment lines does not (so it is not a size limit). Bisect by writing variant copies of the .ras as `tst_*.ras` and compiling each with the CLI; then restructure (e.g. move the decision into an init routine and reuse existing flags).
- **`array[..] of byte at $addr` can crash the compiler (2026-10-05, WaterPumpGame):** replacing two initialised byte arrays (level maps, read as `b:=Terkepek[ti]` with an integer index) by `Terkepek : array[748] of byte at $EF00;` crashed trse.exe (0xC0000005) - with either array alone, with a literal or expression size, and even at a low address - although other `at` arrays in the same program (`Map at $0BF0`, a buffer at `$E700`) compile. Working replacement: keep only an `incbin(file, $addr)` and read by address with a few asm lines (`ld hl,[Cim] / ld a,(hl) / inc hl / ld [Cim],hl / ld [B],a`), computing the address in Pascal from an integer VAR holding the base (`Cim:=Alap+ti`).
- **Program end must stay below `$8000` on TVC with GE direct-to-screen - and the build does not warn (2026-10-05):** check `EndBlock19ef` in the `.sym` after every build. A feature that "only" adds ~200 bytes pushed it to `$8004`. When close to the limit, measure by applying the change in stages on `tst_*.ras` copies and reading the symbol each time.
- **More 0xC0000005 crashes seen 2026-10-05:** (a) in one procedure `Meteor.Data:=Meteor_FazPtr_Tab[0];` or `Meteor.Data:=Meteor.AnimSet;` followed by `Meteor.SaveBackground/Draw` crashed (same code with another sprite, or without the Data line, compiled); (b) `faz:=faz & 7;` inside a new `begin..end` in a scan loop crashed, `if (faz>=8) then faz:=faz-8;` compiled - but test copies behaved inconsistently (removing one comment "fixed" it too). Treat these crashes as layout-dependent: bisect on copies, then pick ANY variant that compiles and verify its generated asm.
- **Tooling (PowerShell) when scripting source edits:** do not name a helper function `R` (or any alias such as `H`, `Sort`) - `R` is the alias of `Invoke-History`, so `R "old" "new"` silently runs the alias and the replacement never happens (the script then wrote a half-edited file). Use explicit names (`Rep`, `Csere`) and make every replace assert exactly one match before writing.
## Remaining general lessons (collected 2026-10-09 when starting a new project)

- **GE digi sound in practice:** `DIGI_TYPE_2x4BIT` byte = 2 samples, LOW nibble first, 8 = silence, 0 = end
  marker (no zero byte inside the sample). `DigiSoundOn` disables the raster/cursor IRQ and starts with a `halt`
  (sync) - never call it between a sprite's `RestoreBackground` and `Draw`. While on, use
  `GE::WaitForDigiSoundSync()` (one call can take ~2 frames, so a fixed loop count overshoots - poll
  `GE::Is2x4bitDigiSoundPlaying()` instead). `DigiSoundOff` leaves CRTC R11 changed -> call
  `SetRasterInterruptPos(239)` afterwards. Non-blocking pattern: a `Digi_Aktiv` flag + a `Frame_Sync()` that
  picks the right sync and switches digi off when the sample ends. WinTVC showed a constant ~1 s audio delay
  (also in a bare menu test) - emulator buffering, not code. Raster-IRQ effects and digi are mutually exclusive.
- **`@startblock $C000 "x" ... @endblock` does nothing on TVC** (compiles, the `.sym` shows the code unmoved).
  Only `incbin(file, address)` data placement works.
- **`Random::SetRSeed()` can produce a 0 seed** (one byte from R) and the xorshift then sticks at 0. Skip it;
  spin `RandomByte()` every frame in the title/menu loop - the player's reaction time is the entropy.
- **No `GE::ClearScreen` (or other GE paging routines) before `GE::Init`:** they page U3 RAM in where the TVC ROM
  IRQ handler expects ROM -> hang. Do ROM file calls before `GE::Init`, GE drawing after it.
- **CLI build output:** `trse.exe -cli ...` prints nothing to a plain PowerShell call; capture it with
  `Start-Process -Wait -PassThru -NoNewWindow -RedirectStandardOutput file`. Exit -1073741819 = compiler crash.
- **Edge-triggered input:** `GE::Pressed` is level-triggered; one action per press needs a `..._Volt` flag.
  When leaving a game loop with fire, wait until all keys are released, or the same press triggers the next screen.

## Lessons from the Befosas project (2026-10): hardware scroll + own Z80 unit

Full Hungarian write-up with details: `C:\TVC\TRSE_Projects\Befosas\docs\TVC_TRSE_altalanos_tudas.md` (sections on
hardware scroll, the two-screen pixel scroll, fast hand-asm routines). Working code: `Befosas.tru` / `Befosas.ras`
(approved version `Befosas_OK.*`). The points that bite:

- **`GE::Init` does not page in video RAM.** Without `GE::SetMemory(GE::MEM_48K_VID)` right after it, `Image.Put` /
  `Sprite.Put` / your own writes to `$8000` go to U2 RAM and nothing appears (only `ClearScreen` pages for itself).
- **A unit procedure called only from asm text (`call Unit_Proc`) is removed by the compiler** ("Symbol undefined").
  Keep the call at TRSE level (a TRSE loop calling asm procedures). Variables used only from asm survive (harmless
  "Unused variables" warning).
- **The peephole optimizer deletes hand-written asm lines it thinks are redundant, silently.** Seen: a second
  `ld b,4` in the same procedure after a `djnz` had zeroed B -> the loop ran 256 times. Work around by writing it
  differently (`ld a,4 / ld b,a`), and after every build diff the unit's asm lines against the generated `.asm`
  (`Befosas\resources\ellenoriz_asm.sh` does this). Placeholder operands for self-modifying code must look "real"
  (`add a,64`, `cp 255`, `jp other_label`), never `add a,0` / `jp 0`.
- **CRTC hardware scroll addressing (GRAPHICS16, 64 bytes/row):** start address +1 = 1 byte = 2 pixels. Byte column L
  of the scrolled picture starts at `$8000 + (L>>6)*256 + (L&63)`; every 64 columns the picture continues 4 rows
  lower, and column L+64 overwrites column L's memory -> redraw the entering column in BOTH directions and clear the
  4 rows above and below it. Vertical centring: move the CRTC start address back by (character rows above the picture) * 64
  instead of moving anything in memory. Raster interrupt = CRTC cursor (R14/R15).
- **Pixel-smooth horizontal scroll** (Bery's "Hóvágta" method, reverse-engineered): two screens in video RAM (base and
  1 pixel shifted, `+$2000` in memory), switch between them every step with the CRTC start address, draw ONE byte
  column per step into the screen about to be shown; visible height <= 128 lines. Byte-wise scroll (2 px/step) needs
  none of this and leaves the full 240 lines.
- **Fast drawing:** unrolled bodies entered in the middle via a self-modified `jp` (count * body size back from the
  end label; verify label distances in the `.sym` after each build); sprite data read with `pop` through SP under
  `di`/`ei`; row step `add hl,de` (DE=64) + `res 6,h`; loop end by comparing the buffer pointer's low byte. A masked
  12x20 sprite + background save went from ~15500 T to ~8000 T, restore from ~8700 T to ~3200 T (counted, not measured).
- **Negative screen rows for free:** a sprite row kept in a byte wraps correctly in the address maths because
  256 rows * 64 bytes = `$4000` = the video RAM size (mask with `$3FFF`). Keep the game-side coordinate offset
  (e.g. +64) so unsigned compares still work.
- **Mario-like jump without signed maths:** separate "rising" and "falling" phases, unsigned speed in quarter rows
  plus a 2-bit fraction accumulator; rising speed decreases by a small gravity while the button is held and a large
  one when released (variable height); falling speed increases up to a cap <= tile height so landing can snap to the
  tile top (`tile_row * tile_h - sprite_h`).

### Added 2026-10-10 (same project): frame timing, overlays, digi sound - all seen as real bugs, fixed, user-confirmed
- **Draw first, then game logic.** Main loop = wait for the raster interrupt -> draw what the PREVIOUS frame's logic
  computed -> run the logic for the next frame (it only computes; a `Draw_Needed` flag carries the result). Logic time
  varies (collision, animation), and when it ran before the drawing, the drawing raced the beam: sprite partly missing
  at the top of the picture, the CRTC start address set too late (that frame still shown with the old address while
  memory already held the new position -> a 1-byte glitch at the far edge, overlays jumping). Cost: 1 frame of input lag.
- **Order inside a scroll step:** restore the sprite background -> CRTC start address (early, but not as the very first
  instruction: the cursor/interrupt address moves too and a second interrupt can fire in the same frame while the beam
  is still on that character row) -> overlays (clock) -> sprite -> the entering map column last (the beam reaches the
  map later than the top of the picture when the interrupt sits at the map's bottom edge).
- **Hardware scroll drags everything in video RAM, including "empty" bands above/below the map.** A fixed HUD element
  must be redrawn at `H + x` every scroll step; drawing one blank byte column on each side of it erases the trail.
  A horizontal line next to the map must be rewritten by the entering column, and because column L+64 is the same
  memory 4 rows lower, clear 8 rows (not 4) above/below so the neighbour block's line byte does not show up.
- **Collision from the tile map, not from screen pixels** (the sprite itself and its saved background are on screen).
  One expensive column lookup (division by tile width) can serve several rows of the same column.
- **A second masked sprite without a second drawer:** temporarily swap width/height/data pointer and a buffer offset
  into the first sprite's variables around the draw/restore call; keep the two rectangles from overlapping (no layering).
- **GE digi sound + raster-timed drawing:** `WaitForDigiSoundSync` counts `SOUND_IT_50HZ` (77) sound interrupts, then
  switches the sound interrupt OFF and halts for the cursor interrupt - so frame sync stays at the cursor position
  (good), but the count is tuned for 4 kHz: at 8 kHz it is reached at half a frame and the sound is muted for the other
  half (chopped, twice as long). Use 4 kHz. `DigiSoundOn` itself starts with a `halt`, so call it IN PLACE of the frame
  wait. The handlers use the shadow registers (`exx`, `af'`) - own asm must not touch them. Turn digi off before
  time-critical drawing (the interrupt costs a large share of CPU). For GR16 text there is no charset: draw digits from
  an own column-wise bitmap table.

### Reading the build output: what TRSE writes into the Z80 `.asm` / `.sym` (verified 2026-10-16, Befosas)
Useful for size analysis, memory maps and checking fixed addresses (the PC tool built on it: tvc-utils skill, `memory-map.md`).
- **`.asm` has no resolved addresses** - only `org $X` and labels. Every label's address is in the `.sym`
  (`al  $1a14 .Befosas_Csempe_Sz`); `EndBlock<start>` there = end of each block (`EndBlock19ef` = end of code).
- **Code block starts at `$19EF` with a 20-byte BASIC stub** (`10 PRINT USR(6659)`); the code itself starts at `$1A03`.
- **Procedures are bracketed**: `; ***********  Defining procedure : X` ... label `X:` ... `end_procedure_X:` (also for unit
  procedures, inline-asm ones included; their own asm labels like `bf_id_w:` fall inside). Label size = next label's
  address - its own -> exact per-procedure byte counts. `ProgramInit` is TRSE's own; `mul_8x8`, `div_16x8`, `_Mod_*`,
  `z80_copy_mem` at the end are TRSE runtime routines (outside any procedure). The main program = `main_block_begin_` /
  `MainProgram_*` labels (in Befosas it is the single biggest item: 1589 bytes).
- **Naming**: main-program globals and procedures have NO prefix (`Ellen_Utem`); a unit's have `<Unit>_` (`Befosas_Cs_Ptr`,
  `GE_Width`) - even when the unit has the same name as the program. Variables placed `at $addr` become
  `Name equ $addr` lines (lower-case letters in the name); the all-upper-case `EQU`s are constants (`GE_KEY_A`, ports, colours).
- **Only what is used gets compiled**: GE's unused procedures are dropped, but their constants stay as `EQU`. Example:
  `GE_MIRROR_TABLE EQU $1700` is always present, yet the 256-byte mirror table (which would sit inside the stack area
  `$14B4`-`$19EE`) is only built/written if a mirroring GE sprite routine is compiled in - grep the `.asm` for a USE of
  `GE_MIRROR_TABLE` beyond the `EQU` line before assuming that memory is safe.
- GE / TVC variables in the `.asm` give the real workspace in use: TVC `$0E48`-`$0E6C`, GE `$0E70`-`$0EA7` (2026 GE.tru).
- `.sym` has duplicate names for incbin blocks (`.Fosos_Data` twice) - keep the first.

## TRSE compiler crash 0xC0000005 depends on code LAYOUT (2026-10-22, WaterPumpGame)
- Deterministic for a given file, but not tied to a statement: replacing an asm block with the same number of `nop`s still crashed; 20 and 45 `nop`s crashed, 70 did not. Trailing comments/line count did not matter.
- Practical workaround: append 1-8 `nop`s at the end of the newest asm block and keep the first variant that compiles (bisect with `tst_*.ras` copies, `assemble=no` is enough to see the crash).
- Also seen: an asm block at the START of a procedure (before any Rascal statement) crashed; Rascal statements first, asm last compiled. Passing `#Label+3` as a procedure argument and passing a procedure's own integer parameter on to another procedure crashed too - go through a global variable.
- File writing after `GE::Init`: `GE::EnableTVCITHandler`, paging `$70` (also store it in `($3)`), `TVC::CreateFile` / `BlockWrite` / `CloseFile`, then `GE::DisableTVCITHandler` + `GE::SetMemory(...)`; the source buffer must be visible under `$70` (U0/U1/U2).

- **`case` is NOT smaller or faster than an `if` chain (measured 2026-10-23, WaterPumpGame):** TRSE compiles `case x of` into the same compare chain the separate ifs give (`ld a,[x]` / `cp n` / `jr nz,next`, and it reloads `x` for every branch), plus a `jp caseend` (3 bytes) after every branch. Five rewritten chains (21 branches) cost +50 bytes. The only gain is skipping the rest of the compares after a match. When code space is tight, keep the ifs. Also seen: a `case` nested in a `case` branch, and a `case ... else begin ... end;`, gave "After declarations, BEGIN is expected" at the end of the procedure, then a compiler crash (0xC0000005). A flat `case` with explicit values compiled.
