# nuke_c_000..009.bmp -> resources\tvc_sprites\nuke.bin (Bery maszkolt, fejlec egyszer) -> masolat a projekt gyokerebe
# (az SD-kartyara a jatek MELLE kell masolni: a program induláskor a "nuke.bin" fajlt tolti az U3-ba).
# Hasznalat: powershell -File resources\nuke_build.ps1 [-Prefix nuke_c_]
param([string]$Prefix = "nuke_c_")
$root = Split-Path $PSScriptRoot -Parent
$tmp = Join-Path $env:TEMP "nuke_build"; New-Item -ItemType Directory -Force $tmp | Out-Null
$all = New-Object System.Collections.Generic.List[byte]
foreach ($n in 0..9) {
  $out = Join-Path $tmp "ph$n.bin"
  & powershell -File (Join-Path $PSScriptRoot "nukebomb_to_bin.ps1") -In (Join-Path $root ("resources\images\{0}{1:D3}.bmp" -f $Prefix,$n)) -Out $out | Out-Null
  $b = [IO.File]::ReadAllBytes($out)
  if ($n -eq 0) { $all.AddRange([byte[]]$b[0..2]) }
  $all.AddRange([byte[]]$b[3..($b.Length-1)])
}
[IO.File]::WriteAllBytes((Join-Path $root "resources\tvc_sprites\nuke.bin"), $all.ToArray())
Copy-Item (Join-Path $root "resources\tvc_sprites\nuke.bin") (Join-Path $root "nuke.bin") -Force
"nuke.bin: $($all.Count) byte (a WaterPumpGame.ras Nuke_Len ertekevel egyezzen: 15683)"
