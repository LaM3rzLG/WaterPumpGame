# TVC documentation PDF index

> The `pdf/` folder is NOT in the git repo (674 MB). Windows: `C:\Users\LG\.claude\skills\TVC-TRSE\sources\docs\pdf\`,
> Mac: `~/Documents/TVC-TRSE-skill/sources/docs/pdf/`. The `extracted/` texts are in the repo.

37 PDFs (+1 plain-text file) under `pdf/`, organized into the 7 category folders they
were downloaded in. Full extraction survey: `../notes/notes_pdf_hardware.md`.

**Read `extracted/*.txt` instead of the PDF whenever one exists** — it's the same
content, already grep-able, no `pdftotext` round-trip needed.

## Text-extractable — plain-text copy in `extracted/` (search these first)

| PDF | Extracted `.txt` | Why it matters |
|---|---|---|
| `07_idegen_nyelvu_referencia/Videoton_TV-Computer_Programming_Guide_2023.pdf` | `Videoton_TV-Computer_Programming_Guide_2023.txt` | **Primary hardware source.** English, 23pp. Memory map, video modes, colors, CRTC 6845 registers, full I/O port table, system variables, worked asm examples. |
| `02_rendszer/TVC_ROM_OCR_verzio.pdf` | `TVC_ROM_OCR_verzio.txt` | **Primary ROM source.** 476pp, someone already OCR'd the 1988 Novotrade "TVC ROM" book. BASIC tokenizer internals, ROM entry points, keyboard/printer/tape/serial routines. Corroborates the Programming Guide's port numbers exactly. |
| `06_egyeb_konyvek/Bertok_Zsolt_Grafika_es_hang_programozasa_gepi_kodban_2019.pdf` | `Bertok_Zsolt_Grafika_es_hang_programozasa_gepi_kodban_2019.txt` | Secondary source, born-digital. Practical VRAM/sprite/raster-interrupt/sound assembly technique, same author as `GE.tru`. Hungarian. |

## Confirmed scanned-image-only (no text layer — `pdftotext` returns nothing)

Would need Tesseract OCR to become searchable. Not blocking — the 3 sources above cover
the ground needed for a TRSE/hardware-focused skill.

- `07_idegen_nyelvu_referencia/TV_Computer_BASIC_V2.00_English_Manual.pdf`
- `07_idegen_nyelvu_referencia/TVC_kodtablazat.pdf` (2pp — cheapest OCR target if ever needed)
- `02_rendszer/TVC_hardver.pdf`, `TVC_ROM.pdf` (non-OCR twin of the usable one above), `Operacios_rendszer.pdf`, `Kaszanyiczki_Laszlo_TVC_ROM_listaja.pdf`
- `05_fejlesztoeszkozok_nyelvek/TVC_Assembler_leiras.pdf`, `Kos_Geza_assembler_leirasa.pdf`
- `01_alapkonyvek/TVC_Basic_konyv.pdf`, `Gepi_kodu_programozas_kezdoknek.pdf`

## Not yet checked (presumed scanned — same download batch/signature as above, but not individually verified)

Everything else in `01_alapkonyvek/`, `02_rendszer/` (`UPM_operacios_rendszer.pdf`,
`VT-DOS_operacios_rendszer.pdf`, `TVC_64K_plus_tobbletszolgaltatasai.pdf`,
`Memoriabovites_termekismerteto.pdf`), `03_interfeszek/` (all 6), `04_lemezmeghajtok/`
(all 4 PDFs — `VT-DOS_help_fajlok.txt` in this folder is **already plain text**, no
extraction needed), `05_fejlesztoeszkozok_nyelvek/` (remaining files),
`06_egyeb_konyvek/` (remaining files + `Feladatmegoldas_szamitogeppel.zip`, an archive
not a PDF). Run `pdffonts <file>.pdf` before assuming any one of these is unusable —
an empty font table confirms scanned, a populated one means it's worth extracting.

## Searching this tree
```
grep -n "keyword" sources/docs/extracted/*.txt     # search everything readable, fast
pdffonts sources/docs/pdf/<category>/<file>.pdf     # check if a not-yet-verified PDF has a text layer
pdftotext -layout <file>.pdf -                      # extract on demand if it does
```
