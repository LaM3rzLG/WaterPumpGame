# Multi-file loader for a big GE game (design 2026-10-05; first step verified 2026-10-11)

Status: the FIRST STEP IS VERIFIED (2026-10-11, Befosas `Loader.ras`, WinTVC + `hbf.rom` + own `.dsk`): a separate picture file is
loaded and shown. The rest (data file to U3, code file, jump to the game) is still the agreed design below, not built.

## Verified 2026-10-11 (this overrides anything below that contradicts it)

- **Bery's `TVC::OpenFile(#Name)` / `TVC::BlockRead(ptr, len)` / `TVC::CloseFile()` work** from a disk image, called before
  `GE::Init`, with no system-variable setup. `Name` is a byte array with a LENGTH prefix: `(7, "kep.bin" as codes, 0)`. Raw files
  (no header) are fine. Working program: read 15360 bytes to `$4000`, then `GE::SetGraphics`, `GE::Init`, `GE::SetMemory(MEM_48K_VID)`,
  `GE::Image.Init(ptr, 64, 240)` + `Put()`. The earlier "wrappers do not work" verdict was wrong: there was no file device.
- **Emulator quick-load of a `.cas` gives no file device** (WinTVC and EP Emu alike): every open fails. Test from a `.dsk`
  (`make_dsk.ps1`, `LOAD` from the disk) or tape (`make_wav.ps1` + `tools\TVCTape.exe`), never by quick-load.
- **TRSE writes a wrong block count into the `.cas` header** (164 bytes short) - quick-load ignores it, a disk `LOAD` does not
  (likely cause of the old "System error 236"). Correct: blocks = ceil((size - 128) / 128), last = (size - 128) mod 128.
  `make_dsk.ps1` fixes the copy it puts on the disk.
- **Block read is function `$D2`** (CAS_BKIN), not `$D5` (verify). Read-close is `$D4`; Bery's `CloseFile` calls `$54` (write-close) -
  harmless for one file in WinTVC, but on the REAL machine with SD (2026-10-23, WaterPumpGame, 4 files) Bery's OpenFile/BlockRead/CloseFile FAILED for every file (garbage data). Working replacement = the Lemmings sequence: `xor a`, `ld ($0B0A),a`, `ld de,name`, `rst $30`/`db $D3` (Z = ok), `ld de,dest`, `ld bc,len`, `rst $30`/`db $D2`, `xor a`, `rst $30`/`db $D4`. Confirmed on real SD and builds for WinTVC disk.
- **A file can never be read straight into video RAM.** The `rst $30` entry (in RAM at `$0B23`, constant `$70` at `$0B2E` - derived
  from the ROM image) switches to `$70` (U0,U1,U2,SYS) for every system call and restores the caller's paging afterwards; the
  disk card ROM switches to `$F0` (U0,U1,U2,EXT) itself. So data read to `$8000` always lands in U2. Read into a buffer below `$8000`.
- Tried and dropped by the user: patching the paging constant for tape, an own tape loader copied from the ROM, strip-by-strip
  loading with repeated `BlockRead` into a small buffer (works in principle on disk, user: not feasible on tape).
- Reference loader that works on WinTVC disk, EP Emu and real SD: the Lemmings (AnyStone, 2025) stub at the end of `Lemmings.cas`.

## Why a loader at all

- A TRSE/GE game keeps its code at `$19EF..` and must end **below `$8000`** (video RAM is paged there).
  Data placed in U3 with `incbin(file, $C000+)` makes the output ONE contiguous block from `$19EF` up to the
  last U3 byte, zero-filled across `$8000..$BFFF`. WaterPumpGame: 52 KB `.cas`, of which ~26 KB is program.
- On the real machine that single block fails ("No memory") because it runs up under the ROM.
- Moving more data into U3 does not shorten the file (it lengthens the block) - it only frees program space.
- A multi-file loader fixes both: each file is loaded where it belongs, and level/sprite/sound data leaves the program.

## The four files, in load order

