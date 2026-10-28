---
name: tvc-trse-mac
description: >
  MAC ONLY (not for the Windows machine). The macOS side of TVC/TRSE development for the
  WaterPumpGame project: where TRSE and the TVC/GE units live on the Mac, how to compile
  from the command line, what of the Windows build chain (PowerShell scripts, TRSE nightly,
  .dsk creation) works or still has to be ported, and how the two machines are kept in sync
  through the git repo. Load it on the Mac TOGETHER with tvc-trse whenever building,
  compiling, running build scripts or setting up tools; it overrides the Windows paths and
  commands in tvc-trse and in CLAUDE.md. Emulators on the Mac: tvc-emu-mac.
---

# TVC / TRSE development on the Mac

Status 2026-10-28 evening: **the full build works on the Mac** and gives the same result as
Windows (WaterPumpGame.bin before splitting and U3KOD.BIN byte-identical; the .dsk differs only
in the FAT file timestamps). VS Code: **Cmd+Shift+B = "Mac: Build + EP emu"**.

## Machines and sync

- Repo: `https://github.com/LaM3rzLG/WaterPumpGame.git` (HTTPS). Mac checkout:
  `~/Documents/TVC Projects/WaterPumpGame`; Windows: `C:\TVC\TRSE_Projects\WaterPumpGame`.
- **Before work: `git pull`; after work: commit + push** - otherwise the machines drift
  (on 2026-10-28 the Mac was 5 commits behind and an analysis was made on stale code).
- In the repo: `.claude/skills/` (tvc-trse, tvc-utils - shared; tvc-trse-mac, tvc-emu-mac -
  Mac only) and `claude_memory/` (the Claude project memory; on the Mac
  `~/.claude/projects/-Users-lgabor-Documents-TVC-Projects-WaterPumpGame/memory` is a
  symlink to it, on Windows a junction - see `claude_memory/README.md`).
- NOT in the repo: the TVC/GE units (`GE.tru` is the user's own!), the 674 MB manual PDFs,
  the emulators, `*.cas`.

## TRSE on the Mac

- App: `/Applications/trse.app` (release build from 2026-10-18; Windows uses the nightly - the
  output was still identical). Binary: `/Applications/trse.app/Contents/MacOS/trse`.
- **The Mac TRSE GUI crashes when it is closed with no project open** (`CIniFile::setStringList`
  in `MainWindow::saveCurrentProject`, SIGSEGV), so it never writes its own `trse.ini` and the
  CLI says "Could not load TRSE settings!". Fix: the CLI gets **`settings=resources/trse_mac.ini`**
  (the Windows nightly `trse.ini` minus `recent_projects`/`ok64_emulator`). Needed keys:
  `assembler_z80 = OrgAsm` (else "set up a link to the assembler (pasmo...)") and the rest of
  that file - with only a few keys `@use` fails with "After declarations, BEGIN is expected".
- Units: `/Applications/trse.app/units/TVC/` (outside git, `GE.tru` is the user's own).
  **OrgAsm does not strip `//` comments inside `asm("...")`** -> in `TVC.tru` (28 lines) and
  `GE.tru` (10 lines) they were replaced with `;` on 2026-10-28 (originals:
  `~/Documents/trse_units_TVC_eredeti_mac/`). Windows has the same fix in its nightly units.
  Not yet compared with the Windows nightly `units\TVC` - after a GE.tru change on Windows,
  copy it over and redo the `//` -> `;` fix inside asm blocks if needed.
- `LG_TVC_Projects.trse` has a Windows `project_path`; the CLI ignores it (full paths given).
- macOS file system is case-insensitive by default, so the Linux `@use` case trap does not apply.

## Build chain

- **Mac: `bash resources/build_mac.sh`** (`--no-emu` = without emulator) = TRSE CLI compile ->
  `pwsh resources/u3_boot_patch.ps1` -> `pwsh resources/make_dsk.ps1` (boot sector template:
  `~/Downloads/TVC/TVC_CEmu/roms/Lemmings.dsk`, byte-identical boot sector to the Windows one;
  override with `TVC_DSK_TEMPLATE`) -> kills the old ep128emu (`-9`, SIGTERM hangs) and starts
  `~/Documents/EP128TVCEmu/TVC_inditas.command` with the new `.dsk`.
- VS Code (`.vscode/tasks.json`): tasks "Mac: Build + EP emu" and "Mac: Build (emulator nelkul)";
  the SANE task stays the default build for Windows. On the Mac `cmd+shift+b` is bound to
  "Mac: Build + EP emu" in the USER keybindings.json (keybindings sync per platform).
  The workspace `.vscode/settings.json` (`sane-trse.compilerPath`) is Windows-only - leave it.
- Windows: `resources\build.ps1` (same steps with the nightly), unchanged.
- PowerShell 7: `brew install powershell` (formula, not the cask) -> `pwsh`.
- Do not commit the build outputs from the Mac unless asked (`.asm/.bin/.dsk/.sym` are tracked
  and also committed from Windows -> conflicts); `git checkout --` them after a test build.
- Still Windows-only (`System.Drawing`): `bmp_to_talaj.ps1`, `charset_export.ps1`,
  `charset_import.ps1`, `nukebomb_to_bin.ps1`, `palyak_import.ps1`. The other `make_*_bin`,
  `palyak_bin`, `memoria_terkep` scripts are plain byte work - probably fine under `pwsh`, not verified.
- The HTML tools in `tools/` run in any browser.

## Testing

- The `.dsk` in the repo is built on Windows. Run it in ep128emu (tvc-emu-mac):
  `ext2`, `load"WATERPG"`. Quick-loading the `.cas` has no file device - always test from disk.
- Real machine: 64K TVC with an SD reader; the user copies the unpacked `.dsk` files to the
  USB stick (`WP` folder). Bugs seen only on the real machine (2026-10-28 report: diagonal
  pattern in the 16-colour menu picture, wrong level layout) - check whether they still
  happen with the current build before analysing; the emulators zero RAM at start.

## Open items (Mac)

1. Compare `/Applications/trse.app/units/TVC/*.tru` with the Windows nightly `units\TVC`.
2. Port the `System.Drawing` scripts only when needed (or keep doing those on Windows).
