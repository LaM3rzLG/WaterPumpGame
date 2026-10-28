---
name: tvc-emu-mac
description: >
  MAC ONLY (not for the Windows machine). Running and building Videoton TV-Computer (TVC)
  emulators on macOS (Apple Silicon): the self-built ep128emu (TVC 64k+, BASIC 1.2 + VT-DOS
  floppy, with a macOS audio/OpenGL patch) and TVC_CEmu. Use it on the Mac whenever the user
  wants to start/test the game in an emulator, load a .dsk/.cas, change emulator ROMs or
  speed/sound settings, rebuild ep128emu, or when the emulator runs slowly, the sound stutters
  or the emulator will not start. On Windows the emulator is WinTVC - ignore this skill there.
---

# TVC emulators on the Mac

Two emulators work on the Mac. **ep128emu is the main one** (the same core as TVCDevTool,
accurate, has a debugger); TVC_CEmu is a quick extra.

## ep128emu (main)

**Saved, ready-to-run copy (user's request): `~/Documents/EP128TVCEmu/`** - the patched
`ep128emu.app`, `ep128emu_data/` (ROMs + configs), the patch, `OLVASSEL.txt`, and
`TVC_inditas.command` (double-click: TVC 64k+ BASIC 1.2 + VT-DOS + the repo's
WaterPumpGame.dsk; restores the ROMs to Application Support if missing). Needs the
Homebrew libs (`fltk@1.3 portaudio libsndfile sdl12-compat`). Update it after a rebuild.

- Source + build: `~/Documents/TVC-emu/ep128emu` - `libretro/ep128emu-core`, branch
  `standalone`, 2.0.12.8 (commit `41cf08e`, by zoltanvb). No official macOS binary exists.
- App: `~/Documents/TVC-emu/ep128emu/ep128emu.app/Contents/MacOS/ep128emu`
- ROMs + configs: `~/Library/Application Support/ep128emu/` (`roms/`, `config/tvc/*.cfg`).
- **The user wants BASIC 1.2**: config `TVC_64k+_V12_VTDOS.cfg`
  (tvc12_sys + tvc12_ext + tvc_dos12d). Do not mix 1.2 SYS with 2.2 EXT ROMs (that was a
  real misconfiguration once). `-cfg` overrides every ROM slot, so a broken saved GUI
  setting (`tvc_cfg.dat`) does not matter when started this way.

### Start (run in background)

```bash
cd ~/Documents/TVC-emu/ep128emu && ./ep128emu.app/Contents/MacOS/ep128emu -tvc -opengl \
  -cfg "$HOME/Library/Application Support/ep128emu/config/tvc/TVC_64k+_V12_VTDOS.cfg" \
  "vm.speedPercentage=100" "sound.latency=0.1" \
  "floppy.a.imageFile=<repo>/WaterPumpGame.dsk" > ../ep128run.log 2>&1
```

On the TVC: `ext2`, then `load"WATERPG"` (then `run` if it does not start by itself).
Any config key can be given as `key=value` on the command line (names: `src/emucfg.cpp`).
Double-clicking the .app starts an Enterprise, not a TVC - always use the command above.
The two "Error opening configuration file ... tvvmcfg1/2.cfg" lines on the first start are
harmless (saved GUI state does not exist yet).

Closing: the process sometimes ignores SIGTERM; `pkill -9 -f "MacOS/ep128emu -tvc"` works.

### macOS patch (`patches/ep128emu-macos.patch`, against commit `41cf08e`)

Without it the emulator runs at 25-32 % with stuttering sound at 100 % speed. Contents:
1. `SConstruct`: Cocoa/OpenGL frameworks instead of X11/`-lGL`, `OpenGL/gl.h` header check,
   no ALSA libs for PortAudio.
2. `src/gldisp.cpp`: `<OpenGL/glext.h>` on Apple. (Software video was far too slow.)
3. `src/soundio.cpp/.hpp`: the lock-based PortAudio ring buffer (producer waited for the
   buffer it had just filled, CoreAudio asked for two periods back to back -> constant
   underruns and the emulation synced to them) **replaced by a single-producer /
   single-consumer sample FIFO** (atomic indexes, size ~ `sound.latency`, producer sleeps
   1 ms when full, callback plays silence when empty). Verified: 100 % speed, 0 underruns;
   user confirmed 2026-10-28.
   GL shaders stay disabled (Apple's old OpenGL lacks the shader types) - plain image works.

### Rebuild from scratch

```bash
brew install fltk@1.3 scons portaudio libsndfile sdl12-compat
mkdir -p ~/Documents/TVC-emu && cd ~/Documents/TVC-emu
git clone -b standalone https://github.com/libretro/ep128emu-core.git ep128emu
cd ep128emu && git checkout 41cf08e && git apply <repo>/.claude/skills/tvc-emu-mac/patches/ep128emu-macos.patch
export PATH="/opt/homebrew/opt/fltk@1.3/bin:/opt/homebrew/bin:$PATH"
scons -j 8 nolua=1 utils=0 cflags="-Wno-c++11-narrowing -Wno-deprecated-declarations \
  -DGL_SILENCE_DEPRECATION -I/opt/homebrew/opt/fltk@1.3/include -I/opt/homebrew/include \
  -L/opt/homebrew/opt/fltk@1.3/lib -L/opt/homebrew/lib"
```

- `utils=0`: the image converter utility includes `GL/gl.h` and does not build on macOS.
- `-Wno-c++11-narrowing`: clang rejects `deps/tvc-routines.cpp` otherwise.
- Building downloaded code needs the user's explicit permission (the auto-mode classifier
  blocks running a cloned repo's `scons` otherwise).
- ROMs: `epmakecfg -f` creates the configs but did NOT download the ROM package. Fix:
  download `https://zoltanvb.github.io/ep128emu/ep128emu_roms-2.0.12.8.bin` into
  `~/Library/Application Support/ep128emu/roms/`, then run
  `./ep128emu.app/Contents/MacOS/epmakecfg -f` again (it unpacks the local package).

### If it is slow again

The speed indicator at 100 % is driven by the audio output. First check that the patched
binary is running (OpenGL linked: `otool -L ... | grep OpenGL`). Raise `sound.latency`
(0.15) only if the sound stutters; 0.284-style values only hide a bug. For diagnosis, the
earlier statistics version is kept as `src/soundio.cpp.debug` in the build folder.

## TVC_CEmu (extra)

- `~/Downloads/TVC/TVC_CEmu/tvc_gui` (arm64, by "Steve", v1.0 FINAL 2026-06-19), README there.
- Links SDL2 from MacPorts (`/opt/local/lib`); with Homebrew start it as:
  `cd ~/Downloads/TVC/TVC_CEmu && DYLD_LIBRARY_PATH=/opt/homebrew/lib ./tvc_gui --disk <repo>/WaterPumpGame.dsk`
  (the .app double-click does not work for the same reason).
- `--cas x.cas --autorun`, `--disk`, TAB = turbo, F1 reset, F3 mouse-joystick off, F10 zoom.
- Its RAM starts zeroed - real-machine-only bugs from uninitialised RAM do not show here.

## Claude sees, types and reads memory in the EP (2026-10-28, working)
**MAC ONLY.** It relies on our own patched ep128emu build and macOS tools (swiftc, perl setsid,
screencapture). On the Windows PC (WinTVC/TMC20) none of this exists - do not try `ep.sh` there; the user
looks at the screen and reports.
Our ep128emu build has a **command-file interface** (patch order: macos -> claude -> memmap -> gepel; `patches/ep128emu-claude.patch`, on top of
`ep128emu-macos.patch`, in `gui/gui.cpp` `fltkCheckCallback`): it polls
`~/Library/Application Support/ep128emu/claude/parancs.txt` every 50 ms, deletes it, runs its lines, logs each to
`kesz.txt`. Works whatever desktop (Space) the window is on - the user watches the EP on another desktop.
Front end: **`bash resources/emu_mac/ep.sh`** (waits for completion, relative names go into the claude folder):
- `indit [dsk]` - kills the old EP, starts it DETACHED (perl double-fork + setsid). Not `open` (launched that way
  the command poller never ran - cause unknown) and not `nohup &` (the VS Code task kills it). build_mac.sh uses it.
- `kep [f.png]` - next frame from the emulator's own frame buffer (768x576), then Read it.
- `folyam <ms> <db> [name]` - frame series + contact sheet `<name>_lap.png` (`epmontage.swift`), Read the sheet.
- `mem <U0|U1|U2|U3|VID|CPU|hex seg> <start hex> <len hex> [f.bin]` - raw dump. Segments: U0=F8 U1=F9 U2=FA
  U3=FB VID=FC (64K TVC); CPU = the current CPU paging view.
- `gepel '<text>'` - typed INSIDE the emulator (no host events, no focus, no lost keys). `"`=Shift+2, `~`=ESC
  (host End = Mac Fn+Right), `|`=Enter, `<`=Backspace, capital = Shift+letter.
- `gomb <name[+name]> [ms]` - hold keys: enter esc fel le bal jobb szokoz shift bs tab ctrl alt F1.. or one char.
- `ablak [f.png]` - old way, screencapture of the window (only when visible on the same desktop).
**TVC startup timing (user):** after start WAIT for the emulator + the VIDEOTON logo (~10 s); the logo needs a
key press (`ep.sh gomb szokoz 150`), then BASIC `ok`. Load from BASIC: `ep.sh gepel 'load"waterpg"|'`, the game
menu appears ~12-14 s later (yellow border = loading). Check with `kep` before typing. `ext2` = VT-DOS CLI: DOS
commands only, loading does NOT work there, leave with ESC (`~`). In BASIC LOAD the name may be abbreviated with `*`.
Lua is NOT available: the build uses `nolua=1`.
- `memablak [zar]` / `memkep [f.png]` - the TVC memory-map window (below); `memkep` renders it off-screen, works
  when it is covered or on another desktop.
- `gepel` (patch `patches/ep128emu-gepel.patch`, after memmap; 2026-10-28): used to drop keys - a press and its
  release landed in the same emulated moment (the VM runs in chunks) and after a GUI stall the `while` loop sent
  down+up at once. Now ONE key event per check-callback pass; hold 50 ms / gap 40 ms (tested OK down to 40/30;
  change at runtime: `gepelido <hold> <gap>` in parancs.txt). `gomb` min hold 120 ms (default 150).
  **Character mapping = Hungarian TVC keyboard by key POSITION** (measured): host `` ` ``->0, `/`->-, `0`->ö, `-`->ü,
  `=`->ó, `[`->ő, `]`->ú, `;`->é, `'`->á, `\`->ű, y<->z (QWERTZ); Shift+ 1=' 2=" 3=+ 4=! 5=% 6=/ 7== 8=( 9=)
  `` ` ``=& ,=? .=: /=_ , accented capitals = Shift. gepel translates all of these (UTF-8 accents too); other chars
  (`* ; < > # $ @`) are skipped and reported as HIBA (key not found yet).
- Diagnostics in the same patch: `hangido` (audio callbacks + underruns since last call; an underrun = silence =
  audible gap), `memido` (memory-map draw time). Measured 2026-10-28 in the game menu: 0 underruns in 10 s with
  the map window closed AND open; map draw ~6-10 ms at 10/s.

## TVC memory-map window (2026-10-28, patch `patches/ep128emu-memmap.patch`, on top of the other two)
Live view of the physical RAM pages, 10 refreshes/s, ~4 % extra CPU, only while open. Open: EP menu
**Debug -> TVC memoriaterkep (Cmd+Shift+M)** or `ep.sh memablak`. Code: `gui/memmap.cpp/.hpp` (own Fl_Double_Window,
no gui dependency) + hooks in `gui/gui.cpp` (menu item, `memablak`/`memkep` commands, copy loop in
`fltkCheckCallback` via `vm.getSegmentPtr(F8..FC)` + `vm.getMemoryPage(0..3)`, no VM lock - read-only).
- Layout: U0, U1, U2, U3 stacked (each 128x128 bytes, one row = $80), VID next to U2; right column = details panel
  (hovered byte; click = hex dump of that $80 row) and legend. Window resizable (picture scales; when shrunk a pixel
  shows the max of the bytes it covers). Left labels: what each CPU page holds now (green = usual, orange = other,
  e.g. SYS ROM); yellow frame = segment currently paged in.
- Per page header: used = non-zero bytes / 16384 (%), largest zero run ("max. szabad") - zero bytes of that run are
  tinted green. Verified in the game menu: U1 free from $6BE2, U2 from $B834, U3 $D44E-$E0E1 = matches the build.
- Value colours: 0 dark, $01 blue -> $40 cyan -> $80 green -> $C0 yellow -> $FF white. Pause button freezes it.
- Planned next (agreed with the user): symbol names from the build's .sym in the hover/details; activity heat map
  (read/write/execute, switchable - needs a memory-access hook); "sections" and "differs from loaded file" views
  together with the Mac port of memoria_terkep.ps1. User wants a section-based fill level there too.
Install after a rebuild: `rm` the old binary, `cp` the new one into `~/Documents/EP128TVCEmu/ep128emu.app/Contents/MacOS/`
and `codesign --force -s -` it (a binary copied over the old one is refused by launchd: "error 162").
Old binary kept as `ep128emu.bak_claude`. macOS permissions given to VS Code: Screen Recording, Accessibility.
