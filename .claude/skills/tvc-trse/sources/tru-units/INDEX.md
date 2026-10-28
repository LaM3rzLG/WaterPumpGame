# TRSE TVC unit source index

Raw `.tru` unit source (TRSE's Pascal-like unit format; bodies are mostly inline Z80
`asm(...)`). Full API catalogs live in `../notes/notes_tru_units.md` (all 6 TVC units +
global units) and `../notes/notes_ge_tru_2026.md` (the newer GE.tru, see below).

## `TVC/` — platform-specific units

| File | Lines | Purpose | Catalog |
|---|---|---|---|
| `TVC.tru` | 2240 | Core "standard library": screen/graphics (firmware-call based), memory banking, text, keyboard, sound, cassette file I/O | `../notes/notes_tru_units.md` §2 |
| `GE.tru` | 8232 | **Berysoft's Game Engine, canonical 2026-01-31 build.** Software sprites (`Sprite`/`Image` classes), GameCard 3rd/4th joystick, digi-sound (PCM sample playback), sprite mirroring, `List` class, hardware scrolling, ZX7 decompression | `../notes/notes_ge_tru_2026.md` (full); `../notes/notes_tru_units.md` §3 (2023 baseline, still accurate for unchanged parts) |
| `legacy/GE.2023-05-10.tru` | 2951 | Prior GE.tru build (bundled with the TRSE install). Kept for reference **only** — the 2 breaking changes vs. 2026 (`Sprite.InitAnimation` arg count, per-key press functions removed) mean code written against this version needs migration. Do not use as the primary API source. | `../notes/notes_tru_units.md` §3 |
| `system.tru` | 191 | Firmware interrupt/ROM-banking control, register push/pop for custom interrupt handlers | `../notes/notes_tru_units.md` §4 |
| `text.tru` | 299 | Lower-level, CPC-firmware-styled text VDU API (distinct from `TVC.tru`'s text section) | `../notes/notes_tru_units.md` §5 |
| `music.tru` | 666 | 3-channel software music player (custom IRQ, phase-accumulator mixing, custom tracker format) | `../notes/notes_tru_units.md` §6 |
| `crtc.tru` | 161 | Mostly **stub/dead code** — only `EnableVRAM`, `SetMode`, `SetPalette`, `SetBorder` implemented | `../notes/notes_tru_units.md` §7 |

## `global/` — cross-platform units (also usable when targeting TVC)

| Path | Purpose |
|---|---|
| `gfx/lib3d.tru` | Generic 3D wireframe engine (`Lib3d` unit) |
| `gfx/linegeneric.tru` | Generic Bresenham line drawing (`LineGeneric` unit) |
| `gfx/genericlevels.tru`, `gfx/genericlevels2.tru` | Tile-based level format reader/renderer |
| `math/matrix.tru` | 3x3 matrix math for the 3D engine |
| `math/vector.tru` | Placeholder/near-empty |
| `system/str.tru` | String utilities: `strlen`, `reverse`, `itoa`/`itoh`, `ltoa`/`ltoh`, `strcat`, `substr` |
| `system/tables.tru` | Placeholder/near-empty |
| `unittests/` | TRSE's own compiler regression tests — **not** a library, don't mistake for one |

Full detail: `../notes/notes_tru_units.md` §8.

## Searching this tree

Every procedure/method is declared with `procedure`/`function`, so:
```
grep -n "^\s*\(procedure\|function\)" sources/tru-units/TVC/GE.tru
```
finds every callable in a unit fast. For semantic questions ("how does X work"), prefer
the curated catalogs in `../notes/` — they already explain intent, not just signatures.
