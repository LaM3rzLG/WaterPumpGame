---
name: ep-claude-interface-mac-only
description: Claude can see/type/dump memory in the EP emulator ONLY on the Mac (../TVC_Kozos/mac/emu_mac/ep.sh); on the Windows PC this does not work
metadata:
  type: project
---
Since 2026-10-28 Claude can drive the EP128 emulator on the Mac: `bash ../TVC_Kozos/mac/emu_mac/ep.sh` kep / folyam /
mem / gepel / gomb, through a command file built into our patched ep128emu (details: skill tvc-emu-mac).

**Why:** the user pointed out explicitly that this only works on the Mac; the PC uses WinTVC/TMC20, which has no
such interface.

**How to apply:** on Windows never offer or try `ep.sh` / screenshots / memory dumps from the emulator - there the
user tests and reports. On the Mac use it freely (wait for boot + key press on the logo first). Related:
[[watergame-mac-migration]].
