# `GE.tru` (2026-01-31 build, 8232 lines) — Updated Game Engine Catalog

Source read in full: `/home/dey/TVC/GE.tru` (8232 lines). Compared line-by-line against the
2023 catalog in `/home/dey/TVC/notes_tru_units.md` §3 (`GE.tru`, 2951 lines, dated 2023-05-10).

This document is an **addendum/update**, not a replacement — `notes_tru_units.md` stays as the
historical catalog. Where a symbol is unchanged from 2023 it is called out as such and not
re-described; everything else (new or modified) is documented in full below.

---

## 0. What changed since the 2023 (2951-line) version — summary

The file grew from 2951 → 8232 lines (2.8x). This is almost entirely **new, additive** surface
area. One genuine breaking change was found (see §9). High-level additions:

1. **GameCard support** — a 3rd/4th joystick expansion peripheral (`InitGameCard`, `Joy3State`/
   `Joy4State`, `GameCardJoy3Port`/`GameCardJoy4Port`, `GAME_CARD_ID`). Detected by scanning the
   4 external expansion slots for an identifying string. `GE::Joystick()` transparently accepts
   `Nr=3/4` once detected.
2. **Digi Sound** — real 4-bit PCM/sample playback (`DigiSoundOn/Off`, `PlayDigiSound`,
   `WaitForDigiSoundSync`, `IsDigiSoundPlaying`, `Is2x4bitDigiSoundPlaying`), implemented as a
   custom high-rate sound interrupt handler, fully independent from (and mutually exclusive in
   timing terms with) the pre-existing square-wave `Sound`/`Volume` API.
3. **Sprite mirroring** — a 256-byte nibble-swap `Mirror Table` (`InitSpriteMirroring`,
   `MIRROR_TABLE`/`MIRROR_TABLE_HI`) plus new `Sprite.DrawMirror`/`FastDrawMirror`/`PutMirrored`
   methods and a `Sprite.Mirrored` flag, and a new bulk op `GE::PutAllSpritesWithMirroring`.
4. **`List` class** — a new lightweight fixed-capacity (20 items) pointer-list class, meant for
   grouping sprites (e.g. as an argument-like collection for group collision checks).
5. **3 animation loop types** — `LOOP_FORWARD`/`LOOP_PINGPONG`/`LOOP_BACKWARD`, vs. the 2023
   version's single implicit forward-looping animation. **`Sprite.InitAnimation` gained a 3rd
   parameter** (`AnimType`) — this is the one breaking signature change (see §9).
6. **Deferred Show/Hide** for sprites (`Sprite.Show`/`Sprite.Hide` + internal `VisibleState`),
   integrated into `RenderAllSprites`/`RenderScrollSprites` so a sprite can be "queued" to appear
   or disappear on the next render pass instead of the caller toggling `Visible` directly.
7. **Hardware scroll in all 8 directions** — new `GE::Scroll(ScrollDirection, UpdateSpritePos)` +
   `SCROLL_UP/UP_RIGHT/RIGHT/DOWN_RIGHT/DOWN/DOWN_LEFT/LEFT/UP_LEFT` and `GE::ResetScroll()`,
   alongside the pre-existing `ScrollUp`/`ScrollDown`. A parallel family of `Scroll*`-prefixed
   sprite draw/save/restore methods exists so sprite rendering can be scroll-aware.
8. **CRTC/video timing extras** — `SetGraphMode` (mode switch via raw port write, no screen
   clear, for split-screen effects mid-frame), `SetRasterInterruptPosEx` (sub-line-granularity
   raster IRQ position), `SetScreenLines`, `SetVerticalSyncPos`.
