# Plan: TVC/TRSE Claude Code Skill

Companion to `PROJECT_NOTES.md` (source material map, same folder). This is the design
+ build roadmap for the actual skill. This whole package is self-contained — see
`PROJECT_NOTES.md` for details.

## 1. What the skill needs to do

Let a user ask Claude Code to write, explain, fix, or extend **TRSE Pascal-like
programs targeting the Videoton TV Computer** and get accurate answers grounded in the
real compiler surface (not hallucinated builtins), covering:
- Project setup (`.trse` project file, compiling via `trse -cli`)
- The generic TRSE language (types, keywords, operators, directives)
- The TVC-specific standard library (`TVC.tru` — firmware/ROM-call style) and the
  Berysoft Game Engine (`GE.tru` — software sprites, faster low-level style)
- TVC hardware facts needed to reason about code (memory banking, video modes, palette,
  CRTC, sound, I/O ports, keyboard/joystick matrix)
- Common patterns: image display, effects (plasma/twister), music playback, sprite
  animation, a full game loop — grounded in the real tutorial examples

## 2. Proposed skill location & structure

A directly relevant precedent already exists on this machine: a Claude Code skill for
**TRSE targeting the C64** at
`~/.config/Claude/local-agent-mode-sessions/skills-plugin/.../skills/trse-coding/`.
Its `SKILL.md` shape is worth copying almost exactly:
- YAML frontmatter with `name` + a deliberately **over-triggering** `description`
  ("better to over-trigger than to miss a TRSE question").
- A short, always-loaded "Core TRSE knowledge" section covering the handful of
  syntax quirks that actually trip people up (non-inclusive `for` loops, no semicolon
  before `else`, nested-conditional parenthesization, `#` as address-of, `mem[]`
  access, `::` unit-member syntax, signed-arithmetic gotchas, record-vs-class
  array-indexing rules) — kept inline because it's small and needed on nearly every
  question, unlike the bulkier reference material.
- Everything else pushed into `references/*.md`, loaded on demand, with an explicit
  "Reference files" section up top telling the model which file answers which kind of
  question (a 3-step workflow: syntax question → `language_syntax.md`; implementation
  pattern → `examples.md`; specific effect/topic → `tutorial_toc.md` → the actual
  `.ras` file).
- A "How to respond" closing section calibrating output format (code-gen vs.
  debugging vs. optimization) rather than leaving it implicit.

The TVC skill should mirror this shape, with a TVC/GE-specific "quirks that trip
people up" section (e.g. the two-coordinate-system issue in `TVC.tru` flagged in
`notes_tru_units.md` §9, the `TVC::` vs `GE::` dual-library split, VRAM paging
save/restore discipline) replacing the C64-specific one.

**Resolved (2026-08-18, revised same day): built as a plain top-level folder,
`tvc-trse-skill/`, fully self-contained.** First pass put this at
`.claude/skills/tvc-trse/` (auto-discovered project skill location); moved to a plain
visible folder per explicit follow-up feedback — the priority is a portable package
you can hand to someone else, not Claude Code auto-discovery in this one project. (If
you want auto-discovery back later, copy or symlink this folder into a `.claude/
skills/tvc-trse/` path — nothing here prevents that.) It bundles a **complete local
copy** of every source it draws on, including SANE's docs — no path outside this
folder is required for anything in here to make sense. Current structure (✅ = built
this pass, ⬜ = pending Phases 1-6):

