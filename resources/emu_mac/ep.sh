#!/bin/bash
# Claude szeme es keze az EP128 emulatorhoz (Mac). Engedely kell: Kepernyorogzites + Kisegito hozzaferes (VS Code).
#   bash resources/emu_mac/ep.sh kep [fajl.png]   - kepernyokep az EP ablakarol (768 px szeles), alap: $TMPDIR/ep.png
#   bash resources/emu_mac/ep.sh gepel '<szoveg>'  - billentyuk kozvetlenul az EP-nek (nem kell elol lennie)
#        jelek: "=Shift+2 (idezojel), ~=TVC ESC (Mac End = Fn+Jobbra), |=Enter, <=Backspace
#   pl. betoltes: ep.sh gepel 'load"waterpg"|'
# Megjegyzes: a kepernyokep a takart ablakot is latja, a lekicsinyitettet nem.
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="${TMPDIR:-/tmp}/ep_eszkoz"; mkdir -p "$BIN"
for t in epkey epwin; do
  if [ ! -x "$BIN/$t" ] || [ "$DIR/$t.swift" -nt "$BIN/$t" ]; then swiftc -O -o "$BIN/$t" "$DIR/$t.swift" || exit 1; fi
done
PID=$(pgrep -f "MacOS/ep128emu -tvc" | head -1)
[ -z "$PID" ] && { echo "nem fut az EP"; exit 1; }
case "${1:-}" in
  kep)   OUT="${2:-${TMPDIR:-/tmp}/ep.png}"; ID=$("$BIN/epwin" "$PID")
         screencapture -x -o -l "$ID" "$OUT" 2>/dev/null || { echo "az EP ablaka nem lathato (masik asztalon / lekicsinyitve / teljes kepernyos VS Code mellett)"; exit 2; }
         sips -Z 768 "$OUT" >/dev/null && echo "$OUT" ;;
  gepel) "$BIN/epkey" "$PID" "${2:-}" ;;
  *)     echo "hasznalat: ep.sh kep [fajl] | ep.sh gepel '<szoveg>'"; exit 1 ;;
esac
