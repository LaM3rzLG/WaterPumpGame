# HTML-eszközök automatikus tesztelése fejetlen (headless) Edge-dzsel

A gépen Microsoft Edge van: `C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe`. A szerkesztők
önálló HTML-ek, ezért a teszt: **a HTML egy másolatába a `</body>` elé egy teszt-szkriptet szúrunk**, ami a
`window.__s16` (vagy hasonló) teszt-hozzáférésen át hív, és az eredményt a `document.title`-be írja; az Edge
`--dump-dom` kimenetéből a `<title>`-t kiolvassuk. Képernyőképhez `--screenshot`.

## Minta (PowerShell eszköz)

```powershell
$sp="<scratchpad>"; $edge="C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
$src=Get-Content -Raw -Encoding UTF8 C:\TVC\TRSE_Projects\WaterPumpGame\tools\sprite16_szerkeszto.html
$js =Get-Content -Raw -Encoding UTF8 "$sp\tNtest.js"
Set-Content "$sp\tN.html" ($src.Replace('</body>','<script>'+$js+'</script></body>')) -Encoding UTF8
Start-Process -FilePath $edge -ArgumentList '--headless=new','--disable-gpu',"--user-data-dir=$sp\epN",
  '--window-size=1400,900','--virtual-time-budget=5000','--dump-dom',"file:///$($sp -replace '\\','/')/tN.html" `
  -Wait -NoNewWindow -RedirectStandardOutput "$sp\domN.txt" 2>$null
(Select-String -Path "$sp\domN.txt" -Pattern '<title>.*</title>').Matches.Value
# képernyőkép: '--screenshot=<png>' a --dump-dom helyett, majd a Read eszközzel megnézni
```

A teszt-szkript váza:
```js
window.onerror=(m,u,l)=>{document.title="JSERR "+m+" @"+l};
(async function(){const S=window.__s16,r=[];try{ /* ... r.push("név:"+érték) ... */ }
 catch(e){r.push("ERR "+e.message);} document.title="RES "+r.join(" | ");})();
```

## Tanulságok

- **Minden futtatáshoz új `--user-data-dir`** (különben a korábbi localStorage-autosave belezavar, és
  párhuzamos/elakadt profil miatt üres lehet a kimenet). A `Start-Process ... -RedirectStandardOutput` kell,
  különben a `--dump-dom` kimenete elveszhet. Az Edge stderr-zaja (sync / task_manager hibák) ártalmatlan.
- **`requestAnimationFrame` fejetlen módban nem fut** -> az animáció-léptetőt közvetlenül, szimulált
  időbélyeggel hívd (`animLoop(1000); animLoop(1061)`), vagy `setTimeout`-ot használj a késleltetéshez.
- Aszinkron dolgokhoz (kép betöltése, `setTimeout`) `--virtual-time-budget=3000..20000`.
- **Böngészőfunkciók helyettesítése** a teszthez: `window.fetch`, `window.showSaveFilePicker`, `window.prompt`,
  `HTMLAnchorElement.prototype.click` (letöltés elkapása: `this.download`). A valódi funkció (pl. "Mentés másként"
  ablak `file://` alatt, CORS-os API-hívás) így NEM igazolt - ezt a válaszban jelezni kell.
- Tesztképet a szkriptben generálj (`canvas` + `toDataURL` -> `new Image()`), így nincs fájlfüggés.
- A teszthez szükséges belső függvényeket a `window.__s16` objektumba kell kitenni (sed-del a sor végére fűzve).
- A **PowerShell eszköz** a parancsszövegben lévő bizonyos mintákat (pl. `u*u+v*v` -> "Remove-Item on system path
  '/4,v='") törlés-kísérletnek vélheti és blokkolja: a teszt-JS-t mindig **külön fájlba** írd (Write eszköz vagy
  Bash heredoc), és a PowerShell csak beolvassa.
- A Bash `sed -i` cserékben a `$`, `&`, `|`, `[`, `(`, `*` escape-elése hibalehetőség: ha a minta nem illeszkedett
  (a grep-ellenőrzés 0-t ad), válts az Edit eszközre. Minden sed/awk-szerkesztés után grep-pel ellenőrizz.
- Az Edit eszköz "modified on disk" figyelmeztetése a saját korábbi sed-módosítások miatt jön - nem idegen változás.
- **Relatív útvonalon betöltött adat** (pl. `<script src="memoria_adat.js">`): a teszt-másolat az EREDETI mappájába kerüljön
  (`tools\_teszt.html`), a futás után töröld. Kattintás-teszthez elég a `</body>` elé egy `setTimeout(() => el.click(), 50)`.
- **DOM-ellenőrzésnél ne a hibaüzenet szövegére keress** (az a script forrásában is benne van -> hamis találat), hanem
  a kirajzolt elemeket számold (osztálynév / data-attribútum regex-szel).
- Regressziós tesztnél ügyelj a modellváltozásra (pl. a fázisok konténerbe kerültek - a régi teszt a sprite-ba
  tette őket, és hamis hibát mutatott).
