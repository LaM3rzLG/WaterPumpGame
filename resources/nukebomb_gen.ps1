# nukebomb.ras W_X / W_Y / Dly tablainak generalasa (12 reszecske, 5 utvonal-pont/reszecske).
# Fazisok (pontok): 0 = a talajon (szetszorva), 1 = behuzodas KOZEPRE (30,160), 2 = felemelkedes a kozepen (30,90),
# 3 = iv a szele fele (koztes pont), 4 = vegpont: a kalap pereme, a vegen ujra kozep fele befordulva.
# Reszecske sorrend (= rajz/z-sorrend): jobb0, bal0, jobb1, bal1, ... ; indulasi keses = 3 * sorszam.
# Hasznalat: powershell -File resources\nukebomb_gen.ps1   (a ..\nukebomb.ras W_X/W_Y/Dly sorait irja at)
$R=@(@(31,88),@(34,88),@(37,90),@(40,94),@(41,100),@(39,106))   # a kalap jobb oldali ive (kozeprol kifele, a vegen befordul)
$wx=@();$wy=@();$dl=@();$n=0
for($k=0;$k -lt 6;$k++){
  foreach($side in 0,1){
    $fx=$R[$k][0]; $fy=$R[$k][1]
    if($side -eq 1){ $fx=60-$fx }
    $gx= if($side -eq 0){ 33+2*$k } else { 27-2*$k }          # talaj: szetszorva a kozep korul
    $mx=30+[int]([math]::Truncate(($fx-30)*2/3)); $my=88+[int]([math]::Truncate(($fy-88)/3)) - 4   # iv koztes pontja
    $pts=@(@($gx,172),@(30,160),@(30,90),@($mx,$my),@($fx,$fy))
    foreach($q in $pts){$wx+=$q[0];$wy+=$q[1]}
    $dl+=(3*$n); $n++
  }
}
$f=Join-Path $PSScriptRoot "..\nukebomb.ras"
$lines=[IO.File]::ReadAllText($f,[Text.Encoding]::UTF8) -split "`n"
for($i=0;$i -lt $lines.Length;$i++){
 $l=$lines[$i]
 if($l -match '^\t\tW_X\s'){ $lines[$i]="`t`tW_X`t`t`t`t:`tarray[$($n*5)] of byte = ("+($wx -join ',')+");" }
 elseif($l -match '^\t\tW_Y\s'){ $lines[$i]="`t`tW_Y`t`t`t`t:`tarray[$($n*5)] of byte = ("+($wy -join ',')+");" }
 elseif($l -match '^\t\tDly\s'){ $lines[$i]="`t`tDly`t`t`t`t:`tarray[$n] of byte = ("+($dl -join ',')+");`t`t/* inditasi keses (kep) */" }
}
[IO.File]::WriteAllText($f,($lines -join "`n"),(New-Object Text.UTF8Encoding($false)))
"reszecske: $n"