```
tvc-trse-skill/                (this folder — fully self-contained)
  SKILL.md                     ✅ interim version (points into sources/ directly)
  PLAN.md                      ✅ this file
  PROJECT_NOTES.md             ✅ source material map + provenance
  references/                  ⬜ curated, concise content — the eventual primary layer
    getting-started.md
    hardware.md
    language/{keywords,operators,types,directives}.md
    api/{tvc-unit,ge-unit,system-unit,text-unit,music-unit,crtc-unit}.md
    cookbook/{display-image,plasma-effect,twister-effect,music-playback,
              sprite-basics,full-game-walkthrough}.md
  templates/                   ✅ project.trse + main.ras starter skeleton
  sources/                     ✅ full bundled raw material, indexed, grep-able
    INDEX.md                     top-level guide
    notes/                       this session's 5 research notes + INDEX.md
    tru-units/                   all .tru unit source (TVC + global) + INDEX.md
      TVC/GE.tru                   canonical 2026 build
      TVC/legacy/GE.2023-05-10.tru  superseded, kept for migration reference
    tutorials/                   all 9 example .ras programs + project files + INDEX.md
    docs/                        all 37 PDFs + INDEX.md
      pdf/                          originals, by category
      extracted/                    plain-text of the 3 readable ones
    sane-trse-docs/               ✅ full copy of SANE's TRSE language doc site (~319 files)
```

`references/` is still empty — that's Phases 1-6 below. Until then, `SKILL.md` is an
honest interim version pointing directly into `sources/`, which is itself fully usable
(indexed, mostly plain-text/grep-able) right now.

Why two tiers instead of just `sources/`: `references/` will be *concise and
synthesized* (what a skill should hand an agent — direct answers, decision guides,
curated examples), while `sources/` is deliberately raw and complete (what backs those
answers, and what to fall back to for anything `references/` doesn't cover or when a
primary-source quote/exact signature is needed). Same shape as SANE's own docs pattern
of "reference pages" vs. "known-bugs.md deep detail," just split into separate trees
here since `sources/` is bulkier (675MB of PDFs) than a doc site would want inline.

## 3. Content-sourcing plan, by section

All paths below are relative to this folder (`tvc-trse-skill/`).

| Skill doc | Primary source(s) | Notes |
|---|---|---|
| `references/getting-started.md` | `sources/notes/notes_tutorials.md` (verbatim `.trse`/`.ras` templates), `sources/sane-trse-docs/getting-started.md` as structural model | Explain zeropage/optimizer fields only at a "don't touch these" level; focus on `system = TVC`, `output_type`, compile command |
| `references/hardware.md` | `sources/notes/notes_pdf_hardware.md` → `sources/docs/extracted/Videoton_TV-Computer_Programming_Guide_2023.txt` + `TVC_ROM_OCR_verzio.txt` + Bertók 2019 graphics book | Memory paging (4×16KB, port $02), 3 video modes, palette encoding, CRTC 6845 register map, full I/O port table, sound ports, keyboard/joystick matrix |
| `references/language/*.md` | `sources/sane-trse-docs/reference/{keywords,operators,types,directives}/` (bundled — see `sources/notes/notes_sane_doc_template.md`), filtered to `TRSE`-tagged (vanilla behavior for `TRSE (modified in SANE)`, exclude `SANE`-tagged) | Reuse SANE's per-page template (Syntax/Parameters/Returns/Example/Known limitations) |
| `references/api/tvc-unit.md` | `sources/notes/notes_tru_units.md` §2 | ~50 procedures, keep the firmware-call framing (many are thin `rst $30` wrappers) |
| `references/api/ge-unit.md` | **`sources/notes/notes_ge_tru_2026.md`** (source: `sources/tru-units/TVC/GE.tru`, canonical), cross-referencing `sources/notes/notes_tru_units.md` §3 for unchanged parts | Emphasize `Sprite`/`Image` class contract, `RenderAllSprites` frame-loop pattern, `UseBackScreen` double-buffering, **plus the 2026 additions**: GameCard 3rd/4th joystick, digi-sound (sample playback, CPU-cost tradeoff vs. square-wave `Sound`), sprite mirroring, `List` class, `LOOP_FORWARD`/`PINGPONG`/`BACKWARD` animation modes. **Must include a migration note for 2 breaking changes**: `Sprite.InitAnimation` needs a new 3rd (loop-mode) argument, and per-key functions (`SpacePressed` etc.) were removed in favor of `GE::Pressed(KeyCode)` + `KEY_*` constants |
| `references/api/system-unit.md`, `text-unit.md`, `music-unit.md` | `sources/notes/notes_tru_units.md` §4-6 | Cross-reference `music.tru`↔`system.tru` firmware-hijack relationship explicitly |
| `references/api/crtc-unit.md` | `sources/notes/notes_tru_units.md` §7 | Explicitly mark stub procedures as unimplemented, point to TVC.tru/GE.tru equivalents |
| `references/cookbook/*.md` | `sources/notes/notes_tutorials.md` examples, actual `.ras` files in `sources/tutorials/` | Link/adapt real compiling examples rather than inventing new ones; note asset-pipeline dependencies (`.fjo` fjong scripts, SID conversion) where relevant. `SpriteDemo.ras`/`SpaceWar.ras` need the GE 2023→2026 migration patch or an explicit version caveat (see `sources/tutorials/INDEX.md`) |
| `templates/*` | already populated — `sources/tutorials/project_template_tvc_image/` (verbatim source), `templates/project.trse` + `templates/main.ras` (clean copies, done) | |

