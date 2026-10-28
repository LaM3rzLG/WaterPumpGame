#!/bin/bash
# Teljes build MACEN (a resources/build.ps1 Mac-es parja):
#   forditas (TRSE CLI) -> u3_boot_patch.ps1 -> WaterPumpGame.dsk -> EP128 emulator inditasa a friss lemezzel.
# Hasznalat (a projekt gyokereben):  bash resources/build_mac.sh          (emulatorral)
#                                    bash resources/build_mac.sh --no-emu (csak build)
# Kell: /Applications/trse.app, pwsh (brew install powershell), ~/Documents/EP128TVCEmu (skill: tvc-emu-mac).
# A unitokat (TVC.tru, GE.tru, ...) a repo tvc_units/ mappajabol masolja a TRSE-be (Windowsrol jonnek).
# A TRSE Macen bezaraskor osszeomlik, ezert nincs sajat trse.ini-je: a beallitasokat a resources/trse_mac.ini adja
# (a Windows-os nightly trse.ini-jebol).
set -u
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
TRSE="/Applications/trse.app/Contents/MacOS/trse"
EMU_DIR="$HOME/Documents/EP128TVCEmu"
TEMPLATE="${TVC_DSK_TEMPLATE:-$HOME/Downloads/TVC/TVC_CEmu/roms/Lemmings.dsk}"
LOG="${TMPDIR:-/tmp}/trse_out_mac.txt"

# 0. unitok: a repo tvc_units/ mappaja a mervado (Windowsrol jon) -> a Mac-es TRSE units/TVC-be, ha elter
UNITS="/Applications/trse.app/units/TVC"
for f in TVC.tru GE.tru crtc.tru music.tru system.tru text.tru; do
  if [ -f "tvc_units/$f" ] && ! cmp -s "tvc_units/$f" "$UNITS/$f"; then
    cp "tvc_units/$f" "$UNITS/$f" && echo "unit frissitve: $f"
  fi
done

# 1. forditas
rm -f WaterPumpGame.cas
"$TRSE" -cli op=project settings="$ROOT/resources/trse_mac.ini" project="$ROOT/LG_TVC_Projects.trse" \
  input_file="$ROOT/WaterPumpGame.ras" assemble=yes > "$LOG" 2>&1
RC=$?
if [ $RC -ne 0 ] || [ ! -f WaterPumpGame.cas ] || grep -v '^Warning' "$LOG" | grep -q -i -E 'error|fatal'; then
  echo "FORDITASI HIBA (exit $RC):"
  grep -v '^Warning' "$LOG" | tail -15
  exit 1
fi
echo "forditas OK"

# 2. U3 boot-javitas (minden forditas utan kell)
pwsh -NoProfile -File resources/u3_boot_patch.ps1 || { echo "U3 BOOT-JAVITAS HIBA - a lemezkep NEM keszult el"; exit 1; }

# 3. lemezkep
pwsh -NoProfile -Command "& ./resources/make_dsk.ps1 -Template '$TEMPLATE' -Files @('WaterPumpGame.cas=WATERPG.CAS','SPRITES.BIN=SPRITES.BIN','PALYAK_lemez.BIN=PALYAK.BIN','SZABALY.BIN=SZABALY.BIN','MENU16.BIN=MENU16.BIN','U3KOD.BIN=U3KOD.BIN') | Select-Object -Last 1" \
  || { echo "LEMEZKEP HIBA"; exit 1; }

# 4. emulator (TVC 64k+, BASIC 1.2, VT-DOS) - a regi peldanyt bezarja (SIGTERM-re nem all le, ezert -9)
if [ "${1:-}" != "--no-emu" ]; then
  # leválasztva indul (resources/emu_mac/ep.sh indit): a VS Code feladat a vegen a sajat folyamatfajat lelovi
  # (nohup & is), "open"-nel inditva pedig a Claude-parancsfajl figyelo nem fut.
  EMU_DATA="$HOME/Library/Application Support/ep128emu"
  if [ ! -f "$EMU_DATA/roms/tvc12_sys.rom" ] && [ -d "$EMU_DIR/ep128emu_data" ]; then
    mkdir -p "$EMU_DATA" && rsync -a "$EMU_DIR/ep128emu_data/" "$EMU_DATA/"   # ROM-ok visszaallitasa
  fi
  if [ -d "$EMU_DIR/ep128emu.app" ]; then
    bash "$ROOT/resources/emu_mac/ep.sh" indit "$ROOT/WaterPumpGame.dsk" >/dev/null
    echo "emulator elinditva - a TVC-n: gomb (logo), majd  load\"WATERPG\""
  else
    echo "nincs emulator: $EMU_DIR/ep128emu.app"
  fi
fi
