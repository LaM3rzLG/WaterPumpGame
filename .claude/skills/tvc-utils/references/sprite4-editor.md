# Sprite4 szerkesztő - `sprite4_szerkeszto.html` (v1, 2026-10-05)

A `sprite16_szerkeszto.html` (v15) MÁSOLATÁBÓL készült 4 színű (GRAPHICS4) változat, a WaterPumpGame
sprite-jaihoz (pumpa, keret, meteor, bomba, fal, vírus...). A 16 színű szerkesztő változatlanul megmaradt.
Felület, fülek, adatmodell, mechanizmusok: mint a `sprite16-editor.md`-ben - itt csak az ELTÉRÉSEK.

## Eltérések a Sprite16-hoz képest

- **Állandók a szkript elején:** `PPB=4` (pixel/byte), `PA=1` (a pixel szélessége a magasságához képest - a
  GRAPHICS4 pixelt négyzetesnek rajzoljuk; a Sprite16-ban ez 2), `NC=4` (színek), `MAXW=256`.
  Minden korábbi `*2` / `/2` ezekre lett cserélve (a vonal-kényszerítés `vx/2` küszöbei NEM arány, maradtak).
- **Paletta:** `PAL16`/`NAMES16` = a TVC 16 színe; `PRESETS=[{id,name,idx:[4 db 16-os index],ge:[4 db GE-név]}]`,
  `palSet` = a kiválasztott készlet, `applyPal()` tölti az AKTÍV `PAL[0..3]`/`NAMES[0..3]`-at. A bal panelen
  `#palPreset` választó. Jelenleg EGY készlet van: **WaterPump = [7,0,12,9]** (0 szürke, 1 fekete, 2 zöld, 3 kék;
  GE: `PALETTE_Gray/Black/Green/Blue`). TERV (a felhasználó kérte, még nincs): színenként választható paletta
  (a 4 index mindegyikéhez a 16 TVC-színből) - ehhez elég a `PRESETS` mellé egy szerkeszthető `idx` + a
  `fillColSel` újrahívása; a projektbe a `pal` mező mellé az `idx`-et is menteni kell.
- **A paletta NINCS a Bery `.bin`-ben** - a fájl csak a 0..3 indexet tárolja; a színeket a játék állítja
  (`GE::SetPalette(i, GE::PALETTE_...)`). A TRSE-kódrészlet kiírja a 4 `SetPalette` sort.
- **Kódolás:** `encPix(c,n)` / `decPix(b,n)` (n = 0..3 a byte-on belül: alsó bit -> bit 7-n, felső -> bit 3-n),
  `maskBits(n) = 0x88>>n` (maszkban az átlátszó pixel két bitje). `buildBin`/`parseBin`: szélesség = pixel/4.
- **Méret:** szélesség 4 többszöröse, 4..256; magasság 1..240. `resize`, `selToNew`, import felfelé kerekít.
- **Képernyő fül:** 256x240, X byte-ban (1 byte = 4 pixel); a border a 16 TVC-színből (`PAL16`), a háttér a 4-ből.
- **Képimport:** a 4 aktív színre alakít; a TVC-kép felismerés tűrése 90*90 (a rajzolóprogramok `C0C0C0`
  szürkéje is a paletta szürkéjének számít, így a `Pump1.bmp`-szerű képek 1:1-ben töltődnek); "egy TVC-pixel a
  képen" 1x1 / 2x2 / 4x4 / 8x8; a pixelarány-korrekció rejtve (pxA = 1); Auto szín 2 / 3.
  Maszkolt sprite-nál a szürke háttér átlátszóvá tételéhez a "színkulcs" (bal felső pixel) kapcsoló kell.
- **PNG mentés:** 1:1, 2x, 4x, 8x (`_x2` ... utótag).
- **Projekt:** `format:"sprite4-projekt"`, `version:1`, `pal:"waterpump"`; a sprite16 projektet ELUTASÍTJA
  (és 4-nél több színt, nem 4-gyel osztható szélességet is). localStorage: `waterpump_sprite4_v1`,
  `waterpump_sprite4_rightW`. Alapértelmezett rajzszín: 1 (fekete), háttér/üres: 0 (szürke).
