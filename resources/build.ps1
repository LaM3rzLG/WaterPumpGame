# Teljes build: fordítás (nightly) -> U3 boot-javítás (u3_boot_patch.ps1) -> lemezkép (WaterPumpGame.dsk).
# Hasznalat (a projekt gyokereben): powershell -NoProfile -File resources\build.ps1
$root = Split-Path $PSScriptRoot -Parent
Set-Location $root
$cas = Join-Path $root "WaterPumpGame.cas"
$elotte = if (Test-Path $cas) { (Get-Item $cas).LastWriteTime } else { [datetime]::MinValue }
$ki = Join-Path $env:TEMP "trse_out.txt"
$p = Start-Process -FilePath "C:\TVC\TRSE_Nightly\trse.exe" -ArgumentList "-cli op=project project=LG_TVC_Projects.trse input_file=WaterPumpGame.ras assemble=yes" -RedirectStandardOutput $ki -Wait -NoNewWindow -PassThru
$hibak = Get-Content $ki | Select-String -Pattern "rror|Line \d+"
if ($p.ExitCode -ne 0 -or $hibak -or -not (Test-Path $cas) -or (Get-Item $cas).LastWriteTime -le $elotte) {
  "FORDITASI HIBA (exit $($p.ExitCode)):"; Get-Content $ki | Select-Object -Last 15; exit 1
}
"forditas OK"
powershell -NoProfile -File (Join-Path $PSScriptRoot "u3_boot_patch.ps1")
if ($LASTEXITCODE -ne 0) { "U3 BOOT-JAVITAS HIBA - a lemezkep NEM keszult el"; exit 1 }
& (Join-Path $PSScriptRoot "make_dsk.ps1") -Files @("WaterPumpGame.cas=WATERPG.CAS","SPRITES.BIN=SPRITES.BIN","PALYAK_lemez.BIN=PALYAK.BIN","SZABALY.BIN=SZABALY.BIN","MENU16.BIN=MENU16.BIN","U3KOD.BIN=U3KOD.BIN") | Select-Object -Last 1
