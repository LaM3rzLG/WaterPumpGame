# Sprite16 szerkesztő - `sprite16_szerkeszto.html` (állapot: v15, 2026-09-27)

Egyetlen önálló HTML-fájl (~1400 sor, ~106 KB), stílus + HTML + egy nagy `<script>`. Nincs keretrendszer,
nincs build. A változásokat lépésenként, `.bak_vN` mentésekkel fejlesztettük (a történet: `history-sprite16.md`).

## Fülek és felület

1. **Sprite szerkesztő** (`#view-edit`)
   - bal panel: eszközök (Pont P, Festés F, Vonal L, Téglalap R, Kör/ellipszis C, Színválasztó I, Spray S,
     Kijelölés M; "kitöltött alakzat"; Shift = a képernyőn arányos alak / 45°), paletta (16 szín + átlátszó,
     bal gomb = bal szín, jobb gomb/Ctrl = jobb szín, X = csere), háttér (maszkolt / nem maszkolt), méret
     (2..128 páros x 1..240), műveletek (vissza/előre, törlés, tükrözés, eltolás), kijelölés-gombok,
     Cartoon effekt;
   - felső sáv: Mentés .bin, Betöltés .bin, Kép importálása…, PNG mentés + mód, nagyítás, rács; konténer-
     szerkesztéskor `#frameBar` ("Konténer: név", fázisválasztó, +, hagymahéj, "← Animátor");
   - jobb panel (húzható elválasztóval, dupla katt = elrejt): sprite-lista (Új/Másolat/Törlés/▲▼), Név,
     TVC-arányú előnézet, fájl-info, TRSE-kódrészlet, formátum-leírás.
2. **Képernyő** (`#view-scene`): TVC GRAPHICS16 kép 128x240 borderrel (`SW=128`, border `BX=32`/`BY=24`
   vászon-egység), border- és háttérszín, nagyítás 1-4x, rács; sprite lerakása (több is), kijelölés, húzás,
   nyilak (1 byte / 1 sor, Shift 4/8), Delete, Előre/Hátra (rajzolási sorrend), X (byte) / Y (sor) mezők;
   koordináta-lista + TRSE-sorok (`Nev.X:=..; Nev.Y:=..; Nev.SetPosition(); Nev.Draw()/Put();`).
3. **Animátor** (`#view-anim`): bal = forrás sprite-ok (húzás a fázissávba / dupla katt = a végére);
   közép = fázissáv (miniatűrök, kattintás = kiválaszt, dupla katt = szerkesztés, húzással átrendezés) +
   előnézet (nagyítás 1-16x vagy "illesztés"); bal alsó = lejátszás (Szóköz), Léptetés ▶ (→), Elejére (Home),
   fázisok közti idő (képkocka, 50 = 1 mp), körkörös ismétlés, háttér, hagymahéj; jobb = konténerlista
   (Új/Másolat/Törlés/▲▼, Név, "Mentés .bin (animált GE sprite)"), info, TRSE-kódrészlet.

Ablakok: **Kép importálása** (`#imModal`, átméretezhető `#imBox`, ⛶ teljes ablak) - lásd `image-conversion.md`.

## Adatmodell

```js
P = { sprites:[...], cur, anims:[...], acur, ek:"sprite"|"anim",
      scene:{border,bg,zoom,grid,items:[{sid,x,y}],sel,place} }
sprite / konténer = { id,name,W,H,masked, frames:[Int8Array(W*H)], cf, undo:[], redo:[], anim:{speed,loop} }
pixel: -1 (TR) = átlátszó, 0..15 = színindex
```
- `sp()` = a szerkesztett objektum: animátor nézetben vagy `P.ek==="anim"` mellett a kijelölt KONTÉNER,
  egyébként a kijelölt SPRITE. `px()` = `sp().frames[sp().cf]`. `byId()` mindkét tömbben keres.
- `ensureAnim()`: mindig legyen legalább egy konténer (`setView`, `load`, `deserialize` hívja).
- A sprite-ok egyfázisúak; többfázisú `.bin` betöltése konténerként kerül be.
- Új, üres (1 üres fázisú) konténer az első behúzott sprite méretét/maszkolását veszi át (`framesFromSprite`);
  eltérő méretnél `fitFrame`: bal felső sarokhoz igazít, vág/kiegészít.

## Fontos mechanizmusok

- **Visszavonás:** objektumonként (`undo`/`redo`, max 100), a pillanatkép minden fázist tartalmaz (`snap`).
  `pushUndo()` = `commitFloat()` + `pushUndoRaw()`.