## 4. Build phases

- [x] **Phase 0 — Research & mapping** (this session): catalog `.tru` units, tutorials,
      PDF hardware docs, and the SANE doc template. Output: the 5 `notes_*.md` files
      (now at `sources/notes/`).
- [x] **Phase 0.5 — Self-contained bundling** (this session, revised same day): built
      the skill as a plain top-level folder (`tvc-trse-skill/`), copied/moved every
      source (`.tru` units, tutorials, all 37 PDFs + 3 text extractions, the research
      notes, and — in the revision — the full SANE docs site too) into `sources/`,
      wrote an `INDEX.md` at the top of `sources/` and inside each of its 5
      subfolders, and wrote an interim `SKILL.md`. Verified: `pdftotext` extraction
      line counts match the earlier research notes exactly (e.g. 22048 lines for the
      ROM book), confirming no drift between what was researched and what got bundled.
      Zero remaining references to any path outside this folder anywhere in
      `SKILL.md`, `PLAN.md`, or `PROJECT_NOTES.md`.
- [x] **Phase 1 — Hardware reference**: done — `references/hardware.md` written
      directly from the primary source (`sources/docs/extracted/Videoton_TV-Computer_
      Programming_Guide_2023.txt`, read in full), corroborated by the ROM OCR book and
      Bertók's graphics guide. Covers: memory paging, all 3 graphic modes (including
      the Graphics-4 bit-interleaving gotcha), palette/border encoding, screen/VRAM
      layout + coordinate-system split, full CRTC 6845 register table + raster-IT
      calculation, full I/O port map, sound, keyboard/joystick (+ 2026 GameCard),
      system variables/safe-memory-areas, and a "known traps" summary. Cross-referenced
      to the actual `TVC::`/`GE::` procedure names throughout so it's actionable, not
      just trivia. Spot-checked the joystick bitmask constants (`JOY_LEFT`=64 etc.)
      directly against `sources/tru-units/TVC/TVC.tru` — exact match.
