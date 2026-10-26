# MEMORIATERKEP: a legutobbi forditasbol kiirja a tools\memoria_adat.js-t, amit a tools\memoria_terkep.html megjelenit.
# Hasznalat (a projekt gyokereben, BUILD UTAN):  powershell -File resources\memoria_terkep.ps1
# Honnan veszi az adatokat:
#   Befosas.asm  - a forditas KIMENETE: org + incbin = a rekeszek neve es kezdete (rekesz vege = a kovetkezo foglalt cim);
#                  "Nev equ $cim" (kisbetus nev = valtozo, a csupa nagybetus allando): a unit tombjei es a GE / TVC valtozoi;
#                  ha a kod hasznalja a GE_MIRROR_TABLE-t, a GE tukrozo tablaja ($1700, 256 byte)
#   Befosas.sym  - a blokkok vege (EndBlock): a kod vege es az incbin-fajlok LEFORDITOTT hossza (az .asm-ben nincs cim)
#   Befosas.tru  - csak a unit tombjeinek MERETE ("array[N] of byte at $cim"; az .asm-ben csak a cim van)
#   a tobbi (rendszervaltozok, verem, video) a lenti $Fix listaban van, kezzel.
# A KOD BONTASA (kod = [...] a .js-ben): a .sym minden cimkeje a kovetkezo cimkeig tart; a gazdat az .asm
#   "Defining procedure : X" ... "end_procedure_X:" hatarai adjak, ezen kivul a nev eleje (MainProgram, unit_, GE_) + kod / adat.
# A kimenet .js (nem .json), mert a duplakattintassal megnyitott HTML nem olvashat be .json-t.
param([string]$Nev = 'WaterPumpGame', [string]$Unit = 'WaterPump')   # Nev = a foprogram (.asm/.sym), Unit = a sajat unit (.tru)
$gyoker = Split-Path $PSScriptRoot -Parent
$kodKezd = 0x19EF

# t: r = rendszer, v = verem, vid = video, sz = szabad | l: csak ennel a $8000-es lapnal latszik
# hat = 1: hatter - nem foglal, csak a beleeso lyukak nevet adja (nem "Szabad")
$Fix = @(
  @{ e = 0x0000; v = 0x0BEF; n = 'Rendszerváltozók'; t = 'r' },
  @{ e = 0x0E48; v = 0x0EAB; n = 'GE / TVC munkaterület (a kód nem használja)'; t = 'r'; hat = 1 },
  @{ e = 0x14B4; v = 0x19EE; n = 'Verem'; t = 'v' },
  @{ e = 0x8000; v = 0xBBFF; n = 'Videó-RAM: a kép (64 x 240)'; t = 'vid'; l = 'vid'; o = 'Videó-RAM (a kép)' },
  @{ e = 0xBC00; v = 0xBFFF; n = 'Videó-RAM: a kép alatt'; t = 'vid'; l = 'vid'; o = 'Videó-RAM (a kép)' },
  @{ e = 0x8000; v = 0x9FFF; n = 'U2 RAM - átmeneti puffer (betöltéskor, a PÁLYÁK mentésekor)'; t = 'sz'; l = 'u2'; o = 'U2 RAM - puffer' },
  @{ e = 0xA000; v = 0xB833; n = 'MENU16.BIN (a 16 színű főmenü, U2)'; t = 'a'; l = 'u2'; o = 'MENU16.BIN' },
  @{ e = 0xB834; v = 0xBFFF; n = 'U2 RAM - szabad'; t = 'sz'; l = 'u2'; o = 'U2 RAM - nem használt' }
)

function Uj([int]$e, [int]$v, $n, $t, [int]$h = -1, $o = $null, $l = $null) {
  [pscustomobject]@{ e = $e; v = $v; n = $n; t = $t; h = $h; o = $o; l = $l; baj = 0 }
}

