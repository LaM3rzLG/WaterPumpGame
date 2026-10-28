# Research notes index

Curated analysis produced while mapping this project (2026-08-18). These are the
**first place to look** for "how does X work" — they already synthesize the raw
`tru-units/`/`tutorials/`/`docs/` material into organized, explained form. Go to the
raw sources only when a note doesn't answer the question in enough depth.

| File | Covers |
|---|---|
| `notes_tru_units.md` | Full API catalog of all 6 TVC `.tru` units + global units, plus a hardware primer (memory banking, video modes, palette, CRTC, sound, sprites, firmware calls) synthesized from reading the unit source directly. GE.tru section reflects the **2023** build — see next entry for the current one. |
| `notes_ge_tru_2026.md` | Full catalog of the canonical 2026 `GE.tru` (8232 lines), focused on what changed since 2023: GameCard joystick expansion, digi-sound/PCM playback, sprite mirroring, `List` class, animation loop modes, and **2 breaking API changes** (§9) that affect `SpriteDemo.ras`/`SpaceWar.ras`. |
| `notes_tutorials.md` | Catalog of all 9 tutorial `.ras` programs (technique demonstrated, units used), verbatim `.trse` project file contents, and the minimal starter template. |
| `notes_pdf_hardware.md` | PDF extraction survey (which of the 37 are text-extractable vs. scanned) plus the actual hardware facts pulled from the 3 usable ones — memory map, video modes, colors, sound, I/O ports, with citations. |
| `notes_sane_doc_template.md` | Structure/template analysis of the SANE TRSE doc site (bundled in full at `../sane-trse-docs/`) — which of its keyword/operator/type/directive/builtin pages are generic-TRSE (reusable for TVC) vs. C64-hardware-specific (not), plus its compatibility-tagging convention and per-page template pattern. Use this note as the **triage guide** before pulling any page from `../sane-trse-docs/` into `references/language/*.md`. |
