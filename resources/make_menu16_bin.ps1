# MENU16.BIN a resources\Menu\WaterPump_Menu.json-bol (Sprite16 szerkeszto projekt): a 16 szinu fomenu grafikaja, NEM maszkolt, fejlec nelkul.
# Sorrend: Cim_C16 (100x40 px = 50 bajt x 40 sor), Menu_C16 (86x92 = 43 x 92), pumpa_C16_1..8 (6x10 = 3 x 10, fazisonkent).
# GR16: 1 bajt = 2 pixel; bal pixel I,G,R,B = 7,5,3,1. bit, jobb = 6,4,2,0. bit (szinindex = I*8+G*4+R*2+B; '.' = 7, a hatter).
# A jatek inditaskor az U2-be tolti ($A000-tol) es onnan masolja a kepernyore. Hasznalat: powershell -File resources\make_menu16_bin.ps1
. (Join-Path $PSScriptRoot 'kozos.ps1')
$j = Get-Content (Ut "resources/Menu/WaterPump_Menu.json") -Raw -Encoding UTF8 | ConvertFrom-Json
$out = New-Object System.Collections.Generic.List[byte]
function Kodol($nm) {
  $s = $script:j.sprites | Where-Object { $_.name -eq $nm }
  if (-not $s) { throw "nincs ilyen sprite: ${nm}" }
  if ($s.W % 2 -ne 0) { throw "${nm} szelessege paratlan: $($s.W)" }
  $px = [string]$s.frames[0]; $W = $s.W; $H = $s.H
  if ($px.Length -ne $W * $H) { throw "${nm}: $($px.Length) pixel, de W*H = $($W*$H)" }
  $kezd = $script:out.Count
  for ($y = 0; $y -lt $H; $y++) {
    for ($x = 0; $x -lt $W; $x += 2) {
      $b = 0
      for ($k = 0; $k -lt 2; $k++) {
        $ch = $px[$y * $W + $x + $k]
        $c = if ($ch -eq '.') { 7 } else { [Convert]::ToInt32([string]$ch, 16) }
        $i = ($c -shr 3) -band 1; $g = ($c -shr 2) -band 1; $r = ($c -shr 1) -band 1; $bl = $c -band 1
        $sh = 1 - $k   # bal pixel: 7,5,3,1 ; jobb: 6,4,2,0
        $b = $b -bor ($i -shl (6 + $sh)) -bor ($g -shl (4 + $sh)) -bor ($r -shl (2 + $sh)) -bor ($bl -shl $sh)
      }
      $script:out.Add([byte]$b)
    }
  }
  "  {0,-14} {1,3} x {2,3} px -> eltolas {3,5}, {4} bajt" -f $nm, $W, $H, $kezd, ($script:out.Count - $kezd)
}
Kodol 'Cim_C16'
Kodol 'Menu_C16'
for ($f = 1; $f -le 8; $f++) { Kodol "pumpa_C16_$f" }
[IO.File]::WriteAllBytes((Ut "MENU16.BIN"), $out.ToArray())
"MENU16.BIN: {0} bajt (U2: `$A000..`${1:X4})" -f $out.Count, (0xA000 + $out.Count - 1)
