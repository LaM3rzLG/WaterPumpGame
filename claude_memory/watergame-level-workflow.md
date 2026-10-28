---
name: watergame-level-workflow
description: How levels get from the map editor (terkep_szerkeszto.html v5) into WaterPumpGame.ras - bit-packed maps, level codes, versus block, which json is authoritative
metadata:
  type: project
---

**The editor never writes the .ras itself** (browser page). Workflow the user uses: design in `terkep_szerkeszto.html`, "Projekt letöltése (.json)" -> `waterpump_palyak.json` in the project folder -> **Claude replaces the blocks** in `WaterPumpGame.ras` (backup, build, check code end). The editor's "Másolás (.ras)" output can also be pasted 1:1.

**Authoritative project file since 2026-10-03: `waterpump_palyak.json`** (10 single/co-op + 4 versus levels). `waterpump_palyak_ras.json` was only a recovery (the browser localStorage had lost 9 levels once — rebuilt from the .ras); older `*_palyak.json` files are historical.

**Editor v5 (details in the TVC-Utils skill `references/other-tools.md`):** two level sets (button "Egy játékos / co-op" vs "Két játékos versus", each max 10), per level: name, `kod` + (1P set only) `kodCoop` (5 letters A-Z, all codes unique across everything, auto-generated), goal, co-op goal, prices, cash, income, meteor/virus/wall/bomb flags. JSON `{levels, levels2, set, cur}`.

**.ras blocks (replace exactly these line ranges):**
- 1P/co-op: from `/* PÁLYÁK:` to the `Palya_Bomba` line: `PALYA_DB`, `INDULO_PALYA`, `Terkepek : array[n*68]` (bit-packed: cell i = x-1+(y-1)*30 -> byte palya*68+i/8, bit 7-(i mod 8), MSB first; 1 = Talaj3 blocked, 0 = Talaj1), `Palya_Kod`, `Palya_KodCoop`, `Palya_Cel`, `Palya_CelCoop`, `Palya_*`.
- Versus: from `/* KÉT JÁTÉKOS PÁLYÁK` to the `Palya2_Bomba` line: `PALYA2_DB`, `Terkepek2 : array[n*68]` (same packing), `Palya2_Kod`, `Palya2_*`.
- How Claude does it reliably: load the json into the editor headless (Edge `--dump-dom`, `window.__waterpump.load(obj)`, `.rasText()` / `.rasText2()`), splice the output into the .ras (PowerShell, UTF-8 no BOM, LF), compile. `MapReset` unpacks the bits into `Map`.

**Display:** level numbers are shown from 01 in every mode (versus "20.." is editor-internal only).

**Why:** user prefers handing over the json; codes must stay stable between editor and game. **How to apply:** before importing, compare the json with the current .ras (codes/values/maps) and report differences; never let a stale json overwrite newer .ras values silently. Related: [[tvc-memory-map-u3]], [[watergame-status]].

UPDATE 2026-10-03 (afternoon): import is scripted - `resources\palyak_import.ps1` (headless Edge loads `terkep_szerkeszto.html` + `waterpump_palyak.json`, takes `rasText()`/`rasText2()`, prints value/map differences, replaces both blocks, compiles; refuses to write on empty output or missing block markers; it uses accent-free regexes `P.LY.K` / `K.T J.T.KOS P.LY.K`; the backup name inside is fixed - adjust it). New per-level fields: `meteorTor`, `meteorVir` -> `Palya_MeteorTor/Vir` (after `Palya_Meteor`, inside the block), `Palya_Nev`/`Palya2_Nev` (19 bytes each, unused by the game). Editor limits: 49 levels per set, versus tabs numbered from 50; versus has no level code field (hidden); code uniqueness only within the single/co-op set. Report differences to the user after each import.

**2026-10-22 - NEW WORKFLOW (level data is a file now):** level tables live in `PALYAK.BIN` (U3 `$EF00`), loaded at start. The `.ras` level block is GENERATED (only consts + `array .. at $addr`). Import: `powershell -File resources\palyak_import.ps1` (json -> headless editor -> `resources\palyak\palyak_adat.txt` -> `resources\palyak_bin.ps1` -> build -> `make_dsk.ps1`). Do not paste editor output into the `.ras` any more.
