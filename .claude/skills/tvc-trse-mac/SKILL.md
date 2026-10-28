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
- NOT in the repo: the 674 MB manual PDFs (Mac: `~/Documents/TVC-TRSE-skill/sources/docs/pdf/` -
  the only copy on the Mac; Windows: `%USERPROFILE%\Documents\TVC-TRSE-skill\...`),
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
- Units: **the repo's `tvc_units/` is authoritative** (pushed from the Windows nightly
  `units\TVC` on 2026-10-28: TVC.tru with all `//` -> `;` in asm, the user's GE.tru, crtc,
  music, system, text). `build_mac.sh` copies them into `/Applications/trse.app/units/TVC/`
  before compiling when they differ. Verified: with them the Mac build equals the Windows build.
  (OrgAsm does not strip `//` comments inside `asm("...")`; the Windows GE.tru still has 10 such
  lines but in code that is not compiled into the game.) Older Mac copies:
  `~/Documents/trse_units_TVC_eredeti_mac/` (USB package), `~/Documents/trse_units_TVC_mac_javitott/`.
- `LG_TVC_Projects.trse` has a Windows `project_path`; the CLI ignores it (full paths given).
- macOS file system is case-insensitive by default, so the Linux `@use` case trap does not apply.

## Build chain

- **Mac: `bash resources/build_mac.sh`** (`--no-emu` = without emulator) = TRSE CLI compile ->
  `pwsh resources/u3_boot_patch.ps1` -> `pwsh resources/make_dsk.ps1` (boot sector template:
  `~/Downloads/TVC/TVC_CEmu/roms/Lemmings.dsk`, byte-identical boot sector to the Windows one;
  override with `TVC_DSK_TEMPLATE`) -> kills the old ep128emu (`-9`, SIGTERM hangs) and starts
  `~/Documents/EP128TVCEmu/ep128emu.app` with the new `.dsk` via `open -n ... --args` (same args as
  `TVC_inditas.command`). NOT `nohup ... &`: the VS Code task kills its whole process tree when it
  ends, so the emulator died silently (2026-10-28).
- VS Code (`.vscode/tasks.json`): tasks "Mac: Build + EP emu" and "Mac: Build (emulator nelkul)";
  the SANE task stays the default build for Windows. On the Mac `cmd+shift+b` is bound to
  "Mac: Build + EP emu" in the USER keybindings.json (keybindings sync per platform).
  The workspace `.vscode/settings.json` (`sane-trse.compilerPath`) is Windows-only - leave it.
- Windows: `resources\build.ps1` (same steps with the nightly), unchanged.
- PowerShell 7: `brew install powershell` (formula, not the cask) -> `pwsh`.
- After changing a unit on Windows: copy it into `tvc_units/` there, commit + push.
- Do not commit the build outputs from the Mac unless asked (`.asm/.bin/.dsk/.sym` are tracked
  and also committed from Windows -> conflicts); `git checkout --` them after a test build.
- `resources/*.ps1` are SHARED by both machines (2026-10-28): each loads `resources/kozos.ps1`
  (`$Gyoker`, `$Mac`, `$Temp`, `$PsExe`, `Ut 'rel/path'`, machine paths `$TrseExe`/`$DskSablon`/`$Bongeszo`,
  optional override `resources/gep_beallitas.ps1` (gitignored), own BMP reader/writer instead of
  `System.Drawing`). Must stay Windows PowerShell 5.1 compatible (ASCII only in BOM-less files, no
  `??`/ternary). Verified on the Mac, byte-identical output: make_sprites_bin, palyak_bin, make_szabaly_bin,
  make_menu16_bin, nuke_build/nukebomb_to_bin, bmp_to_talaj, charset_import/export (PNG preview only on
  Windows), palyak_import (headless Chrome, then build_mac.sh --no-emu), make_dsk (default template = `$DskSablon`).
  NOT yet ported: `memoria_terkep.ps1` (planned later, together with EP emulator work); `build.ps1`
  stays Windows-only (merging the builds: postponed). Obsolete, untouched: `watervas_build.ps1`.
  Pitfalls found: `"$dir\x"` + `[IO.File]` makes a file literally named `dir\x` on the Mac (Join-Path
  normalizes, string concat does not); `[Uri]'/abs/path'` is relative on Unix (empty AbsoluteUri);
  `-ArgumentList a,(expr).Prop` drops the argument - use a variable; a script called with `&` in-process
  does not set `$LASTEXITCODE` -> call sub-scripts with `& $PsExe -NoProfile -File`.
- The HTML tools in `tools/` run in any browser.

## Testing

- The `.dsk` in the repo is built on Windows. Run it in ep128emu (tvc-emu-mac):
  `ext2`, `load"WATERPG"`. Quick-loading the `.cas` has no file device - always test from disk.
- Real machine: 64K TVC with an SD reader; the user copies the unpacked `.dsk` files to the
  USB stick (`WP` folder). Bugs seen only on the real machine (2026-10-28 report: diagonal
  pattern in the 16-colour menu picture, wrong level layout) - check whether they still
  happen with the current build before analysing; the emulators zero RAM at start.

## Open items (Mac)

1. Port `memoria_terkep.ps1` + the `/memoria` command to both machines (after the EP emulator work).
