# SZOVEG.BIN a resources\szovegek\jatekszabaly.txt-bol (a JATEKSZABALY / HOW TO USE kepernyo szovegei).
# Formatum: rekordonkent  x, y, szoveg (ASCII; az ekezetes betuk 123..140), 0  ... vegen 255. Mindig 1024 bajtra kiegeszitve (a jatek Szov_Hossz = 1024).
# A jatek inditaskor az U3-ba toltí ($FA00), a Jelmagyarazat_Kepernyo onnan irja ki. Hasznalat: powershell -File resources\make_szoveg_bin.ps1
. (Join-Path $PSScriptRoot 'kozos.ps1')
$MERET = 1024
$b = New-Object System.Collections.Generic.List[byte]
$hiba = 0
# a font 123..140-es kodjai (a betukeszlet-szerkeszto sorrendje); kodpontokkal, hogy a szkript kodolasa ne szamitson
$HU = -join (@(0xC1,0xC9,0xCD,0xD3,0xD6,0x150,0xDA,0xDC,0x170,0xE1,0xE9,0xED,0xF3,0xF6,0x151,0xFA,0xFC,0x171) | ForEach-Object { [char]$_ })
foreach ($s in Get-Content (Ut "resources/szovegek/jatekszabaly.txt") -Encoding UTF8) {
  if ($s.Trim() -eq '' -or $s.StartsWith('#')) { continue }
  $r = $s.Split(';', 3)
  if ($r.Count -ne 3) { "HIBA: rossz sor: $s"; $hiba = 1; continue }
  $x = [int]$r[0]; $y = [int]$r[1]; $sz = $r[2]
  if ($x -gt 63 -or $y -gt 239) { "HIBA: kilog a kepernyorol: $s"; $hiba = 1 }
  foreach ($c in $sz.ToCharArray()) { if (([int]$c -lt 32 -or [int]$c -gt 122) -and $HU.IndexOf($c) -lt 0) { "HIBA: nem kiirhato karakter '$c' (csak ASCII 32..122 es a magyar ekezetesek): $s"; $hiba = 1 } }
  $b.Add([byte]$x); $b.Add([byte]$y)
  foreach ($c in $sz.ToCharArray()) { $k = $HU.IndexOf($c); if ($k -ge 0) { $b.Add([byte](123 + $k)) } else { $b.Add([byte][int]$c) } }
  $b.Add(0)
}
$b.Add(255)
if ($b.Count -gt $MERET) { "HIBA: a szoveg tul hosszu: $($b.Count) bajt (max $MERET)"; $hiba = 1 }
if ($hiba -eq 1) { exit 1 }
while ($b.Count -lt $MERET) { $b.Add(0) }
[IO.File]::WriteAllBytes((Ut "SZOVEG.BIN"), $b.ToArray())
"SZOVEG.BIN: $MERET bajt (`$FA00..`$FDFF), ebbol hasznalt: " + ($b.IndexOf(255) + 1)