$reszek = @()
$hatter = @()
foreach ($f in $Fix) {
  if ($f.hat) { $hatter += Uj $f.e $f.v $f.n $f.t }
  else { $reszek += Uj $f.e $f.v $f.n $f.t -1 $f.o $f.l }
}

# --- a .sym blokkjai: kezdet -> az elso cim a blokk UTAN ---
$symFajl = Join-Path $gyoker "$Nev.sym"
$asmFajl = Join-Path $gyoker "$Nev.asm"
if (-not (Test-Path $symFajl) -or -not (Test-Path $asmFajl)) { "HIBA: nincs $Nev.sym / $Nev.asm - elobb build kell"; exit 1 }
$blokkVeg = @{}
$symCim = @{}
foreach ($s in Get-Content $symFajl) {
  if ($s -match '^al\s+\$([0-9a-fA-F]+)\s+\.(\S+)') {
    $sc = [Convert]::ToInt32($Matches[1], 16); $sn = $Matches[2]
    if (-not $symCim.ContainsKey($sn)) { $symCim[$sn] = $sc }
    if ($sn -match '^EndBlock([0-9a-fA-F]+)$') { $blokkVeg[[Convert]::ToInt32($Matches[1], 16)] = $sc }
  }
}
if (-not $blokkVeg.ContainsKey($kodKezd)) { "HIBA: a $Nev.sym-ben nincs EndBlock19ef"; exit 1 }
$kodVeg = $blokkVeg[$kodKezd]
# U3-kód (2026-10-26): ha van U3_Also_Vege cimke, a kod ket darab: $19EF..U3_Also_Vege-1 es $C000..EndBlock-1
$alsoVeg = if ($symCim.ContainsKey('U3_Also_Vege')) { $symCim['U3_Also_Vege'] } else { $kodVeg }
$reszek += Uj $kodKezd ($alsoVeg - 1) "Kód ($Nev + GE + unit)" 'k' -1 'Kód'
if ($alsoVeg -lt $kodVeg) { $reszek += Uj 0xC000 ($kodVeg - 1) "Kód az U3-ban (a forrás vége + főprogram)" 'k' -1 'Kód' }

# --- az .asm: valtozok (equ), rekeszek (org + incbin), a GE tukrozo tablaja ---
$valtozok = @()
$binek = @()
$org = -1
$tukor = $false
foreach ($s in Get-Content $asmFajl) {
  if ($s -match '^\s*(\w+)\s+equ\s+\$([0-9a-fA-F]+)\s*$') {
    $vn = $Matches[1]; $vc = [Convert]::ToInt32($Matches[2], 16)
    if ($vn -cmatch '[a-z]') { $valtozok += [pscustomobject]@{ Nev = $vn; Cim = $vc } }
    continue
  }
  if ($s -match '^\s*org\s+\$([0-9a-fA-F]+)') { $org = [Convert]::ToInt32($Matches[1], 16); continue }
  if ($s -match '^\s*incbin\s+"([^"]+)"') {
    $ut = $Matches[1] -replace '/+', '\'
    $binek += [pscustomobject]@{ Fajl = Split-Path $ut -Leaf; Ut = $ut; Cim = $org }
    continue
  }
  if ($s -match '\bGE_MIRROR_TABLE') { $tukor = $true }
}
if ($tukor) { $reszek += Uj 0x1700 0x17FF 'GE tükröző tábla (a kód használja!)' 'r' }