- **Lebegő kijelölés** (`flt`): beillesztés / felemelés; minden más módosítás, eszköz-, sprite-, fülváltás és
  mentés előtt `commitFloat()` lerakja. `sel` = kijelölt téglalap, `clip` = vágólap (sprite-ok között is).
- **Rajzolás:** `draw(d)` a W x H képet 1 px/pixel canvasra rendereli, majd nagyítva (pixel 2*zoom széles,
  zoom magas) rajzol + rács (byte-határ erősebb); hagymahéj: az előző fázis 40%-kal az üres helyeken.
- **Animáció időzítés:** `animLoop` requestAnimationFrame + 20 ms-os "TVC-képkocka" számláló; fejetlen
  böngészőben a rAF nem fut - teszteléshez `animLoop(ts)` közvetlenül hívható.
- **Húzd-és-ejtsd:** HTML5 drag&drop, `text/plain` = `s:<spriteId>` (sprite a listából) vagy `f:<index>` (fázis).
- **Gyorsbillentyűk:** INPUT/SELECT/TEXTAREA mezőben és nyitott import-ablaknál nem hatnak
  (az ablakban Esc = mégse, Enter = importálás).

## Mentés, export, tárolás

- **Sprite / konténer `.bin`:** `buildBin(s)` - Bery GE formátum, minden fázis egymás után (`formats.md`);
  `parseBin(u)` a visszaolvasás (fejléc-ellenőrzéssel).
- **PNG:** `spritePng(s,p,sx,sy)` - `pngMode`: 1:1, 2:1 (`_tvc`), 4x2 (`_tvc_x2`), 8x4 (`_tvc_x4`); az átlátszó átlátszó marad.
- **Projekt `.json`** (`serialize`/`deserialize`, `version:3`): `sprites`, `anims`, `cur`, `acur`, `ek`,
  `scene{border,bg,zoom,grid,items[{s,x,y}]}`, `ui{colL,colR,zoom,tool,view,onion,png,name}`;
  a pixelek fázisonként hex-karakterlánc (`0`-`f`, `.` = átlátszó). Mentés: "Projekt mentése…" ->
  `showSaveFilePicker` (név + mappa), tartalék: `prompt` + letöltés; a név (`projName`) a fülsávban látszik.
- **localStorage:** `waterpump_sprite16_v2` (autosave, 300 ms késleltetéssel), `waterpump_sprite16_v1` (régi,
  betöltéskor átveszi), `waterpump_sprite16_rightW` (+ `_hide`) a jobb panel szélességéhez;
  a régi `waterpump_claude_key`-t betöltéskor törli.

## Teszt-hozzáférés

`window.__s16` = `{encPix, decPix, buildBin, parseBin, P, serialize, deserialize, setView, newSprite,
uiRefresh, sceneRefresh, cartoon, sprayAt, px, api(): {sel, flt, clip, copySel, …}, anim:{setFrame, frameAdd,
frameDel, frameMove, animStep, animStart, animStop, animRefresh, animLoop, framesFromSprite, frameReorder, st()},
im:{imOpen, compute, palOn, B8, pal1, blur, spritePng}}` - a fejetlen tesztek ezen keresztül hívnak
(`testing-headless-edge.md`). Új funkciónál bővítsd, ha tesztelni kell.

## Fő függvények (a fájlban nagyjából ebben a sorrendben)

Paletta/kódolás: `PAL`, `NAMES`, `encPix`, `decPix`, `buildBin`, `parseBin` · Modell: `newSprite`, `ensureAnim`,
`sp`, `px`, `byId`, `uniqueName` · Szerkesztő: `draw`, `buildPalette`, `buildSpriteList`, `uiRefresh`, `pushUndo`,
`doUndo`, `plot/line/rect/ellipse/flood/constrain/shape`, `sprayAt`, `cartoon`, kijelölés (`selDown`, `selMove`,
`copySel`, `cutSel`, `pasteSel`, `delSel`, `allSel`, `selToNew`, `nudge`, `commitFloat`), `resize`, `transform`,
`setTool` · Import: `imOpen`, `imDetectTvc`, `imCompute11`, `imCompute` és segédei (`image-conversion.md`) ·
Export: `spritePng` · Képernyő: `sceneRender`, `sceneRefresh`, `hitItem`, `clampItem` · Animátor: `setFrame`,
`frameAdd/Del/Move`, `animStart/Stop/Step/Loop/Render/Refresh`, `framesFromSprite`, `frameReorder`, `moveAnim`
· Keret: `setRightW`, `setView`, `serialize`, `deserialize`, `save`, `load`, `projNameUi`.