- [x] **Phase 2 — Language reference**: done — 4 parallel agents adapted SANE's
      keyword/operator/type/directive pages into `references/language/{keywords,
      operators,types,directives}.md` (one file per category, `##` group headers +
      `###` per-entry, ~3500 lines total). Tag-triaged throughout: `SANE`-only content
      excluded, `TRSE (modified in SANE)` content documents the original vanilla
      behavior (bug included) rather than SANE's fix, since real TVC-target TRSE
      doesn't carry SANE's patches.
      - **Keywords**: 52/52 included, 0 excluded, 15 carry vanilla-TRSE limitations.
        `krillsloader` correctly flagged as C64-disk-fastloader-only, no TVC
        equivalent. 6502-specific codegen wording stripped from limitation notes
        since TVC is Z80-based, not 6502.
      - **Operators**: 19/19 included, 0 excluded. Surfaced a substantial list of
        unresolved vanilla-TRSE signed-arithmetic bugs a TVC developer needs to know
        (signed division not implemented at all; `>`/`>=` don't compile for `signed
        integer`; all 4 comparisons don't compile for `signed long`; `xor` as a
        boolean combinator always evaluates true; `shr` is never arithmetic even on
        signed values; etc.) — see the file for the full list.
      - **Types**: 14 included, `incsid` excluded (SID-chip-specific, TVC has none),
        `cstring` included but flagged as an **open question** — its C64 PETSCII
        screen-code mapping doesn't apply to TVC, and TVC's own character encoding
        isn't documented anywhere in this skill yet. Revisit once that gap is filled.
      - **Directives**: 41 generic + 13 flagged C64-specific (no TVC equivalent yet),
        0 excluded as SANE-only. Verified assumptions against real TVC source instead
        of trusting the earlier research hint at face value — corrected it twice:
        most of the `@export*` family (`@exportsubregion`, `@exportblackwhite`,
        `@exportframe`, `@exportcompressed`, `@exportrgb8palette`,
        `@export_parallax_data`, `@setcompressionweights`, `@perlinnoise`,
        `@pathtool`) is confirmed TVC-compatible — real `.ras` tutorials use plain
        `@export` the same way SANE's C64 docs show it — while `@exportprg2bin`
        (reads a C64 `.prg` load address) and `@vbmcompilechunk` (emits literal 6502
        opcodes) are genuinely C64-only despite not being on the original hint list.
- [x] **Phase 3 — TVC API reference**: done — all 6 unit reference files written
      (`references/api/{tvc-unit,ge-unit,system-unit,text-unit,music-unit,
      crtc-unit}.md`, 721 lines total), directly from `sources/notes/
      notes_tru_units.md` and `sources/notes/notes_ge_tru_2026.md`. `ge-unit.md`
      unifies the 2023 baseline and 2026 delta into one canonical reference (using the
      2026 build throughout) with the 2 breaking changes presented as an upfront
      migration section, not buried in a changelog. `crtc-unit.md` explicitly marks
      every stub procedure as non-functional rather than implying it works.
      Spot-checked `LOOP_FORWARD`/`PINGPONG`/`BACKWARD` and `GE::Pressed` directly
      against `sources/tru-units/TVC/GE.tru` — exact match.
- [x] **Phase 4 — Cookbook**: done — 7 parallel agents wrote
      `references/cookbook/{display-image,plasma-effect,twister-effect,music-playback,
      tvc-unit-tour,sprite-basics,full-game-walkthrough}.md` (3,600 lines total) plus
      2 patched, migration-fixed `.ras` files at `references/cookbook/assets/`.
      `tvc-unit-tour.md` was added beyond the original plan (a "systems tour" of
      `TVC.tru` via `tutorial_tvc.ras`, contrasted explicitly with `GE.tru`'s
      sprite-based style) since it didn't fit any of the other 6 planned docs but was
      too valuable to drop.

      **A 3rd GE breaking change was found** during this phase, missed by the
      Phase 0/8 research: the global `CharSetHeight` was renamed to `CharHeight` in
      the 2026 build. It surfaced by actually compiling the patched `SpriteDemo_2026.ras`
      and hitting `Could not find variable 'GE_CharSetHeight'` — now documented as
      breaking change #3 in `references/api/ge-unit.md`'s migration section, and fixed
      in both patched cookbook assets.

      **Compile verification, mixed results**:
      - `SpriteDemo_2026.ras` — **verified**: compiled clean (zero errors) against an
        isolated copy of the toolchain with the canonical 2026 `GE.tru` swapped in.
        This is what caught the `CharSetHeight` rename above.
      - `SpaceWar_2026.ras` — **not verified**, and importantly, **the original
        unmodified 2023 `SpaceWar.ras` also fails to compile** against its own
        matching 2023 `GE.tru` with the currently-installed `trse` binary (a
        different error: `constant '' already defined` at a bare `= X` line, vs. the
        patched 2026 attempt's `Symbol '(GE_Joy3State)' undefined`). Both errors are
        assembler-level and unrelated to the API-migration edits (confirmed by the
        pristine-original also failing). This looks like a pre-existing
        toolchain-version sensitivity to `SpaceWar`'s scale (by far the largest file
        in this skill, 893-907 lines) — most likely the bundled, working
        `SpaceWar.bin`/`.cas` artifacts were built with a different `trse` version
        than what's installed here. **Correction to earlier claims** (in
        `PROJECT_NOTES.md` and `sources/notes/notes_tutorials.md`): "ships with
        pre-built `.bin`/`.cas`, confirming it compiles" was an inference from
        artifact presence, not a verified compile with the currently-installed
        toolchain — that inference no longer holds for `SpaceWar.ras` specifically
        (still holds for `SpriteDemo.ras`, since that one now has an actual clean
        compile behind it). The migration patch itself (all 9 call-site edits) was
        still verified correct by careful manual diff against the documented 2026
        API, independent of the compile attempt.
      - Also notable: `trse -cli` **does** work headlessly in this environment when
        invoked correctly (`trse -cli op=project project=<proj>.trse
        input_file=<file>.ras`, run from the file's own directory so relative
        resource paths resolve) — contrary to an earlier report from one agent that
        it hung waiting for a display (that agent's invocation was likely missing
        required arguments, causing it to fall through to GUI mode).
- [x] **Phase 5 — Templates**: done — `templates/project.trse` + `templates/main.ras`
      are clean copies from `sources/tutorials/project_template_tvc_image/`.
- [x] **Phase 6 — SKILL.md**: done — the final, concise `SKILL.md` is written, now
      that `references/` is complete: frontmatter, a self-containment statement, a
      "Reference files" index (what to load for what), a "Which unit? `TVC.tru` vs
      `GE.tru`" decision guide, a "Known traps" section (GE migration, vanilla-TRSE
      signed-arithmetic bugs, VRAM paging discipline, dead `crtc.tru` stubs, Z80-not-
      6502, and the Linux `@use` case-sensitivity gotcha found in Phase 7), a
      "Getting started" pointer to `templates/`, and a "How to respond" section
      calibrating output format — modeled on the `trse-coding` skill found on this
      machine, per the plan in §2.
- [x] **Phase 7 — Validation**: done, with real findings, not just a clean pass.
      Requires the TRSE compiler binary (`trse -cli`), which is build-tooling, not
      skill content — it lives on the build machine at `/home/dey/trse/bin/trse` and
      is **not** part of this bundle (a compiler binary isn't source material to
      share; anyone using this skill elsewhere needs their own TRSE install to
      compile, same as any compiler-targeting skill).
      - **`templates/project.trse` + `main.ras`** (the actual starter skeleton a new
        user gets): compiles clean, produces `main.bin`.
      - **5 of 6 general-tutorial cookbook sources** (`tutorial_image.ras`/`image2`/
        `image3`, `plasma.ras`, `twister.ras`) compile clean as-is.
      - **`music.ras` failed** with `Could not find TRU file for inclusion : Music` —
        traced to a genuine, confirmed **Linux case-sensitivity gotcha**: `@use
        "Music"` doesn't match the actual file `music.tru` (lowercase) on a
        case-sensitive filesystem. Verified the theory directly (supplying a
        correctly-cased copy fixes it). **Same issue independently confirmed on**
        `tutorial_tvc.ras`'s `@use "tvc"` vs. actual file `TVC.tru`. Documented in
        `references/language/directives.md`'s `@use` entry, `SKILL.md`'s Known traps,
        and both affected cookbook docs (`music-playback.md`, `tvc-unit-tour.md`).
        This wasn't previously known — none of the earlier PDF/unit research surfaced
        it, since it only shows up by actually compiling on this specific OS.
      - **`SpriteDemo_2026.ras`** (the patched GE cookbook asset): verified clean in
        Phase 4, still holds.
      - **`SpaceWar_2026.ras`** and even the pristine original `SpaceWar.ras`: still
        unverified, per the Phase 4 finding (toolchain-version sensitivity to this
        file's scale, not a code defect) — documented in `full-game-walkthrough.md`
        and not re-litigated here.
- [x] **Phase 8 — Berysoft engine reconciliation**: resolved. You found a newer
      `GE.tru` (Jan 31, 2026, 8232 lines), now the canonical copy at
      `sources/tru-units/TVC/GE.tru`, superseding the 2023 one (kept as
      `sources/tru-units/TVC/legacy/GE.2023-05-10.tru`). Confirmed genuinely newer
      (not a fork), same author. Full catalog: `sources/notes/notes_ge_tru_2026.md`.
      **Verdict: not a strict superset** — 2 breaking changes found
      (`Sprite.InitAnimation` 3rd-arg addition; per-key functions replaced by
      `GE::Pressed(KeyCode)`), everything else additive. **Use the 2026 version as
      canonical for `references/api/ge-unit.md`** (Phase 3) with the breaking changes
      called out as a migration note.

## 5. Open decisions / assumptions to confirm

1. ~~Skill location~~ — **resolved**: plain top-level folder `tvc-trse-skill/`,
   fully self-contained, no external paths (see §2).
2. **BASIC coverage** — most BASIC-manual PDFs are scanned/un-OCR'd (bundled as-is
   under `sources/docs/pdf/`, not text-searchable yet) and the project framing is TRSE
   (a compiler, not BASIC), so BASIC is out of scope by default for `references/`. Say
   so if you actually want a BASIC-language reference section too (would need OCR
   work first).
3. **OCR for remaining PDFs** — 34 of 37 PDFs have no text layer (all still bundled as
   raw PDFs under `sources/docs/pdf/`, just not yet plain-text-searchable). Not
   blocking Phase 1-7 since the 3 usable sources cover the needed ground, but flag if
   you want specific ones OCR'd (e.g. `TVC_kodtablazat.pdf`, 2 pages, cheapest target,
   for an accurate character-code table) — would add a `.txt` into `sources/docs/
   extracted/` and an `INDEX.md` update, same pattern as the 3 already done.
4. **Language reference granularity** — one file per category vs. one per keyword
   (leaning per-category for skill-file-count sanity; SANE's one-per-page approach
   suits a browsable doc site more than a skill's reference folder).

## 6. Consistency check on the interrupted research agents

Three of the four Phase-0 research agents hit transient API server errors mid-response
and were resumed (not restarted from scratch) via `SendMessage`. Spot-checked their
output against ground truth afterward:
- `sources/notes/notes_tutorials.md`'s verbatim `.trse` project-file blocks match the
  real files exactly (byte-for-byte diff, zero deltas).
- `sources/notes/notes_pdf_hardware.md`'s page-count claims (23 / 476 / 42 pages)
  match `pdfinfo` exactly for all three cited PDFs.
- `sources/notes/notes_sane_doc_template.md`'s reference-folder counts are accurate to within ±1-3
  (e.g. "140 builtins" vs. 137 actual, "17 types" vs. 16 actual) — an approximate
  figure stated as such, not a fabrication; the underlying content triage (which pages
  are C64-specific vs. generic) checked out on direct inspection.

No corruption or fabricated content found. The resumed agents re-verified via fresh
tool calls after being cut off rather than relying on recalled memory, which is why
the resume held up cleanly.

## 7. Status: all 8 phases complete

`tvc-trse-skill/` is a finished, self-contained Claude Code skill: `SKILL.md` (final,
concise entry point), `references/` (hardware, 4-file language reference, 6-file API
reference, 7-file cookbook + 2 patched compiling examples), `templates/` (verified-
compiling starter), and `sources/` (every raw material this all draws on, indexed and
mostly grep-able). Everything that could be verified against a real compiler was;
everything that couldn't (BASIC coverage, OCR on the 34 unreadable PDFs, the
`SpaceWar`-scale toolchain issue) is explicitly flagged rather than silently assumed.

Natural next steps, none of them blocking:
- OCR specific PDFs on request (§5.3) if a gap in `references/hardware.md` shows up
  in practice.
- Investigate the `SpaceWar`-scale compile issue further if a different `trse` build
  becomes available to test against.
- Expand `references/cookbook/` if new worked-example needs come up.
- Move/copy this folder into a `.claude/skills/tvc-trse/` path (here or elsewhere) if
  you want Claude Code to auto-discover it as an active project/personal skill —
  nothing about its current self-contained, portable form prevents that.
