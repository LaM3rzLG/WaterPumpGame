# TRSE TVC Platform Unit Inventory

Source: `/home/dey/trse/units/TVC/` (platform-specific) and `/home/dey/trse/units/global/` (cross-platform, also available when targeting TVC).

This catalogs the public API surface (procedures, functions, constants, types) exposed by each `.tru` unit file, as raw material for a TRSE/TVC "skill" reference. `.tru` files are TRSE unit source: Pascal-like declarations whose bodies are almost always a single `asm("...")` block of inline Z80 assembly, occasionally mixed with Pascal-level control flow (if/case/while) for parts that don't need to be hand-optimized.

All TVC procedures are called with the `UnitName::ProcName(...)` syntax, e.g. `TVC::SetGraphicsMode(TVC::GRAPHICS_16);`.

---

## 1. Hardware/platform primer (from reading the units)

- **CPU**: Z80. Code is literally Z80 assembly wrapped in Pascal procedure syntax; parameters are marshalled through fixed memory addresses (`var ... : byte at $0E48;` etc.) rather than a real calling convention, and picked up in asm via `ld A,[Unit_ParamName]`.
- **Memory banking**: TVC has 4 x 16KB pages (U0-U3 user RAM slots, plus VID = video RAM 16KB, SYS = 16KB system ROM, CART/EXT = external 16KB banks) that are memory-mapped in 4 banks via port `$2`/system variable `$3`. Common presets (mirrored in both `TVC.tru` and `GE.tru` as `MEM_DEFAULT/MEM_VID_ON/MEM_FULL_64K/MEM_48K_VID` or `MEM_DEFAULT/MEM_VID_ON/MEM_FULL_64K/MEM_48K_VID`) select which 16KB chunk lands at each quarter of the 64KB Z80 address space. Video RAM ($8000-$BFFF when mapped in) must be paged in before touching screen memory, and code paging it in must remember to restore the previous mapping afterward — nearly every screen-writing routine in `TVC.tru` does save-map/write/restore-map around VRAM access.
- **Video modes** (3 graphics modes, selectable via CRTC / system ROM call):
  - `GRAPHICS2` (mode 0): 512x240, 2 colors
  - `GRAPHICS4` (mode 1): 256x240, 4 colors
  - `GRAPHICS16` (mode 2): 128x240, 16 colors
  - Internally the screen is always 64 bytes/row x 240 rows (15360 bytes = one 16KB-ish framebuffer at $8000), just interpreted as 1/2/4 bits-per-pixel depending on mode. X/Y pixel-addressing APIs (`PutPixel`, `Line`, etc.) use an abstract 1024x960 coordinate space regardless of mode (firmware scales it); the low-level "byte row" APIs (`FillRect`, `VerticalBytes`, sprite code) work in the native 64x240 byte grid.
- **Color/palette**: A single palette byte encodes 2 bits each of R/G/B-ish "brightness+hue" (values like `$41`=blue, `$44`=red, `$54`=yellow, `$55`=white). In GRAPHICS2/4 modes there are 2 or 4 programmable palette slots (hardware ports `$60`+slot); GRAPHICS16 uses a fixed 16-entry palette (`GR16_*` constants map pixel value 0-15 directly to color, no remapping). Border color uses its own separate constant set (`BORDER_*`), a shifted/different encoding from `PALETTE_*`.
- **CRTC (Cardtridge/CRT controller chip)**: Real hardware register file addressed via port `$70` (select register) / `$71` (register data). `crtc.tru` exposes only a thin, mostly-stub wrapper (`SetMode`, `SetPalette`, `SetBorder`); most CRTC register pokes actually happen inline inside `TVC.tru`/`GE.tru`/`music.tru` procedures (e.g. raster interrupt line position uses CRTC registers 14/15; disabling the cursor interrupt during music playback pokes CRTC registers 10/11).
- **Sound**: A single 3-channel-capable square-wave "sound generator" reachable via 3 I/O ports: PITCH low byte (port 4), PITCH high nibble + IT/SIGN flags (port 5), VOLUME (port 6, also shared with graphics-mode bits). Only one hardware tone channel exists; `music.tru`'s 3-channel player synthesizes multi-channel sound entirely in software by rewriting the port-4/5/6 values from a custom high-frequency (~8.5kHz/~5kHz) timer interrupt that mixes 3 phase-accumulator oscillators per interrupt tick — this is a full software wavetable/PWM mixer, not 3 hardware channels.
- **Keyboard/joystick**: A 10-row keyboard matrix mapped into fixed system RAM addresses ($0B51.. in TVC.tru's IsPressed, or GE's own `KEYBOARD_0`..`KEYBOARD_7`/`JOY1_STATE`/`JOY2_STATE` table at 2897-2906). Two joysticks are read as extra matrix rows with bitmask constants `JOY_LEFT/RIGHT/UP/DOWN/FIRE`. GE.tru requires an explicit `GetKeyboard`/`GetJoysticks` scan call before reading press-state functions; TVC.tru's keyboard functions read system-maintained state directly (relies on the stock interrupt handler still running).
- **Text/character set**: TVC has a built-in ROM/RAM character generator addressable through firmware calls (`text.tru`, and `TVC.tru`'s `DefChar`/`CreateCharImage`/`PutCharImage`). Characters 128-223 are redefinable; codes below 240 additionally cost 2KB of RAM once user-defined-char mode is switched on. `GE.tru` bypasses the character generator entirely for its `WriteText`, instead blitting a custom bitmap font image (`CharSetPtr`) directly to screen bytes — this is the "game" text path, faster but needs a font resource.
- **Sprites ("GE" unit)**: Not hardware sprites — TVC has none. `GE.tru`'s `Sprite` class implements software sprites: each sprite is a byte-rectangle blitted onto the screen (or an off-screen "back screen" at `$C000` on 64K machines) with save/restore of the background pixels it overwrites, masked AND/OR compositing (`SpriteType` 1 = plain overwrite, 2 = mask+image pair), a position stored as a precomputed raw screen-byte address, and simple sprite-sheet animation (an array of same-sized frames, `AnimSet`/`AnimPhaseNr`/`AnimDelay`).
- **Firmware/ROM**: TVC's ROM ("system firmware") owns interrupt handling and a large `rst $30` system-call trap that dispatches by function-code byte (`db $N` after the `rst $30`) — used pervasively for text/graphics/sound/file routines (BASIC-level equivalents: `VMODE`, `BTEXT`, `VID_BKOUT`, `CAS_OPEN`, `CAS_BKIN`, `TONE_SET`, etc.). `system.tru` provides raw enable/disable of this firmware interrupt handler and of ROM paging, for programs that want to take over the machine (e.g. music.tru's custom IRQ, or games disabling firmware to reclaim CPU time / avoid firmware side effects).
- **File I/O**: Cassette-tape-era ROM routines (`CAS_CRTE`, `CAS_OPEN`, `CAS_CLOSE`, `CAS_CHIN`, `CAS_BKIN`, `CAS_BKOUT`), exposed as `CreateFile/OpenFile/CloseFile/ByteRead/BlockRead/BlockWrite` in `TVC.tru`. On emulators/real hardware with disk add-ons these same calls are typically redirected to file-based storage.

