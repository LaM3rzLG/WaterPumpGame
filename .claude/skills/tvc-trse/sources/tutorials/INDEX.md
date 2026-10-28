# TVC tutorial / example source index

Runnable TRSE `.ras` programs targeting TVC, with their project files and asset
resources. Full catalog with technique/unit-usage breakdown:
`../notes/notes_tutorials.md`. All examples here are **known to compile** (several ship
pre-built `.bin`/`.cas` outputs as proof).

## `tutorials/` — general examples (project file: `tvc_tutorials.trse`)

| File | Technique | Units used |
|---|---|---|
| `tutorial_image.ras` | Compressed 256×240 4-color image display | `crtc`, `memory`, `system`, `text`, `compression` |
| `tutorial_image2.ras` | Same, 128×240 16-color mode | same — this is the template `templates/` was derived from |
| `tutorial_image3.ras` | Same, 512×240 2-color mode | same |
| `twister.ras` | Sine-tunnel scrolltext demo effect (needs `data/twister_*.bin`, generated via `resources/fjong/twister.fjo`) | `crtc` |
| `plasma.ras` | Classic plasma, hand-written inline Z80 asm inner loop with `repeat`/`repend` unrolling | `crtc` |
| `music.ras` | SID-derived music playback (non-blocking, interrupt-driven), full asset pipeline documented in header comments | `Music`, `crtc` |

## `tutorials_bertok/` — Bery (Zsolt Bertók) examples (project file: `tvc_tutorials_bertok.trse`)

| File | Technique | Units used | Notes |
|---|---|---|---|
| `tutorial_tvc.ras` | Broad tour of the `TVC` unit: text, char redefinition/animation, vector drawing, raster sync, joystick, sound | `tvc` | 338 lines, best single-file tour of ROM-routine capabilities |
| `SpriteDemo.ras` | `GE::Sprite`/`GE::Image` tutorial: animation, background save/restore, double buffering, joystick movement | `GE` | 281 lines. **Written against the 2023 GE API** — see migration note below |
| `SpaceWar.ras` | Complete shoot-em-up: state machines, entity records, collision detection, laser pooling, level/game-over flow | `GE` | 893 lines, richest single reference for a full game architecture. **Written against the 2023 GE API** — see migration note below |

**Migration note**: `SpriteDemo.ras` and `SpaceWar.ras` were written against the 2023
`GE.tru` (`../tru-units/TVC/legacy/GE.2023-05-10.tru`) and will **not compile
unmodified** against the canonical 2026 `GE.tru` — `Sprite.InitAnimation` needs a 3rd
argument, and `SpacePressed`/`EscPressed`/etc. were replaced by `GE::Pressed(KeyCode)`.
See `../notes/notes_ge_tru_2026.md` §9 for the full breaking-change list before adapting
these into cookbook docs.

## `project_template_tvc_image/` — minimal starter skeleton

`project.trse` + `files/main.ras`, structurally identical to `tutorials/tutorial_image2.ras`.
Clean copies live in `../../templates/`.

## Searching this tree
```
grep -rn "@use" sources/tutorials/          # which units each example depends on
grep -rln "GE::" sources/tutorials/         # examples using the Game Engine
```
