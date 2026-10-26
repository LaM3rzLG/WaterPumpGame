# SZOVEG.BIN a resources\szovegek\jatekszabaly.txt-bol (a JATEKSZABALY / HOW TO USE kepernyo szovegei).
# Formatum: rekordonkent  x, y, szoveg (ASCII), 0  ... vegen 255. Mindig 1024 bajtra kiegeszitve (a jatek Szov_Hossz = 1024).
# A jatek inditaskor az U3-ba toltí ($FA00), a Jelmagyarazat_Kepernyo onnan irja ki. Hasznalat: powershell -File resources\make_szoveg_bin.ps1
$dir = Split-Path $PSScriptRoot -Parent
$MERET = 1024
$b = New-Object System.Collections.Generic.List[byte]
$hiba = 0
foreach ($s in Get-Content "$dir\resources\szovegek\jatekszabaly.txt" -Encoding UTF8) {
  if ($s.Trim() -eq '' -or $s.StartsWith('#')) { continue }
  $r = $s.Split(';', 3)
  if ($r.Count -ne 3) { "HIBA: rossz sor: $s"; $hiba = 1; continue }
  $x = [int]$r[0]; $y = [int]$r[1]; $sz = $r[2]
  if ($x -gt 63 -or $y -gt 239) { "HIBA: kilog a kepernyorol: $s"; $hiba = 1 }
  foreach ($c in $sz.ToCharArray()) { if ([int]$c -lt 32 -or [int]$c -gt 90) { "HIBA: nem kiirhato karakter '$c' (csak 32..90, ekezet nelkul): $s"; $hiba = 1 } }
  $b.Add([byte]$x); $b.Add([byte]$y)
  foreach ($c in $sz.ToCharArray()) { $b.Add([byte][int]$c) }
  $b.Add(0)
}
$b.Add(255)
if ($b.Count -gt $MERET) { "HIBA: a szoveg tul hosszu: $($b.Count) bajt (max $MERET)"; $hiba = 1 }
if ($hiba -eq 1) { exit 1 }
while ($b.Count -lt $MERET) { $b.Add(0) }
[IO.File]::WriteAllBytes("$dir\SZOVEG.BIN", $b.ToArray())
"SZOVEG.BIN: $MERET bajt (`$FA00..`$FDFF), ebbol hasznalt: " + ($b.IndexOf(255) + 1)
