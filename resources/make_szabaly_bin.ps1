# SZABALY.BIN a resources\szovegek\szabaly.txt-bol (a tobboldalas JATEKSZABALY kepernyo).
# A szabaly.txt SIMA SZOVEG, a tordelest es a sorok helyet ez a szkript szamolja a font.bin szelessegeibol:
#   "N. oldal" sor = uj oldal;  az oldal elso sora = cim (kozepen, fent);  utolso sora = labsor (kozepen, lent);
#   CSUPA NAGYBETUS sor = fejezetcim (elotte kis hezag);  minden mas sor = bekezdes (automatikusan tordelve);
#   "BAL | szoveg" sor = jelmagyarazat-tetel: balra ikon(ok) (@PUMPA @TALAJ @KRATER @SZIKLA @FAL @KERET @VIRUS @BOMBA @AKNA)
#     vagy felirat (pl. "R" gomb: a szoveg ele kerul); a szoveg TETEL_X-tol tordelve;  elotte kis hezag.
#   ures sor nem szamit;  "#"-tel kezdodo sor = megjegyzes.
# Kimenet: oldalankent rekordok (x, y, szoveg, 0) es ikon-rekordok (253, ikon, x, y), oldal vege 254, a legvegen 255; 4096 bajtra kiegeszitve.
# A jatek inditaskor az U2 $9000-ra tolti, a Szabaly_Kepernyo oldalankent a Pause_Buf-ba ($E700) masolja es onnan irja ki.
# Hasznalat: powershell -File resources\make_szabaly_bin.ps1   (majd make_dsk.ps1)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$MERET = 4096                         # U2 $9000..$9FFF; egy oldal legfeljebb 2048 bajt (a Pause_Buf merete)
$BAL = 2; $JOBB = 63                  # a bekezdesek bal szele es a jobb hatar (byte-oszlop)
$CIM_Y = 2; $ELSO_Y = 18; $LAB_Y = 226; $ALJ = 219   # a cim, az elso szovegsor, a labsor helye; a szoveg utolso sora legfeljebb itt kezdodhet
$TETEL_X = 8                           # a jelmagyarazat-tetelek szovegenek bal szele
$IKON = @{ PUMPA = 0; TALAJ = 1; KRATER = 2; SZIKLA = 3; FAL = 4; KERET = 5; VIRUS = 6; BOMBA = 7; AKNA = 8 }   # a Szov_Ikon (WaterPumpGame.ras) sorszamai
$font = [IO.File]::ReadAllBytes((Ut "resources/tvc_sprites/font.bin"))
$N = ($font.Length - 1) / (1 + ($font[0] -band 15))
# a font 123..140-es kodjai (a betukeszlet-szerkeszto sorrendje); kodpontokkal, hogy a szkript kodolasa ne szamitson
$HU = -join (@(0xC1,0xC9,0xCD,0xD3,0xD6,0x150,0xDA,0xDC,0x170,0xE1,0xE9,0xED,0xF3,0xF6,0x151,0xFA,0xFC,0x171) | ForEach-Object { [char]$_ })
$script:hiba = 0
function Kod([char]$c) { $k = $HU.IndexOf($c); if ($k -ge 0) { return 123 + $k }; if ([int]$c -ge 32 -and [int]$c -le 122) { return [int]$c }; "HIBA: nem kiirhato karakter '$c'" | Write-Host; $script:hiba = 1; return 32 }
function Px([string]$s) { $p = 0; foreach ($c in $s.ToCharArray()) { $i = (Kod $c) - 32; if ($i -lt $N) { $p += $font[1 + $i] } }; return $p }
function Szel([string]$s) { return [Math]::Floor(((Px $s) + 3) / 4) }
function Tordel([string]$s, $balx = $BAL) {          # a bekezdes sorokra bontasa (szohatarnal), hogy BAL-tol JOBB-ig elferjen
  $sorok = @(); $akt = ''
  foreach ($w in ($s -split ' +' | Where-Object { $_ -ne '' })) {
    $proba = if ($akt -eq '') { $w } else { "$akt $w" }
    if ($balx + (Szel $proba) -le $JOBB -or $akt -eq '') { $akt = $proba } else { $sorok += $akt; $akt = $w }
  }
  if ($akt -ne '') { $sorok += $akt }
  return ,$sorok
}
function Nagybetus([string]$s) { return ($s -cmatch '\p{Lu}') -and -not ($s -cmatch '\p{Ll}') }

