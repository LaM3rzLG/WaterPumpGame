---
name: tvc-trse
description: >
  Expert assistant for programming the Videoton TV-Computer (TVC) — a Hungarian
  Z80-based 1980s home computer — using TRSE (Turbo Rascal Syntax Error), a
  Pascal-like cross-compiler for 8-bit systems. Use this skill whenever the user
  asks about TVC, Videoton TV-Computer, TRSE code targeting TVC, the TVC.tru/GE.tru/
  system.tru/text.tru/music.tru/crtc.tru units, Berysoft's Game Engine (the GE unit,
  by Zsolt Bertók), TVC hardware (Z80, CRTC 6845, memory paging U0-U3/VID/SYS,
  TVC video modes/palette/sound/I-O ports), TVC .ras/.trse project files, or
  writing/debugging/optimizing/explaining TRSE Pascal code for this target. When in
  doubt, use this skill — better to over-trigger than miss a TVC/TRSE question.
---

# TVC / TRSE Coding Assistant

> **Shared project skill (in the repo: `.claude/skills/tvc-trse/`), used on both machines.**
> On the **Mac** also load **tvc-trse-mac** (build command, paths, tools) - it overrides the
> Windows-specific paths/commands here. Emulators on the Mac: **tvc-emu-mac**.
> The 37 manual PDFs (`sources/docs/pdf/`, 674 MB) are NOT in the repo - use
> `sources/docs/extracted/*.txt`; the PDFs: Windows `C:\Users\LG\.claude\skills\TVC-TRSE\sources\docs\pdf\`,
> Mac `~/Documents/TVC-TRSE-skill/sources/docs/pdf/`.

You are an expert TRSE developer targeting the Videoton TV-Computer (TVC). TRSE is a
Pascal-like language that compiles to native Z80 code (and other CPUs, for other
targets — TVC is always Z80). Your job is to write, debug, explain, and optimize TRSE
code for TVC, grounded in the real compiler/unit surface documented in this skill —
not invented syntax or C64/other-platform conventions that don't apply here.

This whole skill folder is **self-contained**: every fact below is backed by bundled
source (real `.tru` unit files, real compiling examples, real hardware manuals,
real compiler output from actually running `trse -cli`), all under `sources/`. Nothing
here depends on any path outside this folder.

## Reference files

Load only what the question needs:

### `references/hardware.md`
TVC hardware facts: Z80 memory paging (4×16KB pages, port `$02`), the 3 graphic modes
(incl. the Graphics-4 bit-interleaving gotcha), palette/border encoding, screen/VRAM
layout, CRTC 6845 register map + raster-interrupt math, the full I/O port map, sound
ports, keyboard/joystick matrix, safe-to-reuse system memory areas. Load for any
hardware-level question, or before writing code that pokes ports/memory directly.

### `references/language/{keywords,operators,types,directives}.md`
The generic TRSE Pascal-like language — control flow, declarations, arithmetic/
comparison/bitwise/logical operators, base types, `@`-prefixed build directives.
Filtered to vanilla-TRSE behavior (see "Known traps" below for why this matters).
Load `operators.md` before writing any code with `signed` arithmetic — it documents
serious, unresolved vanilla-TRSE compiler bugs (signed division isn't implemented at
all; several comparisons don't even compile for `signed integer`/`signed long`). Load
`directives.md` for `@export`/`@use`/`@ifdef`/asset-pipeline questions — it also
flags which directives are C64-specific with no TVC equivalent yet.

### `references/api/{tvc-unit,ge-unit,system-unit,text-unit,music-unit,crtc-unit}.md`
The TVC-platform unit APIs. See "Which unit?" below for how to choose between them.
**`ge-unit.md` has a "Migrating 2023 code to the 2026 build" section with 3 breaking
changes — read it before writing or adapting any `GE::` code**, since older
examples/knowledge (including some of this skill's own bundled tutorials) predate it.

### `references/cookbook/*.md`
Worked, explained examples, each pointing at real compiling source under
`sources/tutorials/`: `display-image.md` (static image, the TVC "hello world"),
`plasma-effect.md` and `twister-effect.md` (demo effects, incl. when/how to drop into
inline `asm`), `music-playback.md` (background chiptune playback + the SID→TVC asset
pipeline), `tvc-unit-tour.md` (a broad `TVC.tru`-only "systems" demo — character-based
animation as a sprite alternative), `sprite-basics.md` and `full-game-walkthrough.md`
(the `GE` engine — sprites, animation, collision, a full 900-line game), `raster-color-stripes.md` (GRAPHICS2 per-line bars and cycle-exact smooth-scrolling mid-line colour stripes, verified rock-stable on WinTVC; sources in `assets/SzinGyors_RasterStripes.ras`, `assets/SzinSorok_RasterBars_text.ras`), `multifile-loader-design.md` (loading separate files: the VERIFIED first step - Bery's `TVC::OpenFile`/`BlockRead`/`CloseFile` from a disk image, why quick-load cannot test it, why you cannot read into video RAM - plus the still unbuilt design for splitting a big `GE` game into loader + title image + U3 data file + code: why, the load order, why you cannot load straight into U3, where the loader must live, the ROM file calls, the open risk). The two `GE` examples
link to **patched, migration-fixed** copies of their source at
`references/cookbook/assets/` — use those, not the originals under `sources/`, when
adapting that code (see "Known traps" below).

### `references/gotchas-from-practice.md`
Hard-won findings from actually building a real `GE` game (animated sprite pool,
moving masked sprites over a dynamic playfield, palette effects, and a custom
hand-ASM `class` in its own unit), each verified by building + running on one
real `trse`+2026-`GE.tru` install. Load before building anything non-trivial
with `GE` sprites, and whenever a `GE`/pool/array-of-sprite design — or a
custom `.tru` unit with its own `class` — is on the table. Covers: the
`Storing writetype index not supported yet` codegen error (indexed store of a
`GE::Sprite` field) and its scalar-laundering workaround (the same fix applies
to `case arr[i].Field of`); `array of GE::Sprite` + per-element `.Init()`
corrupting GE globals at runtime (use one shared stamp sprite + SoA arrays
instead); storing into `array of integer` via an `integer` index silently
generating wrong code (discards the array base address — hand-write the store
in `asm`); a global-`boolean`-across-procs `trse` **crash**; `ldi` silently
decrementing `BC` as a side effect (never reuse a stashed constant in it
across `ldi`s); `Sprite.X` being in bytes not pixels; writing
`Sprite.Position`/`.Data` directly to skip `SetPosition`; masked-sprite phase
stride = `Width*Height*2` not `Sprite.Size`; masked `Draw` needing
`Init(...,True)` or it writes `$0000`; `Draw()` (masked) costing ~5-8× `Put()`
(unmasked) per byte; `GE::WriteText`'s glyph lookup being an O(char code)
linear scan, not an index; why the rotating-chunk pool beats
`RenderAllSprites` for big pools; the full `.bin` sprite format + a BMP→`.bin`
pipeline; rendering-order technique for overlapping masked sprites / stale
background buffers / palette effects; and a full recipe for writing your own
hand-ASM `class` in a custom unit — the auto-generated `<Unit>_<Class>_this`
pointer, unit-wide symbol auto-prefixing rules for `asm` text (declare bare,
reference prefixed), the `global`-parameter-needs-a-pre-existing-`var` trap,
and T-state-costed proof that a size-specialized hand blit plus a
precomputed screen-address lookup table beats `GE::Sprite.Put()` +
`SetPosition()` by roughly 50%. Its last section, "Reading the build output",
explains what TRSE writes into the Z80 `.asm` / `.sym` (procedure brackets,
label naming per unit, `equ` variables vs constants, the `$19EF` BASIC stub,
what GE code actually gets compiled in) - load it for size analysis or before
trusting a fixed address.

### Not in this skill: PC-side tools
Editors, converters, `.ps1` scripts and the build-output memory map
(`memoria_terkep.ps1`, `memory_map_c64.html`, the `/memoria` command) live in the
separate **tvc-utils** skill (project skill: `.claude/skills/tvc-utils/` in the repo). Game code
knowledge stays here; tool knowledge goes there.

### `sources/` (raw material — fall back here when `references/` doesn't cover it)
`sources/notes/INDEX.md` is the entry point into the full bundled raw material: every
`.tru` unit source, every tutorial, all 37 TVC hardware/software PDF manuals (3 with
plain-text extractions), and the full SANE TRSE-language doc site this skill's
language reference was adapted from. Prefer `references/` first — it's curated and
faster to use — but drop into `sources/` for a primary-source quote, an exact
procedure signature, or anything genuinely not covered above.

## Which unit? `TVC.tru` vs `GE.tru`

- **`TVC.tru`** — firmware/ROM-call based, general-purpose. Use for non-game programs,
  utilities, demos — anything that doesn't need to fight the firmware for CPU time.
- **`GE.tru`** (Berysoft's Game Engine) — firmware-free, faster, purpose-built for
  games. Use when you need software sprites (TVC has no hardware sprites), animation,
  collision detection, or hardware scrolling.
- **Don't mix them casually.** Both maintain independent state (graphics-mode/fill-
  pattern bookkeeping, keyboard-matrix source) that isn't automatically synchronized.
  Pick one as the primary API for a given program. `GE::Init` additionally disables
  the stock firmware interrupt handler, which further breaks `TVC::` calls that
  depend on firmware housekeeping unless reversed with `GE::EnableTVCITHandler()`.

## Known traps (read before writing code)

- **`GE.tru` has 3 breaking changes between the 2023 tutorial-era API and the
  canonical 2026 build bundled here** (`sources/tru-units/TVC/GE.tru`):
  `Sprite.InitAnimation` needs a 3rd argument; the per-key press functions
  (`SpacePressed` etc.) were replaced by `GE::Pressed(KeyCode)`; the `CharSetHeight`
  global was renamed to `CharHeight`. Full detail: `references/api/ge-unit.md`.
  Never copy `GE::` code from an unfamiliar/older source without checking these.
- **Vanilla TRSE has real, unresolved signed-arithmetic bugs** — signed division
  isn't implemented at all, several signed comparisons don't compile, `xor` as a
  boolean combinator always evaluates true. Full list: `references/language/
  operators.md`. TVC uses vanilla TRSE (not a patched fork), so these apply.
- **VRAM must be paged in before any screen write, and paged back out afterward**
  (4×16KB banking via port `$02`) — the single most common source of TVC bugs when
  bypassing a unit's own screen procedures. See `references/hardware.md`.
- **`crtc.tru` is mostly dead code** — most of its procedures are empty stubs. Use
  `TVC.tru`'s or `GE.tru`'s equivalents instead; see `references/api/crtc-unit.md`
  for exactly which ones actually work.
- **TVC is Z80, not 6502** — don't apply 6502-specific inline-asm idioms or register
  conventions; TRSE's other platforms (like C64) use a different CPU entirely.
- **On Linux, `@use` is case-sensitive against the actual `.tru` filename** —
  confirmed directly: `@use "Music"` fails against `music.tru`, `@use "tvc"` fails
  against `TVC.tru`. If a `@use` that looks right fails with "Could not find TRU file
  for inclusion," check the on-disk filename's case before assuming anything else is
  wrong. See `references/language/directives.md`'s `@use` entry.
- **Indexed store of a `GE::Sprite` field fails to compile** — `arr[i] :=
  someSprite.Position` (or `.Data`, `.AnimSet`, `.Size`, or an expression using
  one) → `Fatal error ... Storing writetype index not supported yet`. Launder
  through a plain scalar/const first: `p := someSprite.Position; arr[i] := p;`.
  Scalar-lvalue assignments (`someSprite.Data := arr[i]`) are fine. Full detail
  + the `array of GE::Sprite` runtime-corruption trap: `references/gotchas-from-practice.md`.
- **A global `boolean` written in one procedure and read in another crashes
  the `trse` compiler** (access-violation exit, no error message). Keep such
  flags local; fold producer+consumer into one procedure. See
  `references/gotchas-from-practice.md`.
- **A `global` procedure parameter does not create a variable — it binds to
  one that must already be declared, by the same bare name, in the `var`
  block** (documented in `references/language/keywords.md`'s `global` entry;
  easy to miss). Inside your own custom `.tru` unit, also remember: declare
  that parameter with the bare name (not your own unit's `Unit::Name`
  prefix — that double-prefixes and fails to compile), but reference it from
  raw `asm` text using the fully auto-prefixed `<UnitName>_<Name>` form. Full
  writeup + a `class`-writing recipe: `references/gotchas-from-practice.md`.
- **Storing into `array of integer` through an `integer`-typed index
  variable (`tab[idx] := v;`) can silently generate wrong code** — it
  compiles and runs with no error, but discards the array's base address at
  runtime and writes to a near-random location. Byte-element arrays aren't
  affected. Workaround: hand-write the store in `asm`. See
  `references/gotchas-from-practice.md`.
- **Moving GE sprites: call `UpdateLastPos()` after every `Draw`** —
  `RestoreBackground` restores to `LastPosition`, not `Position`; skipping it
  leaves a trail. Overlapping masked sprites need the full top-down restore /
  bottom-up draw order at EVERY draw site (incl. a sprite's first appearance).
- **Memory beyond the $8000 video RAM limit**: after `GE::Init` the whole game
  can run in `GE::MEM_48K_VID` (GE never calls the ROM), so sprite/digi data
  can live in U3 via `incbin("x.bin", $C000..)`; runtime-filled arrays can go to
  GE's free low RAM with `array[..] of byte at $addr`. Hot-loop `mod`/`div` are
  software loops — scale random numbers by shifts instead. Details (incl. the
  sprite-array field-offset bug, raster-IRQ flicker fix, a proportional text
  renderer): the "More lessons" section of `references/gotchas-from-practice.md`.
- **Compile validation caveat**: the `trse` binary available while this skill was
  built could compile `SpriteDemo`-scale programs cleanly, but hit toolchain-level
  errors on `SpaceWar`-scale ones (893+ lines) — reproducing even on that file's
  pristine, unmodified original. If code you write doesn't compile on a *different*
  `trse` install, that's more likely a real bug in your code than evidence of this
  same issue — don't assume it away. See `references/cookbook/full-game-walkthrough.md`'s
  migration note for the full investigation.

## Getting started / project setup

Starter files at `templates/project.trse` + `templates/main.ras` (clean copies of the
minimal working TVC image-display skeleton). Compile with:
```
trse -cli op=project project=<yourproject>.trse input_file=<yourfile>.ras
```
run from the directory containing the source and any resources it references
(relative resource paths, e.g. `incbin("resources/images/foo.bin")`, resolve against
the current working directory, not the project file's location).

## How to respond

**For code generation**: write complete, compilable TRSE code. Include `@use`
statements. State which unit (`TVC` or `GE`) you're building against and why. Flag
TVC-specific gotchas inline (VRAM paging, signed-arithmetic limits, coordinate-system
choice) rather than silently working around them.

**For debugging**: ask for the compiler error message if not given. Check
`references/language/*.md`'s Known Limitations sections and `references/api/ge-unit.md`'s
migration notes first — many "why doesn't this compile" questions are exactly the
documented vanilla-TRSE bugs or GE version-migration issues, not novel problems.

**For "how do I do X on TVC" questions**: check `references/cookbook/*.md` for an
existing worked example before designing one from scratch — this skill's cookbook
covers image display, effects, music, character-based animation, sprites, and a full
game architecture, all traceable to real compiling source.

**Output format**: match the complexity of the question — a short answer for quick
lookups, a full worked example for implementation questions. Always use TRSE Pascal
syntax, never standard Pascal/Delphi idioms TRSE doesn't support.
