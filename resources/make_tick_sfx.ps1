# Rovid "tick" hang (pumpa lerakasa) - GE digi hang (DIGI_TYPE_2x4BIT, 4 kHz), mint a make_explosion_sfx.ps1
# Kimenet: resources\sfx\tick.wav (8 bit mono 4000 Hz, meghallgatashoz) + resources\sfx\tick.bin (2x4 bit/byte, alsó nibble eloszor, 0 byte = vege)
# Hasznalat: powershell -File resources\make_tick_sfx.ps1 [-Ms 40] [-Freq 1100] [-Tau 9]
param([int]$Ms = 40, [double]$Freq = 1100, [double]$Tau = 9)
$fs = 4000
$n = [int]([math]::Floor($Ms * $fs / 1000 / 2) * 2)
$rnd = New-Object System.Random(7)
$x = New-Object 'double[]' $n
$phase = 0.0
for ($i = 0; $i -lt $n; $i++) {
  $t = $i / $fs
  $env = [math]::Exp(-$t * 1000 / $Tau)
  $phase += 2 * [math]::PI * $Freq / $fs
  $click = 0.0; if ($i -lt 6) { $click = ($rnd.NextDouble() * 2 - 1) * (1 - $i / 6.0) * 0.7 }   # rovid kattanas az elejen
  $v = 0.9 * [math]::Sin($phase) * $env + $click
  if ($v -gt 1) { $v = 1 } elseif ($v -lt -1) { $v = -1 }
  $tail = [math]::Min(1.0, ($n - $i) / 12.0)
  $x[$i] = $v * $tail
}
$dir = Join-Path $PSScriptRoot 'sfx'
New-Item -ItemType Directory -Force $dir | Out-Null
$data = New-Object 'byte[]' $n
for ($i = 0; $i -lt $n; $i++) { $data[$i] = [byte][math]::Round(128 + 127 * $x[$i]) }
$ms2 = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms2)
$bw.Write([Text.Encoding]::ASCII.GetBytes('RIFF')); $bw.Write([int](36 + $n)); $bw.Write([Text.Encoding]::ASCII.GetBytes('WAVEfmt '))
$bw.Write([int]16); $bw.Write([int16]1); $bw.Write([int16]1); $bw.Write([int]$fs); $bw.Write([int]$fs); $bw.Write([int16]1); $bw.Write([int16]8)
$bw.Write([Text.Encoding]::ASCII.GetBytes('data')); $bw.Write([int]$n); $bw.Write($data)
[IO.File]::WriteAllBytes((Join-Path $dir 'tick.wav'), $ms2.ToArray())
$s = New-Object 'int[]' $n
for ($i = 0; $i -lt $n; $i++) { $q = [int][math]::Round(8 + 7.5 * $x[$i]); if ($q -lt 0) { $q = 0 } elseif ($q -gt 15) { $q = 15 }; $s[$i] = $q }
$bytes = New-Object System.Collections.Generic.List[byte]
for ($i = 0; $i -lt $n; $i += 2) {
  $lo = $s[$i]; $hi = $s[$i + 1]
  if ($lo -eq 0 -and $hi -eq 0) { $lo = 1 }
  $bytes.Add([byte]($lo -bor ($hi -shl 4)))
}
$bytes.Add(0)
[IO.File]::WriteAllBytes((Join-Path $dir 'tick.bin'), $bytes.ToArray())
"{0} minta ({1} ms) -> tick.wav {2} byte, tick.bin {3} byte" -f $n, ($n * 1000 / $fs), (44 + $n), $bytes.Count
