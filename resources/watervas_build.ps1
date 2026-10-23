# WaterPumpGame.ras -> WaterVAS.ras (valos gepre): az U3-adatok EGY tomoritett blokkban a kod utan ($7A00-tol),
# indulaskor a program masolja at az U3-ba ($C000..). A .cas igy folytonos, kitoltes nelkul.
param([int]$Blob = 0x7A00)
$enc = New-Object Text.UTF8Encoding($false)
$dir = Split-Path $PSScriptRoot -Parent
$L = [IO.File]::ReadAllText("$dir\WaterPumpGame.ras", $enc) -split "`n"
$items = @()
for ($i = 0; $i -lt $L.Length; $i++) {
	$m = [regex]::Match($L[$i], '^\s*(\w+)\s*:\s*incbin\("([^"]+)",\s*\$[0-9A-Fa-f]+\);')
	if ($m.Success) { $items += [pscustomobject]@{ Line = $i; Name = $m.Groups[1].Value; File = $m.Groups[2].Value } }
}
if ($items.Count -lt 10) { "HIBA: keves incbin sor ($($items.Count))"; exit 1 }
$ms = New-Object IO.MemoryStream
$addr = 0xC000
foreach ($it in $items) {
	$b = [IO.File]::ReadAllBytes("$dir\" + $it.File)
	$L[$it.Line] = "`t`t{0}`t:`tarray[{1}] of byte at `${2:X4};" -f $it.Name, $b.Length, $addr
	$ms.Write($b, 0, $b.Length); $addr += $b.Length
}
$len = [int]$ms.Length
if ($addr -gt 0xE700) { "HIBA: az U3-adat a Pause_Buf-ba er"; exit 1 }
[IO.File]::WriteAllBytes("$dir\resources\vas_u3.bin", $ms.ToArray())
$first = $items[0].Line
$L[$first] = ("`t`tVAS_Blob`t:`tincbin(`"resources\vas_u3.bin`", `${0:X4});`n" -f $Blob) + $L[$first]
$pi = [Array]::FindIndex($L, [Predicate[string]] { param($x) $x -match '^\s*Procedure ProgramInit\(\)' })
$bg = -1; for ($i = $pi; $i -lt $pi + 8; $i++) { if ($L[$i] -match '^\s*begin\s*$') { $bg = $i; break } }
if ($pi -lt 0 -or $bg -lt 0) { "HIBA: ProgramInit nem talalhato"; exit 1 }
$copy = @"
		asm("
			di
			ld a,(`$3)
			push af
			ld a,`$B0
			out (`$2),a
			ld hl,VAS_Blob
			ld de,`$C000
			ld bc,$len
			ldir
			pop af
			out (`$2),a
			ei
		");
"@ -replace "`r", ""
$L[$pi] = "Procedure VAS_Masol();`n`tbegin`n" + $copy + "`n`tend;`n`n" + $L[$pi]; $L[$bg] = $L[$bg] + "`n`t`tVAS_Masol();"
[IO.File]::WriteAllText("$dir\WaterVAS.ras", ($L -join "`n"), $enc)
"blob: {0} byte, `${1:X4}..`${2:X4} -> U3 `$C000..`${3:X4}" -f $len, $Blob, ($Blob + $len - 1), ($addr - 1)
$p = Start-Process -FilePath "C:\TVC\TRSE\trse.exe" -ArgumentList "-cli", "op=project", "project=LG_TVC_Projects.trse", "input_file=WaterVAS.ras", "assemble=yes" -WorkingDirectory $dir -Wait -PassThru -NoNewWindow -RedirectStandardOutput "$env:TEMP\vas.txt"
"exit=$($p.ExitCode)"; Get-Content "$env:TEMP\vas.txt" | Select-String -Pattern "Fatal|Expected|rror|line:" | Select-Object -First 5
(Select-String -Path "$dir\WaterVAS.sym" -Pattern "EndBlock19ef|VAS_Blob").Line
Get-Item "$dir\WaterVAS.bin", "$dir\WaterVAS.cas" -ErrorAction SilentlyContinue | ForEach-Object { "{0} {1}" -f $_.Name, $_.Length }