---

## 2. `TVC.tru` — core platform unit (2240 lines)

**Purpose**: The main "standard library" for the TVC target — screen/graphics, memory-bank switching, text, keyboard, sound, and cassette file I/O, almost entirely implemented as thin wrappers around the machine's ROM firmware `rst $30` system calls or direct I/O-port pokes. This is the general-purpose unit most non-game programs would use (as opposed to `GE.tru`, which is a specialized game/sprite framework favoring raw screen-byte access over firmware calls for speed).

### Global params / helper vars
Most procedures pass their parameters through fixed-address globals (`Mode, Nr, Color, X, Y, Style, X1, Y1, X2, Y2, DelayTicks, SoundVolume, Duration, Pitch, KeyCode, CharCode, CharDataPtr, Width, Height, FillPattern, GraphMode, Background, Count, PortNr, Value, LineNr, Pattern, Size, SourcePtr, DestPtr`, all packed into TVC's free "text editor working area" at $0E48-$0E97), plus `Text: ^byte`, `NumStr: array[6] of byte` (result buffer for `IntToStr`/`ByteToStr`), and `soundIsOn: boolean`.

### Constants
- **Memory mapping**: `MEM_DEFAULT`(0), `MEM_VID_ON`(1), `MEM_FULL_64K`(2), `MEM_48K_VID`(3)
- **Graphics modes**: `GRAPHICS2`(0)=512x240/2color, `GRAPHICS4`(1)=256x240/4color, `GRAPHICS16`(2)=128x240/16color
- **Text styles**: `TEXT_STYLE_DEFAULT`(0), `TEXT_STYLE_NO_INK`(1), `TEXT_STYLE_TRANSPARENT`(2), `TEXT_STYLE_INVISIBLE`(3)
- **Line draw modes**: `LINE_MODE_DEFAULT`(0)=overwrite, `LINE_MODE_OR`(1), `LINE_MODE_AND`(2), `LINE_MODE_XOR`(3)
- **Sound**: `SILENT_SOUND`=4095, `MAX_VOLUME`=15; port addresses `SOUND_LO_PORT`(4)/`SOUND_HI_PORT`(5)/`SOUND_VOLUME_PORT`(6)
- **Joystick bitmasks**: `JOY_LEFT`(64), `JOY_RIGHT`(32), `JOY_UP`(2), `JOY_DOWN`(4), `JOY_FIRE`(8)
- **Palette colors** (2/4-color modes): `PALETTE_BLACK`, `PALETTE_DARK_BLUE`, `PALETTE_DARK_RED`, `PALETTE_DARK_MAGENTA`, `PALETTE_DARK_GREEN`, `PALETTE_DARK_CYAN`, `PALETTE_DARK_YELLOW`, `PALETTE_GRAY`, `PALETTE_BLACK2`, `PALETTE_BLUE`, `PALETTE_RED`, `PALETTE_MAGENTA`, `PALETTE_GREEN`, `PALETTE_CYAN`, `PALETTE_YELLOW`, `PALETTE_WHITE`
- **Border colors** (own encoding, `BORDER_*`, 16 values mirroring the palette names)
- **16-color mode palette** (fixed, `GR16_BLACK` through `GR16_WHITE`, values 0-15)
- Various hardware addresses: `SYS_TIMER`, `PORT_3/5/6_MEM_MIRROR`, `SYS_GRAPH_MODE`, `GRAPH_MODE_PORT`, `SYS_BORDER_COLOR/PORT`, `SYS_INK_COLOR`, `SYS_PAPER_COLOR`, `SYS_TEXT_STYLE_FLAG`, `SYS_LINE_MODE`, `SYS_LINE_STYLE`, `FILE_BUFFER_TYPE`

### Screen
| Signature | Description |
|---|---|
| `procedure SetGraphicsMode(Mode: global byte)` | Switch video mode (`GRAPHICS2/4/16`) via firmware `VMODE` call; also resets `FillPattern` to 0. |
| `function GetGraphicsMode(): byte` | Reads current mode from system variable $0B13 (bits 0-1). |
| `procedure ClearScreen()` | Fills the whole 16KB video RAM with `FillPattern` byte, paging VRAM in/out around the write. |
| `procedure Cls()` | Clears screen via BASIC-firmware `CLS` routine (`rst $30`/`db $5`). |
| `procedure SetPalette(Nr, Color: global byte)` | Sets one palette slot (0-3, GRAPHICS2/4 only) to a color code via hardware port $60+Nr. |
| `procedure SetBorder(Color: global byte)` | Sets the screen border color via port $0 and updates the mirror system variable. |
| `procedure WaitForSync()` | Blocks until the next raster interrupt (`halt`). |
| `procedure SetRasterInterruptPos(LineNr: global byte)` | Programs CRTC registers 14/15 to fire the raster interrupt at a given screen line (0-239). |

### Memory mapping
| Signature | Description |
|---|---|
| `procedure SetMemory(Mode: global byte)` | Selects one of 4 fixed 4x16KB bank layouts (`MEM_DEFAULT/MEM_VID_ON/MEM_FULL_64K/MEM_48K_VID`) by writing port $2 / system variable $3. |
| `procedure MemCopy(SourcePtr, DestPtr: global pointer; Size: global integer)` | Raw `ldir` block copy between two addresses. |

### Text
| Signature | Description |
|---|---|
| `procedure GotoXY(X, Y: global byte)` | Moves text cursor (character coords, range depends on graphics mode: 1-64/32/16 columns x 1-24 rows) via firmware `BTEXT`. |
| `procedure Write(Text: global ^byte)` | Prints a 0-terminated string at the current cursor position (firmware `VID_BKOUT`). |
| `procedure WriteAt(X, Y: global byte; Text: global ^byte)` | Combines `GotoXY` + `Write`. |
| `procedure SetColor(Color: global byte)` | Sets text/line ink color (range depends on mode) via system variable. |
| `procedure TextBackground(Color: global byte)` | Sets text background/paper color; also recomputes `FillPattern` byte used by `FillRect`/`ClearScreen` for the current graphics mode. |
| `procedure TextStyle(Style: global byte)` | Sets overwrite behavior: default / no-ink / transparent-bg / both (`TEXT_STYLE_*`). |
| `procedure DefChar(CharCode: global byte; CharDataPtr: global pointer)` | Redefines a character glyph (codes 128-223) from a 10-byte bitmap via firmware `DEFC`. |
| `procedure CreateCharImage(CharCode, Count, Background, Color: global byte)` | Pre-renders one or more redefined characters (codes 154-223) into a fast-blit "char image" buffer at $100, honoring the current 4-color palette (GRAPHICS4-mode only). Needed before `PutCharImage`. |
| `procedure PutCharImage(X, Y, CharCode, Count: global byte)` | Blits pre-rendered char-images directly to video RAM at a char position (opaque). |
| `procedure PutTransparentCharImage(X, Y, CharCode, Count: global byte)` | Same as `PutCharImage` but ORs onto the existing screen content (transparent background). |

### Graphics (vector/pixel drawing, abstract 1024x960 coordinate space, all via firmware)
| Signature | Description |
|---|---|
| `procedure PutPixel(X1, Y1: global integer)` | Plots a single point (0-1023, 0-959) using firmware move+pen-on+pen-off. |
| `procedure Line(X1, Y1, X2, Y2: global integer)` | Draws a line between two absolute points. |
| `procedure LineRel(X1, Y1: global integer)` | Draws a line from the current pen position by a relative displacement. |
| `procedure MoveTo(X1, Y1: global integer)` | Moves the pen (no draw) to an absolute position. |
| `procedure MoveRel(X1, Y1: global integer)` | Moves the pen by a relative displacement. |
| `procedure Rectangle(X1, Y1, X2, Y2: global integer)` | Draws an unfilled rectangle outline between two corner points. |
| `procedure VerticalBytes(X, Y, Count, Pattern: global byte)` | Low-level: writes `Count` vertical bytes of `Pattern` directly into video RAM at byte-grid coords (0-63, 0-239), bypassing firmware. |
| `procedure Fill()` | Flood-fills from the current pen position (firmware `Fill`). |
| `procedure SetLineStyle(Style: global byte)` | Sets a firmware line-dash style, 1-14. |
| `procedure SetLineMode(Mode: global byte)` | Sets pixel combine mode for line/pixel drawing (`LINE_MODE_*`: overwrite/OR/AND/XOR). |
| `procedure FillRect(X, Y, Width, Height: global byte)` | Fills a byte-grid rectangle directly in video RAM with the current `FillPattern` (fast, non-firmware). |

### Keyboard
| Signature | Description |
|---|---|
| `function ReadKey(): byte` | Blocks until a key is pressed, returns its code (firmware `KBD_CHIN`). |
| `function IsPressed(): byte` | True if any key in the 10-row keyboard matrix is currently held. |
| `function SpacePressed(): boolean` | Direct matrix-bit test for Space. |
| `function ReturnPressed(): boolean` | Direct matrix-bit test for Return/Enter. |
| `function EscPressed(): boolean` | Direct matrix-bit test for Esc. |
| `function CtrlPressed(): boolean` | Direct matrix-bit test for Ctrl. |
| `function AltPressed(): boolean` | Direct matrix-bit test for Alt. |
| `function ShiftPressed(): boolean` | Direct matrix-bit test for Shift. |
| `function Joystick(Nr, KeyCode: global byte): boolean` | Reads joystick 1 or 2 (`Nr`) direction/fire state via `JOY_*` bitmask against matrix rows 8/9. Relies on the stock interrupt handler maintaining the matrix. |

### Helpers / I/O / misc
| Signature | Description |
|---|---|
| `function In(PortNr: global byte): byte` | Raw `in a,(port)`. |
| `procedure Out(PortNr, Value: global byte)` | Raw `out (port),a`. |
| `function Rnd(): byte` | "Random" byte from the Z80 memory-refresh register R (cheap pseudo-random). |
| `procedure Delay(DelayTicks: global integer)` | Busy-waits `DelayTicks` raster syncs (~20.096ms each). |
| `procedure IntToStr(X1: global integer)` | Converts an integer (0-99999-ish) to decimal ASCII digits into `NumStr`. |
| `procedure ByteToStr(Nr: global byte)` | Converts a byte to decimal ASCII digits into `NumStr`. |
| `function Odd(Nr: global byte): boolean` | True if `Nr` is odd (bit 0 test). |

### Sound
| Signature | Description |
|---|---|
| `procedure Volume(SoundVolume: global byte)` | Sets output volume (0-15) on the single hardware channel. |
| `procedure SoundOn()` | Re-enables the firmware sound-sign bit (implicitly sets volume 15); not required unless previously disabled. |
| `procedure SoundOff()` | Silences and disables the sound-sign bit. |
| `procedure Sound(Pitch: global integer)` | Plays a continuous tone at the given pitch value (0-4095, 4095=silent) until `NoSound`. |
| `procedure SoundEx(Pitch: global integer; Duration, SoundVolume: global byte)` | Plays a tone for a fixed duration (units of ~20ms) and volume via firmware `TONE_SET`. |
| `procedure NoSound()` | Stops the currently playing tone. |

### File I/O (cassette-based ROM calls)
| Signature | Description |
|---|---|
| `procedure CreateFile(FileName: global ^byte)` | Creates/opens a file for writing (`CAS_CRTE`), max 16-char name. |
| `function OpenFile(FileName: global ^byte): boolean` | Opens a file for reading (`CAS_OPEN`); returns success. |
| `procedure CloseFile()` | Closes the current file (`CAS_CLOSE`). |
| `function ByteRead(): byte` | Reads one byte from the open file (`CAS_CHIN`). |
| `function BlockRead(BlockData: global ^byte; BlockLength: global integer): integer` | Reads a block; returns 0 on success, else bytes not read. |
| `function BlockWrite(BlockData: global ^byte; BlockLength: global integer): integer` | Writes a block (single call only per file); returns 0 on success, else bytes not written. |

---

## 3. `GE.tru` — "Game Engine" unit (2951 lines)

**Purpose**: A self-contained, faster/lower-level alternative to `TVC.tru`, purpose-built for games. It duplicates most of `TVC.tru`'s screen/keyboard/sound/misc helpers (same names, same behavior, TVC-firmware-free where possible) and adds the unit's real value-add: a **software sprite/image engine** with an optional double-buffered "back screen", a bitmap-font text writer, hardware scrolling, and ZX7 decompression for compressed asset loading.

### Key globals / constants (subset distinct from TVC.tru)
- `SCREEN_WIDTH`=64 (bytes/row), `SCREEN_HEIGHT`=240 (rows), `SCREEN_SIZE`=15360, `SCREEN_ADDR`=$8000, `BACK_SCREEN_ADDR`=$C000
- `ScreenAddr`: currently active draw target ($8000 = live screen, $C000 = back screen)
- `MemAllocPtr` / `FreeMemSize` / `MemAllocPage`: a simple bump/top-down allocator used to carve out per-sprite background-save buffers from free RAM (ASCII screen area or page 2/3, depending on `UseBackScreen`)
- `SpriteListPtr` / `LastSpritePtr` / `SpriteCount`: a flat list of pointers to every `Sprite` instance created, used by the `*AllSprites` bulk operations
- `CharSetPtr` / `CharSetImgWidth` / `CharWidth` / `CharSetHeight`: configuration for the custom bitmap-font `WriteText` renderer (must be set to an `incbin`-loaded font image before use)
- Same `MEM_*`, `GRAPHICS*`, sound port, `PALETTE_*`, `BORDER_*`, `JOY_*` constants as `TVC.tru` (independently redefined, same values)
- Keyboard matrix addresses `KEYBOARD_0`..`KEYBOARD_7`, `JOY1_STATE`, `JOY2_STATE` (2897-2906) — GE reads these directly rather than via TVC.tru's addresses

### `Sprite` class (software sprites — the heart of the unit)
A class-style record (fields + methods, `this`-based like a Pascal object) representing one software sprite. Sprites are **not** hardware objects — they are byte-rectangle images blitted onto the screen with background save/restore for flicker-free movement.

Fields: `Visible: boolean`, `SpriteType: byte` (1=plain bitmap, 2=masked), `Data: pointer` (mask+image bytes), `Background: pointer` (buffer to save what's under the sprite), `Position/LastPosition: integer` (raw screen byte address), `RedrawIsRequired: boolean`, `Width: byte` (bytes), `Height: byte` (pixels/rows), `Size: integer` (Width*Height), `X/Y: byte` (byte-grid coords), `LastX/LastY: byte`, `ToNextRow: byte` (=SCREEN_WIDTH-Width, precomputed stride), `AnimSet: pointer`, `AnimType/AnimPhaseCount/AnimPhaseNr/AnimDelayValue/AnimDelay: byte`, and 3 free-use bytes `State/Direction/Timer/Counter`.

| Method | Description |
|---|---|
| `procedure Init(ImagePtr: global pointer; X, Y: global byte; GetBackgroundBuffer: global boolean)` | Initializes a sprite from a resource blob (byte layout: `[SpriteType][Width][Height][mask+image data...]`), computes size/stride, sets position, registers it in the global sprite list, and (if `GetBackgroundBuffer`) allocates a background-save buffer from the bump allocator. |
| `procedure FastDraw` | Draws a masked sprite using the Z80 stack pointer (`SP`) as a fast data-streaming register (interrupts disabled during the blit) while saving the overwritten background — fastest draw path. |
| `procedure Draw` | Draws a masked sprite (AND mask, OR image) without touching `SP`/interrupts — safer but slower than `FastDraw`; also saves background. |
| `procedure RestoreBackground` | Copies the previously saved background buffer back over the sprite's last screen position (erases the sprite). |
| `procedure SaveBackground` | Copies current screen content under the sprite into its background buffer and updates `LastPosition/LastX/LastY` (used standalone, e.g. by `Put`-based workflows). |
| `procedure Put` | Blits the sprite image directly (overwrite, no mask, no background save) — for opaque/non-restoring placement. |
| `procedure CopyToScreen` | Copies only the minimal "dirty" rectangle spanning the sprite's old and new position from the back screen to the live screen (used with `UseBackScreen` double buffering to minimize the copy). |
| `procedure SetPosition()` | Recomputes `Position` (raw screen address) from `X`/`Y` and marks `RedrawIsRequired`. |
| `procedure UpdateLastPos` | Manually syncs `LastPosition/LastX/LastY` to current values (for custom copy workflows). |
| `procedure MoveLeft() / MoveRight()` | Shifts sprite one byte-column left/right (fast pointer +/-1, updates X). |
| `procedure MoveUp() / MoveDown()` | Shifts sprite one row up/down (fast pointer +/- SCREEN_WIDTH, updates Y). |
| `procedure MoveUpBy2() / MoveDownBy2()` | Shifts by 2 rows. |
| `procedure MoveUpBy4() / MoveDownBy4()` | Shifts by 4 rows (optimized: only touches the position high byte since 4*64=256). |
| `procedure InitAnimation(AnimPhaseCount, AnimDelay: global byte)` | Configures a sprite-sheet animation: treats `Data` as the first of `AnimPhaseCount` equal-sized frames laid out consecutively in memory. |
| `procedure Animation()` | Advances to the next animation frame every `AnimDelay` calls, looping back to the first frame at the end. |

### `Image` class (static, non-restoring images)
Simpler than `Sprite` — no mask, no background save/restore, no animation, just a positioned bitmap blit. Fields: `Bitmap: pointer`, `Position: integer`, `Width/Height: byte`, `Size: integer`, `X/Y: byte`, `ToNextRow: byte`.

| Method | Description |
|---|---|
| `procedure Init(ImagePtr: global pointer; Width, Height: global byte)` | Sets bitmap pointer/dimensions, precomputes size and row stride. |
| `procedure Put` | Blits the bitmap directly to the screen at `X`/`Y` (overwrite, opaque). |

### Sprite-list bulk operations
| Signature | Description |
|---|---|
| `procedure SetMemory(Mode: global byte)` | Same memory-bank switch as TVC.tru's, GE-local constants. |
| `procedure Init(UseBackScreen: global boolean)` | Initializes the engine: choose direct-to-screen (`DIRECT_TO_SCREEN`) or double-buffered (`USE_BACK_SCREEN`, needs 64K) rendering. |
| `procedure RenderAllSprites` | Full frame update: restores every sprite's background, then redraws all sprites and re-saves backgrounds — the standard "move everything, redraw everything" per-frame call. |
| `procedure CopyAllSpritesToScreen` | With back-screen mode: copies every sprite's dirty rectangle from the back screen to the live screen. |
| `procedure DrawAllSprites` | Draws all sprites without restoring backgrounds first (no erase). |
| `procedure PutAllSprites` | `Put`s all sprites (opaque, no mask/background). |
| `procedure CopyBackScreenToScreen` | Copies the entire back screen buffer to the live screen (full-frame flip). |
| `procedure CopyBackScreenRectToScreen(X, Y, Width, Height: global byte)` | Copies a specific byte-grid rectangle from back screen to live screen. |

### Screen / graphics (byte-grid, largely a GE-local mirror of TVC.tru's screen section, plus scrolling)
| Signature | Description |
|---|---|
| `procedure SetGraphics(Mode: global byte)` | Same as TVC.tru's `SetGraphicsMode`. |
| `function GetGraphics(): byte` | Same as TVC.tru's `GetGraphicsMode`. |
| `procedure SetPalette(Nr, Color: global byte)` | Same as TVC.tru's `SetPalette`. |
| `procedure SetBorder(Color: global byte)` | Same as TVC.tru's `SetBorder`. |
| `procedure WaitForSync()` | Same as TVC.tru's. |
| `procedure SetRasterInterruptPos(Nr: global byte)` | Same as TVC.tru's. |
| `procedure ScrollUp(UpdateSpritePos: global boolean)` | Hardware smooth-scroll the screen up one line via CRTC start-address register (direct-to-screen mode only); optionally shifts all sprite Y positions to compensate. |
| `procedure ScrollDown(UpdateSpritePos: global boolean)` | As above, scrolling down. |
| `procedure ClearScreen(Pattern: global byte)` | Fills the active screen (screen or back screen) with a byte pattern. |
| `procedure FillRect(X, Y, Width, Height, Pattern: global byte)` | Fills a byte-grid rectangle with a pattern byte (direct memory write, no firmware). |
| `procedure VBytesLine(Position: global integer; Count, Pattern: global byte)` | Draws a vertical run of `Count` bytes of `Pattern` starting at a raw screen address. |
| `procedure HBytesLine(Position: global integer; Count, Pattern: global byte)` | Draws a horizontal run of `Count` bytes of `Pattern` starting at a raw screen address. |

### Keyboard / joystick (GE-local matrix reader, requires explicit scan call)
| Signature | Description |
|---|---|
| `procedure GetKeyboard` | Scans and caches the 10-row keyboard matrix into `KEYBOARD_0..7`/`JOY1_STATE`/`JOY2_STATE`; must precede the `*Pressed` functions below. |
| `function KeyPressed(): boolean` | Any key held, per cached matrix. |
| `function SpacePressed(): boolean` | Space held. |
| `function ReturnPressed(): boolean` | Return held. |
| `function EscPressed(): boolean` | Esc held. |
| `function CtrlPressed(): boolean` | Ctrl held. |
| `function ShiftPressed(): boolean` | Shift held. |
| `procedure GetJoysticks` | Scans just the 2 joystick matrix rows (lighter than full `GetKeyboard` if only joystick input is needed). |
| `function Joystick(Nr, JoyCode: global byte): boolean` | Tests a `JOY_*` bitmask against joystick 1 or 2's cached state. |

### Sound (identical behavior to TVC.tru's sound section, GE-local)
| Signature | Description |
|---|---|
| `procedure Volume(SoundVolume: global byte)` | Set volume 0-15. |
| `procedure SoundOn()` | Re-enable sound sign. |
| `procedure SoundOff()` | Disable/silence. |
| `procedure Sound(Pitch: global integer)` | Play continuous tone. |
| `procedure NoSound()` | Stop tone. |

### Text
| Signature | Description |
|---|---|
| `procedure WriteText(X, Y: global byte; Text: global ^byte)` | Renders a 0-terminated string using a custom bitmap font image (`CharSetPtr`, ASCII 32-90 only, image laid out as one strip), blitted directly to screen bytes — bypasses the firmware character generator entirely for speed. |

### Helpers / misc (duplicates of TVC.tru's helpers, GE-namespaced)
| Signature | Description |
|---|---|
| `function In(Nr: global byte): byte` | Raw port read. |
| `procedure Out(Nr, Value: global byte)` | Raw port write. |
| `function Rnd(): byte` | Pseudo-random byte from Z80 R register. |
| `procedure Delay(DelayTicks: global integer)` | Busy-wait N raster syncs. |
| `function Odd(Nr: global byte): boolean` | Odd/even test. |
| `procedure IntToStr(IntNum: global integer)` | Integer to decimal string in `NumStr`. |
| `procedure ByteToStr(Nr: global byte)` | Byte to decimal string in `NumStr`. |
| `procedure FillMem(MemAddr: global integer; Size: global integer; Pattern: global byte)` | Generic memory fill (not screen-specific). |
| `procedure MemCopy(SourcePtr, DestPtr: global pointer; Size: global integer)` | Raw block copy, same as TVC.tru's. |
| `procedure ZX7Decompress(SourcePtr, DestPtr: global pointer)` | Decompresses ZX7-compressed asset data (e.g. `incbin("....zx7")` resources) to a destination address — used to keep compiled asset size down for images/sprites shipped as compressed blobs. |

---

## 4. `system.tru` — low-level system/firmware control (191 lines)

**Purpose**: Small unit for taking direct control of the machine away from (or back to) the stock firmware — interrupt handler management, ROM banking, register push/pop helpers for interrupt code. Used when a program (typically `music.tru`, or a game with a custom IRQ) needs the CPU without firmware interference.

| Signature | Description |
|---|---|
| `procedure SaveFirmware()` | Saves the current ($38) interrupt-vector target into `firmware` so it can be restored later. |
| `procedure DisableFirmware()` | Replaces the interrupt handler at $38 with a bare `EI:RET`, effectively neutering the firmware's per-tick housekeeping (keyboard scan, cursor blink, etc.) while still allowing interrupts to occur. |
| `procedure EnableFirmware()` | Restores the firmware interrupt handler saved by `SaveFirmware` (jump-vector at $38). No-op if already enabled. |
| `procedure RequireFirmware()` | Ensures firmware interrupt handling is on, remembering prior state in `firmware_oldstate` for later restoration. |
| `procedure RestoreFirmwareState()` | Restores whichever state (`enabled`/`disabled`) was in effect before the last `RequireFirmware()` call. |
| `procedure PushAll() inline` | Pushes both register sets (AF/BC/DE/HL/IX/IY, primary and shadow via `exx`) onto the stack — for use at the top of a custom interrupt handler. |
| `procedure PopAll() inline` | Inverse of `PushAll`, restores both register sets. |
| `procedure EnableInterrupts() inline` | `ei`. |
| `procedure DisableInterrupts() inline` | `di`. |
| `procedure EnableRom()` | Maps both lower ($0000-$3FFF) and upper ($C000-$FFFF) ROM banks in, via firmware calls. |
| `procedure DisableRom()` | Unmaps both ROM banks (opposite of `EnableRom`). |
| `procedure EnableLRom()` | Maps only the lower ROM bank in. Note: name is misleading — this actually *enables* (docstring calls it "Disables" but the call is to the enable routine at $B906, matching `EnableRom`'s first call). |
| `procedure DisableLRom()` | Unmaps the lower ROM bank. |
| `procedure VSync()` | Waits for one vertical sync using `ei;nop;halt;di` (brief interrupt-window wait pattern, distinct from `TVC.tru`'s plain `halt`). |

Also declares raw `firmware: integer` (the saved vector), `firmware_enabled`/`firmware_oldstate: byte` flags, and generic `src, dst: pointer; len: integer` scratch vars (imports the `memory` unit).

---

## 5. `text.tru` — TVC ROM text/VDU (Video Display Unit) wrapper (299 lines)

**Purpose**: A closer-to-firmware, closer-to-Amstrad/CPC-style text VDU API (this unit's comments read like a port of an existing CPC firmware-call convention, using `#bbXX` ROM entry points) — cursor, windows/streams, pen/paper colors, user-defined characters. Distinct from `TVC.tru`'s text section, which is more TVC-idiomatic; `text.tru` looks like an alternate/lower-level text API, possibly for closer BASIC-firmware parity.

| Signature | Description |
|---|---|
| `procedure Reset(c: global byte)` | Resets the text VDU: partial reset (indirections + control table) if `c=0`, full reset (+ stream 0, colors, cursor home) otherwise. |
| `procedure Enable(c: global byte)` | Enables/disables character output to the current stream. |
| `procedure PutChar(c: global byte)` | Prints one char at the cursor; control codes are obeyed (not printed literally). |
| `procedure PutControlChar(c: global byte)` | Prints one char; control codes are printed literally instead of being obeyed. |
| `function GetChar(): byte` | Reads the character currently at the cursor position. |
| `procedure Print(p: global pointer)` | Prints a 0-terminated string, control chars obeyed. |
| `procedure PrintControl(p: global pointer)` | Prints a 0-terminated string, control chars printed literally. |
| `procedure EnableCursor(c: global byte)` | Shows (`c=1`) or hides (else) the text cursor. |
| `procedure MoveCursorTo(x, y: global byte)` | Moves the cursor to a character position. |
| `function GetPen(): byte` | Returns current foreground (ink) color. |
| `procedure SetPen(c: global byte)` | Sets foreground color. |
| `function GetPaper(): byte` | Returns current background color. |
| `procedure SetPaper(c: global byte)` | Sets background color. |
| `procedure SwapPenPaper()` | Swaps foreground/background colors. |
| `procedure SetTransparent(c: global byte)` | Sets background to opaque (0) or transparent (nonzero). |
| `function GetTransparent(): byte` | Returns whether background is transparent. |
| `procedure EnableUserDefinedChar()` | Internal: allocates a 2KB user-defined-character bitmap table and registers it with the firmware; called automatically as needed. |
| `procedure SetCharMatrix(c: global byte; p: global pointer)` | Redefines the 8x8 bitmap for character `c` from an 8-byte array (1 byte/pixel-row); auto-enables user-defined chars if `c < 240`. |
| `procedure SelectWindow(c: global byte)` | Selects the active text window/stream (0-7). |
| `procedure SetWindow(x, y, x2, y2: global byte)` | Sets the current window's rectangle bounds (x:0-79, y:0-24). |
| `procedure ClearWindow()` | Fills the current window with the paper color. |

---

## 6. `music.tru` — 3-channel software music player (666 lines)

**Purpose**: A complete, self-contained interrupt-driven music playback engine ("Fast&Force" 3-channel player, 2024). Installs its own high-frequency timer interrupt (~8491Hz or ~5008Hz) that both mixes 3 software oscillator channels into the single hardware sound-volume port on every tick, and — every 6th tick — parses one "frame" of a custom binary music format to update per-channel frequency/volume/ADSR-release state. This is a much heavier, more specialized unit than `TVC.tru`'s simple `Sound`/`SoundEx` calls, aimed at chiptune-style background music (e.g. converted from SID dumps, per the `SidDumpTVCGUI` credit in the header).

### Public API
| Signature | Description |
|---|---|
| `procedure Init(interrupt_freq: global byte)` | Prepares the frequency lookup table (`freqTable_8491` or `freqTable_5008`, note-index → phase-accumulator increment) for the chosen tick rate; does not itself start playback or install the interrupt. Accepts only `$E9` (8491Hz) or `$D9` (5008Hz). |
| `procedure Play(data_pointer: global pointer; bpm: global integer; graphics_mode: global byte)` | Installs the custom interrupt handler at $38 (replacing firmware), disables the CRTC cursor interrupt, and starts streaming/mixing the 3-channel music data pointed to by `data_pointer` at the given tempo (`bpm`, 60-6000) and current `graphics_mode` (needed because the volume port's usable bit-width depends on mode). Uses shadow registers, IX, IY, and briefly the stack pointer inside the ISR — caller must not rely on those across playback. |
| `procedure Stop()` | Restores the CRTC cursor interrupt and a stock-ish interrupt entry stub, silences the sound port, and sets the "finished" flag. Must be called once playback naturally finishes (see `IsMusicFinished`) or to abort early. |
| `function IsMusicFinished(): byte` | Returns `music_finished_flag`: 0 while playing, 255 once the data stream hits its `FINISH` marker (sound is muted but the custom interrupt is still installed — `Stop()` must still be called to hand control back). |

### Constants (music data format / hardware)
- Tick rates: `INTERRUPT_FREQ_8491`=$E9, `INTERRUPT_FREQ_5008`=$D9; matching tempo bases `BPM_SID_8491`=500, `BPM_SID_5008`=884
- Graphics-mode passthrough constants: `GRAPHICS_MODE_2/4/16` (0/1/2) — must match whatever `TVC::SetGraphicsMode`/`GE::SetGraphics` set, since it affects the volume-port bit mask used by the mixer
- Hardware ports: `SOUND_LO_PORT`(4), `SOUND_HI_PORT`(5), `SOUND_VOLUME_PORT`(6), `IT_ACK_PORT`(7), `CRTC_REG_PORT`($70), `CRTC_DATA_PORT`($71)
- Per-record control-byte values used in the compiled music data stream: `MUTE`(86)=silence this channel, `FINISH`(253)=end of track, `SKIP`(254)=hold previous note on this channel, `LOOP`(255)=restart track, `FRQINC00..FRQINC0F`(87-102)/`FRQDEC00..FRQDEC0F`(103-118)=relative pitch bend up/down in 16 steps, `ADSR00..ADSR0F`(119-134)=16 preset volume-release rates (roughly 7ms to 24000ms, see `CHECK_RELEASE_CONTROL` table in the ISR)
- `MAX_VOLUME`=20 (per-channel mix ceiling, note: different scale than TVC.tru's 0-15), `DURATION_IRQ_CONST`=6 (ticks per music frame), `BPM_DIVIDER`=14153 (used to convert a 60-6000 BPM value into the internal per-frame tick divisor)

### Data format notes (inferred from the ISR)
The music data pointed to by `data_pointer` is a flat byte stream of one control-byte per channel (3 bytes per "row": channel 1, channel 2, channel 3), interpreted every 6th interrupt tick. Each byte is either a note index (looked up in the relocated frequency table to get a 16-bit phase-accumulator increment), or one of the control codes above (mute/skip/pitch-bend/ADSR-release/loop/finish). This is a compact, ad-hoc tracker format, not a standard file format — any authoring tooling for it lives outside this unit (likely the referenced `SidDumpTVCGUI` converter).

---

## 7. `crtc.tru` — CRTC (video timing chip) register wrapper (161 lines)

**Purpose**: Intended as a direct wrapper around the CRTC (the chip that also handles the video mode/palette/border hardware, addressed via ports $70/$71 register-select/data or the dedicated mode/border/palette ports). In its current state in this build, **most of the procedures are stubs (empty bodies)** — only a few are actually implemented. Likely superseded in practice by the equivalent, fully-implemented functions in `TVC.tru`/`GE.tru`.

### Constants
- `sys_graph_mode`=$0B13, `graphics_mode_port`=6 (address type)
- `mode_16_color`=2, `mode_4_color`=1, `mode_2_color`=0
- Palette values: `black`=$00, `dark_blue`=$1, `dark_red`=$4, `dark_magenta`=$5, `dark_green`=$10, `dark_cyan`=$11, `dark_yellow`=$14, `gray`=$15, `blue`=$41, `red`=$44, `magenta`=$45, `green`=$50, `cyan`=$51, `yellow`=$54, `white`=$55
- `ytab: array[240] of integer = BuildTable("i*64")` — a compile-time-generated lookup table mapping screen row → byte offset (row*64), presumably meant for fast row-address calculation (TRSE's `BuildTable` is a unit-generation directive)

| Signature | Status | Description |
|---|---|---|
| `procedure EnableVRAM() inline` | **Implemented** | Pages video RAM in at $8000 (writes $50 to the memory-mapping port/mirror), without the save/restore of the current mapping that `TVC.tru` does — caller's responsibility. |
| `procedure WaitForSync()` | **Stub (empty)** | Presumably meant to wait for vblank; body is empty in this file. |
| `procedure WaitForHSync()` | **Stub (empty)** | Presumably meant to wait for hblank. |
| `procedure SetMode(ga: global byte)` | **Implemented** | Sets the CRTC graphics resolution/color-depth mode (2=128x240/16-color, 1=256x240/4-color, 0=512x240/2-color) by masking bits 0-1 of the graphics-mode system variable and sending to the mode port. |
| `procedure Synchronize()` | **Stub (empty)** | Presumably meant to sync timing to VSYNC. |
| `procedure SetInk(ga, gb: global byte)` | **Stub (empty)** | Documented as "set ink to a given color (ink 0-15, color 0-31)" but body is empty. |
| `procedure SetPalette(ga, gb: global byte)` | **Implemented** | Sets one of 16 palette slots via hardware port ($60+ga) = gb, using the generic `Memory::Out` helper. |
| `procedure SetBorder(ga: global byte)` | **Implemented** | Sets border color via firmware call ($BC38). |
| `procedure SetWidth256()` | **Stub (empty)** | Documented as a "screen width hack" to 256 bytes; unimplemented. |
| `procedure InitDefault(ga: global byte)` | **Stub (empty)** | Presumably meant to set up a default CRTC configuration. |

---

## 8. Global (cross-platform) units also usable when targeting TVC

Located under `/home/dey/trse/units/global/`. These are platform-independent TRSE library units (mostly pure Pascal-level logic, not TVC-specific asm), so they're summarized rather than fully cataloged — they'd be documented separately/generically in a TRSE skill rather than as TVC hardware reference.

- **`global/gfx/`** — generic drawing/3D helpers:
  - `lib3d.tru` (`Lib3d` unit): a small 3D wireframe engine — `AllocateWireframe`, `LoadObject`, `RotateVertices`/`RotateVerticesOptimisedZ80`, `ProjectSimple`, `Ortho`, `RenderWireframe`/`RenderWireframeColor`, `RenderLineList`, `FillColors`, `FlipPointPointers`. Generic (not TVC-bound) vertex/face rendering pipeline; would need platform-specific pixel-plotting hooked in.
  - `linegeneric.tru` (`LineGeneric` unit): two generic Bresenham-style line-drawing implementations, `Line`/`Line2(x1,y1,x2,y2,color: global byte)`.
  - `genericlevels.tru` / `genericlevels2.tru` (`GenericLevels`/`GenericLevels2` units): tile-based level-format reader/renderer — `ReadHeader`, `RenderLevel`, `RenderLevelStrip`. Generic tilemap loading/rendering scaffolding, platform-agnostic data format.
- **`global/math/`**:
  - `matrix.tru` (`Matrix` unit): 3x3 matrix math for the 3D engine — `MatMul3`, `MatMulVec3`/`MatMulVec3Z80`, `Normalize3`, `Identity`, `RotateX/Y/Z`.
  - `vector.tru` (`Vector` unit): essentially empty/placeholder (4 lines).
- **`global/system/`**:
  - `str.tru` (`str` unit): string utilities — `strlen`, `reverse`, `itoa`/`itoh` (int-to-decimal/hex string), `ltoa`/`ltoh` (long variants), `strcat`, `substr`. General-purpose string conversion, complementary to TVC.tru/GE.tru's more limited `IntToStr`/`ByteToStr`.
  - `tables.tru` (`Tables` unit): essentially empty/placeholder (8 lines).
- **`global/unittests/`**: Not a runtime API at all — this is TRSE's own compiler/language regression test suite (`integer.tru`, `classes.tru`, `advanced_math.tru`, `muldiv.tru`, `ifthenelse.tru`, `bitop.tru`, `casts.tru`, `forloop.tru`, etc.), exercising language features (arithmetic, casts, control flow, classes) rather than providing TVC or general library functionality. Not relevant to an API reference for the skill, but worth knowing about since it lives alongside real library units and could otherwise be mistaken for one.

---

## 9. Notes for skill-authoring

- **Two parallel "standard libraries" exist** (`TVC.tru` vs `GE.tru`) with overlapping-but-independently-implemented screen/keyboard/sound/misc functions. A skill should probably document them as two entry points/profiles ("firmware-friendly general programs" vs "sprite-based games") rather than merging them, since mixing `TVC::` and `GE::` calls in one program is possible but their memory-mapping/state assumptions (e.g. `GraphMode`/`FillPattern` bookkeeping, keyboard-matrix source) aren't automatically synchronized.
- **`crtc.tru` is mostly dead/stub code** in this checkout — don't document its empty procedures as if they do something; flag them as unimplemented/superseded by TVC.tru or GE.tru equivalents.
- **`music.tru` and `system.tru`'s firmware-disable calls are mutually relevant**: `Music::Play` hijacks the interrupt vector the same way `System::DisableFirmware`/custom-IRQ code would, and both leave the machine in a state where `System::EnableFirmware`/`Music::Stop` must be called to hand control back cleanly — worth cross-referencing in the skill so users don't strand the machine with keyboard/cursor firmware disabled.
- **Coordinate systems differ by section within the same unit**: TVC.tru's `PutPixel`/`Line`/`Rectangle` use an abstract 1024x960 space (firmware-scaled per graphics mode), while `FillRect`/`VerticalBytes`/all of GE.tru's screen and sprite code use the native 64(byte)x240(row) byte grid. This distinction is a common source of confusion and deserves explicit callout in the reference doc.
