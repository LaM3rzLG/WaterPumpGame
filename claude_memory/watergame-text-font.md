---
name: watergame-text-font
description: "WaterPumpGame text output: own proportional renderer Ir() + font.bin replaced GE::WriteText; user rejected 4-px glyphs; charset editor html"
metadata:
  type: project
---

Since 2026-09-26 all text goes through `Ir(x, y, text)` (asm, before `ProgramInit`) instead of `GE::WriteText`: per glyph 1 or 2 bytes wide from `font.bin` (1 byte height + 91 widths for ASCII 32..122 + image 182 bytes wide), returns the next free column in `Ir_X`; `Ir_Hossza` (width), `Ir_Kozep` (centre), `HUD_Num2/3/4` digit by digit via `Ir_Jegy`. The HUD positions are chained (`Cash_X`, `Cash2_X`, `Pump_X`, `Lives_X`), so they follow the glyph widths. With the current font (all glyphs 2 bytes = the original Bery 8x7 set, lowercase = copies of uppercase) the screen is identical to before; saved ~1.4 KB.

The user tried to redraw glyphs 1 byte (4 px) wide and gave up: M/W/Q do not fit and small letters look ugly ("Nem szép"). Decision (option A): keep the renderer with 8-px glyphs; later maybe icons instead of words in the HUD. Don't push small fonts again.

Tools: `charset_szerkeszto.html` (91 glyphs, per-glyph narrow/wide toggle, height, proportional preview, font.bin/CharSetGR4.bin/.bmp import/export), `resources\charset_export.ps1` / `charset_import.ps1` (old 59-glyph format). Not tested on the real machine yet — fallback: `WaterPumpGame.ras.bak_font` (GE WriteText version).

**How to apply:** if text or HUD numbers look wrong after the next test, suspect `Ir`/`HUD_Num*` first; keep digits equal width. Related: [[watergame-status]].
