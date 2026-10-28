# TVC Hardware Reference

What you need to know about the Videoton TV-Computer's hardware to write correct TRSE
code for it. Sources: `sources/docs/extracted/Videoton_TV-Computer_Programming_Guide_2023.txt`
(primary — English, born-digital, cited directly below), corroborated and extended by
`sources/docs/extracted/TVC_ROM_OCR_verzio.txt` (the 1988 Novotrade ROM book) and
`sources/docs/extracted/Bertok_Zsolt_Grafika_es_hang_programozasa_gepi_kodban_2019.txt`.
Full citation trail: `sources/notes/notes_pdf_hardware.md`. Cross-checked against the
TVC/GE unit source itself (`sources/tru-units/TVC/`) — where a TRSE unit already wraps
a hardware fact into a callable procedure, that's noted inline so you reach for the
unit call instead of poking ports by hand.

## System overview

- **CPU**: Z80 @ 3.125 MHz.
- **Models**: TVC 32k, TVC 64k, TVC 64k+ (differ in RAM and VIDEORAM banking — see
  below).
- **Memory**: 32KB or 64KB RAM, 20KB ROM (BASIC + OS I/O + charset).
- **Video**: CRTC 6845 controller, 50Hz, no character mode (BASIC draws characters
  graphically), no hardware sprites.
- **Sound**: 1 channel, square wave, 6 octaves, 4-bit volume.
- **Input**: 66-key QWERTZ keyboard + internal joystick port; 2 external joystick
  ports.
- **Expansion**: 4 expansion slots, 1 cartridge port, 1 printer port.

## Memory mapping (page banking)

The Z80's 64KB address space is split into four 16KB pages, all switched together by
**one write to port `$02`** (mirrored to system variable `P_SAVE` at `$0003` — write
the mirror *first*, then the port, per the ROM's own convention):

```
ld  A,<mapping byte>
ld  ($3),A      ; P_SAVE mirror
out ($2),A      ; actually switch the banks
```

Three standard layouts (from the Programming Guide, verbatim byte values):

| Layout | Page 0 ($0000-3FFF) | Page 1 ($4000-7FFF) | Page 2 ($8000-BFFF) | Page 3 ($C000-FFFF) | Byte |
|---|---|---|---|---|---|
| Default (boot) | U0 (system uses up to $19EE) | U1 (free) | U2 (free, 64k/64k+ only) | ROM (SYS) | — |
| VIDEORAM on | U0 | U1 | **VIDEORAM** | ROM (SYS) | `$50` |
| Full 64K RAM | U0 | U1 | U2 | **U3** (free, 64k/64k+ only) | `$B0` |

**You must page VIDEORAM in before touching screen memory, and page it back out
(or otherwise remember what was mapped before) when you're done** — this is the
single most common TVC bug. `TVC.tru`'s screen-writing procedures (`ClearScreen`,
`FillRect`, `VerticalBytes`, `DefChar`-family) already do this save/restore around
their VRAM access; if you write raw memory yourself, you must do it too.

64k+ model only: **port `$0F`** bits 4-5 select which of 4×16KB VIDEORAM banks is
mapped in, value = `(BANK-1)*16`.

TRSE wrapper: `TVC::SetMemory(Mode)` / `GE::SetMemory(Mode)`, where `Mode` is one of
`MEM_DEFAULT`(0), `MEM_VID_ON`(1), `MEM_FULL_64K`(2), `MEM_48K_VID`(3) — these encode
the byte values above (and a 4th combined layout) so you never need to poke port `$02`
directly in ordinary code.

## Graphic modes

Three fixed modes, selected by a 2-bit mode code. **Screen size is always 15,360
bytes** (64 bytes/line × 240 lines) regardless of mode — only the bits-per-pixel
changes. An optional 256-line mode brings this to 16,384 bytes.

| Mode | Code | Resolution | Colors | Text grid | Bits/pixel | Pixels/byte |
|---|---|---|---|---|---|---|
| Graphics 2 | 0 | 512×240 | 2 (any 2 of the 16-color palette) | 64×24 chars | 1 | 8 |
| Graphics 4 | 1 | 256×240 | 4 (any 4 of the 16-color palette) | 32×24 chars | 2 | 4 |
| Graphics 16 | 2 | 128×240 | 16 (full palette, fixed) | 16×24 chars | 4 | 2 |

