# TVC / TRSE Skill — Project Notes

This folder is a **Claude Code skill package** for programming the **Videoton TV
Computer (TVC)** — a Hungarian Z80-based 8-bit home computer from the 1980s — using
**TRSE** (Turbo Rascal Syntax Error), a Pascal-like cross-compiler for 8-bit systems.

**This entire folder is self-contained and portable.** Nothing in it depends on any
path outside itself — no reference to `/home/dey/trse`, `/home/dey/SANE`, or anywhere
else on this machine. Zip it up and hand it to someone else, or drop it into another
project's `.claude/skills/` folder, and it works unchanged. See `PLAN.md` (this same
folder) for the build roadmap.

## Structure

```
tvc-trse-skill/
  SKILL.md                  # entry point (interim version — see Status below)
  PLAN.md                    # build roadmap
  PROJECT_NOTES.md            # this file
  references/                  # curated, concise skill content — NOT YET WRITTEN (Phases 1-6)
  templates/                    # clean project.trse + main.ras starter skeleton
  sources/                       # everything bundled, raw + notes, fully searchable now
    INDEX.md                      # top-level guide to this tree
    notes/                          # this session's research notes (curated, read first)
    tru-units/                       # all TVC .tru unit source + cross-platform global units
    tutorials/                        # all 9 known-compiling example .ras programs + assets
    docs/                               # all 37 PDFs + plain-text extractions of the 3 readable ones
    sane-trse-docs/                       # full copy of SANE's generic TRSE language doc site
```

Every folder under `sources/` has its own `INDEX.md` — start there, not with a raw
`find`/`ls`. Grep works throughout except `sources/docs/pdf/*.pdf` for the 34
scanned-only manuals (use `sources/docs/extracted/*.txt` instead, or `pdftotext`/
`pdffonts` on demand for anything not yet checked).

## Where the bundled material originally came from (provenance only — not a dependency)

These paths no longer need to exist for this skill to work; they're recorded here so
future updates (pulling in a newer version of something) know where to look.

### TRSE compiler install — originally `/home/dey/trse/`
- `units/TVC/*.tru` → now `sources/tru-units/TVC/`. Full catalog:
  `sources/notes/notes_tru_units.md`.
  - `TVC.tru` (2240 lines) — general-purpose "standard library": screen/graphics
    (firmware-call based), memory banking, text, keyboard, sound, cassette file I/O.
  - `GE.tru` (2951 lines, dated May 10, 2023) — the original Berysoft Game Engine
    (Zsolt Bertók / "Bery"; `SpaceWar.ras` renders "BERYSOFT" in-game). **Superseded**
    — now kept at `sources/tru-units/TVC/legacy/GE.2023-05-10.tru` for reference only.
  - `system.tru`, `text.tru`, `music.tru`, `crtc.tru` — see `sources/tru-units/INDEX.md`.
  - `units/global/` → now `sources/tru-units/global/` — cross-platform units also
    usable on TVC (generic 3D wireframe engine, line drawing, tilemap loader, matrix
    math, string utils).
- `tutorials/TVC/*` → now `sources/tutorials/`. Full catalog:
  `sources/notes/notes_tutorials.md`.
- `project_templates/tvc_image/` → now `sources/tutorials/project_template_tvc_image/`
  and cleaned into `templates/`.

### The newer Berysoft Game Engine — found by you, 2026-08-18, originally at the TVC project root
`GE.tru` dated **January 31, 2026**, 8232 lines (2.8x the bundled 2023 one). Now the
**canonical** copy at `sources/tru-units/TVC/GE.tru`. Confirmed genuinely newer (not a
fork) — same author, same core `Sprite`/`Image` class shape. New subsystems since 2023:
- **GameCard** — a joystick-expansion peripheral occupying one of 4 external slots (ID
  string `"JOY+SN"`). `InitGameCard()` scans slots; `Joystick(Nr=3/4,...)`/`Joy3State`/
  `Joy4State` then transparently support it. Its `GAMECARD_JOY_*` bitmasks use a
  *different* encoding than the built-in `JOY_*` constants.
- **Digi sound** — real 4-bit PCM sample playback via a dedicated interrupt (mutually
  exclusive in timing with the raster/cursor interrupt). `DigiSoundOn(Frequency,
  DigiSoundType)` picks 2/4/8kHz and a 1x4-bit (~12.6% CPU, full size) vs. 2x4-bit
  (~20% CPU, half size) tradeoff; two non-interchangeable "is playing" pollers, one per
  packing type.
- **Sprite mirroring** — `InitSpriteMirroring()` builds a 256-byte nibble-swap table,
  plus `DrawMirror`/`FastDrawMirror`/`PutMirrored`/`PutAllSpritesWithMirroring`.
- A new **`List` class** (20-item fixed-capacity pointer list, general-purpose).
- 3 animation loop modes (`LOOP_FORWARD`/`PINGPONG`/`BACKWARD`) replacing the 2023
  version's single direction.
- Also new: deferred `Sprite.Show`/`Hide`, 8-directional `Scroll()`,
  `EnableTVCITHandler`/`DisableTVCITHandler` (auto-invoked by `GE::Init`), accent-aware
  `WriteText`.

