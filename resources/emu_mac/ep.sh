#!/bin/bash
# Claude szeme es keze az EP128 emulatorhoz (Mac). A javitott EP (patch: .claude/skills/tvc-emu-mac/patches/
# ep128emu-claude.patch) a ~/Library/Application Support/ep128emu/claude/parancs.txt-t figyeli - ablaktol,
# asztaltol (Space) fuggetlenul. Eredmenyek ugyanabban a mappaban, naplo: kesz.txt.
#   ep.sh indit [lemez.dsk]       - EP inditasa levalasztva (a VS Code feladat sem loheti le), regi peldany le
#   ep.sh kep [nev.png]           - kepkocka (768x576) -> kiirja az utvonalat
#   ep.sh folyam <ms> <db> [nev]  - kepsorozat + kontaktlap (<nev>_lap.png), kiirja a lap utvonalat
#   ep.sh mem <U0|U1|U2|U3|VID|CPU> <kezdo hex> <hossz hex> [nev.bin]  - nyers memoria
#   ep.sh gepel '<szoveg>'        - "=Shift+2  ~=ESC (Mac End)  |=Enter  <=Backspace  NAGYBETU=Shift+betu
#   ep.sh gomb <nev[+nev]> [ms]   - nyomva tartas: enter esc fel le bal jobb szokoz shift bs tab ctrl alt F1.. vagy 1 karakter
#   ep.sh ablak [nev.png]         - regi mod: az ablak fotoja (csak ha ugyanazon az asztalon latszik)
# Inditas utan: a TVC logo egy gombnyomasra tunik el (ep.sh gomb szokoz), betoltes: ep.sh gepel 'load"waterpg"|'
set -u
DIR="$(cd "$(dirname "$0")" && pwd)"
C="$HOME/Library/Application Support/ep128emu/claude"; mkdir -p "$C"
EMU="$HOME/Documents/EP128TVCEmu/ep128emu.app/Contents/MacOS/ep128emu"
DATA="$HOME/Library/Application Support/ep128emu"
BIN="${TMPDIR:-/tmp}/ep_eszkoz"; mkdir -p "$BIN"
tool() {  # Swift segedprogram forditasa, ha kell
  if [ ! -x "$BIN/$1" ] || [ "$DIR/$1.swift" -nt "$BIN/$1" ]; then swiftc -O -o "$BIN/$1" "$DIR/$1.swift" || exit 1; fi
}
pid() { pgrep -f "MacOS/ep128emu -tvc" | head -1; }
need() { [ -n "$(pid)" ] || { echo "nem fut az EP (ep.sh indit)"; exit 1; }; }
abs() { case "$1" in /*) echo "$1" ;; *) echo "$C/$1" ;; esac; }
# parancs kuldese; var, amig az EP elveszi, majd amig a kesz.txt-be <n> uj sor kerul
send() {
  local want="$1"; shift
  local before; before=$(wc -l < "$C/kesz.txt" 2>/dev/null || echo 0)
  printf '%s\n' "$@" > "$C/parancs.tmp" && mv "$C/parancs.tmp" "$C/parancs.txt"
  local i=0
  while [ $i -lt 600 ]; do
    local now; now=$(wc -l < "$C/kesz.txt" 2>/dev/null || echo 0)
    [ ! -f "$C/parancs.txt" ] && [ $((now - before)) -ge "$want" ] && { tail -n "$want" "$C/kesz.txt" | grep HIBA; return 0; }
    sleep 0.05; i=$((i + 1))
  done
  echo "idotullepes (fut az EP? ep.sh indit)"; return 1
}
case "${1:-}" in
  indit)
    DSK="${2:-$(cd "$DIR/../.." && pwd)/WaterPumpGame.dsk}"
    pkill -9 -f "MacOS/ep128emu -tvc" 2>/dev/null; sleep 0.5
    # nem "open": azzal inditva a parancsfajl-figyelo nem fut; nem "nohup &": a VS Code feladat a vegen lelovi
    ( cd / && perl -MPOSIX=setsid -e 'fork and exit; setsid; fork and exit; open STDIN,"</dev/null";
        open STDOUT,">/dev/null"; open STDERR,">&STDOUT"; exec @ARGV' "$EMU" -tvc -opengl \
        -cfg "$DATA/config/tvc/TVC_64k+_V12_VTDOS.cfg" "vm.speedPercentage=100" "sound.latency=0.1" \
        "floppy.a.imageFile=$DSK" )
    echo "EP elinditva: $DSK" ;;
  kep)    need; F=$(abs "${2:-kep.png}"); send 1 "kep $F" && echo "$F" ;;
  folyam) need; MS="${2:?ms}"; DB="${3:?db}"; P=$(abs "${4:-folyam}")
          rm -f "$P"_[0-9][0-9][0-9][0-9].png
          send "$((DB + 1))" "folyam $MS $DB $P" || exit 1
          tool epmontage; COLS=5; [ "$DB" -lt 5 ] && COLS=$DB
          "$BIN/epmontage" "${P}_lap.png" "$COLS" 300 "$P"_[0-9][0-9][0-9][0-9].png && echo "${P}_lap.png" ;;
  mem)    need; F=$(abs "${5:-mem.bin}"); send 1 "mem ${2:?seg} ${3:?kezdo} ${4:?hossz} $F" && echo "$F" ;;
  gepel)  need; send 2 "gepel ${2:-}" ;;
  gomb)   need; send 2 "gomb ${2:?nev} ${3:-100}" ;;
  ablak)  need; tool epwin; F=$(abs "${2:-ablak.png}"); ID=$("$BIN/epwin" "$(pid)")
          screencapture -x -o -l "$ID" "$F" 2>/dev/null || { echo "az EP ablaka nem lathato (masik asztalon / lekicsinyitve)"; exit 2; }
          sips -Z 768 "$F" >/dev/null && echo "$F" ;;
  *)      sed -n '2,13p' "$0"; exit 1 ;;
esac
