# `TVC` unit reference

Source: `sources/tru-units/TVC/TVC.tru` (2240 lines). Full raw catalog:
`sources/notes/notes_tru_units.md` §2.

**What it's for**: the general-purpose TVC "standard library" — screen/graphics,
memory banking, text, keyboard, sound, cassette file I/O — almost entirely implemented
as thin wrappers over the machine's ROM firmware `rst $30` system calls or direct
I/O-port pokes. Use this unit for **non-game, firmware-friendly programs** (utilities,
demos, tools, anything that doesn't need to fight the firmware for CPU time). For
sprite-based games, see `references/api/ge-unit.md` instead — `GE.tru` duplicates most
of this unit's screen/keyboard/sound surface in a firmware-free, faster style and adds
software sprites.

`@use "TVC"` to import. All calls use `TVC::ProcName(...)` syntax.

**Don't mix `TVC::` and `GE::` casually.** Both units maintain independent state for
things like the current fill pattern and graphics mode; calling into both APIs in the
same program works mechanically but their bookkeeping isn't synchronized (see
`references/api/ge-unit.md`'s intro for detail). Pick one as your primary API for a
given program.

## Constants

| Group | Values |
|---|---|
| Memory mapping | `MEM_DEFAULT`(0), `MEM_VID_ON`(1), `MEM_FULL_64K`(2), `MEM_48K_VID`(3) — see `references/hardware.md`'s memory-mapping table for what each layout maps |
| Graphics modes | `GRAPHICS2`(0)=512×240/2-color, `GRAPHICS4`(1)=256×240/4-color, `GRAPHICS16`(2)=128×240/16-color |
| Text styles | `TEXT_STYLE_DEFAULT`(0), `TEXT_STYLE_NO_INK`(1), `TEXT_STYLE_TRANSPARENT`(2), `TEXT_STYLE_INVISIBLE`(3) |
| Line draw modes | `LINE_MODE_DEFAULT`(0)=overwrite, `LINE_MODE_OR`(1), `LINE_MODE_AND`(2), `LINE_MODE_XOR`(3) |
| Sound | `SILENT_SOUND`=4095, `MAX_VOLUME`=15, `SOUND_LO_PORT`(4)/`SOUND_HI_PORT`(5)/`SOUND_VOLUME_PORT`(6) |
| Joystick bitmasks | `JOY_LEFT`(64), `JOY_RIGHT`(32), `JOY_UP`(2), `JOY_DOWN`(4), `JOY_FIRE`(8) |
| Palette colors | `PALETTE_BLACK`, `PALETTE_DARK_BLUE`, `PALETTE_DARK_RED`, `PALETTE_DARK_MAGENTA`, `PALETTE_DARK_GREEN`, `PALETTE_DARK_CYAN`, `PALETTE_DARK_YELLOW`, `PALETTE_GRAY`, `PALETTE_BLACK2`, `PALETTE_BLUE`, `PALETTE_RED`, `PALETTE_MAGENTA`, `PALETTE_GREEN`, `PALETTE_CYAN`, `PALETTE_YELLOW`, `PALETTE_WHITE` |
| Border colors | `BORDER_*`, 16 values mirroring the palette names — **own separate encoding from `PALETTE_*`**, don't mix the two constant families even though the underlying bit layout is related (see `references/hardware.md`) |
| Graphics-16 palette | `GR16_BLACK` through `GR16_WHITE` (fixed, values 0-15, no remapping) |

Most procedures pass parameters through fixed-address globals packed into the "text
editor working area" (`$0E48`-`$0E97`) rather than a real calling convention — this is
transparent to you as a caller (just pass arguments normally), but explains why the
unit's internal implementation looks the way it does if you read the source.

## Screen

| Signature | Description |
|---|---|
| `procedure SetGraphicsMode(Mode: byte)` | Switch video mode (`GRAPHICS2`/`4`/`16`) via firmware `VMODE` call; also resets the fill pattern to 0. |
| `function GetGraphicsMode(): byte` | Reads the current mode back from the system variable mirror. |
| `procedure ClearScreen()` | Fills all of video RAM with the current fill pattern byte; pages VRAM in/out around the write automatically. |
| `procedure Cls()` | Clears the screen via the BASIC-firmware `CLS` routine (a different path than `ClearScreen`). |
| `procedure SetPalette(Nr, Color: byte)` | Sets one palette slot (0-3, Graphics 2/4 only) via port `$60`+`Nr`. |
| `procedure SetBorder(Color: byte)` | Sets border color via port `$00` and updates the mirror. |
| `procedure WaitForSync()` | Blocks until the next raster interrupt (`halt`). |
| `procedure SetRasterInterruptPos(LineNr: byte)` | Programs CRTC registers 14/15 for a raster interrupt at the given screen line (0-239); handles the `Xpos`-must-not-be-0 CRTC quirk internally. |

## Memory mapping

| Signature | Description |
|---|---|
| `procedure SetMemory(Mode: byte)` | Selects one of the 4 fixed bank layouts (see Constants above) by writing port `$02` / the `P_SAVE` mirror. |
| `procedure MemCopy(SourcePtr, DestPtr: pointer; Size: integer)` | Raw `ldir` block copy between two addresses. |

## Text

| Signature | Description |
|---|---|
| `procedure GotoXY(X, Y: byte)` | Moves the text cursor (character coords; column range depends on graphics mode — 1-64/32/16 — rows always 1-24) via firmware `BTEXT`. |
| `procedure Write(Text: ^byte)` | Prints a 0-terminated string at the current cursor position. |
| `procedure WriteAt(X, Y: byte; Text: ^byte)` | `GotoXY` + `Write` combined. |
| `procedure SetColor(Color: byte)` | Sets text/line ink color. |
| `procedure TextBackground(Color: byte)` | Sets text background/paper color; also recomputes the fill pattern used by `FillRect`/`ClearScreen`. |
| `procedure TextStyle(Style: byte)` | Sets overwrite behavior (`TEXT_STYLE_*`: default / no-ink / transparent-background / both). |
| `procedure DefChar(CharCode: byte; CharDataPtr: pointer)` | Redefines a character glyph (codes 128-223) from a 10-byte bitmap via firmware `DEFC`. |
| `procedure CreateCharImage(CharCode, Count, Background, Color: byte)` | Pre-renders one or more redefined characters (codes 154-223) into a fast-blit buffer; **Graphics 4 mode only**. Call before `PutCharImage`. |
| `procedure PutCharImage(X, Y, CharCode, Count: byte)` | Blits pre-rendered char-images to video RAM at a character position (opaque). |
| `procedure PutTransparentCharImage(X, Y, CharCode, Count: byte)` | Same as `PutCharImage` but ORs onto existing screen content instead of overwriting. |

The `DefChar`/`CreateCharImage`/`PutCharImage` trio is TVC's character-based approach
to sprite-like animation without the `GE` unit — see `tutorials_bertok/tutorial_tvc.ras`
(`sources/tutorials/tutorials_bertok/tutorial_tvc.ras`) for a 12-frame run-cycle built
this way.

## Graphics (vector/pixel drawing — abstract 1024×960 coordinate space)

**Coordinate system note**: everything in this section uses TRSE's abstract
1024×960 firmware coordinate space (scaled to the actual resolution per graphics
mode), **not** the native 64×240 byte grid. `VerticalBytes` and `FillRect` below break
this pattern — they're byte-grid, native-coordinate procedures included here because
they're graphics-related, not because they share a coordinate system with the rest of
this section. See `references/hardware.md`'s "two coordinate systems" note.

| Signature | Description |
|---|---|
| `procedure PutPixel(X1, Y1: integer)` | Plots one point (0-1023, 0-959). |
| `procedure Line(X1, Y1, X2, Y2: integer)` | Draws a line between two absolute points. |
| `procedure LineRel(X1, Y1: integer)` | Draws a line from the current pen position by a relative displacement. |
| `procedure MoveTo(X1, Y1: integer)` | Moves the pen without drawing. |
| `procedure MoveRel(X1, Y1: integer)` | Moves the pen by a relative displacement. |
| `procedure Rectangle(X1, Y1, X2, Y2: integer)` | Draws an unfilled rectangle outline. |
| `procedure Fill()` | Flood-fills from the current pen position. |
| `procedure SetLineStyle(Style: byte)` | Sets a firmware dash style, 1-14. |
| `procedure SetLineMode(Mode: byte)` | Sets the pixel combine mode for line/pixel drawing (`LINE_MODE_*`). |
| `procedure VerticalBytes(X, Y, Count, Pattern: byte)` | **Byte-grid coordinates** (0-63, 0-239). Writes `Count` vertical bytes of `Pattern` directly into VRAM, bypassing firmware. |
| `procedure FillRect(X, Y, Width, Height: byte)` | **Byte-grid coordinates.** Fills a rectangle directly in VRAM with the current fill pattern — fast, non-firmware. |

## Keyboard

Reads system-maintained state directly, which **requires the stock firmware
interrupt handler to still be running** (unlike `GE.tru`'s keyboard functions, which
do their own explicit scan and work even with the firmware handler replaced).

| Signature | Description |
|---|---|
| `function ReadKey(): byte` | Blocks until a key is pressed, returns its code. |
| `function IsPressed(): byte` | True if any key in the matrix is currently held. |
| `function SpacePressed(): boolean` | Direct matrix-bit test for Space. |
| `function ReturnPressed(): boolean` | Direct matrix-bit test for Return/Enter. |
| `function EscPressed(): boolean` | Direct matrix-bit test for Esc. |
| `function CtrlPressed(): boolean` | Direct matrix-bit test for Ctrl. |
| `function AltPressed(): boolean` | Direct matrix-bit test for Alt. |
| `function ShiftPressed(): boolean` | Direct matrix-bit test for Shift. |
| `function Joystick(Nr, KeyCode: byte): boolean` | Reads joystick 1 or 2 direction/fire state via a `JOY_*` bitmask against matrix rows 8/9. |

## Sound

Single hardware tone channel — see `references/hardware.md`'s Sound section for the
underlying ports. For multi-channel/chiptune playback, use `music.tru` instead (which
takes over this channel entirely via its own interrupt-driven mixer).

| Signature | Description |
|---|---|
| `procedure Volume(SoundVolume: byte)` | Sets output volume, 0-15. |
| `procedure SoundOn()` | Re-enables the sound sign bit (implicitly sets volume 15). |
| `procedure SoundOff()` | Silences and disables the sound sign bit. |
| `procedure Sound(Pitch: integer)` | Plays a continuous tone (0-4095, 4095=silent) until `NoSound`. |
| `procedure SoundEx(Pitch: integer; Duration, SoundVolume: byte)` | Plays a tone for a fixed duration (~20ms units) and volume. |
| `procedure NoSound()` | Stops the currently playing tone. |

## File I/O (cassette-based ROM calls)

On emulators/hardware with disk add-ons, these same calls are typically redirected to
file-based storage transparently.

| Signature | Description |
|---|---|
| `procedure CreateFile(FileName: ^byte)` | Creates/opens a file for writing (max 16-char name). |
| `function OpenFile(FileName: ^byte): boolean` | Opens a file for reading; returns success. |
| `procedure CloseFile()` | Closes the current file. |
| `function ByteRead(): byte` | Reads one byte from the open file. |
| `function BlockRead(BlockData: ^byte; BlockLength: integer): integer` | Reads a block; returns 0 on success, else bytes not read. |
| `function BlockWrite(BlockData: ^byte; BlockLength: integer): integer` | Writes a block (single call only per file); returns 0 on success, else bytes not written. |

## Helpers / I/O / misc

| Signature | Description |
|---|---|
| `function In(PortNr: byte): byte` | Raw `in a,(port)`. |
| `procedure Out(PortNr, Value: byte)` | Raw `out (port),a`. |
| `function Rnd(): byte` | Cheap pseudo-random byte from the Z80 memory-refresh register R — low quality, fine for simple effects, not for anything needing real randomness. |
| `procedure Delay(DelayTicks: integer)` | Busy-waits `DelayTicks` raster syncs (~20.096ms each). |
| `procedure IntToStr(X1: integer)` | Converts an integer to decimal ASCII digits into the shared `NumStr` buffer. |
| `procedure ByteToStr(Nr: byte)` | Converts a byte to decimal ASCII digits into `NumStr`. |
| `function Odd(Nr: byte): boolean` | True if `Nr` is odd. |

`IntToStr`/`ByteToStr` write into a shared internal buffer (`NumStr`) rather than
returning a string — read it back immediately (e.g. pass it straight to `Write`)
before calling another procedure that might reuse the same buffer.
