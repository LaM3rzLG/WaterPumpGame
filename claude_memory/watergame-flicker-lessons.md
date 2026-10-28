---
name: watergame-flicker-lessons
description: "Lessons on Keret/virus/meteor flicker and disappearing Keret in WaterPumpGame - event-driven redraw, do not draw stamps into the Keret footprint, raster IT below moving sprites"
metadata: 
  node_type: memory
  type: project
  originSessionId: 32e78541-ed71-4542-ba61-950c34fb6f78
  modified: 2026-09-20T21:20:46.864Z
---

- The Keret (16x12 masked, saved-background sprite) is overwritten by unmasked 8x8 virus stamps in its 3x3 neighbourhood. Failed fixes (rolled back): redrawing the Keret every frame when a virus is near (slow controls + flicker); moving the virus block BEFORE the Keret redraw (Keret disappeared, likely tearing/stale-restore).
- Working fix (Betav1.3): `Keret_Erint(x,y)` returns 1 if the cell is in the Keret 3x3; the virus code then SKIPS the Enemy_Kirak stamp and sets `Keret_Sereles`; next `Keret_Frissit` does Restore -> PumpakKirak -> Enemyk_Ujrarajzol -> Save/Draw. Keep the virus block AFTER the Keret redraw in the main loop.
- Meteor flicker: `Meteor_Keret_Frissit` used to erase+redraw both masked sprites every frame (~10 ms) while the raster IT sits at line 239 -> the beam saw the erased state (same tearing as the old nuke). Fix (untested on hardware at the time of writing): redraw the Keret only when needed (moved / pump under / virus event / meteor overlaps) and put the raster IT just below the moving sprite each frame (`SetRasterInterruptPos(ly)`, back to 239 when done and in `Palya_Betolt`).
- General: `Sprite.RestoreBackground` uses `LastPosition` (see CLAUDE.md), never insert long calls (DigiSoundOn, halts) between a sprite's Restore and Draw.

**How to apply:** for any new moving masked sprite think about beam position vs. erase window before writing the redraw order. Related: [[watergame-pump-scheduling]].

UPDATE 2026-09-25/26: (1) Cursor on a pump redrew EVERY frame (yellow border bar) -> now only when the pump under/next to it changes phase (`Keret_Pumpa_Valt`, set by `PumpakSzamol`). (2) Virus sampling used software `mod`/`*30` (~16k T/frame) -> shift-based `Rnd_Mezo`/`Rnd_Harom` asm. (3) Stuck cursor piece when the meteor spawned over a row-1 cursor: `Meteor_Indit` saved the meteor background with the cursor still drawn -> every draw site must follow top-restore / bottom-draw order. (4) Second cursor `Keret2` is always ABOVE `Keret`; whenever `Keret` redraws, `Keret2` redraws too (restore K2, K1, draw K1, K2).