# a unit tombjei: cim az .asm-bol, meret a .tru-bol
$meret = @{}
foreach ($s in Get-Content (Join-Path $gyoker "$Unit.tru") -Encoding UTF8) {
  if ($s -match '^\s*(\w+)\s*:\s*array\[([\d\s\*\+]+)\]\s+of\s+(byte|integer)\s+at\s+\$') { $db = [int](Invoke-Expression $Matches[2]); $meret[$Matches[1]] = $(if ($Matches[3] -eq 'integer') { 2 * $db } else { $db }) }
}
foreach ($x in ($valtozok | Where-Object { $_.Nev -like "$($Unit)_*" })) {
  $n = $x.Nev.Substring($Unit.Length + 1)
  $m = if ($meret.ContainsKey($n)) { $meret[$n] } else { 1 }
  $cimke = if ($meret.ContainsKey($n)) { "$n (unit-tömb)" } else { "$n (unit, méret ismeretlen)" }
  $reszek += Uj $x.Cim ($x.Cim + $m - 1) $cimke 'u' -1 $(if ($x.Cim -ge 0xC000) { 'Unit-tömbök' })
}
# a foprogram cimhez rogzitett tombjei ("Nev : array[N] of byte|integer at $cim;"): meret a .ras-bol (a konstansokat behelyettesitve);
# a "/* SPRITES.BIN: mappa\fajl.bin */" jelu sorok merete a resources\mappa\fajl.bin valodi hossza; mindegyik kulon resz
$konst = @{}
$rasSorok = Get-Content (Join-Path $gyoker "$Nev.ras") -Encoding UTF8
foreach ($s in $rasSorok) { if ($s -match '^\s*const\s+(\w+)\s*:\s*\w+\s*=\s*([\d\s\*\+]+);') { $konst[$Matches[1]] = [int](Invoke-Expression $Matches[2]) } }
$sajat = @{}
foreach ($s in $rasSorok) {
  if ($s -notmatch '^\s*(\w+)\s*:\s*array\s*\[([^\]]+)\]\s+of\s+(byte|integer)\s+at\s+\$([0-9a-fA-F]+)') { continue }
  $vn = $Matches[1]; $kif = $Matches[2]; $typ = $Matches[3]; $vc = [Convert]::ToInt32($Matches[4], 16)
  foreach ($k in $konst.Keys) { $kif = $kif -replace "\b$k\b", $konst[$k] }
  $db = [int](Invoke-Expression ($kif -replace '[^0-9*+ ]', ''))
  $m = if ($typ -eq 'integer') { 2 * $db } else { $db }
  $cimke = $vn; $o = $null
  if ($s -match 'SPRITES\.BIN:\s*(\S+\.bin)') {
    $fp = Join-Path $gyoker ("resources\" + $Matches[1])
    if (Test-Path $fp) { $m = (Get-Item $fp).Length }
    $cimke = (Split-Path $Matches[1] -Leaf) + " (SPRITES.BIN)"; $o = 'SPRITES.BIN (hangok, sprite-ok, betűk)'
  }
  elseif ($vn -match '^(Terkepek|Palya)') { $cimke = "$vn (PALYAK.BIN)"; $o = 'PALYAK.BIN (pályaadatok)' }
  $sajat[$vn] = 1
  $reszek += Uj $vc ($vc + $m - 1) $cimke $(if ($vc -ge 0xC000) { 'a' } else { 'r' }) -1 $o
}
# a tobbi unit (GE, TVC) valtozoi: unitonkent egy resz, az elsotol az utolsoig (az utolso merete 1-nek veve)
$tobbi = $valtozok | Where-Object { $_.Nev -notlike "$($Unit)_*" -and -not $sajat.ContainsKey($_.Nev) } | Group-Object { $_.Nev.Split('_')[0] }
foreach ($g in $tobbi) {
  $cimek = $g.Group | ForEach-Object { $_.Cim } | Sort-Object
  $reszek += Uj $cimek[0] $cimek[-1] "$($g.Name) változói ($($g.Count) db)" 'r'
}

# --- az incbin-rekeszek: a rekesz vege = a kovetkezo foglalt cim ---
foreach ($b in $binek) {
  $kov = @($reszek | Where-Object { $_.e -gt $b.Cim } | ForEach-Object { $_.e }) + @($binek | Where-Object { $_.Cim -gt $b.Cim } | ForEach-Object { $_.Cim }) + 0x10000 | Sort-Object | Select-Object -First 1
  $hossz = if ($blokkVeg.ContainsKey($b.Cim)) { $blokkVeg[$b.Cim] - $b.Cim } else { (Get-Item $b.Ut).Length }
  $r = Uj $b.Cim ($kov - 1) $b.Fajl 'a' $hossz
  if ($hossz -gt $kov - $b.Cim) { $r.baj = 1; $r.v = $b.Cim + $hossz - 1 }
  $reszek += $r
}

# --- egy lyuk kitoltese: a hatter-reszekbe eso darab a hatter nevet kapja, a tobbi "Szabad" ---
function Lyuk($a, $z) {
  $ki = @()
  foreach ($h in ($hatter | Sort-Object e)) {
    if ($h.v -lt $a -or $h.e -gt $z) { continue }
    if ($h.e -gt $a) { $ki += Uj $a ($h.e - 1) 'Szabad' 'sz' }
    $ki += Uj ([Math]::Max($a, $h.e)) ([Math]::Min($z, $h.v)) $h.n $h.t
    $a = $h.v + 1
  }
  if ($a -le $z) { $ki += Uj $a $z 'Szabad' 'sz' }
  $ki
}

# --- atfedes + a lyukak kitoltese (a $8000-es lap ket valtozata kulon) ---
$kesz = @()
foreach ($valt in 'vid', 'u2') {
  $sor = @($reszek | Where-Object { -not $_.l -or $_.l -eq $valt } | Sort-Object e)
  $hol = 0
  foreach ($r in $sor) {
    if ($r.e -lt $hol) { $r.baj = 1 }
    elseif ($r.e -gt $hol -and $valt -eq 'vid') { $kesz += Lyuk $hol ($r.e - 1) }
    if ($r.v + 1 -gt $hol) { $hol = $r.v + 1 }
  }
  if ($hol -lt 0x10000 -and $valt -eq 'vid') { $kesz += Lyuk $hol 0xFFFF }
}
$kesz += $reszek
$bajDb = @($kesz | Where-Object { $_.baj -eq 1 }).Count

# --- a KOD bontasa: minden .sym-cimke merete = a kovetkezo cimke cime - a sajat cime; gazdaja az .asm-bol
#     ("Defining procedure : X" ... "end_procedure_X:" kozott X; kivul a nev eleje + kod / adat szerint) ---
$cimkek = @(); $proc = $null; $sorsz = 0; $varo = @()
$adatMinta = '^(db|dw|ds|defb|defw|defs|incbin)\b'
foreach ($s in Get-Content $asmFajl) {
  if ($s -match 'Defining procedure : (\S+)') { $proc = $Matches[1]; continue }
  $t = $s.Trim()
  if ($t -eq '' -or $t.StartsWith(';')) { continue }
  if ($s -match '^\s*([A-Za-z_][\w.]*):\s*(.*)$') {
    $cn = $Matches[1]; $rest = ($Matches[2] -split ';')[0].Trim()
    if ($cn -like 'end_procedure_*') { foreach ($x in $varo) { if (-not $x.F) { $x.F = 'k' } }; $varo = @(); $proc = $null; continue }
    if (-not $symCim.ContainsKey($cn)) { continue }
    $x = [pscustomobject]@{ N = $cn; C = $symCim[$cn]; P = $proc; F = $null; S = $sorsz++ }
    $cimkek += $x; $varo += $x
    if ($rest) { $f = if ($rest -match $adatMinta) { 'a' } else { 'k' }; foreach ($x in $varo) { $x.F = $f }; $varo = @() }
    continue
  }
  if ($varo.Count) { $f = if ($t -match $adatMinta) { 'a' } else { 'k' }; foreach ($x in $varo) { $x.F = $f }; $varo = @() }
}
$unitok = @('GE', 'TVC') + @($tobbi | ForEach-Object { $_.Name })
function Gazda($c) {
  # -> @(egység, név): ras = a foprogram, unit = a sajat unit ($Unit.tru), GE / TVC, trse = a TRSE sajat rutinjai
  if ($c.P) {
    if ($c.P -eq 'ProgramInit') { return 'trse', 'ProgramInit (a TRSE indító eljárása)' }
    if ($c.P -like "$($Unit)_*") { return 'unit', $c.P.Substring($Unit.Length + 1) }
    $el = $c.P.Split('_')[0]
    if ($unitok -contains $el) { return $el, $c.P.Substring($el.Length + 1) }
    return 'ras', $c.P
  }
  if ($c.N -like 'MainProgram*' -or $c.N -like 'main_block*' -or $c.N -eq 'main' -or $c.N -eq 'block1') { return 'ras', 'Főprogram (főciklus)' }
  $el = $c.N.Split('_')[0]
  if ($el -eq $Unit) { return 'unit', $(if ($c.F -eq 'a') { '(változók, táblák)' } else { '(eljáráson kívüli kód)' }) }
  if ($unitok -contains $el) { return $el, $(if ($c.F -eq 'a') { '(változók)' } else { '(eljáráson kívüli kód)' }) }
  if ($c.F -eq 'a') { return 'ras', '(globális változók)' }
  'trse', 'indító ugrás, szorzás, osztás, másolás'
}
$elemek = [ordered]@{}
$bent = @($cimkek | Where-Object { $_.C -ge $kodKezd -and $_.C -lt $kodVeg } | Sort-Object C, S)
$elsoCim = if ($bent.Count) { $bent[0].C } else { $kodVeg }
$darabok = @(@{ u = 'trse'; n = 'BASIC indító (10 PRINT USR(...))'; c = $kodKezd; h = $elsoCim - $kodKezd; f = 'a' })
for ($i = 0; $i -lt $bent.Count; $i++) {
  $j = $i + 1
  while ($j -lt $bent.Count -and $bent[$j].C -eq $bent[$i].C) { $j++ }
  if ($j -gt $i + 1) { continue }   # azonos cimen tobb cimke: a sorban utolso viszi a byte-okat
  $kov = if ($j -lt $bent.Count) { $bent[$j].C } else { $kodVeg }
  if ($bent[$i].C -lt 0xC000 -and $kov -gt $alsoVeg) { $kov = [math]::Max($alsoVeg, $bent[$i].C) }   # a lenti resz vege (a hezag nem kod)
  $g = Gazda $bent[$i]
  $darabok += @{ u = $g[0]; n = $g[1]; c = $bent[$i].C; h = $kov - $bent[$i].C; f = $bent[$i].F; cn = $bent[$i].N }
}
# elem: n nev, u egyseg, k / a kod- es adatbyte, r = darabok [cim, hossz, k|a] (szomszedos azonos fajtak osszevonva),
#       c = a legnagyobb cimkek [nev, cim, hossz] (legfeljebb 12)
$cimkeLista = @{}
foreach ($d in $darabok) {
  if ($d.h -le 0) { continue }
  $kulcs = "$($d.u)|$($d.n)"
  if (-not $elemek.Contains($kulcs)) { $elemek[$kulcs] = [ordered]@{ n = $d.n; u = $d.u; k = 0; a = 0; r = New-Object System.Collections.ArrayList; c = @() }; $cimkeLista[$kulcs] = @() }
  $el = $elemek[$kulcs]
  $f = if ($d.f -eq 'a') { 'a' } else { 'k' }
  if ($f -eq 'a') { $el.a += $d.h } else { $el.k += $d.h }
  $ui = $el.r.Count - 1
  if ($ui -ge 0 -and $el.r[$ui][0] + $el.r[$ui][1] -eq $d.c -and $el.r[$ui][2] -eq $f) { $el.r[$ui][1] += $d.h } else { [void]$el.r.Add(@($d.c, $d.h, $f)) }
  if ($d.cn) { $cimkeLista[$kulcs] += , @($d.cn, $d.c, $d.h) }
}
foreach ($kulcs in @($elemek.Keys)) {
  $lista = New-Object System.Collections.ArrayList
  foreach ($x in @($cimkeLista[$kulcs] | Sort-Object { - $_[2] } | Select-Object -First 12)) { [void]$lista.Add(@([string]$x[0], [int]$x[1], [int]$x[2])) }
  $elemek[$kulcs].c = $lista
}
$kodElemek = @($elemek.Values)

# --- csoport az osszesitoben + kiiras ---
$ki = @()
foreach ($r in ($kesz | Sort-Object e, l)) {
  $o = $r.o
  if (-not $o) {
    if ($r.v -lt $kodKezd) { $o = 'Rendszer (BASIC változói, GE, unit-tömbök, verem)' }
    elseif ($r.t -eq 'sz') { $o = 'Szabad' }
    else { $o = $r.n }
  }
  $e = [ordered]@{ e = $r.e; v = $r.v; n = $r.n; t = $r.t; o = $o }
  if ($r.h -ge 0) { $e.h = $r.h }
  if ($r.l) { $e.l = $r.l }
  if ($r.baj) { $e.baj = 1 }
  $ki += $e
}
$adat = [ordered]@{ nev = $Nev; datum = (Get-Item $asmFajl).LastWriteTime.ToString('yyyy-MM-dd HH:mm'); kodVeg = $kodVeg; baj = $bajDb; reszek = $ki; kod = $kodElemek }
$szoveg = "/* GENERALT FAJL (resources\memoria_terkep.ps1) - ne szerkeszd */`nvar MEMORIA = " + ($adat | ConvertTo-Json -Depth 6 -Compress) + ";`n"
[IO.File]::WriteAllText((Join-Path $gyoker 'tools\memoria_adat.js'), $szoveg, (New-Object Text.UTF8Encoding($false)))

foreach ($r in ($ki | Where-Object { $_.t -ne 'sz' -or $_.e -lt 0x8000 -or $_.e -ge 0xC000 })) {
  if ($r.l -eq 'u2') { continue }
  $hossz = $r.v - $r.e + 1
  $jel = if ($r.baj) { 'HIBA: ATFEDES / NEM FER BELE' } elseif ($null -ne $r.h) { "szabad: $($hossz - $r.h)" } else { '' }
  '${0:X4}-${1:X4} {2,6}  {3}  {4}' -f $r.e, $r.v, $hossz, $r.n, $jel
}
"--- a kod bontasa ($(if ($alsoVeg -lt $kodVeg) { ($alsoVeg - $kodKezd) + ($kodVeg - 0xC000) } else { $kodVeg - $kodKezd }) byte):"
$kodElemek | Group-Object { $_.u } | ForEach-Object { '  {0,-5} {1,6} byte  ({2} elem)' -f $_.Name, ($_.Group | ForEach-Object { $_.k + $_.a } | Measure-Object -Sum).Sum, $_.Count }
"  a 10 legnagyobb:"
$kodElemek | Sort-Object { -($_.k + $_.a) } | Select-Object -First 10 | ForEach-Object { '  {0,6}  {1,-5} {2}' -f ($_.k + $_.a), $_.u, $_.n }
if ($alsoVeg -lt $kodVeg) { "kod vege: lent `${0:X4} (szabad {1} a `$8000-ig) | U3 `${2:X4} (szabad {3} a `$D800-ig) | hibas resz: $bajDb | kesz: tools\memoria_adat.js" -f $alsoVeg, (0x8000 - $alsoVeg), $kodVeg, (0xD800 - $kodVeg) }
else { "kod vege: `${0:X4} | hibas resz: $bajDb | kesz: tools\memoria_adat.js" -f $kodVeg }
if ($bajDb) { exit 1 }
