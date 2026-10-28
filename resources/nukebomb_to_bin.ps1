# nukebomb.bmp -> resources\tvc_sprites\nukebomb.bin  (Bery/GE MASZKOLT sprite, GRAPHICS4)
# Fejlec: 02, szelesseg (byte = 4 px), magassag (sor); utana soronkent bajtparok: MASZK, ADAT.
# Szinek (palettaindex): fekete=1, zold=2, kek=3, szurke=ATLATSZO (mindket maszkbit 1, adat 0).
# Pixel n (0..3, balrol) egy bajton belul: szin also bitje -> bit(7-n), felso bitje -> bit(3-n).
param(
  [string]$In  = (Join-Path $PSScriptRoot "images/nukebomb.bmp"),
  [string]$Out = (Join-Path $PSScriptRoot "tvc_sprites/nukebomb.bin")
)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$bmp = Bmp-Olvas (Resolve-Path $In).Path
$w = $bmp.W; $h = $bmp.H
if ($w % 4 -ne 0) { throw "A szelesseg ($w px) nem osztható 4-gyel" }
$wb = $w / 4

function Get-Idx($c) {
  $r=$c.R; $g=$c.G; $b=$c.B
  if ($r -lt 40 -and $g -lt 40 -and $b -lt 40) { return 1 }          # fekete
  if ([math]::Abs($r-$g) -lt 24 -and [math]::Abs($g-$b) -lt 24) { return 0 }  # szurke = atlatszo (969691, C0C0C0)
  if ($g -gt $r -and $g -gt $b) { return 2 }                          # zold (6ED26E, 04FF04)
  if ($b -gt $r -and $b -gt $g) { return 3 }                          # kek (3255C3, 0000FF)
  throw ("Ismeretlen szin: {0:X2}{1:X2}{2:X2}" -f $r,$g,$b)
}

$bytes = New-Object System.Collections.Generic.List[byte]
$bytes.Add(2); $bytes.Add([byte]$wb); $bytes.Add([byte]$h)
$count = @(0,0,0,0)
for ($y=0; $y -lt $h; $y++) {
  for ($bx=0; $bx -lt $wb; $bx++) {
    $mask = 0; $data = 0
    for ($n=0; $n -lt 4; $n++) {
      $i = Get-Idx (Bmp-Pixel $bmp ($bx*4+$n) $y); $count[$i]++
      if ($i -eq 0) { $mask = $mask -bor (0x80 -shr $n) -bor (0x08 -shr $n) }
      else {
        if ($i -band 1) { $data = $data -bor (0x80 -shr $n) }
        if ($i -band 2) { $data = $data -bor (0x08 -shr $n) }
      }
    }
    $bytes.Add([byte]$mask); $bytes.Add([byte]$data)
  }
}
[System.IO.File]::WriteAllBytes($Out, $bytes.ToArray())
"{0}x{1} px = {2} byte x {1} sor; {3} byte -> {4}" -f $w,$h,$wb,$bytes.Count,$Out
"atlatszo/fekete/zold/kek pixel: $($count -join ' / ')"
