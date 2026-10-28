# TVC Hardware Documentation Survey (for TRSE / Claude Code skill scoping)

Extraction method: `pdftotext -layout` on each PDF, cross-checked with `pdffonts` (embedded
font table — empty means the PDF page is a raster scan with no text layer at all, i.e.
un-OCR'd) and `pdfinfo` (Creator/Producer strings). Raw extracted `.txt` files were kept in a
scratch directory during this session (not committed anywhere) — this document contains the
highlights pulled from them.

**Bottom line up front:** the single best source is
`Videoton_TV-Computer_Programming_Guide_2023.pdf` (English, 23 pages, cleanly text-extractable,
essentially a hardware reference card already organized the way a skill doc would want it). A
second usable source is `02_rendszer/TVC_ROM_OCR_verzio.pdf`, a full OCR'd/retyped transcript of
the classic Hungarian "TVC ROM" book (476 pages, Word-produced, clean text) which corroborates
and deepens the Programming Guide's port/memory facts. Most of the other priority files
(TVC_hardver.pdf, the non-OCR TVC_ROM.pdf, TVC_Assembler_leiras.pdf, TVC_kodtablazat.pdf,
Operacios_rendszer.pdf, the English BASIC manual) are **scanned-image PDFs with zero text
layer** — `pdftotext` returns empty pages and `pdffonts` shows no fonts at all. These would need
external OCR (e.g. Tesseract) before they're usable as text sources.

---

## 1. `07_idegen_nyelvu_referencia/Videoton_TV-Computer_Programming_Guide_2023.pdf`

- **23 pages, 1.16 MB. Text extraction: clean and complete** (native/digital PDF, not scanned —
  `pdftotext -layout` produced full readable text, ~36 KB).
- English. This is a modern (2023), purpose-built technical reference, structured almost exactly
  like a hardware-reference doc should be. Table of contents:
  - Short history of TV-Computer
  - Hardware specifications
  - Graphic modes
  - Colors
  - Memory mapping
  - System video calls
  - Screen / VIDEORAM
  - Put image example
  - CRTC 6845 (incl. raster-interrupt position, screen start position)
  - Ports
  - System variables (TAPE, LINE/BORDER/TEXT, BASIC, SERIAL LINE, KEYBOARD)
  - System areas

### Key facts extracted

**Hardware specs**
- CPU: Z80 @ 3.125 MHz
- Memory: 32 KB or 64 KB RAM; models: TVC 32k, 64k, 64k+
- Video RAM: separate 16 KB (32k/64k models), or 4×16 KB banks (64k+ model)
- ROM: 20 KB (BASIC + OS I/O + charset)
- Screen controller: CRTC 6845, 50 Hz
- Sound: 1 channel square wave, 6 octaves, 4-bit volume
- No hardware sprites
- 66-key QWERTZ keyboard + internal joystick
- Expansion: 4 expansion slots, 1 cartridge port, 2 joystick ports, 1 printer port
- OS: ROM OS (BASIC + I/O, versions 1.2/2.0/2.1/2.2), VT-DOS (MS-DOS-compatible at instruction
  level), UPM (CP/M 2.2 compatible at program level)

**Graphic modes** (screen size is always 15,360 bytes = 64 bytes/line × 240 lines; 16,384 bytes
if the optional 256-line mode is enabled)

| Mode | Resolution | Colors | Text grid | Pixels/byte |
|---|---|---|---|---|
| Graphics 2 | 512×240 | 2 (any 2 of 16-color palette) | 64×24 chars | 8 |
| Graphics 4 | 256×240 | 4 (any 4 of 16-color palette) | 32×24 chars | 4 |
| Graphics 16 | 128×240 | 16 (full palette) | 16×24 chars | 2 |

No character mode — characters are drawn graphically by BASIC. Definable character codes:
128–223 (10-byte matrix each, 1 byte/line, 1 bit/pixel). Video memory is bitmap-like: every pixel
carries its own color info (no attribute-clash like Spectrum).

**Colors**: fixed 16-color palette; intensity bit doubles as brightness multiplier on RGB, giving
two distinct blacks (so effectively 15 unique visible colors). In Graphics 4 the byte encodes 4
2-bit pixels via bit-plane-like split (low bits of 4 pixels in one nibble, high bits in the
other — see page 12 of extracted text for the bit table). Palette registers are set via ports
$60–$63 (Palette color #0–#3); each palette entry is a color-code byte (bit layout: bit1=Blue,
bit3=Red, bit5=Green, bit7=Intensity, matching border register).

**Memory mapping** — Z80's 64 KB space is split into four 16 KB "pages" selected via **port $02**
(value written also mirrored to system variable **P_SAVE at $0003**):
- Default: Page0 $0000-$3FFF = U0 (system uses $0000-$19EE of it), Page1 $4000-$7FFF = U1 (free),
  Page2 $8000-$BFFF = U2 (free, 64k/64k+ only), Page3 $C000-$FFFF = system ROM (SYS).
- With VIDEORAM on: Page2 becomes VIDEORAM ($8000 base) instead of U2. Example: `ld A,$50 / ld
  ($3),A / out ($2),A`.
- Full 64K RAM paging (64k/64k+): Page3 becomes U3 instead of ROM. Example: `ld A,$B0 / ...`.
- 64k+ model VIDEORAM banking: port $0F (dec 15) bits 4-5 select VRAM bank, value =
  (BANK-1)*16 — 4×16KB VRAM banks.

**System video calls** (via `rst $30` + function-code byte in ROM, used by BASIC internally):
VMODE(04h, set graphic mode), PAL(0Ch, set palette from a 4-byte table), CLS(05h), BTEXT(03h, set
char cursor position), VID_CHOUT(01h), VID_BKOUT(02h, write text block), BABS(06h, absolute pixel
position), BREL(07h, relative pixel position), BON(08h)/BOFF(09h) (pen up/down for line drawing),
FILL(0Ah), DEFC(0Bh, define custom character 128-223 from 10-byte matrix).

**Screen / VIDEORAM layout**: Screen base address $8000 when VRAM mapped to page 2. Line stride
is 64 bytes in **all three** graphics modes. Sequential/linear layout (no interleaving).
`ScreenAddr = $8000 + Ypos*64 + Xpos` (Xpos in bytes 0-63, Ypos in lines 0-239). A full worked
Z80 asm PUT_IMAGE routine (sprite/image blit via 4×`LDI` per line) is included verbatim.

**CRTC 6845 register map** (select register via **port $70**, read/write data via **port $71**):
R0 chars/line-1 (default 63h/99d), R1 displayed chars/line (40h/64d), R2 h-sync pos-1 (4Bh/75d),
R3 sync widths, R4 total char lines-1 (40h/77d), R5 extra TV lines (2), R6 displayed char lines
(3Ch/60d), R7 v-sync pos-1 (42h/66d), R8 interlace/skew, R9 TV-lines per char row -1 (3),
R10/R11 cursor start/end line, R12/R13 screen-start-address high/low (read/write — used for
hardware scrolling: incrementing by 1 scrolls 4 pixel rows), R14/R15 raster-interrupt position
high/low (default $0EFF = line 239/col 63), R16/R17 light-pen position (read only). One CRTC
"character" = 1 screen byte = 4 pixel rows tall; 240-line screen = 60 CRTC lines, 256-line screen
= 64 CRTC lines. Formulas given for converting (Ypos,Xpos) pixel/byte coordinates into raster-IT
register values. Warning: never set the raster-interrupt Xpos to 0 (causes an error); use 63.

**I/O Port map** (the single most valuable table in this doc):

| Dec | Hex | R/W | Function |
|---|---|---|---|
| 0 | 00 | W | Border color (bit1 Blue, bit3 Red, bit5 Green, bit7 Intensity) |
| 1 | 01 | W | Printer data out |
| 2 | 02 | W | Memory-page mapping (bits 2-7); must write $0003 mirror first |
| 3 | 03 | W | bits0-3 keyboard matrix row select; bits6-7 expansion-slot IOMEM select |
| 4 | 04 | W | Sound pitch low byte |
| 5 | 05 | W | bits0-3 sound pitch high; bit4 sound disable; bit5 sound-IRQ enable; bits6-7 tape motor control (L/R) |
| 6 | 06 | W | bits0-1 graphic mode; bits1-5 sound volume; bit7 printer STROBE |
| 7 | 07 | W | Clear raster/sound interrupt (any value) |
| 15 | 0F | W | 64k+ only: bits4-5 VIDEORAM bank select |
| 16/17 | 10/11 | W | Slot 0 serial data / USART mode |
| 32/33 | 20/21 | W | Slot 1 serial data / USART mode |
| 48/49 | 30/31 | W | Slot 2 serial data / USART mode |
| 64/65 | 40/41 | W | Slot 3 serial data / USART mode |
| 80 | 50 | W | Tape output signal |
| 88 | 58 | R | Read keyboard matrix row (row selected via port 3) |
| 89 | 59 | R | bits0-3 slot IRQ reqs; bit4 raster/sound IRQ; bit5 tape data; bit6 B/W(0)/Color(1) switch; bit7 printer ACK |
| 90 | 5A | R | Slot ID bits (2 bits per slot ×4 slots) — ID 00 serial, 10 floppy, 01/11 unused |
| 91 | 5B | R | Clear sound frequency divider (for timing accuracy) |
| 96-99 | 60-63 | W | Palette colors #0-#3 |
| 112 | 70 | W | CRTC register select (0-17) |
| 113 | 71 | R/W | CRTC register data |

Worked asm examples given for: setting a Graphics-4 palette, setting border color, switching to
Graphics 16, enabling sound, playing a note (with an octave/note constant table pointer, e.g.
`HL=$0E5D` = octave 4 note A — matches BASIC's `PITCH`), and setting sound volume (0-15,
shifted into port 6 bits 2-5).

**System variables** (Page-0 RAM, addresses in hex/dec) — full table extracted, most useful
entries: `P_SAVE` ($0003, memory-mapping mirror), `OS_ENTRY` ($0030, rst $30 jump table),
`IT_ENTRY` ($0038), `PORT_03/05/06` mirrors at $0B11/$0B12/$0B13, `HI_MEM` ($0B19, top of BASIC
RAM), `INK`/`PAPER`/`BORDER` color variables at $0B4D/$0B4E/$0B4F, `L_MODE`/`L_STYLE` line-draw
mode, keyboard `PICTURE` matrix at $0B51 (10 bytes, one per row incl. joystick rows — a worked
joystick-read example is given using $0B59 = row 8, bit6=LEFT, bit5=RIGHT, bit3=FIRE).

**System memory areas**: ASCII screen buffer $0100 (1600 bytes, 64×25), definable-char matrices
$0740 (960 bytes), video/IO/keyboard/sound/tape work areas $0B72-$0BF0, editor work area $0E48,
`PROG_ID` string $0E98, system STACK $0EAC (2048 bytes), BASIC work area $16AC (835 bytes) —
each annotated with whether it's safe for a user program to reuse.

This file alone is almost sufficient to draft the memory-map, video-mode, color, sound, and
port sections of a TVC hardware-reference doc.

---

## 2. `07_idegen_nyelvu_referencia/TV_Computer_BASIC_V2.00_English_Manual.pdf`

- **30 pages, 14 MB. Text extraction: FAILED — scanned-image PDF, no text layer.**
  `pdftotext -layout` produced an essentially empty file (0 text lines). `pdffonts` shows zero
  embedded fonts, confirming every page is a raster image with no OCR. `pdfinfo` shows
  Creator/Producer = `PScript5.dll` / `Acrobat Distiller 5.0` — a print-to-PDF of a scan, not a
  born-digital or already-OCR'd document.
- **Not usable as-is for text extraction.** Would need Tesseract or similar OCR run over
  rendered page images (`pdftoppm`) to recover BASIC command syntax reference content. Flagging
  as a candidate for OCR if BASIC-level detail becomes a priority later (skill's stated priority
  is TRSE/hardware, not BASIC, so this is lower priority to redo).

---

## 3. `02_rendszer/TVC_hardver.pdf` (Hungarian hardware manual)

- **254 pages, 10 MB. Text extraction: FAILED — scanned-image PDF, no text layer.**
  Same signature as above (`pdffonts` empty, Creator `PScript5.dll`, Producer `5D PDF Creator
  v1.52.582` — a scan-to-PDF tool). `pdftotext` returned no extractable text at all, not even
  garbled OCR — this is a pure image scan.
- Could not extract table of contents or structure by text means. Not currently usable without
  external OCR. Given that `TVC_ROM_OCR_verzio.pdf` and the Programming Guide already cover the
  same memory/port ground with clean text, this file is a **lower-priority OCR candidate** unless
  gaps are found later (e.g. detailed expansion-card electrical specs, which this manual likely
  has and the other two don't).

---

## 4. `02_rendszer/TVC_ROM.pdf` and `02_rendszer/TVC_ROM_OCR_verzio.pdf` (ROM routines reference)

Two files, same underlying book — **Ludányi László, "A TV-Computer ROM programja"**, Novotrade
Rt., 1988, ISBN 963 02 5895 1.

- **`TVC_ROM.pdf`: 476 pages, 27 MB. Text extraction FAILED** — scanned image, no fonts, same
  `PScript5.dll`/Acrobat Distiller signature as the other scans.
- **`TVC_ROM_OCR_verzio.pdf`: 476 pages, 14 MB. Text extraction SUCCEEDED — this is the useful
  one.** Creator/Producer = Microsoft Word 2019, meaning someone already OCR'd (or manually
  retyped) the original scan into Word and re-exported to PDF. `pdftotext -layout` pulled ~914 KB
  of clean, well-structured Hungarian text (22,048 lines). This is a major, previously-hidden
  asset for the project — effectively a full retail-quality ROM disassembly/internals book in
  machine-readable form.

### Structure (full table of contents recovered from extracted text)

1. **AZ ISMERKEDÉS ALAPSZINTJE: amit a hardverről tudni kell** (basics: what you need to know
   about the hardware)
   - 1.1 A mikroprocesszor (the microprocessor / Z80)
   - 1.2 A memória (memory paging: 4×16KB pages, U0-U3/VID/CART/SYS/EXT segment names, port $02
     page-select, port $03 bits 6-7 select EXT card)
   - 1.3 A képmegjelenítő hardver (video hardware: CRTC 6845, port $70/$71 register select/data,
     palette ports $60-$63, border port $00, color-switch bit on port $59 bit6)
   - 1.4 A billentyűzet (keyboard)
   - 1.5 A magnetofon kezelése (tape handling)
   - 1.6 A nyomtató vezérlése (printer control)
   - 1.7 A soros vonali hardver (serial line hardware)
2. **AZ ISMERKEDÉS KÖVETKEZŐ SZINTJE: előkészületek** (preparations) — U0 RAM layout, system
   variable/function-call conventions, video system variables (2.7), serial-line bytes (2.9),
   tape system variables (2.10), work areas (2.11), BASIC work variables (2.12)
3. Main body — ROM walkthrough: startup (3.1-3.2), function-call dispatch (3.3), interrupt
   handler (3.4), function execution incl. **3.5.4.4 A videomemória rutinok** (video memory
   routines), keyboard routines + code tables (3.5.5.4), printer routines (3.5.6), sound
   generation routines (3.5.7 Hangképzés), then **3.6 BASIC** internals — tokenizer, keyword
   table, keyword routines, built-in functions, low-level arithmetic/conversion routines, error
   handling (3.6.8) — then serial line and tape low-level routines (3.8), ending ~p.449.
4. BEFEJEZÉS (conclusion) incl. 4.2 Rutingyűjtemény (routine/entry-point collection — likely a
   valuable ROM routine address index).

### Corroborating hardware facts (cross-checked against the Programming Guide, matches exactly)

- Confirms the 4×16KB page model, page names U0-U3/VID/CART/SYS/EXT, and **port $02** as the
  page-select port, with **port $03 bits 6-7** selecting which expansion card's IOMEM appears in
  the EXT segment.
- Confirms CRTC 6845, **port $70** register select / **port $71** data.
- Confirms palette ports **$60-$63**, border port **$00**.
- Confirms color-mode toggle switch readable on **port $59 bit 6**.
- Additional detail not in the Programming Guide: sound is disabled via **port $05 bit 4**, sound
  IRQ enabled via **port $05 bit 5**, volume divider via **port $06**; printer STROBE handshake
  via **port $06 bit 6** (out)/**port $59 bit 7** (ACK in); tape motor control via **port $05
  bits 6-7**; joystick/connector state readable via **port $5A** (dec 90).
- System variable mirrors: **$0B11** = port 3 mirror, **$0B12** = port 5 mirror, **$0B13** = port
  6 mirror — matches Programming Guide's PORT_03/05/06 addresses exactly.

**Recommendation**: this OCR'd ROM book, together with the Programming Guide, should be the
primary basis for the memory-map/I/O-port/video sections of the skill's hardware reference; it
also uniquely covers BASIC tokenizer internals, ROM entry-point addresses, and keyboard/printer/
tape/serial low-level routines, which the Programming Guide only summarizes.

---

## 5. `07_idegen_nyelvu_referencia/TVC_kodtablazat.pdf` (character code table)

- **2 pages, 53 KB. Text extraction FAILED — pure image scan**, confirmed via `pdfinfo`:
  `Creator: Acrobat 5.0 Scan Plug-in for Windows`. `pdftotext` returns nothing; `pdffonts` shows
  no embedded fonts. Despite being "mostly a table" (which usually extracts well from native
  PDFs), this is a flatbed-scanned page image, so nothing came out.
- Since it's only 2 pages, this is the cheapest candidate in the whole set to run through OCR
  (Tesseract) later if an accurate character-code table is needed — small, well worth doing on
  demand, low effort.

---

## 6. `05_fejlesztoeszkozok_nyelvek/TVC_Assembler_leiras.pdf` (assembler description)

- **24 pages, 20 MB. Text extraction FAILED — scanned image**, same `PScript5.dll`/Acrobat
  Distiller signature as the other Hungarian scans. No fonts, no text.
- Not usable without OCR. Given its small page count (24), also a reasonably cheap OCR target if
  TRSE inline-assembly register/opcode conventions need Hungarian-source corroboration — but the
  Programming Guide's worked Z80 asm examples (all confirmed standard Z80 mnemonics: `ld`, `out`,
  `ex`, `ldi`, `jp nz`, `rst $30`, etc.) are probably sufficient on their own since TRSE embeds
  standard Z80 assembly, not a TVC-specific dialect.

---

## Other files checked opportunistically (not on the original priority list)

- **`02_rendszer/Operacios_rendszer.pdf`** (163 pages, 3.1 MB): scanned image, no text layer,
  same signature as the others (`PScript5.dll` / `5D PDF Creator`). Not usable as-is.
- **`02_rendszer/Kaszanyiczki_Laszlo_TVC_ROM_listaja.pdf`** (329 pages, 159 MB — huge file,
  likely high-res scan): fonts check returned empty — scanned, not text-extractable.
- **`05_fejlesztoeszkozok_nyelvek/Kos_Geza_assembler_leirasa.pdf`**: fonts check empty — scanned,
  not text-extractable.
- **`01_alapkonyvek/TVC_Basic_konyv.pdf`**, **`01_alapkonyvek/Gepi_kodu_programozas_kezdoknek.pdf`**:
  fonts check empty — scanned, not text-extractable.
- **`06_egyeb_konyvek/Bertok_Zsolt_Grafika_es_hang_programozasa_gepi_kodban_2019.pdf`** (42
  pages, born-digital — `pdffonts` shows an embedded `LiberationSans-Bold` TrueType font, i.e.
  this one is NOT a scan): **text extraction succeeded cleanly** (~1,643 lines / 105 KB). Title:
  "VIDEOTON TV-COMPUTER GRAFIKA ÉS HANG PROGRAMOZÁSA GÉPI KÓDBAN" (graphics & sound programming
  in machine code), by Bertók Zsolt, 2019, an unfinished ("befejezetlen változat") community
  document. TOC: 1. Alapok (basics), 2. A videomemória (VRAM) elérése (accessing VRAM),
  3. Hogyan csináljuk a gyakorlatban (practical approach), 4. Írás a képernyőre (writing to
  screen), 5. A VRAM pixelenkénti írása (pixel-level VRAM writes), 6. Vonal rajzolása / Sprite
  kirakása / Tile map (line drawing, sprite placement, tile maps), 7. Sprite mozgatás (sprite
  movement), 8. "Igazi" sprite kirakó + raster-interrupt setup, 9. Tippek és trükkök sprite
  kirakáshoz (sprite tips/tricks), 10. Hangoskodjunk (sound). This is a strong **secondary
  source specifically for practical VRAM/sprite/raster-interrupt/sound assembly technique**,
  complementing the Programming Guide's terser reference tables with worked examples and
  explanation. Confirms VRAM size 16 KB, screen-line stride 64 bytes in every mode, and the
  15,360/16,384-byte visible/total split, matching the Programming Guide exactly. Recommended
  as a **priority follow-up read** alongside the two files already flagged, since it's one of
  only two Hungarian-language documents in the whole corpus that isn't a raw scan.

---

## Overall scanned-vs-text-extractable determination

**Cleanly text-extractable (usable now):**
- `Videoton_TV-Computer_Programming_Guide_2023.pdf` — primary source
- `TVC_ROM_OCR_verzio.pdf` — primary source (OCR'd/retyped ROM book)
- `Bertok_Zsolt_Grafika_es_hang_programozasa_gepi_kodban_2019.pdf` — secondary source (born-digital)

**Scanned-image-only, no text layer, `pdftotext` returns nothing (need OCR to use):**
- `TV_Computer_BASIC_V2.00_English_Manual.pdf`
- `TVC_hardver.pdf`
- `TVC_ROM.pdf` (superseded by its OCR'd sibling above)
- `TVC_kodtablazat.pdf` (small, cheap OCR target)
- `TVC_Assembler_leiras.pdf`
- `Operacios_rendszer.pdf`
- `Kaszanyiczki_Laszlo_TVC_ROM_listaja.pdf`
- `Kos_Geza_assembler_leirasa.pdf`
- `TVC_Basic_konyv.pdf`, `Gepi_kodu_programozas_kezdoknek.pdf`
- (not individually re-checked, but same production signature and folder as the above, so
  presumed scanned: most other files in `03_interfeszek/`, `04_lemezmeghajtok/`,
  `05_fejlesztoeszkozok_nyelvek/`, `06_egyeb_konyvek/` — worth spot-checking with `pdffonts`
  before assuming any one of them is usable)

All the scanned files share one of two production signatures: `PScript5.dll` print-driver +
`Acrobat Distiller 5.0` / `5D PDF Creator v1.52.582` (a batch scan-to-PDF workflow), or `Acrobat
5.0 Scan Plug-in for Windows` (direct scanning). None carry an OCR text layer (Tesseract, ABBYY,
Acrobat's own OCR, etc. were evidently never run on them) — `pdffonts` reports zero fonts on
every one, which is the reliable tell for "this is a raster image with nothing behind it," as
opposed to garbled-but-present OCR text.
