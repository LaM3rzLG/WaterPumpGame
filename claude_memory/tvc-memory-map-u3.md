---
name: tvc-memory-map-u3
description: "WaterPumpGame memory layout (2026-10-03): code < $8000 (now $7827), game runs permanently in MEM_48K_VID, sprite/sound/font data in U3 slots, save buffer at $E700, Map/ScreenAddrTab in GE's free low RAM"
metadata:
  type: project
---

Program loads at `org $19ef`; video RAM is `$8000-$BFFF`, so the CODE must end below `$8000` (check `EndBlock19ef` in `WaterPumpGame.sym` after each build; `$7827` on 2026-10-03 evening, ~2 KB free - about 20 more levels fit; 49+49 levels need the level data moved to U3).

**The game runs permanently in `GE::MEM_48K_VID` ($90 = U0,U1,VID,U3)**, set in `ProgramInit` right AFTER `GE::Init`. Never set $90 before `GE::Init`. Video RAM can be written directly at $8000 + y*64 + x (used by the pause/exit save routine, `Szinez`, the versus mini-map asm).

**U3 slots (incbin with fixed address, NO overlap check):** ExplosionSFX $C000, TickSFX $D000, Pumpa $D100, Talaj1/2/3 $D200/$D300/$D400, Keret $D500, Keret2 $D600, Enemy $D700, Fal $D800, Meteor $D900 (512), Bomba $DB00, BombaIkon $DC00, **$DD00 free** (old 2P map; exit icon was there briefly, removed), Pumpa2 $E000, font.bin $E100 (..$E656). **`Pause_Buf : array[2048] of byte at $E700`** = screen-area save buffer for pause/exit dialogs (not loaded data). Free above ~$EF00.

**Level maps are no longer in U3:** both 1P (`Terkepek`) and versus (`Terkepek2`) maps are bit-packed arrays in the .ras (68 bytes/level), `terkep2p.bin` is unused.

**Low RAM (filled only after GE::Init):** `Map : array[540] of byte at $0BF0` (free only while no ROM file I/O is used), `WaterPump::ScreenAddrTab : array[540] of integer at $0EAC`. GE sprite background buffers come from 256..2815 first.

**The .cas (52 471 bytes) is one contiguous block $19EF..$E656** — real program ~21.5 KB, then zero fill ($729A..$7FFF + 16 KB video) + U3 data. Fix = [[watergame-multifile-loader-plan]] (parked).

**Real machine (2026-10-03): the 52 KB .cas does not load on the user's real TVC.** Variant for hardware tests = `WaterVAS.ras`, GENERATED from `WaterPumpGame.ras` by `resources\watervas_build.ps1` (never hand-edit; rerun after every change of the main file or level import; it also builds). It packs all U3 data into `resources\vas_u3.bin` (5436 bytes, no slots: Pumpa $C000 ... Font $CFE6, end $D53B), `VAS_Blob : incbin(..., $7A00)` after the code, former incbins become `array[n] of byte at $addr`, and `ProgramInit` starts with `di`, paging `$B0` (U0,U1,U2,U3), `ldir $7A00->$C000`, restore `($3)`, `ei`. `.cas` = 30 173 bytes, contiguous `$19EF..$8F3B`, sound + all levels kept. Limits: 64K machine; code end (`$783F` in WaterVAS) must stay below `$7A00` (script param `-Blob`). **2026-10-05 DECISION: WaterVAS is DROPPED by the user (the 52 KB .cas died with "No memory" on the real machine; the multi-file loader will solve it later). Keep the paragraph below only as a record of the technique.** The WaterVAS build currently crashes the compiler (0xC0000005) after the `WaterPump.tru` 8-row fix; the .cas on disk is stale - see [[watergame-status]].** NOT yet confirmed on hardware; fallback if it still fails = drop digi sound and keep everything below `$8000`.

`@startblock`/`@endblock` does NOT relocate code on TVC. **How to apply:** new big data -> free U3 area ($DD00 slot, or above $EF00); new runtime tables -> low RAM `at`; if ROM file loading returns (loader plan), `Map` at 3056 must be reconsidered. Related: [[watergame-status]], [[trse-asm-integration-pitfalls]].

UPDATE 2026-10-05 evening: code end `$7F38` (~200 bytes free - FULL). New U3 slots: `AknaSFX` `$CB00..$CF4D` (mine sound, must stay below `$D000`), `Akna_Data` `$DD00..$DE03` (16-phase mine, 259 bytes), reserved for the postponed explosion image `$DE80` (291 bytes), free again from `$EF00` (the map experiment used `$EF00..$F384`). `WaterPump::PumpaFazPtr_Tab` now has 32 entries (0..7 P1 pump, 8..15 P2 pump, 16..31 mine). `array[..] of byte at $addr` for the level maps crashed trse.exe - read U3 data by address with asm instead (see [[watergame-multifile-loader-plan]]).