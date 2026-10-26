# SPRITES.BIN = az U3 tartalma ($C000-tol): hangok, sprite-ok, betukeszlet, a jatekban hasznalt cimeken.
# A jatek induláskor ezt tolti be ($8000-ra), majd az U3-ba masolja. A cimek a WaterPumpGame.ras "... at $cim" soraival egyeznek!
# Hasznalat: powershell -File resources\make_sprites_bin.ps1   -> SPRITES.BIN a projekt gyokereben; kiirja a hosszt (Spr_Hossz a .ras-ban)
$root = Split-Path $PSScriptRoot -Parent
$list = @(
  @("resources\sfx\explosion.bin",          0xC000),
  @("resources\sfx\akna.bin",               0xCB00),
  @("resources\sfx\tick.bin",               0xD000),
  @("resources\tvc_sprites\Pumpa.bin",      0xD100),
  @("resources\tvc_sprites\talaj1.bin",     0xD200),
  @("resources\tvc_sprites\talaj2.bin",     0xD300),
  @("resources\tvc_sprites\talaj3.bin",     0xD400),
  @("resources\tvc_sprites\keret.bin",      0xD500),
  @("resources\tvc_sprites\keret2.bin",     0xD600),
  @("resources\tvc_sprites\enemy.bin",      0xD700),
  @("resources\tvc_sprites\fal.bin",        0xD800),
  @("resources\tvc_sprites\meteor.bin",     0xD900),
  @("resources\tvc_sprites\bomba.bin",      0xDB00),
  @("resources\tvc_sprites\bombaikon.bin",  0xDC00),
  @("resources\tvc_sprites\akna.bin",       0xDD00),
  @("resources\tvc_sprites\Pumpa2.bin",     0xE000),
  @("resources\tvc_sprites\font.bin",       0xE100)
)
$base = 0xC000
$end = 0
foreach ($e in $list) { $len = (Get-Item (Join-Path $root $e[0])).Length; $end = [math]::Max($end, $e[1] + $len) }
$buf = New-Object byte[] ($end - $base)
$hiba = 0
for ($i = 0; $i -lt $list.Count; $i++) {
  $d = [IO.File]::ReadAllBytes((Join-Path $root $list[$i][0]))
  $a = $list[$i][1]
  $next = if ($i + 1 -lt $list.Count) { $list[$i+1][1] } else { $end }
  if ($a + $d.Length -gt $next) { "HIBA: {0} ({1} bajt) atfed a kovetkezovel (`${2:X4})" -f $list[$i][0], $d.Length, $next; $hiba = 1 }
  [Array]::Copy($d, 0, $buf, $a - $base, $d.Length)
  "  `${0:X4}  {1,5}  {2}" -f $a, $d.Length, $list[$i][0]
}
if ($hiba -eq 1) { exit 1 }
[IO.File]::WriteAllBytes((Join-Path $root "SPRITES.BIN"), $buf)
"SPRITES.BIN: {0} bajt (`$C000..`${1:X4}) -> Spr_Hossz = {0}" -f $buf.Length, ($end - 1)