9. **Interrupt-handler management** — `EnableTVCITHandler`/`DisableTVCITHandler`, and `GE::Init`
   now **automatically disables** the stock TVC firmware interrupt handler and installs a
   minimal GE one (this wasn't documented/explicit in the 2023 catalog).
10. **Text engine upgrade** — `WriteText` now handles the full Hungarian accented character set
    (Á É Í Ó Ö Ő Ú Ü Ű and lowercase), not just ASCII 32-90; a new `InitCharSet` convenience
    procedure configures the 4 font-config globals in one call.
11. **Removed convenience keyboard functions** — `SpacePressed`/`ReturnPressed`/`EscPressed`/
    `CtrlPressed`/`ShiftPressed` (from the 2023 catalog) are **gone**, replaced by a generic
    `GE::Pressed(KeyCode: integer): boolean` taking one of ~90 new `KEY_*` constants. See §9.
12. Misc smaller additions: `GetMemoryMapping`, `FillRectAtPos`, `PutByte`, `GetMemByte`,
    `GetMemInt`, `MicroDelay`, `CopyLines`, `CollidedWith` (group collision), `Sprite.Collided`,
    extra sprite move helpers (`MoveLeftBy2`/`MoveRightBy2`/`MoveUpBy8`/`MoveDownBy8`), extra
    `Image` methods (`FastPut`, `ScrollPut`, `PutToPos`, `ScrollPutToPos`, `PutRect`,
    `SetPosition`, `MoveLeft/Right/Up/UpBy2/UpBy4/Down/DownBy2/DownBy4`), and
    `CopyBackScreenRectFromPosToScreen`.
13. The `Sprite` class record grew from its 2023 field set to **39 bytes** (`SPRITE_CLASS_SIZE`
    = 39) with new fields `VisibleState`, `WasAnimated`, `AnimDirection`, `UseBackground`,
    `GroupNr`, `AnimDelayCountdown`, `LastAnimSprite`, `Mirrored`, `Delay`. `Image` is now
    formally sized at `IMAGE_CLASS_SIZE` = 11 bytes (same fields as before, just a named
    constant added).

---

## 1. Memory map (verbatim from the file header)

```
Memory use (decimal addresses):
 255 - 2815 (2560 bytes) backgrounds of sprites (free to use if any sprite.Init does not allocate a background buffer)
3696 - 3735 (  40 bytes) Game Engine variables
3736 - 3755 (  20 bytes) Game Engine variables 2 (originally: PROG_ID)
5300 - 5803 ( 504 bytes) Stack (from 5803 to 5300)
5888 - 6143 ( 256 bytes) Mirror table for sprite mirroring (free to use if you do not use the GE::InitSpriteMirroring)
6144 - 6343 ( 200 bytes) SpriteList
6344 - 6623 ( 280 bytes) List class objects (free to use if you do not use List objects)

Free memory areas (decimal addresses):
3056 - 3655 ( 600 bytes) tape working area (free to use if you do not use file operations)
3756 - 5299 (1544 bytes) Stack lower area
5804 - 5887 (  84 bytes) BASIC working area
6624 - 6638 (  15 bytes) BASIC working area
```

Notes for RAM budgeting:
- Sprite background buffers still primarily come out of the 2560-byte pool at 255-2815 (the
  ASCII-screen + user-defined-character area) via the same bump allocator (`MemAllocPtr`,
  `FreeMemSize`, `MemAllocPage`) as in 2023, spilling onto Page 1/2/3 top-down once that pool is
  exhausted — this mechanism is unchanged.
- New fixed allocations vs. 2023: the 256-byte **Mirror table** (5888-6143, `$1700`-`$17FF`) and
  the 280-byte **List class object pool** (6344-6623) are new fixed regions carved out of what
  used to be free BASIC-working-area / SpriteList-adjacent space. Both are explicitly documented
  as "free to use if you don't use" the corresponding feature (`InitSpriteMirroring` / `List`),
  so a program that skips sprite mirroring and the `List` class gets that memory back.
- `SpriteList` itself moved to 6144-6343 (200 bytes = 100 sprites x 2-byte pointer) — same size
  budget (100 sprites) as 2023's `SpriteListPtr = 6144` region, just now documented with an
  explicit end boundary and immediately followed by the List pool.

---

## 2. Key globals / constants — new since 2023

- `GameCardFound: boolean`, `GameCardJoy3Port`/`GameCardJoy4Port: byte`, `Joy3State`/
  `Joy4State: byte = 0`, `GAME_CARD_ID: string no_term = (6,"JOY+SN")`
- `NoDigiSoundIsPlaying: byte = 64` / `NoDigiSoundIsPlaying2: byte = 0` — sentinel flags used by
  the digi-sound ISR / `IsDigiSoundPlaying`/`Is2x4bitDigiSoundPlaying`
- `MIRROR_TABLE: integer = $1700`, `MIRROR_TABLE_HI: byte = $17`
- `SPRITE_CLASS_SIZE: byte = 39`, `IMAGE_CLASS_SIZE: byte = 11`
- `ListsPtr: integer = 6344` — bump pointer for `List` class instance storage
- `CRTC_ScreenOffset`, `CursorITPos`, `CursorIT_TVline` — scroll/raster-IRQ bookkeeping state
  (used by `ScrollUp/Down/Scroll` and `SetRasterInterruptPosEx`)
- Digi Sound constants: `DIGI_FREQ_8_KHZ`(232)/`DIGI_FREQ_4_KHZ`(206)/`DIGI_FREQ_2_KHZ`(158)
  (frequency-divider low bytes), `DIGI_TYPE_1x4BIT`(0, "~12% CPU", full size)/
  `DIGI_TYPE_2x4BIT`(1, "~20% CPU", half size), `SOUND_IT_50HZ`(77)
- Animation: `LOOP_FORWARD`(0), `LOOP_PINGPONG`(1), `LOOP_BACKWARD`(2)
- Scroll directions: `SCROLL_UP`(1), `SCROLL_UP_RIGHT`(2), `SCROLL_RIGHT`(3),
  `SCROLL_DOWN_RIGHT`(4), `SCROLL_DOWN`(5), `SCROLL_DOWN_LEFT`(6), `SCROLL_LEFT`(7),
  `SCROLL_UP_LEFT`(8)
- GameCard/expansion-slot: `EXT_SLOT_COUNT`(4), `SLOT_0..3_BASE_ADDR`($40/$70/$A0/$D0),
  `SLOT_RAM_AREA_SIZE`(48), `SLOT_0..3_JOY3_PORT`/`SLOT_0..3_JOY4_PORT` (per-slot joystick I/O
  port numbers), `GAMECARD_JOY_UP`(1)/`DOWN`(2)/`LEFT`(4)/`RIGHT`(8)/`FIRE`(16) — **note this is
  a different bit encoding than the built-in `JOY_*` constants** (`JOY_UP`=2, `JOY_DOWN`=4,
  `JOY_LEFT`=64, `JOY_RIGHT`=32, `JOY_FIRE`=8, unchanged from 2023)
- A large new block of ~90 individual **`KEY_*` key-code constants** (`KEY_A".."KEY_Z`-equivalent
  matrix-row/bitmask pairs, e.g. `KEY_SPACE`, `KEY_RET`, `KEY_ESC`, `KEY_CTRL`, `KEY_SHIFT`,
  `KEY_ALT`, digits, punctuation, and Hungarian accented letters `KEY_OE`/`KEY_UE`/`KEY_AA`/etc.),
  each encoded as `(bitmask_hi_byte << 8) | matrix_row_lo_byte`, consumed by the new
  `GE::Pressed(KeyCode)` function. Also `JOY1_LEFT/RIGHT/ACC/FIRE/DOWN/UP` and `JOY2_*` as
  matrix-encoded key-code constants (distinct from the `JOY_*` bitmask constants used by
  `GE::Joystick`).
- Graphics-4/16 raw color-byte constants `GR4_COLOR0..3`, `GR16_COLOR_*` (16 values) — present in
  2023 too under slightly different naming (`GR16_*`); now grouped and fully named
  `GR16_COLOR_BLACK`..`GR16_COLOR_WHITE`.

Unchanged from 2023 (same names/values): `SCREEN_WIDTH/HEIGHT/SIZE/ADDR`, `BACK_SCREEN_ADDR`,
`USE_BACK_SCREEN`/`DIRECT_TO_SCREEN`, `MEM_DEFAULT/VID_ON/FULL_64K/48K_VID`, `GRAPHICS2/4/16`,
`SOUND_LO/HI/VOLUME_PORT`, `SILENT_SOUND`, `MAX_VOLUME`, `PALETTE_*`, `BORDER_*`, `JOY_*`,
`KEYBOARD_0..7`/`JOY1_STATE`/`JOY2_STATE` addresses (2897-2906).

---

## 3. `Sprite` class

### Fields (39 bytes, `SPRITE_CLASS_SIZE`)

```
0    Visible          : boolean
1    SpriteType       : byte     (1=bitmap/no mask, 2=masked)
2-3  Data             : pointer  (mask+image bytes)
4-5  Background       : pointer  (background-save buffer)
6-7  Position         : integer  (raw screen byte address)
8-9  LastPosition     : integer
10   VisibleState     : byte     [NEW] internal: 0=stable, 1=pending Show, 2=pending Hide
11   Width            : byte
12   Height           : byte
13-14 Size            : integer
15   X                : byte
16   Y                : byte
17   LastX            : byte
18   LastY            : byte
19   ToNextRow        : byte
20-21 AnimSet         : pointer
22   AnimType         : byte     [NEW meaning] LOOP_FORWARD/PINGPONG/BACKWARD
23   AnimPhaseCount   : byte
24   AnimPhaseNr      : byte
25   WasAnimated      : boolean  [NEW] set True by Animation(); caller must clear it
26   AnimDirection    : byte     [NEW] internal ping-pong direction flag
27   UseBackground    : boolean  [NEW] whether Background buffer is in use
28   GroupNr          : byte     [NEW] used by CollidedWith
29   AnimDelay        : byte
30   AnimDelayCountdown: byte    [NEW]
31-32 LastAnimSprite  : pointer  [NEW] cached address of last anim frame (for LOOP_BACKWARD)
33   Mirrored         : boolean  [NEW] draw mirrored via PutAllSpritesWithMirroring
34   State            : byte     (free-use)
35   Direction        : byte     (free-use)
36   Timer            : byte     (free-use)
37   Counter          : byte     (free-use)
38   Delay            : byte     [NEW] (free-use)
```

The 2023 class was smaller (no `VisibleState`, `WasAnimated`, `AnimDirection`,
`UseBackground`, `GroupNr`, `AnimDelayCountdown`, `LastAnimSprite`, `Mirrored`, `Delay`) — code
that pokes the class by raw byte offset (rather than field name) will break; normal field-name
usage is unaffected.

### Methods

Unchanged from 2023 (same signature/behavior): `Init(ImagePtr, X, Y, GetBackgroundBuffer)`,
`FastDraw`, `Draw`, `RestoreBackground`, `SaveBackground`, `Put`, `CopyToScreen`, `SetPosition()`,
`UpdateLastPos`, `MoveLeft()`, `MoveRight()`, `MoveUp()`, `MoveDown()`, `MoveUpBy2()`,
`MoveDownBy2()`, `MoveUpBy4()`, `MoveDownBy4()`, `Animation()` (still frame-advances, but now
loop-type-aware — see below).

New/changed methods:

| Method | Description |
|---|---|
| `procedure FastDrawMirror` | Like `FastDraw` (SP-register streaming, masked, interrupts disabled) but draws horizontally mirrored, reading through `MIRROR_TABLE`. |
| `procedure DrawMirror` | Like `Draw` (masked, interrupt-safe) but horizontally mirrored. |
| `procedure ScrollFastDraw` | Like `FastDraw`, but the row-advance wraps within the VRAM 32K-48K window instead of a fixed stride — for use right after `GE::ScrollUp`/`ScrollDown`/`Scroll`. |
| `procedure ScrollDraw` | Scroll-aware variant of `Draw`. |
| `procedure Show` | Marks a currently-`Visible=False` sprite to be shown on the *next* `RenderAllSprites`/`RenderScrollSprites` call (sets `VisibleState=1`); no-op if already visible. |
| `procedure Hide` | Marks a currently-`Visible=True` sprite to be hidden on the next render pass (sets `VisibleState=2`); no-op if already hidden. |
| `procedure SetBackground(BackgroundBuffer: pointer)` | Manually assigns/replaces the sprite's background-save buffer pointer (sets `UseBackground := BackgroundBuffer <> 0`); alternative to letting `Init`'s allocator pick one — e.g. to point several small sprites at a shared static `array[...] of byte`. |
| `procedure ScrollSaveBackground` | Scroll-aware variant of `SaveBackground`. |
| `procedure ScrollRestoreBackground` | Scroll-aware variant of `RestoreBackground`. |
| `procedure PutMirrored` | Like `Put` (opaque, no mask) but horizontally mirrored via the Mirror Table. |
| `procedure SmallPut` | Smaller/slightly-slower-code alternative to `Put` (uses `ldir` per row instead of unrolled `ldi`s) — same effect, smaller code size. |
| `procedure ScrollPut` | Scroll-aware variant of `Put`. |
| `procedure Render` | **New convenience method**: if `Visible`, restores background (if `UseBackground`), draws via `Draw` or `Put` depending on `SpriteType`, saves background if needed, and updates last-position — i.e. does everything `RenderAllSprites` does but for one sprite, for manual per-sprite render ordering. No-op if not visible. |
| `procedure ScrollRender` | Scroll-aware variant of `Render` (uses the `Scroll*` draw/save/restore methods). |
| `procedure ScrollFastRender` | Like `ScrollRender` but uses `ScrollFastDraw` (SP-register path) for the masked case — not safe to use alongside Digi Sound playback. |
| `procedure MoveLeftBy2()` / `MoveRightBy2()` | Shift 2 byte-columns left/right (new; 2023 only had the 1-byte-column `MoveLeft`/`MoveRight`). |
| `procedure MoveUpBy8()` / `MoveDownBy8()` | Shift 8 rows up/down (new; 2023 only had up to `By4`). |
| `function Collided(Sprite2: pointer): boolean` | AABB collision test against one specific other sprite, using `X/Y/Width/Height`. |
| `function CollidedWith(GroupNr: byte): integer` | Scans the whole global sprite list for a *visible* sprite whose `GroupNr` matches, AABB-testing each; returns a pointer to the first colliding sprite, or 0 if none. Enables "did the player hit any enemy" without maintaining a separate list. |
| `procedure InitAnimation(AnimPhaseCount, AnimDelay, AnimType: byte)` | **Signature changed** — gained a 3rd parameter `AnimType` (`LOOP_FORWARD`/`LOOP_PINGPONG`/`LOOP_BACKWARD`). For `LOOP_BACKWARD` it also precomputes and caches the address of the last animation frame (`LastAnimSprite`). See §9 — 2023 callers used `InitAnimation(count, delay)` (2 args) and must add the 3rd. |
| `procedure Animation()` | Behavior extended: now branches on `AnimType`. `LOOP_FORWARD` cycles 1→N→1→N...; `LOOP_BACKWARD` cycles N→1→N→1... (using the cached `LastAnimSprite`); `LOOP_PINGPONG` bounces 1→N→1→N... reversing direction at each end (tracked via `AnimDirection`). Also now sets `WasAnimated := True` on every phase change (caller-managed flag, never cleared automatically). |
| `procedure ResetAnimation(ImageSet: pointer)` | Re-points a sprite's animation at a different frame-set (e.g. switching from a "walk" to a "run" animation) without re-running full `InitAnimation` bookkeeping; resets phase/direction/delay countdown to start-of-animation state. |

---

## 4. `Image` class

Fields unchanged from 2023 (`Bitmap`, `Position`, `Width`, `Height`, `Size`, `X`, `Y`,
`ToNextRow`), now formally 11 bytes (`IMAGE_CLASS_SIZE`). `Init(ImagePtr, Width, Height)` and
`Put` are unchanged from 2023. New methods:

| Method | Description |
|---|---|
| `procedure FastPut` | Faster but larger-code variant of `Put` (unrolled unconditional-jump `ldi` blit, same technique as `Sprite.Put`). |
| `procedure ScrollPut` | Puts the image, and also handles the VRAM 32K-48K wraparound needed right after a hardware scroll — usable for e.g. an image sliding in at the bottom/top edge during scrolling. |
| `procedure PutToPos` | Draws using the already-computed `Position` field directly, instead of recomputing from `X`/`Y` — for repeated draws at a manually-tracked position. |
| `procedure ScrollPutToPos` | `PutToPos` + scroll-wraparound handling. |
| `procedure PutRect(StartX, StartY, Width, Height: byte)` | Draws only a sub-rectangle of the image's bitmap (an atlas/tile-sheet cutout) at the image's `X`/`Y` screen position — treats the `Image.Bitmap` as a `Width x Height`-cell sprite sheet and blits the `(StartX,StartY)`-`(StartX+Width,StartY+Height)` region. |
| `procedure SetPosition()` | Recomputes `Position` from `X`/`Y` (mirrors `Sprite.SetPosition`). |
| `procedure MoveLeft() / MoveRight()` | Shift `Position`/`X` by 1 byte-column. |
| `procedure MoveUp() / MoveUpBy2() / MoveUpBy4()` | Shift up by 1/2/4 rows. |
| `procedure MoveDown() / MoveDownBy2() / MoveDownBy4()` | Shift down by 1/2/4 rows. |

`Image` previously (2023) had no position-tracking/movement helpers at all — it was purely a
one-shot static blit. It's now nearly at parity with `Sprite` for positioning/movement (just
without background save/restore, masking, or animation, which remain `Sprite`-only).

