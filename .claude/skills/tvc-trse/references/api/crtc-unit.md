# `Crtc` unit reference

Source: `sources/tru-units/TVC/crtc.tru` (161 lines). Full raw catalog:
`sources/notes/notes_tru_units.md` §7.

**Mostly dead code in this build — read this before using it.** `crtc.tru` is
intended as a direct wrapper around the CRTC 6845 (see `references/hardware.md`'s CRTC
section), but **most of its procedures are empty stubs**. Only `EnableVRAM`,
`SetMode`, `SetPalette`, and `SetBorder` actually do anything; the rest compile and
can be called, but do nothing. In practice this unit is superseded by the equivalent,
fully-implemented functions in `TVC.tru`/`GE.tru` — **prefer those** for anything this
table marks as a stub. `@use "crtc"` still shows up in several of the bundled
tutorials (for its constants and the working `EnableVRAM`/`SetMode`/`SetPalette`/
`SetBorder` calls), so it's not dead weight to import, just don't rely on the
unimplemented procedures.

## Constants

| Group | Values |
|---|---|
| System addresses | `sys_graph_mode`=`$0B13`, `graphics_mode_port`=6 |
| Graphics modes | `mode_16_color`=2, `mode_4_color`=1, `mode_2_color`=0 |
| Palette | `black`=`$00`, `dark_blue`=`$1`, `dark_red`=`$4`, `dark_magenta`=`$5`, `dark_green`=`$10`, `dark_cyan`=`$11`, `dark_yellow`=`$14`, `gray`=`$15`, `blue`=`$41`, `red`=`$44`, `magenta`=`$45`, `green`=`$50`, `cyan`=`$51`, `yellow`=`$54`, `white`=`$55` |

Also declares `ytab: array[240] of integer = BuildTable("i*64")` — a compile-time
lookup table mapping screen row → byte offset (`row*64`), for fast row-address
calculation.

## Procedures

| Signature | Status | Description |
|---|---|---|
| `procedure EnableVRAM() inline` | **Implemented** | Pages video RAM in at `$8000` (writes `$50` to the memory-mapping port). Unlike `TVC.tru`'s screen procedures, does **not** save/restore the prior mapping — that's your responsibility if you call this directly. |
| `procedure SetMode(ga: byte)` | **Implemented** | Sets the graphics resolution/color-depth mode (2=Graphics 16, 1=Graphics 4, 0=Graphics 2) by masking bits 0-1 of the graphics-mode system variable and writing the mode port. |
| `procedure SetPalette(ga, gb: byte)` | **Implemented** | Sets one of the 16 palette slots via port `$60`+`ga` = `gb`. |
| `procedure SetBorder(ga: byte)` | **Implemented** | Sets border color via a firmware call. |
| `procedure WaitForSync()` | **Stub (empty)** | Presumably meant to wait for vblank. Use `TVC::WaitForSync`/`GE::WaitForSync` instead. |
| `procedure WaitForHSync()` | **Stub (empty)** | Presumably meant to wait for hblank. No working equivalent elsewhere in this skill's bundled units. |
| `procedure Synchronize()` | **Stub (empty)** | Presumably meant to sync timing to VSYNC. |
| `procedure SetInk(ga, gb: byte)` | **Stub (empty)** | Documented in-source as "set ink to a given color (ink 0-15, color 0-31)" but the body is empty. Use `TVC::SetColor` instead. |
| `procedure SetWidth256()` | **Stub (empty)** | Documented as a "screen width hack" to 256 bytes; unimplemented. |
| `procedure InitDefault(ga: byte)` | **Stub (empty)** | Presumably meant to set up a default CRTC configuration. |

If you need functionality one of the stubs implies (raster sync, ink/color, a default
CRTC init), reach for `TVC.tru`'s or `GE.tru`'s equivalents — both have real,
implemented versions of the sync/color/mode-setting behavior this unit only stubs out.
