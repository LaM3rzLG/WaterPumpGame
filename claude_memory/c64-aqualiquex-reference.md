---
name: c64-aqualiquex-reference
description: "The C64 aqualiquex TRSE source is the reference implementation for WaterPumpGame's virus/gameplay logic — where it lives and what to mine from it"
metadata: 
  node_type: memory
  type: reference
  originSessionId: 9e5b2686-f4a4-4f4d-849c-47ae13101f96
  modified: 2026-09-07T12:34:58.032Z
---

The user's own C64 TRSE port of Aqualique 1.0 lives at `C:\Users\LG\Documents\-- DEY --\`.
It is the canonical behavior reference for WaterPumpGame — when virus / pump / meteor / wall /
economy behavior is unclear, read it and copy the Rascal logic (ignore the `asm(...)` blocks).

Files:
- `aqualiquex.ras` — main loop: colony seeding (`if raster::newSecond`, `noOfColonies < maxColonies`
  → `makeVirus`, then `doVirusSpread:=true`), meteor event (50/50 vs virus), wall build
  (`space` + `credits>=50`), win at `noOfDrills<250`.
- `units.tru` — `makeVirus(x,y)` (eats drills, wall blocks, `putChar(virusStart)`); char ranges
  `virusStart=192`, `virusAnimFramesStart=202`, `virusAnimFramesEnd=208`, drill `144..163`,
  wall `224..227`; `makeDrill`/`removeDrill`, `refreshDrills(dfrom,dto)` (rotating fifths),
  `rndom()` (1-byte xorshift), economy (`credits=2000`, drill costs 100).
- `raster.tru` — the raster-IRQ 16-sample virus loop: `for i:=0 to 15` random x,y; GROWING virus
  (`>=192 & <202`) → `putChar(tmp+1)`; MATURE (`>=202 & <=208`) → random shimmer char + (if
  `doVirusSpread`) spread into the 3×3 incl. diagonals (`x+rnd%3-1`) via `makeVirus`.

WaterPumpGame's current virus model (2026-08-30, ~v7.3+) is a 1:1 model of this, minus raster
timing (one main-loop `WaitForSync` iteration = one C64 raster IRQ). Details in the project's
CLAUDE.md → "Enemy / Vírus — ENEMY_Szekcio". Not yet ported: meteor, wall, win condition,
mature-virus shimmer (TVC has only 1 mature sprite phase). See [[watergame-working-style]].
