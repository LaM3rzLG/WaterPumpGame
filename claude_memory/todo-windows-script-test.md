---
name: todo-windows-script-test
description: "OPEN TODO - the shared resources/*.ps1 scripts (kozos.ps1, 2026-10-28) are untested on Windows PowerShell 5.1; remind user when on the Windows machine"
metadata:
  node_type: memory
  type: project
  originSessionId: a8242841-819d-4ac7-b464-0263d873eaa8
  modified: 2026-10-28T19:59:54.452Z
---

2026-10-28: the resources/*.ps1 scripts were made shared for Mac + Windows (resources/kozos.ps1, commit 14a4ad5).
Verified only on the Mac (pwsh 7, byte-identical outputs). NOT run on Windows PowerShell 5.1 yet.

**Why:** the user was on the Mac and could not test on Windows; 5.1 differences (encoding, path handling) could break them.

**How to apply:** when a session runs on the Windows machine, remind the user to run in the project root:
1. `powershell -File resources\make_sprites_bin.ps1` -> `git status`: SPRITES.BIN and WaterPumpGame.ras must NOT change
2. `powershell -File resources\palyak_import.ps1` (headless Edge -> palyak_bin -> build.ps1) -> PALYAK.BIN, .ras unchanged, build OK, .dsk made
3. optional: `powershell -File resources\bmp_to_talaj.ps1 -In resources\images\talaj3.bmp -Out $env:TEMP\t3.bin` and compare with resources\tvc_sprites\talaj3.bin (`fc /b`)
4. optional: `powershell -File resources\charset_export.ps1 -Out $env:TEMP\cs.bmp` - the PNG preview must still be made on Windows
If something fails: fix in kozos.ps1 / the script, keep it 5.1 + pwsh 7 compatible (see [[watergame-mac-migration]]).
After success: delete this memory and its MEMORY.md line.