- **Teszt-hozzáférés:** `window.__s16` (a név maradt) + `PAL, PAL16, NAMES, PRESETS, PPB, draw, resize, im.detect`.

## v2 (2026-10-05): mentés névvel, sprite-onkénti BMP (mentés: `.bak_v1`)

- **`saveFile(name, blob, desc, ext, id)`** (közös): `showSaveFilePicker` ("Mentés másként": név + mappa, `id`-nként
  megjegyzett mappa: `s4bin`, `s4bmp`, `s4proj`); ha nincs / hibázik: `prompt` a névre + letöltés. Vissza: fájlnév / null.
  Ezt használja a "Mentés .bin" (`saveBin`), a konténer-export, a projektmentés és a BMP.
- **BMP gomb a sprite-listában** (`.sv`, `buildSpriteList`): csak akkor látszik, ha a sprite a legutóbbi BMP-mentés
  óta változott vagy még nem volt mentve - `s.bmpH !== spriteSig(s)` (FNV-ujjlenyomat: név + méret + maszk + pixelek);
  `saveBmp(s)` siker után `s.bmpH`-t állít, a projekt `bmp` mezőben menti. `buildBmp(s)`: 24 bites BMP az 1. fázisból,
  a paletta RGB-jével; az átlátszó pixel a 0. színnel (szürke) - a `resources\*.ps1` konvertálók ezt jól olvassák.
- **Projektnév:** szerkeszthető `#projName` mező a fülsávban (ez a javasolt `.json` fájlnév; mentés után a fájl nevét veszi fel).
- A felhasználó jelzése volt, hogy "nem tud nevet adni" a projektnek és a `.bin`-nek: a `.bin` korábban kérdés
  nélkül a Letöltésekbe ment; a projektnél a "Mentés másként" ablak valódi böngészőben (`file://`) NINCS igazolva.

## v3 (2026-10-05): "Mind egy .bin-be" (mentés: `.bak_v2`)

- A sprite-lista fölötti `#bAllBin` gomb: `allSpritesAnim()` a lista ÖSSZES sprite-ját a lista sorrendjében egy animált Bery GE `.bin`-be fűzi (fejléc egyszer + a fázisok), konténer nélkül; eltérő méret/maszkolás esetén hibát jelez. A javasolt fájlnév a projekt neve.
- OKA: a felhasználó a sprite-okat (akna1..16) szerkesztette, a "Mentés .bin" csak az AKTUÁLIS sprite egy fázisát menti, a konténer fázisai pedig a behúzáskori MÁSOLATOK (későbbi sprite-módosítás nem megy át) - így a konténer elavult. Ha a felhasználó sprite-listából dolgozik, ez a gomb a helyes export.
- Ellenőrizve: az `akna.json`-ból a gomb kimenete bájtazonos a játék `akna.bin`-jével (259 byte).

## v4 (2026-10-05): "Mind mentése BMP-be"

- `#bAllBmp` / `saveAllBmp()`: `showDirectoryPicker` (mappa, `id:s4bmpdir`, readwrite) -> minden sprite `<név>.bmp` (felülír), utána `bmpH` beáll (a soronkénti BMP gombok eltűnnek). Azonos nevű sprite-oknál megáll. Ha nincs mappaválasztó: megerősítés után egyenként a Letöltésekbe. A valódi mappaválasztó (`file://`, írási engedély kérése) NINCS igazolva, csak helyettesítve tesztelt.

## v5 (2026-10-05): "Új projekt"

- `#bProjNew` / `newProject()`: megerősítés után egy üres `sprite1` (az éppen szerkesztett sprite méretével/maszkolásával), üres konténer, üres képernyő, alap projektnév; a lemezre mentett fájlokat nem érinti, az autosave felülíródik.

## Ellenőrizve (fejetlen Edge, 2026-10-05)

A játék `Pumpa.bin`, `Pumpa2.bin`, `keret.bin`, `meteor.bin` (4 fázis), `bomba.bin`, `talaj1.bin`, `fal.bin`,
`enemy.bin` fájljai `parseBin` -> `buildBin` után BÁJTAZONOSAK; projekt oda-vissza; BMP-színű kép 1:1 importja;
képernyőkép. Valódi böngészőben egérrel (rajzolás, húzás, fájlválasztó ablakok) NINCS kipróbálva.
