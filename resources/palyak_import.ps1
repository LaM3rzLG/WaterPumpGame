# PALYAIMPORT: waterpump_palyak.json -> (a szerkeszto fej nelkul, Edge) -> resources\palyak\palyak_adat.txt -> palyak_bin.ps1
# (PALYAK.BIN + a .ras palyablokkja) -> forditas -> lemezkep (WaterPumpGame.dsk). Hasznalat: powershell -File resources\palyak_import.ps1
$enc = New-Object Text.UTF8Encoding($false)
$dir = Split-Path $PSScriptRoot -Parent
$sp = Join-Path $env:TEMP "wp_import"; New-Item -ItemType Directory -Force $sp | Out-Null
$edge = "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$adat = "$dir\resources\palyak\palyak_adat.txt"
"json: " + (Get-Item "$dir\waterpump_palyak.json").LastWriteTime
$src = [IO.File]::ReadAllText("$dir\tools\terkep_szerkeszto.html", $enc)
$json = [IO.File]::ReadAllText("$dir\waterpump_palyak.json", $enc)
$js = "window.onerror=function(m,u,l){document.title='JSERR '+m+' @'+l};(function(){var W=window.__waterpump;var ok=W.load($json);document.getElementById('o1').textContent=W.rasText();document.getElementById('o2').textContent=W.rasText2();document.title='RES '+ok+' '+W.sets()[0].length+' '+W.sets()[1].length;})();"
[IO.File]::WriteAllText("$sp\t.html", $src.Replace('</body>', '<pre id="o1"></pre><pre id="o2"></pre><script>' + $js + '</script></body>'), $enc)
Remove-Item "$sp\ep" -Recurse -Force -ErrorAction SilentlyContinue
Start-Process -FilePath $edge -ArgumentList '--headless=new','--disable-gpu',"--user-data-dir=$sp\ep",'--virtual-time-budget=3000','--dump-dom',("file:///" + $sp.Replace([string][char]92,'/') + "/t.html") -Wait -NoNewWindow -RedirectStandardOutput "$sp\dom.txt" 2>$null
$d = [IO.File]::ReadAllText("$sp\dom.txt", $enc); ([regex]::Match($d, '<title>.*?</title>')).Value
Add-Type -AssemblyName System.Web
$o1 = [System.Web.HttpUtility]::HtmlDecode(([regex]::Match($d, '<pre id="o1">([\s\S]*?)</pre>')).Groups[1].Value).TrimEnd("`n") -split "`n"
$o2 = [System.Web.HttpUtility]::HtmlDecode(([regex]::Match($d, '<pre id="o2">([\s\S]*?)</pre>')).Groups[1].Value).TrimEnd("`n") -split "`n"
if (-not $o1 -or $o1.Count -lt 10 -or -not $o2 -or $o2.Count -lt 5) { "HIBA: ures szerkeszto-kimenet, semmi NEM valtozott"; exit 1 }
if (Test-Path $adat) { Copy-Item $adat "$adat.bak" -Force }
[IO.File]::WriteAllText($adat, (($o1 + $o2) -join "`n"), $enc)
"palyak_adat.txt: {0} + {1} sor" -f $o1.Count, $o2.Count
& powershell -NoProfile -File "$dir\resources\palyak_bin.ps1"
if ($LASTEXITCODE -ne 0) { "HIBA: palyak_bin.ps1"; exit 1 }
$p = Start-Process -FilePath "C:\TVC\TRSE\trse.exe" -ArgumentList "-cli","op=project","project=LG_TVC_Projects.trse","input_file=WaterPumpGame.ras","assemble=yes" -WorkingDirectory $dir -Wait -PassThru -NoNewWindow -RedirectStandardOutput "$sp\b.txt"
"forditas exit=$($p.ExitCode)"; (Select-String -Path "$dir\WaterPumpGame.sym" -Pattern "EndBlock19ef").Line
if ($p.ExitCode -eq 0) { & powershell -NoProfile -File "$dir\resources\make_dsk.ps1" }
