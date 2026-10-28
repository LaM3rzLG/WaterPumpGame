# `Text` unit reference

Source: `sources/tru-units/TVC/text.tru` (299 lines). Full raw catalog:
`sources/notes/notes_tru_units.md` §5.

**What it's for**: a lower-level, VDU-style text API (cursor, windows/streams,
pen/paper colors, user-defined characters) reading like a port of an existing
CPC-firmware calling convention (`#bbXX`-style ROM entry points in its own source
comments). **This is a different unit from `TVC.tru`'s text section** (`GotoXY`/
`Write`/`WriteAt`/`SetColor`/etc.) — the two aren't meant to be mixed; pick one text
API per program. `TVC.tru`'s text section is the more TVC-idiomatic default; reach for
`text.tru` specifically if you need its window/stream model (multiple independent text
regions with their own cursor/colors) or closer BASIC-firmware parity.

`@use "text"` to import. All calls use `Text::ProcName(...)` syntax.

| Signature | Description |
|---|---|
| `procedure Reset(c: byte)` | Resets the text VDU: partial reset (indirections + control table) if `c=0`, full reset (+ stream 0, colors, cursor home) otherwise. |
| `procedure Enable(c: byte)` | Enables/disables character output to the current stream. |
| `procedure PutChar(c: byte)` | Prints one char at the cursor; control codes are obeyed (not printed literally). |
| `procedure PutControlChar(c: byte)` | Prints one char; control codes print literally instead of being obeyed. |
| `function GetChar(): byte` | Reads the character currently at the cursor position. |
| `procedure Print(p: pointer)` | Prints a 0-terminated string, control chars obeyed. |
| `procedure PrintControl(p: pointer)` | Prints a 0-terminated string, control chars printed literally. |
| `procedure EnableCursor(c: byte)` | Shows (`c=1`) or hides (else) the text cursor. |
| `procedure MoveCursorTo(x, y: byte)` | Moves the cursor to a character position. |
| `function GetPen(): byte` | Returns the current foreground (ink) color. |
| `procedure SetPen(c: byte)` | Sets foreground color. |
| `function GetPaper(): byte` | Returns the current background color. |
| `procedure SetPaper(c: byte)` | Sets background color. |
| `procedure SwapPenPaper()` | Swaps foreground/background colors. |
| `procedure SetTransparent(c: byte)` | Sets background opaque (`0`) or transparent (nonzero). |
| `function GetTransparent(): byte` | Returns whether background is transparent. |
| `procedure EnableUserDefinedChar()` | Internal: allocates a 2KB user-defined-character bitmap table and registers it with the firmware. Called automatically as needed by `SetCharMatrix`. |
| `procedure SetCharMatrix(c: byte; p: pointer)` | Redefines the 8×8 bitmap for character `c` from an 8-byte array (1 byte/pixel-row). Auto-enables user-defined chars if `c < 240`. |
| `procedure SelectWindow(c: byte)` | Selects the active text window/stream (0-7). |
| `procedure SetWindow(x, y, x2, y2: byte)` | Sets the current window's rectangle bounds (x: 0-79, y: 0-24). |
| `procedure ClearWindow()` | Fills the current window with the paper color. |

The window/stream model (`SelectWindow`/`SetWindow`, up to 8 independent windows) has
no equivalent in `TVC.tru`'s simpler `GotoXY`-based text — reach for `text.tru` when a
program genuinely needs multiple independent scrolling text regions on screen at once.