Byte layout per mode:
- **Graphics 2**: each bit is one pixel — 0 selects palette color 0, 1 selects color 1.
- **Graphics 4**: 2 bits/pixel, but **not** stored as 4 contiguous 2-bit fields — the
  low bits of all 4 pixels come first (bits 7-4), then the high bits of all 4 pixels
  (bits 3-0). If you're hand-packing Graphics 4 pixel data, get this bit-interleaving
  wrong and every pixel's color comes out corrupted.
- **Graphics 16**: 4 bits/pixel = 2 pixels/byte, but INTERLEAVED (NOT nibble-per-pixel; verified from GE.tru GR16_COLOR_* consts + InitSpriteMirroring masks 170/85): LEFT pixel = bits 7,5,3,1 (I,G,R,B), RIGHT pixel = bits 6,4,2,0 (I,G,R,B); color index = I*8+G*4+R*2+B (GR16_COLOR_* order), e.g. solid dark blue = 3, white = 255. [Old, WRONG text follows: high
  nibble first pixel, low nibble second pixel; value 0-15 indexes the fixed 16-color
  palette directly (no remapping, unlike Graphics 2/4's programmable palette slots).]

TRSE wrapper: `TVC::SetGraphicsMode(Mode)` / `GE::SetGraphics(Mode)` with constants
`GRAPHICS2`/`GRAPHICS4`/`GRAPHICS16` matching the mode codes above; `crtc.tru`'s
`SetMode` also works but is otherwise mostly dead code (see `PROJECT_NOTES.md`).

## Colors and palette

Fixed 16-color palette. Each color byte encodes: **bit 1 = Blue, bit 3 = Red, bit 5 =
Green, bit 7 = Intensity** (same encoding is reused for the border color port).
Intensity is a brightness multiplier on RGB, not an independent color — since it
multiplies, "black × either intensity" is still black, so there are only **15
visually distinct colors** despite 16 codes.

- **Graphics 2 / Graphics 4**: the 2 or 4 colors in use are picked from the full
  16-color palette via **programmable palette registers**, ports `$60`-`$63`
  (Palette color #0 through #3 — Graphics 2 only uses #0/#1). Example (Graphics 4:
  dark blue, cyan, dark red, yellow):
  ```
  ld A,$1  : out ($60),A   ; palette #0 = dark blue
  ld A,$51 : out ($61),A   ; palette #1 = cyan
  ld A,$4  : out ($62),A   ; palette #2 = dark red
  ld A,$54 : out ($63),A   ; palette #3 = yellow
  ```
  TRSE wrapper: `TVC::SetPalette(Nr, Color)` / `GE::SetPalette(Nr, Color)`, with
  `PALETTE_*` named constants (`PALETTE_DARK_BLUE`, `PALETTE_CYAN`, etc.) for the
  color byte.
- **Graphics 16**: no palette registers — the 4-bit pixel value *is* the color index
  directly into the fixed palette. TRSE constants: `GR16_BLACK`...`GR16_WHITE`.
- **Border**: its own port (`$00`), same bit encoding as the palette bytes, but TRSE
  gives it a **separate constant set** (`BORDER_*`) from `PALETTE_*` — don't assume
  they're interchangeable in code even though the underlying bit pattern matches.
  Wrapper: `TVC::SetBorder(Color)` / `GE::SetBorder(Color)`.

## Screen / VIDEORAM layout

- Screen base address: **`$8000`** once VIDEORAM is paged in (Page 2).
- Line stride: **64 bytes**, identical in all three graphic modes.
- Layout is linear/sequential (no interleaving): `ScreenAddr = $8000 + Ypos*64 + Xpos`,
  where `Xpos` is the byte column (0-63) and `Ypos` is the pixel row (0-239).
- The image-blit pattern the Guide gives (and that `GE.tru`'s `Sprite`/`Image` classes
  implement in optimized form) is a straight `LDI`-based row copy: for each row, copy
  `width` bytes from source to `ScreenAddr`, then advance the destination pointer by
  `64 - width` to reach the next row (not `64` — you're already `width` bytes into the
  row).

Two coordinate systems exist in TRSE's TVC unit and it's worth knowing both, since
mixing them up is a common source of bugs:
- **Abstract firmware coordinates** (0-1023 × 0-959, scaled per graphics mode by ROM
  calls): used by `TVC::PutPixel`/`Line`/`Rectangle`/`MoveTo`.
- **Native byte-grid coordinates** (0-63 × 0-239, direct VRAM addressing): used by
  `TVC::FillRect`/`VerticalBytes` and *all* of `GE.tru`'s screen/sprite code.

## CRTC 6845

Selected via **port `$70`** (register number, 0-17) then read/written via **port
`$71`** (register data). The CRTC's own "character" unit is **4 pixel rows tall**, not
related to text characters — one screen line (64 bytes) = 1 CRTC character-row; a
240-line screen is 60 CRTC lines, the optional 256-line screen is 64 CRTC lines.

| Reg | R/W | Meaning | Default |
|---|---|---|---|
| R0 | W | Characters/line − 1 | `$63` (99) |
| R1 | W | Displayed chars/line | `$40` (64) |
| R2 | W | Horizontal sync position − 1 | `$4B` (75) |
| R3 | W | Bits 0-3 h-sync width, 4-7 v-sync lines | `$32` (50) |
| R4 | W | Total character lines − 1 | `$40` (77) |
| R5 | W | Extra TV lines | `2` |
| R6 | W | Displayed character lines | `$3C` (60) |
| R7 | W | Vertical sync position − 1 | `$42` (66) |
| R8 | W | Interlace / char displacement | `0` |
| R9 | W | TV lines per character row − 1 | `3` |
| R10 | W | Cursor start line in char / enable bits | `3` |
| R11 | W | Cursor end line in char | `3` |
| R12/R13 | R/W | Screen start address, high/low byte | `0` / `0` |
| R14/R15 | R/W | Raster-interrupt position, high/low byte | `$0E` / `$FF` (line 239, col 63) |
| R16/R17 | R | Light pen position, high/low (read only) | — |

**Raster interrupt position**, given a pixel row `Ypos` (0-239) and byte column `Xpos`
(0-63):
```
CharNo        = Ypos DIV 4
TVLineNo      = Ypos - CharNo*4
RasterPosAddr = CharNo*64 + Xpos
R14 = RasterPosAddr DIV 256      ; high byte
R15 = RasterPosAddr MOD 256      ; low byte
R10 = R11 = TVLineNo
```
**Never set `Xpos` to 0** — the Guide explicitly warns this causes an error; use `63`
instead (the last byte of the line), which is also CRTC's own default. TRSE wrapper:
`TVC::SetRasterInterruptPos(LineNr)` / `GE::SetRasterInterruptPos(Nr)` — these fix
`Xpos` internally, so you only supply the line number.

**Hardware vertical scroll**: incrementing R12/R13 (the 16-bit screen start address,
range 0-4095 since the screen is 64×64 CRTC units) by 1 scrolls the visible screen by
**4 pixel rows** per increment — the CRTC has no finer scroll granularity than that.
TRSE wrapper: `GE::ScrollUp`/`ScrollDown` (direct-to-screen mode only, not compatible
with `UseBackScreen` double buffering).

## I/O port map

| Dec | Hex | R/W | Function |
|---|---|---|---|
| 0 | `$00` | W | Border color (bit1 Blue, bit3 Red, bit5 Green, bit7 Intensity) |
| 1 | `$01` | W | Printer data out |
| 2 | `$02` | W | Memory-page mapping (bits 2-7) — write `$0003` mirror first |
| 3 | `$03` | W | Bits 0-3: keyboard matrix row select; bits 6-7: expansion-slot IOMEM select |
| 4 | `$04` | W | Sound pitch, low byte |
| 5 | `$05` | W | Bits 0-3: sound pitch high nibble; bit 4: sound disable; bit 5: sound-IRQ enable; bits 6-7: tape motor (left/right connector) |
| 6 | `$06` | W | Bits 0-1: graphic mode; bits 1-5: sound volume; bit 7: printer STROBE |
| 7 | `$07` | W | Clear raster/sound interrupt (any value written) |
| 15 | `$0F` | W | 64k+ only: bits 4-5 VIDEORAM bank select, value=(BANK-1)*16 |
| 16/17 | `$10`/`$11` | W | Slot 0: serial data / USART mode |
| 32/33 | `$20`/`$21` | W | Slot 1: serial data / USART mode |
| 48/49 | `$30`/`$31` | W | Slot 2: serial data / USART mode |
| 64/65 | `$40`/`$41` | W | Slot 3: serial data / USART mode |
| 80 | `$50` | W | Tape output signal |
| 88 | `$58` | R | Read keyboard matrix row (row chosen via port `$03`) |
| 89 | `$59` | R | Bits 0-3: slot IRQ reqs; bit 4: raster/sound IRQ; bit 5: tape data; bit 6: B/W(0)/Color(1) switch; bit 7: printer ACK |
| 90 | `$5A` | R | Slot ID, 2 bits/slot ×4: `00`=serial, `10`=floppy, `01`/`11`=unused. **Also**: keyboard matrix row 8 = joystick 1 (bit6 LEFT, bit5 RIGHT, bit3 FIRE, and by symmetry bit1 UP/bit2 DOWN — see Keyboard/joystick below) |
| 91 | `$5B` | R | Clear sound-frequency divider (for timing accuracy) |
| 96-99 | `$60`-`$63` | W | Palette colors #0-#3 |
| 112 | `$70` | W | CRTC register select (0-17) |
| 113 | `$71` | R/W | CRTC register data |

Note: `TVC.tru` mirrors ports `$03`/`$05`/`$06` into RAM (`PORT_03`/`PORT_05`/`PORT_06`
at `$0B11`/`$0B12`/`$0B13`) precisely because those ports are **write-only** — the only
way to read "what did I last set the graphics mode / sound / keyboard-row-select to"
is via the mirror, not the port itself. Always read-modify-write through the mirror
when changing individual bits of these three ports (see the Sound and Colors examples
above, which all follow this pattern), or you'll clobber unrelated bits.

## Sound

Single hardware channel, square wave, 6 octaves, 4-bit volume (0-15).
- **Pitch**: low byte on port `$04`; high nibble + disable/IRQ-enable flags on port
  `$05` (mirror `PORT_05`).
- **Volume**: bits 1-5 of port `$06` (mirror `PORT_06`), shifted left 2 from a 0-15
  value.
- **Enable/disable**: bit 4 of port `$05` (`1` = disabled).
- TRSE wrapper: `TVC::Sound(Pitch)`/`SoundEx(Pitch, Duration, Volume)`/`Volume(V)`/
  `SoundOn`/`SoundOff`/`NoSound` (also mirrored in `GE.tru`, same behavior).

For anything beyond a single tone — chiptune playback, multiple simultaneous notes —
see `music.tru`, which **replaces** this simple channel with a fully software-mixed
3-oscillator player driven from a custom ~8.5kHz/~5kHz timer interrupt (it takes over
the interrupt vector; `system.tru`'s firmware save/restore discipline applies). For
sampled sound (not synthesized tones), the 2026 `GE.tru` build adds **digi sound** —
real 4-bit PCM playback via its own dedicated interrupt, mutually exclusive in timing
with the raster/cursor interrupt. See `sources/notes/notes_ge_tru_2026.md` for the
`DigiSoundOn`/`PlayDigiSound` API and its CPU-cost tradeoff (1x4-bit ≈12.6% CPU/full
size vs. 2x4-bit ≈20% CPU/half size).

## Keyboard and joystick

A 10-row keyboard matrix, selected via port `$03` bits 0-3 and read back via port
`$58`. The matrix is scanned continuously by the stock firmware interrupt handler into
a RAM mirror (`PICTURE`, 10 bytes at `$0B51`) — `TVC.tru`'s keyboard functions
(`ReadKey`, `IsPressed`, `SpacePressed`, etc.) read this mirror directly and therefore
**require the stock interrupt handler to still be running**. `GE.tru` instead does its
own explicit matrix scan (`GetKeyboard`/`GetJoysticks`) into its own cache before its
`*Pressed`/`Joystick` functions are valid — call the scan every frame before reading
input.

**Joysticks** are read as two extra matrix rows (not separate ports): row 8
(`$0B59`/joystick 1) and row 9 (joystick 2). Bit layout confirmed by the Guide's
worked example: bit 6 = LEFT, bit 5 = RIGHT, bit 3 = FIRE (UP/DOWN follow the same
pattern on the remaining bits — see `TVC.tru`'s `JOY_UP`(2)/`JOY_DOWN`(4) constants for
the exact values TRSE uses). TRSE wrapper: `TVC::Joystick(Nr, KeyCode)` /
`GE::Joystick(Nr, JoyCode)` with `JOY_LEFT`/`JOY_RIGHT`/`JOY_UP`/`JOY_DOWN`/`JOY_FIRE`
bitmask constants.

The 2026 `GE.tru` build adds **GameCard** support — a joystick-expansion peripheral in
one of the 4 external slots (ID string `"JOY+SN"`), giving joysticks 3 and 4
(`Joy3State`/`Joy4State`). Its bitmask encoding is **different** from the built-in
`JOY_*` constants — use the dedicated `GAMECARD_JOY_*` constants, don't reuse `JOY_*`.

## System variables and memory areas worth knowing

Selected entries from the full table in the Programming Guide and ROM book (Page 0 /
U0 RAM, always mapped regardless of banking state):

| Address | Name | What it's for |
|---|---|---|
| `$0003` | `P_SAVE` | Mirror of the last memory-mapping byte sent to port `$02` — write here *before* the port |
| `$0030` | `OS_ENTRY` | Entry point of ROM firmware calls (the `rst $30` dispatch table) |
| `$0038` | `IT_ENTRY` | Interrupt handler entry point — `system.tru`'s `SaveFirmware`/`DisableFirmware`/`EnableFirmware` operate on this vector |
| `$0B11`/`$0B12`/`$0B13` | `PORT_03`/`PORT_05`/`PORT_06` | RAM mirrors of the 3 write-only ports — see the port-map note above |
| `$0B19` | `HI_MEM` | Top of BASIC-usable RAM |
| `$0B4D`/`$0B4E`/`$0B4F` | `INK`/`PAPER`/`BORDER` | Current line/text/border color state |
| `$0B51` | `PICTURE` | 10-byte live keyboard matrix (rows 0-7 keys, rows 8-9 joysticks) |

Safe-to-reuse memory areas (from the Programming Guide's own annotations — useful when
deciding where to put custom buffers, e.g. `GE.tru`'s sprite background-save pool):

| Address | Size | Area | Safe to reuse when... |
|---|---|---|---|
| `$0100` | 1600B | ASCII screen buffer (64×25) | always, if you're not using the ASCII/text screen |
| `$0740` | 960B | Definable-character matrices (chars 128-223) | you're not using those character codes |
| `$0BF0` | 600B | Tape working area | you don't do file (tape) I/O |
| `$0E48` | 80B | Editor working area | always |
| `$0EAC` | 2048B | System STACK | never, unless you fully understand the consequences |
| `$16AC` | 835B | BASIC working area | you're not calling back into BASIC/system functions |

`GE.tru`'s own header comment documents a similar map for *its* memory usage
(background-save pool, sprite list, mirror table, `List` class objects) — see
`sources/tru-units/TVC/GE.tru`'s top-of-file comment or
`sources/notes/notes_ge_tru_2026.md` for the exact byte ranges it claims.

## Known traps (see also `SKILL.md`)

- **Raster-interrupt `Xpos` must never be 0** — use 63.
- **Graphics 4's bit layout is not 4 contiguous 2-bit pixels** — low bits of all 4
  pixels first, then high bits of all 4 pixels. Get this wrong when hand-packing
  pixel data and every color comes out scrambled.
- **Ports `$03`/`$05`/`$06` are write-only** — always read-modify-write through their
  RAM mirrors (`$0B11`/`$0B12`/`$0B13`), never assume you can read the port itself.
- **VIDEORAM must be paged in before any screen write, and paged back afterward** —
  the single most common source of TVC-target bugs when bypassing the unit's own
  screen procedures.
- **The 16-color palette has only 15 visually distinct colors** — two palette codes
  both produce black (intensity is a multiplier, and black × anything is black).
