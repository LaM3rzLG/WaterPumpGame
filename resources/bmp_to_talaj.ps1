# 8x8-as BMP -> resources\tvc_sprites\<nev>.bin (Bery/GE, NEM maszkolt, GRAPHICS4): fejlec 01 02 08 + 8 sor x 2 bajt.
# Szinek (palettaindex): szurke/vilagos = 0, fekete = 1, zold = 2, kek = 3. Pixel n (0..3) egy bajton belul:
# a szin also bitje -> bit(7-n), felso bitje -> bit(3-n)  (mint a talaj1/talaj2/fal.bin).
# Hasznalat: powershell -File resources\bmp_to_talaj.ps1 -In resources\images\talaj3.bmp -Out resources\tvc_sprites\talaj3.bin
param([string]$In, [string]$Out)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$bmp = Bmp-Olvas (Resolve-Path $In).Path
if ($bmp.W -ne 8 -or $bmp.H -ne 8) { throw "8x8-as BMP kell ($($bmp.W)x$($bmp.H))" }
function Idx($c) {
  if ($c.R -lt 40 -and $c.G -lt 40 -and $c.B -lt 40) { return 1 }
  if ([math]::Abs($c.R-$c.G) -lt 24 -and [math]::Abs($c.G-$c.B) -lt 24) { return 0 }
  if ($c.G -gt $c.R -and $c.G -gt $c.B) { return 2 }
  return 3
}
$bytes = New-Object System.Collections.Generic.List[byte]
$bytes.Add(1); $bytes.Add(2); $bytes.Add(8)
for ($y = 0; $y -lt 8; $y++) {
  for ($bx = 0; $bx -lt 2; $bx++) {
    $v = 0
    for ($n = 0; $n -lt 4; $n++) {
      $i = Idx (Bmp-Pixel $bmp ($bx*4+$n) $y)
      if ($i -band 1) { $v = $v -bor (0x80 -shr $n) }
      if ($i -band 2) { $v = $v -bor (0x08 -shr $n) }
    }
    $bytes.Add([byte]$v)
  }
}
$outPath = if ([IO.Path]::IsPathRooted($Out)) { $Out } else { Join-Path (Get-Location) $Out }
[IO.File]::WriteAllBytes($outPath, $bytes.ToArray())
"{0} -> {1}: {2} bajt" -f $In, $Out, $bytes.Count