# oldalakra bontas
$oldalak = @(); $akt = $null
foreach ($s in Get-Content (Ut "resources/szovegek/szabaly.txt") -Encoding UTF8) {
  $s = $s.Trim()
  if ($s -match '^\d+\.\s*oldal$') { if ($akt) { $oldalak += ,$akt }; $akt = New-Object System.Collections.ArrayList; continue }
  if ($s -eq '' -or $s.StartsWith('#')) { continue }
  if (-not $akt) { $akt = New-Object System.Collections.ArrayList }
  [void]$akt.Add($s)
}
if ($akt) { $oldalak += ,$akt }

$b = New-Object System.Collections.Generic.List[byte]
function Rekord($x, $y, [string]$s) { $b.Add([byte]$x); $b.Add([byte]$y); foreach ($c in $s.ToCharArray()) { $b.Add([byte](Kod $c)) }; $b.Add(0) }
$on = 0
foreach ($o in $oldalak) {
  $on++
  if ($o.Count -lt 2) { "HIBA: a(z) $on. oldalon nincs cim es labsor"; $hiba = 1; continue }
  # sorkoz: 10, fejezet elott +5; ha nem fer el, 9 es +4
  foreach ($kz in @(@(10, 5), @(9, 4), @(9, 2))) {
    $sorok = @(); $y = $ELSO_Y; $elso = 1
    for ($k = 1; $k -lt $o.Count - 1; $k++) {
      $s = $o[$k]
      if ($s.Contains(" | ")) {
        $resz = $s.Split("|", 2); $cimke = $resz[0].Trim(); $szov = $resz[1].Trim(); if ($elso -eq 0) { $y += $kz[1] }
        if ($cimke.StartsWith("@")) { $ix = $BAL; foreach ($inev in ($cimke -split " +")) { $inev = $inev.TrimStart("@"); if (-not $IKON.ContainsKey($inev)) { "HIBA: ismeretlen ikon: $inev"; $script:hiba = 1; continue }; $sorok += ,@("I", $IKON[$inev], $ix, ($y - 1)); $ix += 3 } }
        else { $szov = "$cimke`: $szov" }      # felirat (pl. "R" gomb): a szoveg elejere, az ikonos tetelek szovegevel egy vonalba
        $ts = Tordel $szov $TETEL_X; foreach ($t in $ts) { $sorok += ,@($TETEL_X, $y, $t); $y += $kz[0] }
        if ($ts.Count -lt 2) { $y += 2 }      # az ikon 10 sor magas: egysoros tetel utan is legyen hely
      }
      elseif (Nagybetus $s) { if ($elso -eq 0) { $y += $kz[1] }; $sorok += ,@($BAL, $y, $s); $y += $kz[0] }
      else { foreach ($t in (Tordel $s)) { $sorok += ,@($BAL, $y, $t); $y += $kz[0] } }
      $elso = 0
    }
    if ($y - $kz[0] -le $ALJ) { break }
  }
  if ($y - $kz[0] -gt $ALJ) { "HIBA: a(z) $on. oldal nem fer el (az utolso sor a $($y - $kz[0]). pixelsoron kezdodne, max $ALJ) - rovidits rajta"; $hiba = 1 }
  "$on. oldal: $($sorok.Count) elem, sorkoz $($kz[0]), utolso sor y = $($y - $kz[0])"
  if ($on -gt 1) { $b.Add(254) }
  $kezd = $b.Count
  Rekord ([Math]::Floor((64 - (Szel $o[0])) / 2)) $CIM_Y $o[0]
  foreach ($r in $sorok) { if ($r[0] -eq "I") { $b.Add(253); $b.Add([byte]$r[1]); $b.Add([byte]$r[2]); $b.Add([byte]$r[3]) } else { Rekord $r[0] $r[1] $r[2] } }
  $l = $o[$o.Count - 1]; Rekord ([Math]::Floor((64 - (Szel $l)) / 2)) $LAB_Y $l
  if ($b.Count - $kezd + 1 -gt 2048) { "HIBA: a(z) $on. oldal tul hosszu: $($b.Count - $kezd + 1) bajt (max 2048)"; $hiba = 1 }
}
$b.Add(255)
if ($b.Count -gt $MERET) { "HIBA: a szoveg tul hosszu: $($b.Count) bajt (max $MERET)"; $hiba = 1 }
if ($hiba -eq 1 -or $script:hiba -eq 1) { exit 1 }
while ($b.Count -lt $MERET) { $b.Add(0) }
[IO.File]::WriteAllBytes((Ut "SZABALY.BIN"), $b.ToArray())
"SZABALY.BIN: $MERET bajt, $on oldal, ebbol hasznalt: " + ($b.IndexOf(255) + 1)
