---
name: tvc-real-machine-file-loading
description: "CONFIRMED 2026-10-23 - how WaterPumpGame loads its data files on a real TVC from SD (own asm, Lemmings call sequence); Bery's TVC::OpenFile/BlockRead/CloseFile fail there"
metadata:
  node_type: memory
  type: project
  originSessionId: 1d7c7b16-5d8f-4170-b31e-0d5b0f017974
  modified: 2026-10-23T20:18:07.565Z
---

Confirmed by the user on the real machine (SD reader), 2026-10-23: the game + SPRITES/PALYAK/SZOVEG/MENU16.BIN load and run.

- Reading goes ONLY through `Fajl_Olvas` (own asm in WaterPumpGame.ras): `xor a` / `ld ($0B0A),a` / `ld de,name` / `rst $30 : db $D3` (Z = ok) / `ld de,dest` / `ld bc,len` / `rst $30 : db $D2` (A=0 ok) / `xor a` / `rst $30 : db $D4`. Errors: border red = open failed, magenta = read failed, waits for a key.
- Bery's `TVC::OpenFile`/`BlockRead`/`CloseFile` worked in WinTVC but every file failed on real SD (garbage: level 1 income 656, slanted 16-colour menu, broken pump). `CloseFile` = `$54` = write-close. Writing with the TVC unit (`Pal_Ment`) is fine.
- Paging was not the cause: `rst $30` pages `$70` for every call.
- Symptom pattern to recognise: when it works in WinTVC but the real machine shows garbage data, suspect the file calls first.
- Files for the machine: `WaterSDCARD\` (the .dsk extracted) -> copy to `E:\WP` on the pendrive root (the older `E:\tvcnew\WaterPump` is stale). Keep the .dsk's PALYAK.BIN (saved by the in-game versus editor) when rebuilding the disk.

**Why:** a whole evening went into finding this; the user explicitly asked to save it.
**How to apply:** any new file loading (the planned loader, title image, level packs) must use this sequence, not the TVC unit. See [[watergame-multifile-loader-plan]], [[tvc-memory-map-u3]].
- 2026-10-23: in the TMC20 emulator the picture breaks up while pumps are placed (tick digi playing) and recovers later - an EMULATOR fault, not the game (user confirmed). Do not debug the digi/CRTC code for it.
- 2026-10-23: versus virus placing (icon was never drawn; fixed with Ikon_Sor(j), code end $7D5B) confirmed working on the real machine.
