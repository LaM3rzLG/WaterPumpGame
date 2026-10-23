# resources\tvc_sprites\CharSetGR4.bin -> resources\images\charset.bmp (1:1, 472x7) + charset_elonezet.png (8x nagyitas, racs, feliratok)
# Formatum: GRAPHICS4 kep, 118 byte (= 472 px) szeles, 7 sor; 59 karakter egymas mellett, karakterenkent 2 byte (8 px).
# Karakter-sorrend: ASCII 32..90 (szokoz ! " # $ % & ' ( ) * + , - . / 0-9 : ; < = > ? @ A-Z) - a GE WriteText (kod-32)*CharWidth.
# Pixel n (0..3) egy bajton belul: szin = bit(7-n) + 2*bit(3-n). Szinek: 0 szurke C0C0C0, 1 fekete, 2 zold 04FF04, 3 kek 0000FF.
param([string]$In = "$PSScriptRoot\tvc_sprites\CharSetGR4.bin", [string]$Out = "$PSScriptRoot\images\charset.bmp", [int]$ImgWidth = 118, [int]$CharW = 2)
Add-Type -AssemblyName System.Drawing
$d = [IO.File]::ReadAllBytes($In)
$h = [int]($d.Length / $ImgWidth); $w = $ImgWidth * 4
$cols = @([Drawing.Color]::FromArgb(192,192,192), [Drawing.Color]::FromArgb(0,0,0), [Drawing.Color]::FromArgb(4,255,4), [Drawing.Color]::FromArgb(0,0,255))
$bmp = New-Object Drawing.Bitmap $w, $h, ([Drawing.Imaging.PixelFormat]::Format24bppRgb)
for ($y=0; $y -lt $h; $y++) { for ($bx=0; $bx -lt $ImgWidth; $bx++) { $v = $d[$y*$ImgWidth+$bx]
  for ($n=0; $n -lt 4; $n++) { $c = ((($v -shr (7-$n)) -band 1)) + 2*((($v -shr (3-$n)) -band 1)); $bmp.SetPixel($bx*4+$n, $y, $cols[$c]) } } }
$bmp.Save($Out, [Drawing.Imaging.ImageFormat]::Bmp)
# elonezet
$z = 8; $cw = $CharW*4; $nch = [int]($ImgWidth / $CharW); $pw = $w*$z; $ph = $h*$z + 14
$pv = New-Object Drawing.Bitmap $pw, $ph; $g = [Drawing.Graphics]::FromImage($pv); $g.Clear([Drawing.Color]::White)
$g.InterpolationMode = 'NearestNeighbor'; $g.PixelOffsetMode = 'Half'; $g.DrawImage($bmp, 0, 0, $pw, $h*$z)
$pen = New-Object Drawing.Pen ([Drawing.Color]::FromArgb(255,0,0)), 1
for ($i=0; $i -le $nch; $i++) { $g.DrawLine($pen, $i*$cw*$z, 0, $i*$cw*$z, $h*$z) }
$font = New-Object Drawing.Font 'Consolas', 8
for ($i=0; $i -lt $nch; $i++) { $ch = [char](32+$i); $lab = if ($i -eq 0) { 'SP' } else { "$ch" }; $g.DrawString($lab, $font, [Drawing.Brushes]::Black, $i*$cw*$z + 20, $h*$z) }
$pv.Save(($Out -replace '\.bmp$','_elonezet.png'), [Drawing.Imaging.ImageFormat]::Png)
$g.Dispose(); $pv.Dispose(); $bmp.Dispose()
"$Out : ${w}x${h} px, $nch karakter (${cw}x${h} px), ASCII 32..$(31+$nch)"