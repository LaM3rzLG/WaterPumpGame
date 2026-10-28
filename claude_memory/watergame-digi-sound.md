---
name: watergame-digi-sound
description: "How GE digi sound (DigiSoundOn/PlayDigiSound) works and behaves in WaterPumpGame - format, raster-IT conflict, non-blocking pattern, emulator latency"
metadata: 
  node_type: memory
  type: project
  originSessionId: 32e78541-ed71-4542-ba61-950c34fb6f78
  modified: 2026-09-20T21:20:41.449Z
---

GE digi sound facts (read from GE.tru, 2026-09-20): `DIGI_TYPE_2x4BIT` byte = 2 samples, LOW nibble first, 0 byte = end marker (so no zero bytes inside), silence = 8; 4 kHz. Generators in the project: `resources\make_explosion_sfx.ps1` (bomb, 1.4 s, 2801 B) and `resources\make_tick_sfx.ps1` (pump tick, 81 B) -> `resources\sfx\*.bin/.wav`.

- `DigiSoundOn` disables the raster/cursor interrupt and begins with a `halt` (sync). While digi is on, use `GE::WaitForDigiSoundSync()` not `WaitForSync()` (plain `halt` returns every 250 us). `DigiSoundOff` re-enables the cursor IT but leaves CRTC R11 at 3+32 -> call `SetRasterInterruptPos(239)` afterwards.
- One `WaitForDigiSoundSync` call can take ~2 frames -> a fixed loop count overshoots badly; poll `GE::Is2x4bitDigiSoundPlaying()` instead.
- Non-blocking pattern used: `Digi_Aktiv` flag; main loop calls `Frame_Sync()` (digi sync while `Digi_Aktiv=1`, turns it off via `Digi_Le()` when the sample ends). Call `Digi_Le()` before blocking screens. The bomb strip (`Bomba_Sav`, needs raster IT) and digi are mutually exclusive: with `Bomba_Sav_Be=1` the explosion starts after the flash.
- Start digi AFTER Keret restore/redraw (DigiSoundOn waits for a sync; never put it between Restore and Draw).
- The user heard a constant ~1 s delay, also in the plain menu test -> most likely WinTVC audio buffering, not game code; sound waveform itself starts loud (verified). Was left as is.

**Why/How to apply:** reuse this pattern for any new sound; check the memory budget first ([[watergame-status]]).

UPDATE 2026-10-03: **digi mode left on -> `GE::WaitForSync` returns at ~4 kHz ("turbo" menu).** Happened when the exit-confirm fire placed a pump (tick sound) in the same frame the game loop ended. Fix in place: `Start_Kepernyo` begins with `Digi_Le()`, and `Exit_Kerdes` waits until all keys are released. Rule: call `Digi_Le` before any menu/wait loop that uses `WaitForSync`.
