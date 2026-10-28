---
name: watergame-pump-scheduling
description: "Confirmed-working pump animation scheduling in WaterPumpGame.ras — strided Map[] scan, keret movement throttle, rotating start phase"
metadata: 
  node_type: memory
  type: project
  originSessionId: 193054ad-f5b0-494b-ae27-c4addef2fa65
  modified: 2026-09-14T17:55:26.729Z
---

Three techniques, confirmed working (compiled via `trse -cli` and play-tested by the user) in `WaterPumpGame.ras` as of 2026-09-14, solving pump-animation-desync and control-speed problems:

1. **Strided per-frame Map[] scan** (`PUMPA_STEP`, `PUMPAK_CHUNK`, `PumpaScanPos`) — `PumpakSzamol()`/`PumpakKirak()` examine `PUMPAK_CHUNK` Map cells per frame, spaced `PUMPA_STEP` apart (not contiguous), and resume next frame exactly where the scan left off (`PumpaScanPos := idx` after the loop — NOT `PumpaScanPos+1`, and not restarting at 0). `PUMPA_STEP` MUST be coprime with `TERKEP_MERET` (540 = 2²×3³×5 — e.g. 7, 13, 17 work; 10 or 15 do NOT, they trap the scan in one residue class forever so most placed pumps would never animate).
2. **Keret movement throttle** — a single byte flag (`Keret_Mozog_Engedve`) toggles 0/1 every frame; the 4 direction-move checks only run when it's 1. Halves cursor speed without touching Space/`DrillLerak` (pump placement stays active every frame).
3. **Rotating start phase for new pumps** (`Pumpa_Uj_Faz`) — `DrillLerak()` starts each newly placed pump at `Pumpa_Uj_Faz` (not always phase 0), incrementing +1 per placement and wrapping at `PUMPA_FAZISOK` (8). Purely cosmetic — pumps placed in quick succession don't visibly animate in lockstep even if they later land in the same scan window together.

**Why:** earlier designs (a rotating pool of active-pump indices keyed by insertion order; a purely contiguous chunk scanned over the Map array) both failed to stop visibly synchronized pump animation when the user placed several pumps quickly in adjacent map cells — those always ended up batched together in the same contiguous scan window. The strided scan fixes this structurally (adjacent map indices land in different step-residue classes); the rotating start phase is a second, purely-cosmetic safety net on top.

**How to apply:** when revisiting pump animation/update scheduling in this project, start from this design rather than reintroducing an active-pump pool or a contiguous-chunk scan — both were explicitly tried and rejected in this project's history (see CLAUDE.md's "PumpaActiv lista eldobva" and later sections). See [[watergame-working-style]] for how the user iterates on this project.
