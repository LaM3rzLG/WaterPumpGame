# nuke_c_000..009.bmp -> resources\tvc_sprites\nuke.bin (Bery maszkolt, fejlec egyszer) -> masolat a projekt gyokerebe
# (az SD-kartyara a jatek MELLE kell masolni: a program induláskor a "nuke.bin" fajlt tolti az U3-ba).
# Hasznalat: powershell -File resources\nuke_build.ps1 [-Prefix nuke_c_]
param([string]$Prefix = "nuke_c_")
. (Join-Path $PSScriptRoot 'kozos.ps1')
$root = $Gyoker
$tmp = Join-Path $Temp "nuke_build"; New-Item -ItemType Directory -Force $tmp | Out-Null
$all = New-Object System.Collections.Generic.List[byte]
foreach ($n in 0..9) {
  $out = Join-Path $tmp "ph$n.bin"
  & (Join-Path $PSScriptRoot "nukebomb_to_bin.ps1") -In (Ut ("resources/images/{0}{1:D3}.bmp" -f $Prefix,$n)) -Out $out | Out-Null
  $b = [IO.File]::ReadAllBytes($out)
  if ($n -eq 0) { $all.AddRange([byte[]]$b[0..2]) }
  $all.AddRange([byte[]]$b[3..($b.Length-1)])
}
[IO.File]::WriteAllBytes((Ut "resources/tvc_sprites/nuke.bin"), $all.ToArray())
Copy-Item (Ut "resources/tvc_sprites/nuke.bin") (Join-Path $root "nuke.bin") -Force
"nuke.bin: $($all.Count) byte (a WaterPumpGame.ras Nuke_Len ertekevel egyezzen: 15683)"
