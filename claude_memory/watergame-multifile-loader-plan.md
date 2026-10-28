---
name: watergame-multifile-loader-plan
description: PARKED (2026-10-03) plan to split WaterPumpGame into loader + title image + U3 data file + main code; user said "start with this later"
metadata:
  type: project
---

**Status: PARKED by the user on 2026-10-03 — "később ezzel kezdünk" (start the next big topic with this).** Do not lose it; bring it up when the user returns to bigger work.

**Why:** the single .cas is 52 471 bytes but only ~21.5 KB is program ($19EF..$6E0A); the rest is zero fill ($6E0A..$7FFF free 4.6 KB + $8000..$BFFF 16 KB video) plus U3 data ($C000..$E656, ~6 KB real data with gaps), because U3 `incbin`s force one contiguous block. Long, wasteful load.

**User's idea:** files = (1) loader, (2) title image (+ music while loading), (3) sprite/level/sound data -> U3, (4) main game code; loader shows image, loads data into U3, then starts the game. (User said "3 files" but listed 4.)

**My assessment given (agreed as the plan):**
- Good, standard TVC approach (Lemmings.cas does exactly this: tiny stub loads external files via ROM CAS_OPEN/CAS_BKIN).
- Gains: much shorter load, more main RAM (data out of program), title screen, later level packs without recompiling.
- Constraints: ROM file calls need SYS ROM + default paging $70 (do NOT page VID at $8000 during ROM calls — that broke the disk DOS before). ROM sits where U3 is ($C000) -> cannot load straight into U3: load into $8000..$BFFF (U2 RAM in default paging), then copy to U3 (and the title image into video RAM) with paging switched, interrupts off.
- Order: all data files first, main code last, then jump; `GE::Init` only after all loads (it disables the ROM IT). Loader must live where the main code won't overwrite it (e.g. above $7000 / in U2).
- Music during loading: probably OK from disk, risky from tape (timing); safe first step = silence or music only between loads.
- The previous blocker: WinTVC `.dsk` gave `LOAD"*"` System error 236 and file open was never verified (see CLAUDE.md 2026-09-20 nuke-loader entries; `resources\make_dsk.ps1`).

**Proposed first step:** proof of concept stub: load one data file to $8000, copy to U3, signal success (colour/text); test in WinTVC starting from the working Lemmings.dsk and on the user's real machine.

**Open questions I asked (unanswered):** target medium (real TVC with SD — which interface? disk? tape? or mainly WinTVC) and music format/player (GE digi or other).

**2026-10-05: confirmed as THE solution for real hardware (user: "loader-es móddal oldjuk meg", "többfájlos, később").** The single 52 KB .cas fails on the real machine with "No memory"; the interim WaterVAS variant was dropped. Still parked - start it only when the user says so.

**2026-10-03 late (superseded):** an interim single-file solution exists - `WaterVAS` (U3 data staged after the code, copied to U3 at start, .cas 30 KB; see [[tvc-memory-map-u3]]). It removes the padding problem but not the RAM limit (level data still in the program) and gives no title screen - the loader plan stays parked for those.

Related: [[tvc-memory-map-u3]], [[watergame-digi-sound]], [[watergame-status]]

**2026-10-05 evening - the loader is now the BLOCKER for new features (user: "A loader lesz a megoldás!").** Program code ends at `$7F38`; the limit is `$8000` (~200 bytes free). The user explicitly chose to WAIT for the loader instead of squeezing bytes or moving data piecemeal. Do not add features that need code space before it; do not re-offer the stop-gaps below unless asked.

