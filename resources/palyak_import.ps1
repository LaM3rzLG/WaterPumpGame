# PALYAIMPORT: waterpump_palyak.json -> (a szerkeszto fej nelkul, Edge) -> resources\palyak\palyak_adat.txt -> palyak_bin.ps1
# (PALYAK.BIN + a .ras palyablokkja) -> build (Windows: build.ps1, Mac: build_mac.sh --no-emu) -> WaterPumpGame.dsk.
# Hasznalat: Windows: powershell -File resources\palyak_import.ps1   Mac: pwsh resources/palyak_import.ps1   [-NemForditas: csak a palyak_adat.txt]
param([switch]$NemForditas)
. (Join-Path $PSScriptRoot 'kozos.ps1')
$enc = New-Object Text.UTF8Encoding($false)
$sp = Join-Path $Temp "wp_import"; New-Item -ItemType Directory -Force $sp | Out-Null
if (-not $Bongeszo) { "HIBA: nincs fej nelkul futtathato bongeszo (Windows: Edge, Mac: Chrome) - lasd kozos.ps1 / gep_beallitas.ps1"; exit 1 }
$adat = Ut "resources/palyak/palyak_adat.txt"
$jsonF = Ut "waterpump_palyak.json"
"json: " + (Get-Item $jsonF).LastWriteTime
$src = [IO.File]::ReadAllText((Ut "tools/terkep_szerkeszto.html"), $enc)
$json = [IO.File]::ReadAllText($jsonF, $enc)
$js = "window.onerror=function(m,u,l){document.title='JSERR '+m+' @'+l};(function(){var W=window.__waterpump;var ok=W.load($json);document.getElementById('o1').textContent=W.rasText();document.getElementById('o2').textContent=W.rasText2();document.title='RES '+ok+' '+W.sets()[0].length+' '+W.sets()[1].length;})();"
$tHtml = Join-Path $sp "t.html"; $epDir = Join-Path $sp "ep"; $domF = Join-Path $sp "dom.txt"
[IO.File]::WriteAllText($tHtml, $src.Replace('</body>', '<pre id="o1"></pre><pre id="o2"></pre><script>' + $js + '</script></body>'), $enc)
Remove-Item $epDir -Recurse -Force -ErrorAction SilentlyContinue
$url = 'file:///' + (($tHtml -replace '\\', '/').TrimStart('/') -replace ' ', '%20')
Start-Process -FilePath $Bongeszo -ArgumentList '--headless=new','--disable-gpu',"--user-data-dir=$epDir",'--virtual-time-budget=3000','--dump-dom',$url -Wait -NoNewWindow -RedirectStandardOutput $domF 2>$null
$d = [IO.File]::ReadAllText($domF, $enc); ([regex]::Match($d, '<title>.*?</title>')).Value
$o1 = [System.Net.WebUtility]::HtmlDecode(([regex]::Match($d, '<pre id="o1">([\s\S]*?)</pre>')).Groups[1].Value).TrimEnd("`n") -split "`n"
$o2 = [System.Net.WebUtility]::HtmlDecode(([regex]::Match($d, '<pre id="o2">([\s\S]*?)</pre>')).Groups[1].Value).TrimEnd("`n") -split "`n"
if (-not $o1 -or $o1.Count -lt 10 -or -not $o2 -or $o2.Count -lt 5) { "HIBA: ures szerkeszto-kimenet, semmi NEM valtozott"; exit 1 }
if (Test-Path $adat) { Copy-Item $adat "$adat.bak" -Force }
[IO.File]::WriteAllText($adat, (($o1 + $o2) -join "`n"), $enc)
"palyak_adat.txt: {0} + {1} sor" -f $o1.Count, $o2.Count
if ($NemForditas) { "palyak_bin.ps1 + forditas kihagyva (-NemForditas)"; exit 0 }
& $PsExe -NoProfile -File (Join-Path $PSScriptRoot "palyak_bin.ps1")
if ($LASTEXITCODE -ne 0) { "HIBA: palyak_bin.ps1"; exit 1 }
# teljes build (forditas + U3 boot-javitas + lemezkep) a gep sajat build-szkriptjevel
if ($Mac) { & bash (Join-Path $PSScriptRoot "build_mac.sh") --no-emu } else { & $PsExe -NoProfile -File (Join-Path $PSScriptRoot "build.ps1") }
if ($LASTEXITCODE -ne 0) { "HIBA: a build nem sikerult"; exit 1 }
