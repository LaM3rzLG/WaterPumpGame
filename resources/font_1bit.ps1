# A regi (4 szinu, 1/2 byte szeles) font.bin atalakitasa az uj, 1 bit/pixeles, PIXEL-szelessegu formatumra.
# Uj formatum (font.bin, a jatek $E100-ra tolti, a SPRITES.BIN resze):
#   [0]      = $80 + magassag (sorok szama, 1..15)  - a $80 jelzi az uj formatumot
#   [1..91]  = szelesseg PIXELBEN (0..8) az ASCII 32..122 karakterekhez; a szelesseg a betukoz is (0 = nincs ilyen karakter)
#   [92..]   = a kepek SORONKENT: sor r, karakter i -> [92 + r*91 + i], 1 byte = 8 pixel, bit7 = bal szelso pixel
# A szelesseg: a legjobboldalibb hasznalt oszlop + 2 (1 pixel betukoz); szokoz es ures karakter: 4; a szamjegyek egyforma szelesek (HUD).
# Hasznalat: powershell -File resources\font_1bit.ps1   (a regi font mentese: resources\tvc_sprites\font_regi4szin.bin)
$dir = Split-Path $PSScriptRoot -Parent
$f = "$dir\resources\tvc_sprites\font.bin"
$b = [IO.File]::ReadAllBytes($f)
if ($b[0] -band 0x80) { "A font.bin mar az uj formatumu."; exit 0 }
$H = $b[0]; $N = 91; $W = 182
if ($b.Length -ne 1 + $N + $W * $H) { "HIBA: nem a regi formatum ($($b.Length) byte)"; exit 1 }
Copy-Item $f "$dir\resources\tvc_sprites\font_regi4szin.bin" -Force
$rows = New-Object byte[] ($N * $H)
$wid = New-Object byte[] $N
for ($i = 0; $i -lt $N; $i++) {
  $max = -1
  for ($r = 0; $r -lt $H; $r++) {
    $v = 0
    for ($c = 0; $c -lt 8; $c++) {
      $byte = $b[1 + $N + $r * $W + 2 * $i + ($c -shr 2)]; $p = $c -band 3
      $on = (($byte -shr (7 - $p)) -band 1) -bor (($byte -shr (3 - $p)) -band 1)
      if ($on) { $v = $v -bor (0x80 -shr $c); if ($c -gt $max) { $max = $c } }
    }
    $rows[$i * $H + $r] = [byte]$v
  }
  $wid[$i] = if ($max -lt 0) { 4 } else { [math]::Min(8, $max + 2) }
}
$dmax = 0; for ($c = 48; $c -le 57; $c++) { $dmax = [math]::Max($dmax, $wid[$c - 32]) }
for ($c = 48; $c -le 57; $c++) { $wid[$c - 32] = $dmax }
$o = New-Object System.Collections.Generic.List[byte]
$o.Add([byte](0x80 + $H))
$o.AddRange($wid)
for ($r = 0; $r -lt $H; $r++) { for ($i = 0; $i -lt $N; $i++) { $o.Add($rows[$i * $H + $r]) } }
[IO.File]::WriteAllBytes($f, $o.ToArray())
"font.bin: uj formatum, $($o.Count) byte (magassag $H). Szelessegek:"
$s = ""; for ($i = 1; $i -lt $N; $i++) { $s += [char](32 + $i) + "=" + $wid[$i] + " " }; $s