---

## 5. `List` class — new

A small fixed-capacity (**max 20 items**) list-of-pointers class, allocated from the 280-byte
pool at 6344-6623 (`ListsPtr` bump-allocates 41 bytes per `List` instance: 1 count byte + 20x2
byte slots). Intended use per the header comment: build a list of sprite addresses and pass it to
places that want to check against "any sprite in this group" — though note `Sprite.CollidedWith`
actually works off the *global* sprite list filtered by `GroupNr`, not off a `List` instance; the
`List` class is a general-purpose pointer container usable for whatever the game needs (enemy
rosters, waypoints, etc.), not specifically wired into the collision API.

Fields: `MemAddr: integer` (address of this list's storage: byte 0 = count, then up to 20x2-byte
item pointers), `NextItemAddr: integer` (internal write cursor).

| Method | Description |
|---|---|
| `procedure Init()` | Claims the next 41-byte slot from `ListsPtr`, zeroes the count. |
| `procedure Add(ItemAddr: integer)` | Appends a pointer/address to the list and increments the count. No bounds check against the 20-item cap is performed in the shown code — exceeding 20 will silently overwrite past the allocated slot into the next `List`'s storage. |
| `function Count: byte` | Returns the current item count. |
| `function Get(Nr: byte): integer` | Returns the `Nr`-th item (0-based); if `Nr >= Count`, returns item 0 as a fallback rather than erroring. |
| `procedure Clear()` | Resets count to 0 (does not need to re-`Init`; storage slot is reused). |

