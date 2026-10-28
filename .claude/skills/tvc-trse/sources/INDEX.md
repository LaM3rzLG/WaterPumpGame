# Bundled source material

Everything under `sources/` is a self-contained copy. This skill package does not
depend on `/home/dey/trse`, `/home/dey/SANE`, the original `tvc_dokumentaciok`
download location, or any other path outside this folder — if you zip up
`tvc-trse-skill/` and hand it to someone else, or move it to another machine, nothing
is missing.

| Folder | What's in it | Start here |
|---|---|---|
| `notes/` | Curated research notes — synthesized, explained, cross-referenced | `notes/INDEX.md` |
| `tru-units/` | Raw TRSE unit source (`.tru`) for all TVC-platform units + cross-platform global units | `tru-units/INDEX.md` |
| `tutorials/` | All 9 known-compiling example `.ras` programs + project files + assets | `tutorials/INDEX.md` |
| `docs/` | All 37 TVC hardware/software PDF manuals, plus plain-text extractions of the 3 that are actually readable | `docs/INDEX.md` |
| `sane-trse-docs/` | Full copy of the SANE project's TRSE language documentation site (keywords/operators/types/directives/builtins, ~319 files). SANE is a C64-only TRSE fork, but its language-level docs (not its C64-hardware builtins) are the source material `references/language/*.md` will be adapted from in Phase 2. See `sources/notes/notes_sane_doc_template.md` for the generic-vs-C64-specific triage before pulling anything from here. Entry point: `sane-trse-docs/index.md`. |

**General rule for the agent using this skill**: check `notes/` first (fastest,
already-explained answers); if the question needs a primary-source quote, a specific
procedure signature, or something the notes don't cover, drop into `tru-units/`,
`tutorials/`, or `docs/extracted/` directly — they're all plain text and grep-friendly.
Only `docs/pdf/*.pdf` (for the 34 scanned-only files) requires a non-text tool
(`pdftotext`/`pdffonts`) to inspect.
