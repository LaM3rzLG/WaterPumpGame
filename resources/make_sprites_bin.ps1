# SPRITES.BIN = az U3 tetejenek tartalma: hangok, sprite-ok, betukeszlet, HEZAG NELKUL, a $FFFF-re vegzodve.
# A jatek induláskor ezt tolti be ($8000-ra), majd az U3-ba masolja (Spr_Cim-tol, Spr_Hossz byte).
# A szkript a WaterPumpGame.ras-ban atirja: a "Nev : array[1] of byte at $cim;" sorokat, a Spr_Cim-et es a Spr_Hossz-t.
# Utana: palyak_bin.ps1 (a palyak kozvetlenul a sprite-ok ala kerulnek), majd forditas.
# Hasznalat: powershell -File resources\make_sprites_bin.ps1   [-NemIr: csak kiirja a kiosztast]
param([switch]$NemIr)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$root = $Gyoker
$list = @(
  @("resources\sfx\explosion.bin",          "ExplosionSFX"),
  @("resources\sfx\akna.bin",               "AknaSFX"),
  @("resources\sfx\tick.bin",               "TickSFX"),
  @("resources\tvc_sprites\Pumpa.bin",      "Pumpa_Data"),
  @("resources\tvc_sprites\talaj1.bin",     "Talaj1_Data"),
  @("resources\tvc_sprites\talaj2.bin",     "Talaj2_Data"),
  @("resources\tvc_sprites\talaj3.bin",     "Talaj3_Data"),
  @("resources\tvc_sprites\keret.bin",      "Keret_Data"),
  @("resources\tvc_sprites\keret2.bin",     "Keret2_Data"),
  @("resources\tvc_sprites\enemy.bin",      "Enemy_Data"),
  @("resources\tvc_sprites\fal.bin",        "Fal_Data"),
  @("resources\tvc_sprites\meteor.bin",     "Meteor_Data"),
  @("resources\tvc_sprites\bomba.bin",      "Bomba_Data"),
  @("resources\tvc_sprites\bombaikon.bin",  "BombaIkon_Data"),
  @("resources\tvc_sprites\akna.bin",       "Akna_Data"),
  @("resources\tvc_sprites\Pumpa2.bin",     "Pumpa2_Data"),
  @("resources\tvc_sprites\font.bin",       "Font_Data")
)
$adat = @()
$ossz = 0
foreach ($e in $list) { $d = [IO.File]::ReadAllBytes((Ut $e[0])); $adat += ,$d; $ossz += $d.Length }
$base = 0x10000 - $ossz
$buf = New-Object byte[] $ossz
$cimek = @{}
$a = $base
for ($i = 0; $i -lt $list.Count; $i++) {
  [Array]::Copy($adat[$i], 0, $buf, $a - $base, $adat[$i].Length)
  $cimek[$list[$i][1]] = $a
  "  `${0:X4}  {1,5}  {2}" -f $a, $adat[$i].Length, $list[$i][0]
  $a += $adat[$i].Length
}
"SPRITES.BIN: {0} bajt (`${1:X4}..`$FFFF) -> Spr_Cim = `${1:X4}, Spr_Hossz = {0}" -f $ossz, $base
if ($NemIr) { exit 0 }
[IO.File]::WriteAllBytes((Join-Path $root "SPRITES.BIN"), $buf)
# a .ras cimeinek atirasa
$enc = New-Object Text.UTF8Encoding($false)
$ras = Join-Path $root "WaterPumpGame.ras"
$R = [IO.File]::ReadAllText($ras, $enc)
foreach ($n in $cimek.Keys) {
  $minta = "(?m)^(\s*$n\s*:\s*array\[1\] of byte at )\`$[0-9A-Fa-f]{4}"
  if (-not [regex]::IsMatch($R, $minta)) { "HIBA: a .ras-ban nincs '$n : array[1] of byte at `$....' sor, a .ras NEM valtozott"; exit 1 }
  $R = [regex]::Replace($R, $minta, ('${1}$' + ('{0:X4}' -f $cimek[$n])))
}
foreach ($p in @(@('Spr_Cim', ('${{1}}${0:X4}' -f $base)), @('Spr_Hossz', ('${{1}}{0}' -f $ossz)))) {
  $minta = "(?m)^(\s*$($p[0])\s*:\s*integer\s*=\s*)[\`$0-9A-Fa-f]+"
  if (-not [regex]::IsMatch($R, $minta)) { "HIBA: a .ras-ban nincs '$($p[0]) : integer = ...' sor, a .ras NEM valtozott"; exit 1 }
  $R = [regex]::Replace($R, $minta, $p[1])
}
[IO.File]::WriteAllText($ras, $R, $enc)
".ras: {0} sprite-cim + Spr_Cim + Spr_Hossz atirva. Kovetkezo lepes: palyak_bin.ps1" -f $cimek.Count