---

## 6. Sprite-list bulk operations (unit-level, `GE::...`)

Unchanged from 2023: `SetMemory(Mode)`, `Init(UseBackScreen)` (see behavior note below),
`RenderAllSprites`, `CopyAllSpritesToScreen`, `DrawAllSprites`, `PutAllSprites`,
`CopyBackScreenToScreen`, `CopyBackScreenRectToScreen(X,Y,Width,Height)`.

**Behavior change**: `GE::Init(UseBackScreen)` now **calls `DisableTVCITHandler` internally** as
part of initialization — every program using `GE::Init` now has the stock TVC firmware interrupt
handler replaced by GE's minimal one from that point on (this must be explicitly reversed with
`GE::EnableTVCITHandler()` if firmware services, e.g. cassette I/O, are needed afterward). The
2023 catalog did not document this as part of `Init`.

`RenderAllSprites` and its siblings now also process the deferred `Show`/`Hide` `VisibleState`
flag as part of each pass (flip `Visible` and clear `VisibleState` before/after drawing).

New:

| Signature | Description |
|---|---|
| `function GetMemoryMapping(): byte` | Reads back the current 4-bank memory-mapping byte (companion read to `SetMemory`). |
| `procedure EnableTVCITHandler()` | Restores the original TVC firmware interrupt handler at `$38` (undoes `DisableTVCITHandler`/`GE::Init`'s default). Needed before using firmware services (e.g. file I/O) that depend on the stock handler's per-tick housekeeping. |
| `procedure DisableTVCITHandler()` | Installs GE's minimal interrupt handler (just acks the interrupt and returns) in place of the firmware one — frees ~1-2 sprites' worth of CPU time per frame by skipping firmware housekeeping (keyboard scan, cursor blink, etc). Called automatically by `GE::Init`. |
| `procedure ResetSpriteList()` | Clears the sprite list and frees all background-buffer allocations, resetting the bump allocator to its initial state — for multi-scene programs that re-`Init` a fresh set of sprites per level/screen. |
| `procedure InitSpriteMirroring()` | Builds the 256-byte `MIRROR_TABLE` (nibble/pixel-pair bit-swap lookup) used by `Sprite.DrawMirror`/`FastDrawMirror`/`PutMirrored` and `PutAllSpritesWithMirroring`. Must be called once at startup (after setting the graphics mode) before using any mirrored draw. |
| `procedure RenderScrollSprites` | Scroll-aware equivalent of `RenderAllSprites` — restores/redraws all sprites using the `Scroll*` sprite methods and handles the VRAM-window wraparound; also processes deferred Show/Hide. |
| `procedure SaveAllSpritesBackground` | Saves the background under every sprite (bulk `Sprite.SaveBackground`) — e.g. one-time initial capture after drawing a level background. |
| `procedure RestoreAllSpritesBackground` | Restores the background under every sprite (bulk `Sprite.RestoreBackground`) — e.g. to blank all sprites off-screen at once. |
| `procedure PutScrollSprites` | Scroll-aware bulk `Put` (calls `Sprite.ScrollPut` for every visible sprite, no background handling). |
| `procedure PutAllSpritesWithMirroring` | Bulk `Put`, but for each visible sprite calls `PutMirrored` instead of `Put` when `sprite.Mirrored = True`. Only meaningful for maskless (`SpriteType=1`) sprites, and requires `InitSpriteMirroring()` to have been called. |
| `procedure CopyBackScreenRectFromPosToScreen(Position: integer; Width, Height: byte)` | Same as `CopyBackScreenRectToScreen` but takes a precomputed raw back-screen `Position` instead of `X`/`Y` byte-grid coordinates. |

---

## 7. Screen / graphics / CRTC

Unchanged from 2023: `SetGraphics(Mode)` (= old `SetGraphicsMode`, via firmware `VMODE` call),
`GetGraphics()`, `SetPalette(Nr, Color)`, `SetBorder(Color)`, `WaitForSync()`,
`SetRasterInterruptPos(LineNr)`, `ClearScreen(Pattern)`, `FillRect(X,Y,Width,Height,Pattern)`,
`VBytesLine(Position,Count,Pattern)`, `HBytesLine(Position,Count,Pattern)`.

New:

| Signature | Description |
|---|---|
| `procedure SetGraphMode(Mode: byte)` | Sets the graphics mode via a **direct port-6 write** (no firmware call, no screen clear) — for switching resolution mid-frame (e.g. from inside a raster-interrupt handler) to get a split-screen effect with two different graphics modes on one screen. |
| `procedure SetRasterInterruptPosEx(LineNr, CharNr: byte)` | Finer-grained version of `SetRasterInterruptPos` — positions the raster/cursor interrupt at a specific character column (`CharNr`) within a line, not just at line granularity. |
| `procedure SetScreenLines(ScreenLines: byte)` | Sets the number of displayed scanlines via CRTC register 6 (must be a multiple of 4; e.g. 200 for a shorter/letterboxed screen). |
| `procedure SetVerticalSyncPos(VertSyncPos: byte)` | Sets CRTC register 7 (vertical sync position, default 66 for 240 lines) — used together with `SetScreenLines` to re-center a non-default-height display. |
| `procedure FillRectAtPos(Position: integer; Width, Height, Pattern: byte)` | Same as `FillRect` but takes a raw screen `Position` instead of `X`/`Y` byte-grid coords. |
| `procedure PutByte(Position: integer; Pattern: byte)` | Writes one raw byte directly to a screen position (`Position` = `$8000 + Y*64 + X`). |
| `function GetMemByte(MemAddr: integer): byte` | Generic PEEK — reads one byte from any memory address (not screen-specific). |
| `function GetMemInt(MemAddr: integer): integer` | Generic 2-byte read (e.g. for reading BASIC/system variables like the HI-MEM pointer or a timer tick). |

### Scroll — new 8-directional API

| Signature | Description |
|---|---|
| `procedure Scroll(ScrollDirection: byte; UpdateSpritePos: boolean)` | Hardware-scrolls the screen by one CRTC step in any of the 8 `SCROLL_*` directions (up/down/left/right and the 4 diagonals), updating the CRTC screen-start register, the cursor/raster-interrupt position, `ScreenAddr`, and (if `UpdateSpritePos`) every sprite's `Position` to compensate. Generalizes the 2023 `ScrollUp`/`ScrollDown` (which remain available, unchanged, as vertical-only convenience wrappers) to all 8 directions. |
| `procedure ResetScroll()` | Resets the CRTC screen-start offset, raster-interrupt position, and `ScreenAddr` back to defaults — undoes accumulated `Scroll`/`ScrollUp`/`ScrollDown` state. |

`ScrollUp(UpdateSpritePos)`/`ScrollDown(UpdateSpritePos)` themselves are unchanged from 2023.

---

## 8. Keyboard / joystick / GameCard

Unchanged from 2023: `GetKeyboard` (fills `KEYBOARD_0..7`/`JOY1_STATE`/`JOY2_STATE` from the
matrix), `KeyPressed(): boolean`, `GetJoysticks` (now also polls GameCard ports — see below),
`Joystick(Nr, JoyCode): boolean` for `Nr=1/2` against the built-in ports.

**Removed** (present in 2023, absent here — see §9): `SpacePressed`, `ReturnPressed`,
`EscPressed`, `CtrlPressed`, `ShiftPressed`, `AltPressed`.

**New**: `function Pressed(KeyCode: integer): boolean` — generic replacement for the removed
per-key functions. `KeyCode` packs a matrix-row index (low byte) and a bitmask (high byte); use
one of the ~90 new `KEY_*` constants (`GE::KEY_SPACE`, `GE::KEY_RET`, `GE::KEY_ESC`,
`GE::KEY_CTRL`, `GE::KEY_SHIFT`, `GE::KEY_ALT`, letters/digits/punctuation, and Hungarian
accented letters). Requires a prior `GetKeyboard()` call, same as the old per-key functions did.

### GameCard (new)

The **GameCard** is a joystick-expansion peripheral that plugs into one of the TVC's 4 external
expansion slots (base I/O-port addresses `$40`/`$70`/`$A0`/`$D0`, each with a 48-byte identifying
RAM area). It exposes two extra joystick ports beyond the machine's built-in 2, giving up to 4
simultaneous joysticks (e.g. for 3-4 player games).

| Signature | Description |
|---|---|
| `procedure InitGameCard()` | Scans expansion slots 0-3 for a card whose ID string matches `GAME_CARD_ID` ("JOY+SN"). If found, sets `GameCardFound := True` and computes `GameCardJoy3Port`/`GameCardJoy4Port` from that slot's base address (+2/+3 offset). Call once at startup, before using joystick numbers 3/4. |
| `GE::GetJoysticks` (extended) | After reading the 2 built-in joystick matrix rows as before, if `GameCardFound`, also `in`-reads `GameCardJoy3Port`/`GameCardJoy4Port` (inverted) into `Joy3State`/`Joy4State`. |
| `GE::Joystick(Nr, JoyCode)` (extended) | `Nr=3` tests `JoyCode` against `Joy3State`; `Nr=4` against `Joy4State`. **Uses a different bitmask encoding than `Nr=1/2`**: `GAMECARD_JOY_UP`=1, `_DOWN`=2, `_LEFT`=4, `_RIGHT`=8, `_FIRE`=16 (vs. the built-in `JOY_UP`=2/`JOY_DOWN`=4/`JOY_LEFT`=64/`JOY_RIGHT`=32/`JOY_FIRE`=8) — callers must use the matching constant family per joystick number. |

---

## 9. Sound

### Square-wave tone (unchanged from 2023)
`Volume(SoundVolume)`, `SoundOn()`, `SoundOff()`, `Sound(Pitch)`, `NoSound()` — identical
behavior/signatures to the 2023 catalog (single hardware tone channel, ports 4/5/6).

### Digi Sound — new (4-bit PCM/sample playback)

A completely separate playback path from the square-wave API above: instead of one continuous
tone, it streams a pre-recorded 4-bit sample buffer out through the same volume port (6) on every
tick of a dedicated high-frequency sound interrupt, `outi`-ing one (or two, packed) sample nibbles
per interrupt. **Mutually timing-exclusive with the raster/cursor interrupt** — `DigiSoundOn`
disables the cursor interrupt and takes over `$38` with its own handler; `DigiSoundOff` reverses
this.

| Signature | Description |
|---|---|
| `procedure DigiSoundOn(Frequency, DigiSoundType: byte)` | Initializes digi-sound playback. `Frequency`: `DIGI_FREQ_2_KHZ`/`4_KHZ`/`8_KHZ` (sample rate — 4 KHz recommended: "good enough quality, less space than 8 KHz"). `DigiSoundType`: `DIGI_TYPE_1x4BIT` (1 nibble/byte, full size, **~12.6% CPU** at 4KHz) or `DIGI_TYPE_2x4BIT` (2 nibbles/byte, **~half the size, ~20% CPU**). Installs the sound-interrupt handler at `$38`, disables the CRTC cursor interrupt, enables the sound interrupt. Samples are prepared externally with Audacity (→ 8-bit mono WAV) + the author's "TVC digi" converter tool (→ 4-bit TVC sample format). |
| `procedure DigiSoundOff()` | Disables the sound interrupt, re-enables the cursor/raster interrupt, restores GE's normal (or firmware, if `EnableTVCITHandler` was also called) interrupt handler. Call before stopping digi-sound use or before re-enabling the firmware handler. |
| `procedure PlayDigiSound(SoundEffect: pointer)` | Starts playback of a sample buffer (must have been prepared/loaded, e.g. via `incbin`). Non-blocking — playback continues via interrupts; call `IsDigiSoundPlaying`/`Is2x4bitDigiSoundPlaying` to poll completion. `DigiSoundOn` must have been called first. |
| `procedure WaitForDigiSoundSync()` | **Replacement for `WaitForSync()` while digi-sound is active** — since the cursor interrupt is disabled during digi-sound playback, this instead counts sound-interrupt ticks to approximate a 50 Hz frame sync, then briefly toggles back to the cursor interrupt and back to the sound interrupt to stay synced. |
| `function IsDigiSoundPlaying: boolean` | Whether a `DIGI_TYPE_1x4BIT` sample is still playing (checks a sentinel end-marker bit). |
| `function Is2x4bitDigiSoundPlaying: boolean` | Same, for `DIGI_TYPE_2x4BIT` samples (checks a zero-byte end marker instead — the two types use different termination conventions and are **not interchangeable** in the polling function used). |

---

## 10. Text

| Signature | Description |
|---|---|
| `procedure InitCharSet(CharSetPtr: pointer; CharSetImgWidth: integer; CharWidth, CharHeight: byte)` | **New convenience wrapper.** Because its 4 parameters are declared as `global` and share names with the pre-existing unit globals `CharSetPtr`/`CharSetImgWidth`/`CharWidth`/`CharSetHeight`(now `CharHeight`), TRSE's global-parameter marshalling means calling this just assigns those 4 globals — the procedure body is empty. Equivalent to (and backward-compatible with) the 2023 approach of assigning those globals directly. Must be called before `WriteText`. |
| `procedure WriteText(X, Y: byte; Text: ^byte)` | Same signature as 2023, but the glyph-lookup logic is now **accent-aware**: codes 128-143 map to uppercase accented letters (Á, É, Í, Ó, Ö, Ő, Ú, Ü, Ű) and codes ≥144 map to their lowercase forms, both remapped into extra glyph slots appended after the base A-Z set in the charset image; codes 32-127 behave as before (space through the base charset). 2023's version only supported plain ASCII 32-90. |

---

## 11. Helpers / misc

Unchanged from 2023: `In(Nr)`, `Out(Nr,Value)`, `Rnd()`, `Delay(DelayTicks)`, `Odd(Nr)`,
`IntToStr(IntNum)`, `ByteToStr(Nr)`, `FillMem(MemAddr,Size,Pattern)`,
`MemCopy(SourcePtr,DestPtr,Size)`, `ZX7Decompress(SourcePtr,DestPtr)`.

New:

| Signature | Description |
|---|---|
| `procedure MicroDelay(Count: byte)` | Fine-grained busy-wait (a tight `nop`/`djnz` loop), sub-raster-tick granularity — vs. `Delay`'s ~20ms-per-unit raster-sync wait. |
| `procedure CopyLines(SourcePtr, DestPtr: pointer; ScreenLines: byte)` | Copies `ScreenLines x 64`-byte rows from source to destination (e.g. blitting N rows of a title image onto the top of the screen) — a coarser-grained, row-count-based sibling of `MemCopy`'s byte-count copy. |

---

## 12. Compatibility verdict — is this a strict superset?

**Almost, but not quite — two breaking changes:**

1. **`Sprite.InitAnimation` signature changed** from `(AnimPhaseCount, AnimDelay: byte)` (2023,
   2 args) to `(AnimPhaseCount, AnimDelay, AnimType: byte)` (2026, 3 args). Any 2023 code calling
   `sprite.InitAnimation(N, D)` will fail to compile against this version and needs a 3rd
   argument added (typically `GE::LOOP_FORWARD` to preserve the old forward-looping behavior).
2. **Removed keyboard convenience functions**: `SpacePressed()`, `ReturnPressed()`,
   `EscPressed()`, `CtrlPressed()`, `ShiftPressed()`, `AltPressed()` no longer exist. 2023 code
   using any of these will fail to compile and must be rewritten as
   `GE::Pressed(GE::KEY_SPACE)` / `GE::Pressed(GE::KEY_RET)` / `GE::Pressed(GE::KEY_ESC)` /
   `GE::Pressed(GE::KEY_CTRL)` / `GE::Pressed(GE::KEY_SHIFT)` / `GE::Pressed(GE::KEY_ALT)`
   respectively.

Everything else found — every other 2023 procedure/function name and signature (constants,
`Sprite`/`Image` core methods, sprite-list bulk ops, screen/graphics, sound, text, helpers) —
is present unchanged in this version; all new capability is additive (new methods, new optional
parameters via new overload-like procedures rather than changed existing ones, new classes, new
constants). The `Sprite` class record also grew in size (28→39-ish bytes) with new fields
inserted/appended, which is only a concern for code that manipulates sprite memory by raw offset
instead of field name (uncommon/unsupported usage).

**Recommendation for the skill**: adopt this 2026 build as the canonical `GE.tru` reference. It
should be presented as a superset with two explicit migration notes (the two breaking changes
above) rather than requiring users to pick between versions.
