---
name: watergame-confirmed-2026-10-05
description: What the user confirmed working on machine on 2026-10-05, what is still in progress, and the decisions made (real hardware -> multi-file loader later, lever pump rejected, pump files renamed)
metadata:
  type: project
---

On 2026-10-05 the user answered an itemised checklist. This supersedes the "not confirmed on machine" notes in [[watergame-status]] for the items below.

**Confirmed working (user tested):** pump bottom (8th) row on the map; P1 blue / P2 green pump in all modes; new pump animations; level import of 10-03 14:32 (level 5 map + meteor breaks rock, levels 6-7 meteor brings virus); joystick icon menu (disabled wall/bomb hidden, icons packed); P2 = joystick 2 + fire; unified HUD in all three modes; main menu with pump pointer; LEVEL CODE (auto-check after 5th letter); versus level select with mini-map; pause (P) and exit (ESC/Q); "METEOR:nn" countdown + blinking "METEOR !"; meteor rock-breaking / virus-seeding incl. virus-free levels; versus win rule; digi sounds (explosion, tick).

**Still in progress (user: "még dolgozunk rajta"):** the LEVEL COMPLETED box (frame, green NEXT CODE) - not final.

**Decisions:**
- Real hardware: the 52 KB .cas failed with a "No memory" error. The WaterVAS approach (data staged in U2, copied to U3) is DROPPED by the user; the fix will be the multi-file loader, LATER ([[watergame-multifile-loader-plan]]). Leave `WaterVAS.*` / `watervas_build.ps1` alone (stale, does not compile) unless asked.
- The lever-style pump (`images\New_Pump`, `Pumpa3.bin`) is rejected for good.
- Pump files renamed so names are straight: `Pumpa.bin` = P1 = blue <- `Pump1..8.bmp`; `Pumpa2.bin` = P2 = green <- `Pump1b..8b.bmp` (both .bin and BMP names were swapped; older `Pumpa.bin.bak_*` follow the old naming).

**How to apply:** don't re-ask about the confirmed items; treat the LEVEL COMPLETED box as open; don't propose WaterVAS or the lever pump again.
