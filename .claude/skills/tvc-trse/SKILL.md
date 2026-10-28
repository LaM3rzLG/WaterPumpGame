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
> `sources/docs/extracted/*.txt`; the PDFs: Windows `C:\Users\LG\Documents\TVC-TRSE-skill\sources\docs\pdf\`,
> Mac `~/Documents/TVC-TRSE-skill/sources/docs/pdf/`.

Write, debug, explain and optimize TRSE code for the TVC (always Z80), grounded in the real
compiler/unit surface documented here — not invented syntax or C64 conventions. Facts are backed by
bundled sources under `sources/` and by real `trse -cli` builds.

## Reference files — load only what the question needs

- **`references/hardware.md`** — paging (port `$02`, `P_SAVE` `$0003`), graphic modes (GR4 bit
  interleave), palette/border, VRAM layout, CRTC 6845 + raster IT, I/O ports, sound, keyboard/joystick,
  free system RAM. Before any port/memory poking.
- **`references/language/{keywords,operators,types,directives}.md`** — the generic TRSE language,
  vanilla behaviour, each with Known limitations. `operators.md` before any `signed` arithmetic.
- **`references/language/builtins.md`** — the only 21 builtins that exist on Z80, their Z80 parameter
  lists and generated code; four are BROKEN on Z80. Before using any builtin.
- **`references/trse-compiler.md`** — which trse.exe (old 2024 build vs nightly), the 0xC0000005 crash
  and its root cause, nightly pitfalls (`//` comments in asm), `case` vs `if` size, branch range, writing
  files after `GE::Init`. Load whenever the build crashes or misbehaves.
- **`references/api/*.md`** — unit APIs (`tvc-unit`, `ge-unit`, `system-unit`, `text-unit`,
  `music-unit`, `crtc-unit`). `ge-unit.md` has 3 breaking 2023→2026 changes: read before any `GE::` code.
- **`references/cookbook/*.md`** — worked examples: `display-image`, `plasma-effect`, `twister-effect`,
  `music-playback`, `tvc-unit-tour`, `sprite-basics`, `full-game-walkthrough` (patched GE sources in
  `cookbook/assets/`), `raster-color-stripes`, `multifile-loader-design` (loading files: the call
  sequence that works on a REAL TVC with SD, why not straight into U3/VRAM, the loader design).
- **`references/gotchas-from-practice.md`** — findings from a real GE game: sprite pools, masked vs
  unmasked draw cost, `Storing writetype index`, `array of GE::Sprite` corruption, `array of integer`
  store bug, `ldi`/BC, hand-ASM `class` in a custom unit (symbol prefixing, `global` params), the `.bin`
  sprite format, render order, U3 data, raster IT flicker, proportional text, reading `.asm`/`.sym`.
  Before non-trivial GE work or a custom unit.
- **`sources/docs/extracted/*.txt`** — searchable text of 17 TVC manuals (index: `sources/docs/INDEX.md`):
  Programming Guide, ROM book, Bertók; and since 2026-10-28 also 14 Tesseract-OCR'd scans - **TVC hardware
  manual** (`TVC_hardver.txt`), **commented ROM listing** (`Kaszanyiczki_Laszlo_TVC_ROM_listaja.txt`),
  operating system, assemblers, 64K+ extras, interface cards. OCR'd code/hex/tables have character
  errors (1/l, 0/O, B/8) - check addresses/opcodes against the PDF page (`=== [oldal N] ===` markers).
- **`sources/`** — raw material (`sources/notes/INDEX.md`): all `.tru` units, tutorials, 37 TVC
  manuals (PDF), the SANE TRSE doc site (`sources/sane-trse-docs/`, synced 2026-10-25; it documents the
  C64 fork - its builtin pages and "Fixed" bug marks do NOT apply to TVC).
- PC-side tools (editors, converters, `.ps1`, memory map) are in the **tvc-utils** skill.

## Which unit? `TVC.tru` vs `GE.tru`

`TVC.tru`: ROM-call based, general purpose. `GE.tru`: firmware-free, fast, for games (software sprites,
animation, collision, hardware scroll). Don't mix casually: separate state; `GE::Init` disables the
firmware IT handler (`GE::EnableTVCITHandler()` to call ROM again).

## Known traps (read before writing code)

- **GE 2023→2026 API changes** (`InitAnimation` 3rd arg, `GE::Pressed(KeyCode)`, `CharHeight`):
  `references/api/ge-unit.md`.
- **Signed arithmetic is broken in vanilla TRSE** (no signed division, some signed comparisons don't
  compile, `xor` between conditions is always true): `references/language/operators.md`.
- **Page VRAM in before writing the screen, restore after** (port `$02`): `references/hardware.md`.
- **`crtc.tru` is mostly empty stubs**: `references/api/crtc-unit.md`.
- **Z80, not 6502**: no 6502 idioms in asm.
- **`@use` is case-sensitive on Linux** against the `.tru` file name.
- **Indexed store of a `GE::Sprite` field** (`arr[i] := spr.Position`) → "Storing writetype index not
  supported yet": copy into a scalar first. `array of GE::Sprite` + per-element `Init` corrupts GE at runtime.
- **`global` procedure parameter** binds to an existing same-name `var`; in your own unit declare it bare,
  reference it in asm as `<Unit>_<Name>`.
- **`tab[idx] := v` on `array of integer` with an integer index can write to a random address**:
  hand-write the store in asm.
- **Builtins on Z80**: `Peek` reads nothing, `MemCpyFast` copies to `$0000`, `Fill` writes count+1,
  `Nop(n)` = 2n nops; `MemCpy(from, to, integer count)`. `references/language/builtins.md`.
- **Reading files on a REAL TVC (SD)**: not with `TVC::OpenFile`/`BlockRead`/`CloseFile` (`CloseFile` is
  the WRITE-close `$54`). Use the Lemmings sequence in asm (`$0B0A`:=0, `$D3`, `$D2`, `xor a` + `$D4`).
  Emulator quick-load of a `.cas` has no file device: test from a `.dsk`. `cookbook/multifile-loader-design.md`.
- **Compiler crash 0xC0000005 with no message**: a bug of the 2024 trse.exe (dangling pointer in the Z80
  post-optimiser, triggered by code LAYOUT, not by a pattern) - fixed in the nightly. Old notes that blamed
  a pattern (global boolean across procedures, `if..else` with GE calls, long comments) were probably this.
  `references/trse-compiler.md`.
- **Moving GE sprites: `UpdateLastPos()` after every `Draw`** (`RestoreBackground` uses `LastPosition`);
  overlapping masked sprites need top-down restore / bottom-up draw everywhere.
- **Beyond `$8000`**: in `GE::MEM_48K_VID` data can live in U3 (`$C000..`), runtime arrays in GE's free
  low RAM (`array[..] of byte at $addr`); hot-loop `mod`/`div` are slow software loops.

## Project setup

Starter: `templates/project.trse` + `templates/main.ras`. Build:
`trse -cli op=project project=<p>.trse input_file=<f>.ras assemble=yes`, run from the source folder
(relative `incbin` paths resolve against the working directory).

## How to respond

Code: complete, compilable, with `@use`; say which unit and why; flag TVC gotchas inline. Debugging: get
the exact error; check the Known limitations in `references/language/*.md`, `ge-unit.md` migration notes and
`trse-compiler.md` first. "How do I…": check the cookbook first. Match answer length to the question; TRSE
Pascal syntax only.
