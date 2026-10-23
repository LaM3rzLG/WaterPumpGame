# Akna-robbanas hangeffekt (rovid) - GE digi hang (DIGI_TYPE_2x4BIT, 4 kHz)
# Kimenet: resources\sfx\akna.wav (8 bit mono 4000 Hz, meghallgatashoz / TVC digi-hez)
#          resources\sfx\akna.bin (2x4 bit/byte, kesz a GE::PlayDigiSound-hoz; az utolso byte 0 = vege)
# Hasznalat: powershell -File resources\make_akna_sfx.ps1 [-Sec 1.4] [-Seed 12345]
# A 2x4BIT formatum a GE.tru SoundITHandler2-bol: egy byte = 2 minta, ELOSZOR az ALSO nibble, utana a FELSO; 0 byte = a hang vege
# (ezert a nem-utolso byte-ok soha nem lehetnek 0). A minta 0..15 (4 bites szint), a csend = 8.
param([double]$Sec = 0.55, [int]$Seed = 777)
$fs = 4000
$n = [int]([math]::Floor($Sec * $fs / 2) * 2)   # paros mintaszam
$rnd = New-Object System.Random($Seed)
$x = New-Object 'double[]' $n
$lp = 0.0; $phase = 0.0
for ($i = 0; $i -lt $n; $i++) {
  $t = $i / $fs
  # zajos test: sotetedo (alul-atereszto szuro: eleinte hangos-fenyes, aztan morajlo)
  $alpha = 0.08 + 0.55 * [math]::Exp(-$t * 5)
  $noise = $rnd.NextDouble() * 2 - 1
  $lp += $alpha * ($noise - $lp)
  $attack = [math]::Min(1.0, $t / 0.006)
  $env = $attack * [math]::Exp(-$t * 6.0)
  # melyen lezuhano dobbenes
  $f = 70 + 200 * [math]::Exp(-$t * 7)
  $phase += 2 * [math]::PI * $f / $fs
  $thump = [math]::Sin($phase) * [math]::Exp(-$t * 3.5)
  # ropogas az elejen
  $crack = 0.0
  if ($t -lt 0.25 -and $rnd.NextDouble() -lt 0.06) { $crack = ($rnd.NextDouble() * 2 - 1) * (1 - $t / 0.25) }
  $v = 2.4 * $lp * $env + 0.55 * $thump + 0.6 * $crack
  if ($v -gt 1) { $v = 1 } elseif ($v -lt -1) { $v = -1 }
  # 4 biten a halk uv elveszne: kompresszio (a lecsengo r??sz is hallhat?? marad)
  $v = [math]::Sign($v) * [math]::Pow([math]::Abs($v), 0.55)
  # kiveg a vegen (kattanas ellen)
  $tail = [math]::Min(1.0, ($n - $i) / 200.0)
  $x[$i] = $v * $tail
}
$dir = Join-Path $PSScriptRoot 'sfx'
New-Item -ItemType Directory -Force $dir | Out-Null
# --- WAV (8 bit unsigned mono)
$data = New-Object 'byte[]' $n
for ($i = 0; $i -lt $n; $i++) { $data[$i] = [byte][math]::Round(128 + 127 * $x[$i]) }
$ms = New-Object System.IO.MemoryStream
$bw = New-Object System.IO.BinaryWriter($ms)
$bw.Write([Text.Encoding]::ASCII.GetBytes('RIFF')); $bw.Write([int](36 + $n)); $bw.Write([Text.Encoding]::ASCII.GetBytes('WAVEfmt '))
$bw.Write([int]16); $bw.Write([int16]1); $bw.Write([int16]1); $bw.Write([int]$fs); $bw.Write([int]$fs); $bw.Write([int16]1); $bw.Write([int16]8)
$bw.Write([Text.Encoding]::ASCII.GetBytes('data')); $bw.Write([int]$n); $bw.Write($data)
[IO.File]::WriteAllBytes((Join-Path $dir 'akna.wav'), $ms.ToArray())
# --- BIN (2x4 bit)
$s = New-Object 'int[]' $n
for ($i = 0; $i -lt $n; $i++) {
  $q = [int][math]::Round(8 + 7.5 * $x[$i]); if ($q -lt 0) { $q = 0 } elseif ($q -gt 15) { $q = 15 }; $s[$i] = $q
}
$bytes = New-Object System.Collections.Generic.List[byte]
for ($i = 0; $i -lt $n; $i += 2) {
  $lo = $s[$i]; $hi = $s[$i + 1]
  if ($lo -eq 0 -and $hi -eq 0) { $lo = 1 }   # a 0 byte a vege-jel
  $bytes.Add([byte]($lo -bor ($hi -shl 4)))
}
$bytes.Add(0)
[IO.File]::WriteAllBytes((Join-Path $dir 'akna.bin'), $bytes.ToArray())
"{0} minta ({1:N2} s @ {2} Hz) -> akna.wav {3} byte, akna.bin {4} byte" -f $n, ($n / $fs), $fs, (44 + $n), $bytes.Count