**Two breaking changes vs. 2023** (everything else is additive) — call these out
explicitly wherever the skill documents migration or cites the old tutorial examples:
1. `Sprite.InitAnimation` gained a required 3rd argument (the loop-mode constant).
2. The old per-key functions (`SpacePressed`, `EscPressed`, `ReturnPressed`, etc.) were
   **removed**, replaced by a generic `GE::Pressed(KeyCode)` plus ~90 new `KEY_*`
   constants — meaning `SpriteDemo.ras`/`SpaceWar.ras` (written against the 2023 API,
   now at `sources/tutorials/tutorials_bertok/`) will **not** compile unmodified
   against this 2026 unit.

Full updated catalog: `sources/notes/notes_ge_tru_2026.md`. **Use this 2026 version as
canonical for `references/api/ge-unit.md`** (Phase 3) with the breaking changes as a
migration note.

### Generic TRSE language docs — originally `/home/dey/SANE/docs/`, now bundled at `sources/sane-trse-docs/`
SANE is a C64-only TRSE fork with the best-organized TRSE documentation available,
cross-checked against compiler source. Its docs (~319 files, ~1.5MB) are now **fully
bundled** here, since Phase 2 (language reference) needs to read them directly.
Structure and reuse analysis: `sources/notes/notes_sane_doc_template.md`.
- **Directly reusable for TVC** (compiler-frontend, target-independent): all of
  `reference/keywords/` (~51 pages), all of `reference/operators/` (19 pages), nearly
  all of `reference/types/` (~16 pages, except `cstring`/`incsid`), and most of
  `reference/directives/` (~54 pages, except image/asset-export and C64-tooling
  directives).
- **NOT reusable** — C64-hardware-specific: `reference/constants.md`, most of
  `reference/builtins/` (~137 pages — VIC-II/SID/sprite/CIA wrappers), `platform-
  notes.md`, `project-files.md`'s hardware content.
- **Compatibility tags matter**: pages tagged `SANE` (new, not in vanilla TRSE) must be
  excluded; pages tagged `TRSE (modified in SANE)` must be documented using their
  *vanilla* (unfixed) behavior for the TVC skill. Plain `TRSE`-tagged content is safe
  to reuse as-is.

### TVC hardware/software PDF manuals — originally `/home/dey/TVC/tvc_dokumentaciok/`
Downloaded via `doksi_downloader.sh` (still at the outer project root) from
tvc.homeserver.hu. Now bundled at `sources/docs/pdf/`. 37 PDFs across 7 category
folders; full extraction survey and index: `sources/docs/INDEX.md` and
`sources/notes/notes_pdf_hardware.md`.
- **Text-extractable, plain-text copies in `sources/docs/extracted/`**: the English
  *Videoton TV-Computer Programming Guide 2023* (primary hardware source — memory map,
  video modes, colors, CRTC 6845, full I/O port table), the OCR'd 476-page *TVC ROM*
  book (primary ROM/BASIC-internals source), and Bertók Zsolt's 2019 graphics/sound
  programming guide (secondary, practical VRAM/sprite/raster-IRQ technique).
- **Scanned-image-only** (34 of 37, no text layer, need OCR): everything else. Not
  blocking — the three sources above cover the ground needed for a TRSE-focused skill.

## Existing reference skill found on the build machine (not bundled — structural model only)
`~/.config/Claude/local-agent-mode-sessions/skills-plugin/.../skills/trse-coding/` — a
previously-built Claude Code skill for **TRSE targeting the C64** (not TVC, same
compiler/language). Not copied in here (it's someone else's finished skill, not raw
material), but its `SKILL.md` shape was used as the structural model for this skill's
`SKILL.md`: frontmatter (name + a deliberately over-triggering `description`), a short
always-in-context "quirks that trip everyone up" section, then pointers to
`references/*.md` loaded on demand.

## Research notes (`sources/notes/`)
- `notes_tru_units.md` — full TVC/GE(2023)/system/text/music/crtc API catalog +
  hardware primer.
- `notes_ge_tru_2026.md` — full catalog of the canonical 2026 `GE.tru`, focused on
  what's new/changed vs. 2023, including the 2 breaking changes.
- `notes_tutorials.md` — tutorial/example catalog, verbatim `.trse` project files, the
  minimal starter template.
- `notes_pdf_hardware.md` — PDF extraction survey + extracted hardware facts with
  source citations.
- `notes_sane_doc_template.md` — SANE doc site structure, per-page template pattern,
  compatibility-tag system, generic-vs-C64-specific content triage.

**Consistency note**: 3 of the 4 initial research agents hit transient API server
errors mid-response and were resumed (not restarted) via `SendMessage`. Spot-checked
their output afterward against ground truth — verbatim project-file blocks match the
real files exactly, PDF page counts match `pdfinfo` exactly, SANE reference-folder
counts are accurate to within ±1-3 (an approximate figure, not a fabrication). No
corruption found.

## Status
Research/mapping complete (2026-08-18), plus a follow-up pass after finding the newer
`GE.tru`, plus a full self-containment pass (everything bundled, including SANE's
docs, no external paths left anywhere in this package). `references/` (the curated,
concise skill content) is **not yet written** — that's Phases 1-6 in `PLAN.md`. The
current `SKILL.md` is an honest interim version that points directly into `sources/`
rather than a finished one.
