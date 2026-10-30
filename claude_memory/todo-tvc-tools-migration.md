---
name: todo-tvc-tools-migration
description: OPEN (2026-10-30) - moving the shared HTML tools (!Toooools, Windows only) into git repo TVC_Tools at TVC_Kozos/tools; steps + status in TVC_Kozos/skills/TEENDO_TVC_Tools.md
metadata:
  type: project
---

Open task started on the Mac 2026-10-30: the shared tools (`C:\TVC\TRSE_Projects\!Toooools`: sprite16/sprite4/charset/
palya16/tilemap/dallam/image2tvc HTML editors + TVCTape.exe) go into the private repo `LaM3rzLG/TVC_Tools` (created, empty)
at `TVC_Kozos/tools` on both machines (root = both, `Win11/` = exe, `Mac/` = empty). The checklist with the exact commands
and the current status is `TVC_Kozos/skills/TEENDO_TVC_Tools.md` (in the TVC_Skills repo - `git pull` there first).

**Why:** the user cannot copy commands between the machines; the Windows-side Claude must run the Windows steps itself.
**How to apply:** when the user says "folytasd a TVC_Tools átállást" (or similar), open that file, do the next unchecked
step that belongs to the current machine, tick it, commit + push. Remove this memory when the file is deleted.
