# Raster colour effects in GRAPHICS2 — per-line bars and smooth-scrolling mid-line stripes

**Status: verified on WinTVC, rock-stable picture (2026-10-01/02).** Built while
exploring "more colours in GRAPHICS 2" for the WaterPumpGame project; the user wants
to reuse it later as an effect (e.g. title screen / level-complete / pump effect).

Source (compiling, TVC unit only, no GE):
- `assets/SzinGyors_RasterStripes.ras` — **the main one**: vertical colour stripes
  *inside* each line, smoothly scrolling 4 px/frame, cycle-exact free-running frame
  loop, text whose ink pixels show the stripes.
- `assets/SzinSorok_RasterBars_text.ras` — simpler: one ink colour per raster line
  (horizontal bars, 7 dark colours up/down), `halt` sync every frame, a text line and
  a solid $FF band.

Build: `trse.exe -cli op=project project=<proj>.trse input_file=<file>.ras assemble=yes`.

## The idea

GRAPHICS2 shows 2 colours: bit 0 = palette 0 (port `$60`, "paper"), bit 1 = palette 1
(port `$61`, "ink"). Rewriting the palette **while the beam is drawing** gives many
colours: whatever pixels are ink take the colour current at that moment.
- **Per line** → horizontal bars (one `out` per 200 T line).
- **Within the line** → vertical stripes. Fastest: preloaded registers +
  `out (c),r` = **12 T = 6 bytes = 48 px** per change; ~10-11 visible changes per line.

Only ink pixels are coloured, so the effect can be limited to a shape: text written
with ink 1 on paper 0, a $FF band, a sprite, a logo... Everything else stays paper.

## Timing facts (measured)

| Fact | Value |
|---|---|
| CPU clock | 3.125 MHz |
| One raster line | 64 µs = **200 T** |
| Visible part of a line | ~128 T (64 bytes, 2 T per byte = 8 px in GR2, 1 T = 4 px) |
| Horizontal blank | ~72 T |
| Frame | CRTC R4=77, R5=2 → 78*4+2 = **314 lines = 62800 T** (WinTVC title shows "314i") |
| Lines from the line-239 IRQ to visible line 0 | 74 |
| `halt` wake-up jitter | 0..3 T (INT tested every 4 T while halted) = 0..12 px |

## Recipe 1 — per-line bars (`SzinSorok`)

1. `TVC::SetGraphicsMode(GRAPHICS2)` then **`TVC::SetRasterInterruptPos(239)`** (the ROM
   VMODE leaves the IRQ around line 173 → effect started mid-screen).
2. Own ISR at `$38`: `JP isr` / `isr: out ($7),a / ei / ret` (ROM ISR gone: no keyboard).
3. Frame: `halt` → `di` → wait 72 lines (`ld b,14 / djnz / dec c / jr nz` = 200 T per
   iteration) → small "Finom" delay (`ld b,n / djnz`, 13 T steps) → 240 iterations of
   exactly 200 T: `ld a,(hl) / out ($61),a / inc hl / dec de / ld a,d / or e / jp z /
   ld b,10 / djnz / jp / jp`. Exit at line 239, `ei`, back to `halt`.
4. Tune "Finom" so the change falls into the horizontal blank (there the `halt` jitter
   is invisible). Here Finom = 10 worked.

## Recipe 2 — mid-line stripes, smooth scroll (`SzinGyors`) — the rock-stable one

1. **Sync once, then never again.** `out ($7),a` (ack a stale request left pending by
   a long `di`, e.g. VRAM fill), `ei / halt / halt / di` (2nd halt is the real one).
   From then on: interrupts off forever, a frame loop of **exactly 62800 T**. Per-frame
   `halt` caused 8..16 px horizontal shake because of its 0..3 T jitter.
2. **Line loop (200 T):** `exx`(4) + 14 × `out (c),r`(168) + `nop`(4) + `ld c,$61`(7)
   + `exx`(4) + `djnz`(13). Colours in B,D,E,H,L,A, C = `$61`, line counter in B'.
3. **14th out = the colour BEFORE the 1st in the cycle** (A when the cycle is
   B,D,E,H,L,A). The part of the line before the 1st `out` shows the previous line's
   last colour; if it equals the 1st colour the 1st stripe looks double wide while
   scrolling.
4. **Phase:** after the sync a one-off delay places the 1st `out` at the left edge of
   the visible area and the 32 T line overhead in the blank (measured from screenshots:
   sync→first out = 14819 T in this program).
5. **Smooth scroll, 4 px/frame:** delay the line loop start by k = 0..11 T, and wait
   11-k T at the end of the frame (total stays 62800). k comes from a jump table of 12
   delay snippets built from 4/6/7/9 T instructions (`nop`, `inc hl`, `ld a,n`,
   `ld a,i`) ending in `jp (ix)` (IX = return point). After k = 11, k → 0 **and** the
   colours rotate by one (r → r-1 mod 6) in the same frame → seamless.
6. **No branches in the frame:** phase p = 0..71 (12 × 6); tables built in Rascal at
   init: `SzPNext[p]`, `SzK2[p]` = k*2, `SzK2b[p]` = (11-k)*2, `SzRt[p]` = r; colours
   doubled (`SzSzin[12]`) so `SzSzin + r` gives 6 consecutive colours.
7. Every instruction has its T count in a comment; the frame sum is written out
   (`48538 + 14262 = 62800`). **If you change anything, re-add the sum.**

## Pitfalls hit on the way

- Stale IRQ → one-shot `halt` returned immediately → bars started ~66 lines early.
- `halt` per frame → horizontal shake (fine only if the change is in the h-blank).
- Writing video RAM in the blank before a timed loop (ldir 288 bytes) took ~90 T more
  than counted (likely VRAM wait states) → the colour step moved; fixed tuning was
  fragile (flicker). Keep VRAM writes out of cycle-counted paths, or re-measure.
- The delay after sync of "1 line + 4 T" looked right horizontally but started one line
  late (thin wrong line at the top) → use the value mod 200.

## Using it in a game (ideas, not done)

The free-running version owns the whole CPU (no interrupts, no keyboard). For a game:
- Title / level-complete / game-over screen: run it as is, poll a key once per frame
  in the vertical blank with a **fixed-cost** read (e.g. `in a,($58)` after selecting
  the row, constant T) and subtract its T from the wait.
- In-game effect on a band (HUD, a "pump" highlight): per-line or mid-line changes only
  for those lines, started from the raster IRQ placed just above the band; costs
  50 lines ≈ 10000 T ≈ 16 % of a frame; accept small jitter or keep changes in h-blank.
- GE (`GE::Init`) installs its own ISR; a GE game would need the effect inside
  `WaitForSync`-timed code (like WaterPumpGame's `Bomba_Sav`), not the free-running loop.
