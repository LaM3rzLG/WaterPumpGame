# Fordítás UTÁN futtatandó (a resources\build.ps1 hívja). A TRSE egy blokkot fordít: $19EF..EndBlock19ef, benne a
# $8000-$BFFF hézaggal (nullák) és az U3-kóddal ($C000..). Ezt így a BASIC betöltő nem tudja betölteni ("No memory"), ezért:
#  1. a $1A03-as indítóugrás ("jp block1") -> "jp U3_Boot" (a ProgramInit lentről fut, betölti az U3KOD.BIN-t, bekapcsolja az U3-at,
#     utána a block1+3-ra ugrik - a főprogram az U3-ban van);
#  2. az U3_Hossz változóba beírja az U3-kód hosszát;
#  3. kivágja: U3KOD.BIN = $C000..EndBlock19ef-1;  WaterPumpGame.bin/.cas = csak $19EF..U3_Also_Vege-1 (a .cas fejléce javítva).
# Ellenőrzi: U3_Also_Vege < $8000, EndBlock19ef <= $D800 (ott kezdődik a Pause_Buf).
$root = Split-Path $PSScriptRoot -Parent
$sym = Get-Content (Join-Path $root "WaterPumpGame.sym")
function Cim($nev) {
  $s = $sym | Where-Object { $_ -match "^al\s+\`$([0-9a-fA-F]+)\s+\.$nev\s*$" } | Select-Object -First 1
  if (-not $s) { "HIBA: nincs '$nev' a .sym-ben"; exit 1 }
  [void]($s -match "\`$([0-9a-fA-F]+)"); [Convert]::ToInt32($Matches[1], 16)
}
$boot = Cim "U3_Boot"; $blk = Cim "block1"; $also = Cim "U3_Also_Vege"; $veg = Cim "EndBlock19ef"; $hcim = Cim "U3_Hossz"
$ORG = 0x19EF; $START = 0x1A03
$binF = Join-Path $root "WaterPumpGame.bin"; $casF = Join-Path $root "WaterPumpGame.cas"; $u3F = Join-Path $root "U3KOD.BIN"
$bin = [IO.File]::ReadAllBytes($binF)
$cas = [IO.File]::ReadAllBytes($casF)
if ($bin.Length -ne $veg - $ORG) { "HIBA: a .bin hossza ({0}) nem a teljes forditas (`$19EF..`${1:X4}) - mar szetvagva? Elobb forditas kell." -f $bin.Length, $veg; exit 1 }
$hiba = 0
if ($also -ge 0x8000) { "HIBA: a lenti kod tul nagy: U3_Also_Vege = `${0:X4} (max `$7FFF)" -f $also; $hiba = 1 }
if ($veg -gt 0xD800) { "HIBA: az U3-kod tul nagy: vege `${0:X4} (max `$D800, ott a Pause_Buf)" -f $veg; $hiba = 1 }
if ($blk -lt 0xC000) { "HIBA: a block1 (`${0:X4}) nincs az U3-ban - hianyzik az org `$C000?" -f $blk; $hiba = 1 }
if ($hcim -ge $also) { "HIBA: az U3_Hossz (`${0:X4}) nincs a lenti reszben" -f $hcim; $hiba = 1 }
$o = $START - $ORG
if ($bin[$o] -ne 0xC3) { "HIBA: a `$1A03-on nem JP van ({0:X2})" -f $bin[$o]; $hiba = 1 }
if ($bin[$blk - $ORG] -ne 0xCD) { "HIBA: a block1 nem 'call'-lal kezdodik ({0:X2})" -f $bin[$blk - $ORG]; $hiba = 1 }
if ($cas.Length -ne $bin.Length + 144 -or $cas[0] -ne 0x11) { "HIBA: a .cas nem a .bin + 144 bajtos fejlec"; $hiba = 1 }
else { for ($i = 0; $i -lt 64; $i++) { if ($cas[144 + $i] -ne $bin[$i]) { "HIBA: a .cas tartalma elter a .bin-tol"; $hiba = 1; break } } }
if ($hiba) { exit 1 }
# 1-2. javitasok a .bin-ben
$u3Hossz = $veg - 0xC000
$bin[$o + 1] = [byte]($boot -band 0xFF); $bin[$o + 2] = [byte]($boot -shr 8)
$bin[$hcim - $ORG] = [byte]($u3Hossz -band 0xFF); $bin[$hcim - $ORG + 1] = [byte]($u3Hossz -shr 8)
# 3. szetvagas
$u3 = New-Object byte[] $u3Hossz; [Array]::Copy($bin, 0xC000 - $ORG, $u3, 0, $u3Hossz)
$lentH = $also - $ORG
$lent = New-Object byte[] $lentH; [Array]::Copy($bin, 0, $lent, 0, $lentH)
$ujCas = New-Object byte[] ($lentH + 144); [Array]::Copy($cas, 0, $ujCas, 0, 144); [Array]::Copy($lent, 0, $ujCas, 144, $lentH)
$ujCas[130] = [byte]($lentH -band 0xFF); $ujCas[131] = [byte]($lentH -shr 8)        # 2. fejlec: a program hossza
$h = $ujCas.Length - 128; $blkDb = [int][math]::Ceiling($h / 128)                    # 1. fejlec (mint a make_dsk.ps1)
$ujCas[2] = [byte]($blkDb -band 0xFF); $ujCas[3] = [byte]($blkDb -shr 8); $ujCas[4] = [byte]($h % 128)
[IO.File]::WriteAllBytes($u3F, $u3); [IO.File]::WriteAllBytes($binF, $lent); [IO.File]::WriteAllBytes($casF, $ujCas)
"U3 boot: `$1A03 -> jp `${0:X4} | WaterPumpGame.cas: `$19EF..`${1:X4} ({2} byte, szabad {3} a `$8000-ig) | U3KOD.BIN: `$C000..`${4:X4} ({5} byte, szabad {6} a `$D800-ig)" -f $boot, ($also - 1), $lentH, (0x8000 - $also), ($veg - 1), $u3Hossz, (0xD800 - $veg)
