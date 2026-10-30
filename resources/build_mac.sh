#!/bin/bash
# WaterPumpGame - Mac build: a kozos mag (TVC_Kozos/mac/build_kozos.sh) + a projekt beallitasai.
#   bash resources/build_mac.sh          (emulatorral)     bash resources/build_mac.sh --no-emu (csak build)
# Uj lemezfajl: a LEMEZ_FAJLOK-ba ES a build.ps1 -Files listajaba is.
cd "$(dirname "$0")/.." || exit 1
KOZOS="${TVC_KOZOS:-$(cd .. && pwd)/TVC_Kozos}"
[ -f "$KOZOS/mac/build_kozos.sh" ] || { echo "nincs meg a kozos mappa: $KOZOS (TVC_KOZOS=...)"; exit 1; }
NEV=WaterPumpGame
TRSE_PROJEKT=LG_TVC_Projects.trse
LEMEZ_FAJLOK="'WaterPumpGame.cas=WATERPG.CAS','SPRITES.BIN=SPRITES.BIN','PALYAK_lemez.BIN=PALYAK.BIN','SZABALY.BIN=SZABALY.BIN','MENU16.BIN=MENU16.BIN','U3KOD.BIN=U3KOD.BIN'"
BETOLTO=WATERPG
utana() {    # U3 boot-javitas (minden forditas utan kell)
  pwsh -NoProfile -File resources/u3_boot_patch.ps1
}
source "$KOZOS/mac/build_kozos.sh"
