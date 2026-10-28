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

Status 2026-10-28: the Mac is set up for **editing and emulator testing**. **Compiling on the
Mac is NOT working yet** (see "Open items"). The Windows machine is still the build machine.
Whatever is marked "not verified" below has not been seen working - say so, do not assume.

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

- App: `/Applications/trse.app` (release build; a second copy in `~/Downloads/trse/`).
  Binary: `/Applications/trse.app/Contents/MacOS/trse`.
- Units: `/Applications/trse.app/units/TVC/` - on 2026-10-23 `GE.tru`, `TVC.tru`, `crtc.tru`,
  `system.tru`, `text.tru` were byte-identical to the Windows ones (from the USB package).
  After a GE.tru change on Windows, copy it here (it is not in git).
- **Windows builds with the TRSE NIGHTLY** (`C:\TVC\TRSE_Nightly\trse.exe`, chosen in
  `.vscode\settings.json`); the Mac has a release build. The project uses nightly-only
  behaviour (see tvc-trse `trse-compiler.md` / CLAUDE.md) - a Mac nightly may be needed.
  Not verified.
- CLI (same syntax as Windows):
  `/Applications/trse.app/Contents/MacOS/trse -cli op=project project="$PWD/LG_TVC_Projects.trse" input_file="$PWD/WaterPumpGame.ras" assemble=yes`
  First attempt failed: **"Could not load TRSE settings! Please make sure you have started TRSE
  as a windowed application at least once"** - the user has to open TRSE once by hand.
  `LG_TVC_Projects.trse` has `project_path = C:/TVC/TRSE_Projects/WaterPumpGame/` - may need a
  Mac path (do not commit that change without asking: Windows uses the same file).
- macOS file system is case-insensitive by default, so the Linux `@use` case trap
  (tvc-trse) does not apply here.

## Build chain (Windows = `resources\build.ps1`)

`build.ps1` = TRSE nightly compile -> `u3_boot_patch.ps1` (splits the output into
`WaterPumpGame.cas` + `U3KOD.BIN`, must run after EVERY compile) -> `make_dsk.ps1`
(WATERPG.CAS, SPRITES.BIN, PALYAK_lemez.BIN as PALYAK.BIN, SZABALY.BIN, MENU16.BIN, U3KOD.BIN).

- PowerShell 7 is not installed on the Mac (`brew install powershell` -> `pwsh`).
- `build.ps1` hard-codes `C:\TVC\TRSE_Nightly\trse.exe`, `$env:TEMP` and calls
  `powershell` (Windows PowerShell) - needs a Mac branch.
- Use `System.Drawing` / Windows-only .NET (need porting or Windows): `bmp_to_talaj.ps1`,
  `charset_export.ps1`, `charset_import.ps1`, `nukebomb_to_bin.ps1`, `palyak_import.ps1`.
- The other scripts (`make_dsk`, `u3_boot_patch`, `make_*_bin`, `palyak_bin`,
  `memoria_terkep`, ...) look plain file/byte work - probably fine under `pwsh`, not verified.
- The HTML tools in `tools/` (sprite/charset/level editors, memory map) run in any browser.

## Testing

- The `.dsk` in the repo is built on Windows. Run it in ep128emu (tvc-emu-mac):
  `ext2`, `load"WATERPG"`. Quick-loading the `.cas` has no file device - always test from disk.
- Real machine: 64K TVC with an SD reader; the user copies the unpacked `.dsk` files to the
  USB stick (`WP` folder). Bugs seen only on the real machine (2026-10-28 report: diagonal
  pattern in the 16-colour menu picture, wrong level layout) - check whether they still
  happen with the current build before analysing; the emulators zero RAM at start.

## Open items (Mac)

1. User opens TRSE once in windowed mode -> retry the CLI build.
2. Decide: release vs nightly TRSE on the Mac.
3. `pwsh` + a Mac-capable `build.ps1` (or a `build.sh`) -> full build + `.dsk` on the Mac.
4. Port the `System.Drawing` scripts only when needed (or keep doing those on Windows).