Waiting for the loader (ready to drop in once there is room):
- **Mine explosion image** `resources\tvc_sprites\akna_vege.bin` (24x24 = 3x3 cells, masked format, 291 bytes): show it centred on the mine after its last phase, visible 1 s, THEN the area destruction. Full code plan (about 200 bytes, compiled in stages up to end `$8004`) is in project `CLAUDE.md`, entry "AKNA ROBBANÁS-KÉP ... ELHALASZTVA A LOADERIG".
- **Level maps out of the program**: proven to compile in `WaterPumpGame.ras.proba_u3terkep` (code end `$7AC8`, 1136 bytes gained): maps in `resources\palyak\terkepek.bin` (68 bytes per level, single-player levels first, then versus), `incbin` at `$EF00`, read BY ADDRESS with a tiny asm reader (`Terk_Alap + (level [+ PALYA_DB in versus]) * 68`). `array[..] of byte at $addr` for these crashed the TRSE compiler, so no arrays. Missing: the import script must emit the .bin and strip the inline arrays. With the loader, the maps (and all other level tables: prices, codes, flags) should live in the data file.
- Also wanted earlier and blocked by space: HISCORE, HOW TO USE rewrite (no line about the mine yet), win screen, more levels (editor allows 49 + 49).

Facts for the design: current single `.cas` = 52 471 bytes, block `$19EF..$E656`; real program about 26 KB; U3 data now: sounds `$C000` (explosion 2801), `$CB00` (mine 1101), `$D000` (tick); sprites `$D100..$DCxx` in 256-byte slots, mine `$DD00` (259), pump2 `$E000`, font `$E100` (1366), `Pause_Buf` `$E700..$EEFF` (runtime), free from `$EF00`. Moving data to U3 does NOT shorten the single file (it grows the contiguous block: the map experiment made the .cas 55 845 bytes) - only the multi-file loader fixes both the size and the RAM limit.

**2026-10-05 late - AGREED DESIGN, the starting point for the loader work (user: "ezt a konklúziót mentsd el, innen megyünk majd tovább").** The user proposed the structure Loader / title image / sprite+sound+map data into U3 / code; I confirmed it and added three constraints. Full write-up: TVC-TRSE skill `references\cookbook\multifile-loader-design.md`; Hungarian summary in project `CLAUDE.md` ("LOADER - ELFOGADOTT TERV").
- Four files in this order: loader (under 0.5 KB), title image (15 360 bytes raw video RAM), data (8-9 KB -> U3: sprites, sounds, font, level maps AND level tables), code (25-26 KB, last).
- Cannot load straight into U3 (ROM is mapped there during file calls): stage at `$8000` (U2 in default paging), then copy with interrupts off - data via paging `$B0`; the image via U3 to video RAM (`$B0`, then `$90`), image before data.
- Loader copies itself to the top of the `$8000..$BFFF` area first (the code file loads at `$19EF`, over the loader's own load address).
- Code last; `GE::Init` only after all loads.
- Total load time stays about the same (the image adds what the padding removal saves); the gains are program space, real-machine loading, swappable level data.
- There is NO title image yet; the user considers it the easy part. Decision still needed from the user: 4-colour (256x240) or 16-colour (128x240) image.
- **Open question I asked, UNANSWERED - ask it first when the work starts:** what will the game load from (WinTVC disk image, SD interface on the real machine - which one, or tape)? The file-open step has never worked in this project (own `.dsk` -> `LOAD"*"` error 236).
- First step: proof-of-concept loader without the game (one data file -> `$8000` -> U3, colour signal), in WinTVC and on the real machine.
**2026-10-22 - STEP 1 DONE (built, not yet tested by the user):** the game itself loads `SPRITES.BIN` (all U3 data: sounds, sprites, font; 9814 bytes) from disk at start (`Spr_Betolt`, before `GE::Init`, `$8000` buffer -> `$B0` paging copy to `$C000`); the U3 `incbin`s became `array[1] of byte at $addr`. `.cas` 52 KB -> 26 KB. Disk image via `resources\make_dsk.ps1` (copied from Befosas). Details in project CLAUDE.md. Next: level data into the file, separate loader program with title image.
**2026-10-22: user confirmed - SPRITES.BIN loading works from the disk image (WinTVC).** The $8000 staging buffer is safe with the disk DOS.
