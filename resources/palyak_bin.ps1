# PALYAK.BIN + a .ras palyablokkja a resources\palyak\palyak_adat.txt-bol (= a terkep_szerkeszto.html .ras-kimenete).
# Az adatok (terkepek, kodok, celok, arak, kapcsolok) a PALYAK.BIN-be kerulnek, az U3-ba, kozvetlenul a sprite-ok (Spr_Cim) ala (a jatek induláskor tolti be);
# a .ras-ban csak a konstansok (PALYA_DB, INDULO_PALYA, PALYA2_DB), a Pal_Hossz es "Nev : array[..] of .. at $cim;" sorok maradnak.
# A .ras-blokk a "/* PALYAK" (vagy PÁLYÁK) sortol a "Palya2_Bomba" sorig cserelodik. Hasznalat: powershell -File resources\palyak_bin.ps1
param([switch]$NemIr)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$enc = New-Object Text.UTF8Encoding($false)
$src = [IO.File]::ReadAllText((Ut "resources/palyak/palyak_adat.txt"), $enc)
$t = [regex]::Replace($src, '/\*[\s\S]*?\*/', ' ')
$consts = [ordered]@{}
foreach ($m in [regex]::Matches($t, 'const\s+(\w+)\s*:\s*byte\s*=\s*(\d+)\s*;')) { $consts[$m.Groups[1].Value] = [int]$m.Groups[2].Value }
foreach ($k in 'PALYA_DB','INDULO_PALYA','PALYA2_DB') { if (-not $consts.Contains($k)) { "HIBA: hianyzik a $k konstans"; exit 1 } }
$skip = @('Palya_Nev','Palya2_Nev','Palya2_Kod')      # a jatek nem hasznalja
$rasSzoveg = [IO.File]::ReadAllText((Ut "WaterPumpGame.ras"), $enc)
if ($rasSzoveg -notmatch '(?m)^\s*Spr_Cim\s*:\s*integer\s*=\s*\$([0-9A-Fa-f]{4})') { "HIBA: nincs Spr_Cim a .ras-ban (elobb make_sprites_bin.ps1)"; exit 1 }
$sprCim = [Convert]::ToInt32($Matches[1], 16)
$PAUSE_VEG = 0xE000     # a Pause_Buf ($D800-$DFFF) vege: a palyak eddig nyulhatnak le
# 1. menet: a hossz (a cimek ettol fuggnek)
$hossz0 = 0
foreach ($m in [regex]::Matches($t, '(\w+)\s*:\s*array\[([^\]]+)\]\s*of\s*(byte|integer)\s*=\s*\(([^)]*)\)\s*;')) {
  if ($skip -contains $m.Groups[1].Value) { continue }
  $n0 = [int](Invoke-Expression ($m.Groups[2].Value -replace '[^0-9*+ ]',''))
  $hossz0 += $(if ($m.Groups[3].Value -eq 'integer') { 2 * $n0 } else { $n0 })
}
$base = $sprCim - $hossz0; $addr = $base
if ($base -lt $PAUSE_VEG) { "HIBA: a palyaadat tul nagy ({0} bajt): `${1:X4}-tol kezdodne, de a Pause_Buf `$DFFF-ig tart" -f $hossz0, $base; exit 1 }
$bytes = New-Object System.Collections.Generic.List[byte]
$decl = @()
foreach ($m in [regex]::Matches($t, '(\w+)\s*:\s*array\[([^\]]+)\]\s*of\s*(byte|integer)\s*=\s*\(([^)]*)\)\s*;')) {
  $nm = $m.Groups[1].Value; $typ = $m.Groups[3].Value
  if ($skip -contains $nm) { continue }
  $n = [int](Invoke-Expression ($m.Groups[2].Value -replace '[^0-9*+ ]',''))
  $vals = @($m.Groups[4].Value -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne '' } | ForEach-Object { [int]$_ })
  if ($vals.Count -ne $n) { "HIBA: $nm - $($vals.Count) ertek, de a meret $n"; exit 1 }
  $decl += "`t`t{0}`t:`tarray[{1}] of {2} at `${3:X4};" -f $nm, $n, $typ, $addr
  foreach ($v in $vals) {
    if ($typ -eq 'byte') { $bytes.Add([byte]($v -band 0xFF)); $addr++ }
    else { $bytes.Add([byte]($v -band 0xFF)); $bytes.Add([byte](($v -shr 8) -band 0xFF)); $addr += 2 }
  }
}
$hossz = $bytes.Count
$blokk = @()
$blokk += "`t`t/* PALYAK (generalt, resources\palyak_bin.ps1 - kezzel NE szerkeszd): az adatok a PALYAK.BIN-ben, az U3-ban a sprite-ok alatt, `${0:X4}-tol; forras: resources\palyak\palyak_adat.txt */" -f $base
$blokk += "`t`tconst PALYA_DB`t:`tbyte = {0};" -f $consts['PALYA_DB']
$blokk += "`t`tconst INDULO_PALYA`t:`tbyte = {0};" -f $consts['INDULO_PALYA']
$blokk += "`t`tconst PALYA2_DB`t:`tbyte = {0};" -f $consts['PALYA2_DB']
$blokk += "`t`tPal_Hossz`t:`tinteger = {0};" -f $hossz
$blokk += $decl
if ($blokk[-1] -notmatch 'Palya2_Bomba') { "HIBA: az utolso sor nem a Palya2_Bomba"; exit 1 }
"PALYAK.BIN: {0} bajt (`${4:X4}..`${1:X4}), {2} egyjatekos + {3} versus palya" -f $hossz, ($base + $hossz - 1), $consts['PALYA_DB'], $consts['PALYA2_DB'], $base
if ($NemIr) { $blokk; exit 0 }
[IO.File]::WriteAllBytes((Ut "PALYAK.BIN"), $bytes.ToArray())
$ras = Ut "WaterPumpGame.ras"
$R = [IO.File]::ReadAllText($ras, $enc) -split "`n"
$a = [Array]::FindIndex($R, [Predicate[string]]{ param($x) $x -match '^\s*/\* P.LY.K' })
$b = [Array]::FindIndex($R, [Predicate[string]]{ param($x) $x -match '^\s*Palya2_Bomba\s' })
if ($a -lt 0 -or $b -le $a) { "HIBA: a .ras palyablokkja nem talalhato, a .ras NEM valtozott"; exit 1 }
$new = @(); $new += $R[0..($a-1)]; $new += $blokk; $new += $R[($b+1)..($R.Length-1)]
[IO.File]::WriteAllText($ras, ($new -join "`n"), $enc)
".ras palyablokk csere: sor {0}..{1} -> {2} sor" -f ($a+1), ($b+1), $blokk.Count