| File | Content | Size (WaterPumpGame) |
|---|---|---|
| Loader | what `LOAD` starts; loads the rest, then jumps to the game | well under 0.5 KB |
| Title image | raw copy of the video RAM, shown while loading | 15 360 bytes (64 x 240), same for GR4 and GR16 |
| Data | sprites, sounds, font, level maps and level tables -> U3 | 8-9 KB |
| Code | the game, program only | 25-26 KB |

Total load time is about the same as the single file today: the title image adds what the removed padding saves.

## Three things the TVC forces

1. **You cannot load straight into U3.** The file routines are in the ROM, and during a ROM call the ROM is
   mapped exactly where U3 is. Load each data file into a staging area first - `$8000..` is free U2 RAM in the
   default (BASIC) paging `$70` - then, with interrupts off, switch paging and copy:
   - data -> U3: paging `$B0` (U0,U1,U2,U3), `ldir` from `$8000` to `$C000+`, restore the original paging
     (the value read from `($3)` at start), `ei`. (This exact copy was used by the dropped WaterVAS variant.)
   - title image -> video RAM: U2 and VID both live at `$8000`, so go through U3: U2 -> U3 under `$B0`,
     then U3 -> VID under `$90` (U0,U1,VID,U3). Do the image BEFORE the data file, since it borrows U3.
   - Keep the default paging during every ROM call. Paging VID in at `$8000` during ROM file calls broke the
     disk DOS in an earlier attempt.
2. **The loader must sit where the code file will not overwrite it.** The game loads at `$19EF`, the same
   place a plain program (and so the loader itself) starts. The loader therefore first copies itself to the
   top of the `$8000..$BFFF` area and continues from there; the staging area is the 16 KB below it. Once the
   game runs and pages the screen in at `$8000`, the loader is gone - which is fine.
3. **Code goes last, and `GE::Init` only after every load.** `GE::Init` disables the ROM interrupt handler;
   no file call works after it. Sequence: image, data, code, then jump to the code's entry point.

## What it buys

- Program space: level maps (68 bytes/level, bit-packed) and the per-level tables leave the program,
  about 1.5-2 KB in WaterPumpGame today. Features waiting for that space are listed in the project notes.
- Runs on the real machine (no block under the ROM).
- New level packs later by swapping the data file, without recompiling.
- U3 has room: 16 KB, about 9 KB used after the move.

In the game, read U3 data **by address** (base address in an integer var + offset, a few asm lines).
`array[..] of byte at $addr` for such tables crashed the compiler - see `gotchas-from-practice.md`.

## Reference: the ROM file calls (taken from a working third-party loader stub, not yet proven here)

- File name is **length-prefixed** (first byte = length), not a 0-terminated TRSE string.
- Before the calls the stub clears three system variables and sets a fourth to 3 (addresses: see the
  WaterPumpGame `CLAUDE.md`, 2026-09-20 "Nuke-betöltő átírva a MŰKÖDŐ referencia szerint").
- Open: `ld de,name` / `rst $30` / `db $D3` (CAS_OPEN); Z = success.
- Block read: `ld bc,length` / `ld de,target` / `rst $30` / `db $D2` (CAS_BKIN); BC = 0 afterwards = all read.
- Close after reading: `xor a` / `rst $30` / `db $D4`.
- The Bery `TVC::OpenFile/BlockRead/CloseFile` wrappers did not work for this (they skip the system-variable
  setup, test a different status, and close with the call meant for writing).
- The TVC interrupt resets the border about every 20 ms, so a border-colour progress/diagnostic signal must be
  rewritten continuously.

## Biggest risk

Opening an external file has never been seen working in this project. In WinTVC files come from an emulated
disk image (floppy card ROM + `.dsk`), not from the Windows folder; our own generated `.dsk` gave
`LOAD"*"` "System error 236" and the attempt was abandoned. So the medium decides the whole approach.

**Open question to the user (asked 2026-10-05, unanswered): what will the game load from** - WinTVC disk
image, an SD interface on the real machine (which one), or tape?

## First step when work starts: proof of concept, without the game

A tiny program: load one data file to `$8000`, copy it to U3, verify a known byte, show the result as a
colour. Run it in WinTVC (start from a known-good third-party disk image) and on the real machine. Only then
split the game.
