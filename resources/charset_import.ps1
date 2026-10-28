# resources\images\charset.bmp -> resources\tvc_sprites\CharSetGR4.bin (a charset_export.ps1 parja)
# A BMP szelessege 4 px tobbszorose (1 byte = 4 px); a kep szelessege byte-ban = CharSetImgWidth, a magassaga = CharHeight.
# Szinek: szurke/vilagos = 0, fekete = 1, zold = 2, kek = 3.
# Kiirja a GE::InitCharSet-hez szukseges parametereket is.
param([string]$In = (Join-Path $PSScriptRoot "images/charset.bmp"), [string]$Out = (Join-Path $PSScriptRoot "tvc_sprites/CharSetGR4.bin"), [int]$Karakterek = 59)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$bmp = Bmp-Olvas (Resolve-Path $In).Path
$w = $bmp.W; $h = $bmp.H
if ($w % 4 -ne 0) { throw "A szelesseg ($w px) nem oszthato 4-gyel" }
$wb = $w / 4
function Idx($c) {
  if ($c.R -lt 40 -and $c.G -lt 40 -and $c.B -lt 40) { return 1 }
  if ([math]::Abs($c.R-$c.G) -lt 24 -and [math]::Abs($c.G-$c.B) -lt 24) { return 0 }
  if ($c.G -gt $c.R -and $c.G -gt $c.B) { return 2 }
  return 3
}
$bytes = New-Object byte[] ($wb*$h)
for ($y=0; $y -lt $h; $y++) { for ($bx=0; $bx -lt $wb; $bx++) { $v = 0
  for ($n=0; $n -lt 4; $n++) { $i = Idx (Bmp-Pixel $bmp ($bx*4+$n) $y); if ($i -band 1) { $v = $v -bor (0x80 -shr $n) }; if ($i -band 2) { $v = $v -bor (0x08 -shr $n) } }
  $bytes[$y*$wb+$bx] = [byte]$v } }
[IO.File]::WriteAllBytes($Out, $bytes)
$cw = $wb / $Karakterek
"$Out : $($bytes.Length) byte; GE::InitCharSet(#CharSet, $wb, $cw, $h);  (karakter: $($cw*4)x$h px, $Karakterek db)"