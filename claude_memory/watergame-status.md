---
name: watergame-status
description: "Current state of WaterPumpGame (2026-10-03 end of session) - menu, modes, joystick-only control, HUD, level codes, pause/exit, versus level select, memory, open topics"
metadata:
  type: project
---

State 2026-10-03 (end of a long session; user: "session lejár, jegyezz fel mindent"). Full detail: project `CLAUDE.md` (★ LEGFRISSEBB ÁLLAPOT at the top + dated 2026-10-02/03 entries at the end). Nothing after `WaterPump_Final_Betav1.4` (09-25) is in a saved beta; NOTHING from 10-02/03 has been confirmed on the real machine/emulator except where the user said "jó lett" (pause colour trick, versus HUD layouts).

**Main menu (no number keys!):** animated pump pointer (`Menu_Pumpa`/`Menu_Anim`, 8 phases) before rows ONE PLAYER GAME / TWO PLAYER CO-OP / TWO PLAYER VERSUS MODE / HOW TO USE / HISCORE (nothing yet) / LEVEL CODE; joystick/cursor up-down (repeat when held), fire/SPACE activates (edge, `Tuz1_Volt`). `Menu_Sor` remembered.

**Control = joystick only in ALL modes:** cursor goes UP from map row 1 into the icon-menu row (row 0, y=30): P1 icons pump/wall/bomb at cols 1/3/5, P2 at 30/28/26; left/right steps between own 3 icons, fire selects (marker = player's Keret graphic `Jelol1/2`), DOWN returns to row 1 under the icon. On the map fire places the selected item (`Jatekos_Tuz`; bomb only on new press). `Jatekos_Mozog(j)` with `Joy_*` vars. F/B keys removed. P2 = joystick 2 (+ WASD, keyboard fire **E** for testing). Bomb destroys everyone's pumps (intended).

**Keys still on keyboard:** P = pause (dark palette, "GAME PAUSED", P again continues); ESC or Q = "EXIT TO MENU ?" (ESC/Q = yes, ANY other key/joystick = no); R = restart level (costs a life, not in versus).

**HUD (one layout for all modes, P2 parts only in 2P):** no blue line; row1 `P1$:` left / centre pump icon:price/income / `P2$:` right (right edge byte 62); row2 pump icon:count (versus also `/goal`) left & right, centre wall:price; row3 centre bomb:price (centre rows centred per line); bottom y=224 (not versus): `LIVES:`+icons, `LVL:nn`, goal `[pump]:sum/goal`. Versus: no lives; `LVL` shown from 01 (internal "20" only in editor).

**Messages:** LEVEL FAILED / GAME OVER / pause / exit use the dark "pause" colour scheme (`Sotet_Szinek`, `Normal_Szinek`, `Szinez` recolours text colour1->3 = gray); LEVEL COMPLETED / PLAYER n WINS keep normal colours + `Varakozas(75)` + shows `NEXT CODE: XXXXX` (co-op shows the co-op code) if there is a next level.

**Modes:** versus: whoever reaches `Palya2_Cel` wins, or whoever runs out (no pumps & no cash for one) loses -> other wins; no lives. Co-op: shared goal `Palya_CelCoop`, both draw the SAME pump graphic (`P2_Kep`=0) but counts stay separate (Map 31..38 for P2). Versus menu entry opens `VS_Valaszto` (level select: mini-map preview drawn by fast asm, every 2nd pixel row, `<  LVL:nn  >`, `PUMP GOAL:nnn`, left/right, fire start, ESC back).

**Level codes:** 5 letters; `Palya_Kod` (1P), `Palya_KodCoop` (co-op, different), `Palya2_Kod` (versus). LEVEL CODE menu (`Kod_Bevitel`): blinking cursor, letters A-Z, DEL, ESC; auto-validates after the 5th letter; valid -> starts that level in the right mode (`Kod_Mod` 0/1/2); wrong -> "WRONG CODE".

**Levels:** maps are BIT-PACKED (68 bytes/level, 1 bit/cell) — see [[watergame-level-workflow]]. Counts: see UPDATE below (11 + 6).

**Memory:** (superseded, see UPDATE below) code ended `$729A`; .cas 52 471 bytes because of the zero fill up to U3 — see [[tvc-memory-map-u3]]; PARKED plan to fix it: [[watergame-multifile-loader-plan]] (start the next big topic with it).

**Open / next:** multi-file loader (parked, first!); HISCORE; HOW TO USE texts need rewriting (user said so); editor versus tabs still numbered 20.. (offered to change to 1..); win screen after the last level; HUD icons instead of words.

**How to apply:** ask what the user tested first; report code end after builds; keep `.bak_<name>`; update CLAUDE.md after every real change. See [[watergame-working-style]].

UPDATE 2026-10-03 evening (later in the same session):
- **Meteor:** random every 10..30 s (`Meteor_Uj_Ido`: seconds `Meteor_Mp`, frame counter `Meteor_Fr`); on meteor levels a fixed "METEOR:nn" countdown in the centre of the icon row; at 0 a ~2 s non-blocking blinking "METEOR !" (black box, gray text), then the fall. Rejected by the user: red text (palette 3 red), crawling red/black border stripes (blocking) - don't propose again.
- **Per-level meteor options:** `MeteorTor` (also destroys rocks/Talaj3), `MeteorVir` (seeds a virus at the impact centre; then `Enemy_Terjedhet:=1`; on levels without virus the cycle still runs via `Palya_Betolt`: kolonia counter set to max + `Virus_Engedve:=1`).
- **Level names** are in the data (`Palya_Nev`) but NOT shown (user decision).
- **Level codes** only for single player and co-op (versus has none; no NEXT CODE in versus).
- **Icon menu / HUD:** disabled wall/bomb not shown; icons packed without gaps; bomb price moves under the pump price when there is no wall.
- **LEVEL COMPLETED box:** `Doboz` (bigger, 1 px black frame), green NEXT CODE line (`Szin_Mod` 3).
- **Levels:** 11 single/co-op + 6 versus; editor allows 49 + 49 (versus tabs from 50); import via `resources\palyak_import.ps1`.
- **Memory:** code end `$7827` (~2 KB free, ~20 more levels) -> level data to U3 together with the parked loader plan.
- Many TRSE compiler crashes today; see [[trse-asm-integration-pitfalls]].

UPDATE 2026-10-03 late:
- **Real-hardware test build = `WaterVAS.ras/.cas`** (30 KB, generated by `resources\watervas_build.ps1`; details in [[tvc-memory-map-u3]]). The user wants to test on the real TVC ("be kell férni", "pályák kellenek" = keep the levels; sound may be dropped only if needed). Ask for the hardware result first next time.
- Levels re-imported (json 14:32): level 5 new map + MeteorTor, levels 6-7 MeteorVir; still 11 + 6. The import script's scratchpad path and backup name are hard-coded - adjust before running.

UPDATE 2026-10-05 (session end, user opens a new session):
- **Later the same day the user confirmed most features and made decisions - see [[watergame-confirmed-2026-10-05]] (it overrides the lines below where they differ: files were RENAMED, WaterVAS dropped).**
- **Pump graphics:** P1 = BLUE = `Pumpa.bin` <- `Pump1..8.bmp`, P2 = GREEN = `Pumpa2.bin` <- `Pump1b..8b.bmp` (renamed; the incbin lines are straight again). Conversion unchanged: `resources\bmp_to_talaj.ps1` per phase, one header, 131 bytes; always show the ASCII decode of the 8 phases after converting (the user checks it). Blue shows in 1P, menu, HUD, co-op. A different pump design (`images\New_Pump`, `Pumpa3.bin`) was tried on P2 and REJECTED ("ez nem jó") - don't propose it.
- **Fixed:** `WaterPump::PutAt` copied only 7 of 8 rows (user found it: bottom pump row missing on the map, menu fine). Unused `PutAtRaw` copied 6 - also fixed, still unused/untested.
- **OPEN:** `WaterVAS.ras` crashes trse.exe (0xC0000005) with the fixed `WaterPump.tru` (main file compiles). Tried: copy asm in its own procedure, old PutAtRaw - no help. User: "WaterVAS most nem releváns". Existing `WaterVAS.cas` is stale (7-row blit, old graphics).
- Code end `$7831`. Nothing from 10-04/05 confirmed on machine.
- P2 control was already joystick 2 + fire (plus WASD/E) in game; main menu, versus level select and the "PRESS SPACE" waits listen to joystick 1/SPACE only (offered to extend, no answer).

UPDATE 2026-10-05 evening (long session; user: "A loader lesz a megoldás! Mentsd a tudást."):
- **Memory is FULL: code end `$7F38` (~200 bytes to `$8000`).** Next big topic = the multi-file loader ([[watergame-multifile-loader-plan]]); nothing that needs code space before it.
- **New, built, NOT yet confirmed on the machine unless noted:**
  - M (P1) / Y (P2) = cycle to the next enabled tool anywhere (`Eszkoz_Kovetkezo`); going UP into the icon row remembers the column and DOWN returns to it (`Vissza1_X/2_X`) - user confirmed "Jó a kód".
  - Main menu in Hungarian without accents (font has none): EGY JATEKOS / KET JATEKOS EGYUTT / KET JATEKOS EGYMAS ELLEN / JATEKSZABALY / REKORDOK / PALYAKOD, wrong code = HIBAS KOD. Other screens still English.
  - Versus level select shows an icon row of what the level allows (pump, wall, bomb, mine, virus, meteor) - `VS_Ikonok`.
  - **MINE (akna) = 4th selectable tool.** Timed: 16 steps at the pump scan pace (about 0.72 s each, about 11 s), 16 distinct images (`akna.bin`, 259 bytes, built from the user's `akna.json` sprite list), then a ROUND blast in a 7x7 box (37 cells) that also destroys rock; own short sound (generated, `make_akna_sfx.ps1`); no flash, game keeps running; waits while a meteor is falling. Map values 41..56. Shared `Terulet_Rombol(px,py,kor)` (bomb = rhombus). Placing via `TeglaLerak(px,py,j,akna)`, one press = one mine. Bomb and mine prices share one HUD row. Level data `Palya_AknaAr/Palya_Akna` (+ `Palya2_`), editor fields added; old projects default: mine where bomb is allowed, price 300 (my placeholder - the on-disk `waterpump_palyak.json` has no mine fields until re-saved from the editor).
  - Mine explosion image (3x3 cells, 1 s before the destruction): drawn by the user, code ready, NOT in the game - did not fit; waits for the loader.
- **Tools:** new `sprite4_szerkeszto.html` (4-colour sprite editor, see the TVC-Utils skill `references\sprite4-editor.md`): palette preset (WaterPump), per-sprite BMP button, save-all-BMP to a folder, "all sprites into one animated .bin", editable project name, new project. The user now draws sprites there; the game reads `.bin` from `resources\tvc_sprites` (the user saved a copy to `resources\images`).
- Lesson about this user's workflow: they edit the SPRITES, not the animation container - container frames are copies and go stale; take the sprite list as authoritative (user: "akna.json a mérvadó").
UPDATE 2026-10-25: compiler = TEMPORARILY the TRSE nightly at `C:\TVC\TRSE_Nightly\trse.exe` (user decision; old `C:\TVC\TRSE` still works). Nightly fixes the Windows post-optimiser crash; its TVC.tru asm `//` comments were changed to `;` (needed). Same code bytes as the old exe. Open: user asked to move all asm procedures out of the main .ras into units (readability) - planned in groups (text, file/image, screen effects, random, game logic), not started yet; TRSE source at `C:\TVC\TRSE_Projects\TRSE-source`.
