# További PC-s TVC-eszközök (WaterPumpGame projekt)

## `charset_szerkeszto.html` - arányos betűkészlet (font.bin)

91 karakter (ASCII 32..122) rácsban; karakterenként Keskeny (4 px = 1 byte) / Széles (8 px = 2 byte) (N billentyű),
"Mind keskeny/széles", magasság 3..16; nagyított szerkesztő 4 színnel (GRAPHICS4; bal gomb = szín, jobb/Ctrl =
szürke háttér, 1-4 = szín), byte-határ narancs vonallal, a keskeny karakter jobb fele sötétítve; eltolás,
tükrözés, törlés, másolás/beillesztés, Ctrl+Z, PageUp/PageDown; arányos előnézet a 64 byte-os TVC-sorra +
figyelmeztetés, ha a számjegyek nem egyforma szélesek (a játék HUD-ja a "0" szélességével számol).
Mentés `font.bin` (formátum: `formats.md`), betöltés `font.bin` VAGY a régi `CharSetGR4.bin`; `.bmp` 728 px
(91 x 8) csak a rajzhoz; localStorage `waterpump_font_v2`. Régi (59 karakteres, fix szélességű) változat:
`charset_szerkeszto.html.bak_v1`. A felhasználó a kisebb (1 byte-os) betűket végül elvetette; a játék a
Bery 8x7-es betűivel fut a saját `Ir()` kiíróval.

## `terkep_szerkeszto.html` - pályaszerkesztő (WaterPumpGame)

30x18 rács (540 mező, index `x-1+(y-1)*30`), `.` normál talaj / `x` blokkolt; bal gomb = eszköz, jobb/Ctrl =
a másik, húzással fest; Mind ./Mind x/Szegély/Invertálás/Tükrözés/Vissza. Legfeljebb 10 pálya fülekkel
(Új/Másolat/Törlés/Előre-Hátra), pályánként név, cél, co-op cél (0 = automatikus: a cél 3/2-e, max 255),
pumpa-/fal-/bomba-ár, kezdő pénz, termelés, kapcsolók (meteor/vírus/fal/bomba). Autosave localStorage
`waterpump_projekt_v2`; projekt letöltése/megnyitása `.json` (`formats.md`); "Másolás (.ras)" az összes
pályát a `.ras` PÁLYÁK-blokkjaként adja ki. Munkamenet: a felhasználó a projektmappába menti a `.json`-t,
Claude újragenerálja a `.ras` blokkot (a `/* PÁLYÁK:` sortól a `^\s*Palya_Bomba\s` sorig) - részletek a
projekt CLAUDE.md-jében és a `watergame-level-workflow` projektmemóriában.

## `image2tvc_offline_v4_2.html` - külső konverter

Egy másik fejlesztő (a felhasználó ismerőse) offline TVC-képkonvertere (Vite/React, minifikált). Nem a mi
kódunk - ne módosítsd; az elemzését lásd `image-conversion.md`. Régebbi változat: `C:\TVC\image2tvc_offline_v3.6.html`.

## PowerShell-szkriptek (`resources\*.ps1`)

| Szkript | Mit csinál |
|---|---|
| `bmp_to_talaj.ps1` | 8x8-as BMP -> nem maszkolt Bery `.bin` (GRAPHICS4, `01 02 08` + 16 byte); színek: szürke 0, fekete 1, zöld 2, kék 3 |
| `nukebomb_to_bin.ps1` | BMP (szélesség 4 px többszöröse) -> MASZKOLT Bery `.bin` (GRAPHICS4, bytepár MASZK, ADAT; szürke = átlátszó); `-In`/`-Out`; több fázis: fázisonként futtatva, a fejléc egyszer |
| `nuke_build.ps1` | a nuke-felhő 10 fázisa -> `nuke.bin` (`-Prefix nuke_c_`) - a nuke-animáció a játékból kikerült, referencia |
| `nukebomb_gen.ps1` | a (elvetett) részecskés robbanás útvonal-táblái - referencia |
| `charset_export.ps1` / `charset_import.ps1` | `CharSetGR4.bin` <-> `charset.bmp` (472x7) + nagyított előnézet; kiírja a `GE::InitCharSet` paramétereit |
| `wav_to_digi.ps1 -In x.wav [-Out nev] [-Fs 4000] [-Normal 1]` (Befosas, 2026-10-10) | KÉSZ PCM `.wav` (8/16 bit, mono/sztereó, bármilyen mintavétel) -> GE digi `nev.bin` (2x4 bit, alsó nibble elöl, 0 = vég) + `nev_tvc.wav` előnézet (pontosan a 4 bites, `-Fs` Hz-es hang - ezt hallgassa meg a felhasználó importálás ELŐTT). Sztereó átlagolva, átmintavételezés a bemeneti szakasz átlagával, csúcsra normalizál |
| `make_explosion_sfx.ps1` / `make_tick_sfx.ps1` | szintetizált digi hang -> `.wav` (meghallgatáshoz) + GE `.bin` (2x4 bit, 4 kHz, 0 = vég); paraméterek `-Sec/-Seed`, ill. `-Ms/-Freq/-Tau` |
| `make_dsk.ps1` | 720 KB FAT12 `.dsk` a WinTVC + HBF (hbf.rom) lemezhez; 8.3 NAGYBETŰS nevek, az első fájl az autostart; attribútum `$00` (a `$20` 236-os hibát okozhatott) |

A BMP-konverterek színleképezése: `#C0C0C0` (vagy szürke) -> 0 / átlátszó, `#000000` -> 1, `#04FF04` -> 2, `#0000FF` -> 3.
GRAPHICS16-os BMP -> SPRITE `.bin` konverterszkript NINCS - arra a Sprite16 import (1:1 mód) + "Mentés .bin" való.
GRAPHICS16-os BMP -> **`GE::Image` nyers bitmap** (fejléc NÉLKÜL, soronként szél/2 byte): `bmp_to_image16.ps1 -In/-Out`
(Befosas `resources\`, 2026-10-09); 1 BMP-pixel = 1 TVC-pixel, legközelebbi szín a 16-ból, kiírja az `Init(#..., szél, mag)`
értékeit. Ellenőrizve: 8x10-es fekete-fehér csempe -> 40 byte (`55 FF FF FF` = bal szélen fekete pixel).

### `terkep_szerkeszto.html` v3 - pályakód + két pályakészlet (2026-10-02)
- **Két pályakészlet** (felül "Pályakészlet:" gombok): `sets[0]` = egy játékos / co-op (LEVEL 1-10), `sets[1]` = két játékos versus (LEVEL 20-tól, a fülek 20, 21, ... számozással); mindkettő max 10 pálya, `levels` = az épp szerkesztett készlet. VS-ben a co-op cél mező rejtve, a cél címkéje "Versus cél: aki eléri, nyer", az új VS pálya alapértékei: cél 255, pumpa 50, fal 50, bomba 1000, pénz 500, termelés 5, meteor/vírus ki.
- **Pályakód** (`kod`): pontosan 5 betű A-Z (a mező szűr és nagybetűsít; `cleanKod`), mellette állapot: "n/5 betű" / "FOGLALT" (mindkét készletben egyedi kell legyen) / "rendben". Új pálya / másolat / régi, kód nélküli projekt betöltése -> véletlen, egyedi kód (`randKod`, `fixKods`).
- **Kimenet:** 1P készlet = a régi PÁLYÁK-blokk + `Palya_Kod : array[n*5] of byte = (ASCII...)` (a `Palya_Cel` ELŐTT, így a csere-tartomány változatlanul `/* PÁLYÁK:` .. `Palya_Bomba`). VS készlet = `/* KÉT JÁTÉKOS PÁLYÁK` .. `Palya2_Bomba` blokk (`PALYA2_DB`, `Terkep2P_Data : incbin(...terkep2p.bin, $E700)`, `Terkepek2 ... at $E700`, `Palya2_Kod`, `Palya2_*`) + "terkep2p.bin letöltése" gomb (pályánként 540 byte, 10/13 értékek) -> `resources\palyak\`.
- **Projekt-JSON:** `{ levels, levels2, set, cur }` (a régi, csak `levels`-es fájl is betölthető; ilyenkor 1 alap VS pálya jön létre). localStorage kulcs változatlan (`waterpump_projekt_v2`).
- Teszt: `window.__waterpump.load(obj)`, `.sets()`, `.rasText()`, `.rasText2()`, `.bin2()`, `.setSet(i)` - headless Edge-dzsel igazolva (régi json betöltése, kódgenerálás, kódszűrés, mindkét blokk).
- **v4 (2026-10-02): 1 bites térkép-kimenet.** Mindkét készlet térképe pályánként 68 byte (`Math.ceil(540/8)`), mező i -> byte `i>>3`, bit `7-(i&7)` (MSB elöl), 1 = blokkolt; `packLines(lvs, első_sorszám)`. 1P blokk a teljes PÁLYÁK-fejléccel (`/* PÁLYÁK:` komment, `PALYA_DB`, `INDULO_PALYA` az "Induló pálya" mezőből, `Terkepek : array[n*68]`, `Palya_Kod`, `Palya_*`); VS blokk `Terkepek2 : array[n*68]`-mal a `.ras`-ban (nincs többé `terkep2p.bin`/incbin). A "normál/blokkolt érték" (10/13) mezők kikerültek (a játék `MapReset`-je képez 10/13-ra). Teszt: visszabontás = a cellák (bad=0); a kimenet egy `.ras`-másolatba illesztve lefordult.
- **v5 (2026-10-02): co-op pályakód.** Az 1P/co-op készlet pályáin `kodCoop` (5 betű, "Co-op pályakód" mező, VS-ben rejtve); minden kód (kod + kodCoop, mindkét készlet) egyedi - `allKods(exL, exF)`, `kodCheck1(input, msg, mező)`; új/másolt/régi pályánál véletlen. Kimenet: `Palya_KodCoop : array[n*5] of byte` a `Palya_Kod` után; JSON mező `kodCoop`. A játék `Kod_Bevitel`-je co-op kódra co-opban indítja a pályát.
- **2026-10-03: pályaszám 49 + 49.** `MAXP` = 49 mindkét készletben; a versus fülek 50-től számozva (`lvlNo`), a játékban mindkét mód 01-től. Memória-figyelmeztetés: a WaterPumpGame-ben jelenleg kb. 25 további pálya fér el `$8000` alatt (~94 byte / egyjátékos pálya).
- **2026-10-03: meteor-opciók.** Pályánként "Meteor a sziklát is rombolja" (`meteorTor`) és "Meteor vírust hoz" (`meteorVir`) jelölő; kimenet `Palya_MeteorTor`/`Palya_MeteorVir` a `Palya_Meteor` után (versusban `Palya2_…`), a csere-tartomány változatlan.

- **terkep_szerkeszto.html (2026-10-05, akna):** új mezők "Akna ára" (`pAknaAr`, JSON `aknaAr`, alap 300) és "Aknát lehet lerakni" (`pAkna`, JSON `akna`); kimenet `Palya_AknaAr`/`Palya_Akna` (és `Palya2_...`) a `Palya_Fal` után, a záró `Palya_Bomba` sor előtt. Régi projekt (nincs `akna` mező): akna = bomba. Mentés: `terkep_szerkeszto.html.bak_akna`. A `resources\palyak_import.ps1` változatlanul működik (a scratchpad-útvonalat és a mentés nevét futtatás előtt át kell írni).

## Projektek közötti másolatok (2026-10-09)
A Befosas projekt (`C:\TVC\TRSE_Projects\Befosas`) a WaterPumpGame általános eszközeinek MÁSOLATÁT kapta:
`tools\` (sprite4/sprite16/charset szerkesztő, image2tvc), `resources\` (bmp_to_talaj, nukebomb_to_bin,
make_explosion_sfx, make_tick_sfx, make_dsk - alapértelmezése ott `Befosas.cas -> BEFOSAS.CAS` -, charset_export/import),
`resources\tvc_sprites\font.bin` + `CharSetGR4.bin`. A szerkesztők localStorage-kulcsa (`waterpump_*`) azonos maradt,
így a böngészőben a két projekt munkája közös. Ha egy eszköz javul, a másik projektben lévő másolatot is frissíteni kell.

## PowerShell-szkriptek írása / forrás szerkesztése - csapdák
- `-replace` / `[regex]::Replace` csereszövegében a `$60`, `$0`, `${1}` csoporthivatkozás -> Z80 asm-sorok tűntek el.
  Forráskódot sorszám- vagy here-string-alapú cserével módosíts, és utána olvasd vissza.
- PS 5.1 a BOM nélküli `.ps1`-et ANSI-nak olvassa -> ékezetes keresőszöveg nem talál. Ékezet nélküli minta (`P.LY.K`) vagy BOM.
- Rövid saját függvénynév ne legyen alias: `function R` helyett az `Invoke-History` (alias `r`) futott.
- A változónevek kis/nagybetű-érzéketlenek: `$l` ciklusváltozó elfedi a `$L` tömböt. DINAMIKUS hatókörrel ez a HÍVOTT
  függvényekre is átterjed: egy `function Uj($fn, $w)` paramétere a belőle hívott `P()`-ben a szkript `$W`-jét (kép
  szélessége) írta felül; a script-szintű `$bal`/`$n` a `$BAL` margót / `$N` betűszámot (2026-10-26, mind csendes hibás
  kimenet, nem hiba). Globális konstansnak egyedi, hosszabb nevet adj, és ne használd ugyanazt kisbetűvel.
- Fájl visszaírása előtt őrfeltétel (üres kimenet / hibás blokkhatár esetén NE írjon) + `.bak_` mentés.
- Sorvégek: a `.ras` lehet LF, a `.trse` CRLF - detektáld, ne feltételezd.

## `tilemap_szerkeszto.html` - tilemap szerkesztő (Befosas projekt, `tools\`, v1: 2026-10-10)

Vízszintesen scrollozó pálya: **10 csempe magas, állítható szélességű** (1..4000 csempe, a jobb szélén nő/csökken;
"+1 képernyő" = +16 csempe). v1-ben két csempe: 0 = nincs, 1 = csempe (fehér kocka, fekete bal éllel és felső sorral -
a játék `csempe1`-e). Egy csempe 8x10 TVC-pixel = 4 byte x 10 sor, a rajzon 2:1 pixelaránnyal (16x10 egység x nagyítás).
Bal gomb = a kiválasztott eszköz, jobb gomb / Ctrl = a másik, húzással fest; 1/2 = eszközváltás; Ctrl+Z (100 lépés,
a szélességváltást is visszavonja); Ctrl+S; nagyítás 1-3x; sárga vonal = képernyőhatár (16 csempe = 64 byte);
állapotsor: mező (oszlop, sor, hányadik képernyő), méret csempében/byte-ban/képernyőben, csempék száma.
Név mező = fájlnév (`nev.json`), "Mentés másként" ablak, ha a böngésző engedi (a választott név visszaíródik a mezőbe);
Megnyitás `.json`; autosave localStorage `befosas_tilemap_v1`. Formátum: `formats.md`. Teszt-hozzáférés: `window.__map`.
A játékba: `resources\tilemap_to_bin.ps1` (`.json` -> oszlopfolytonos `.bin`, lásd `formats.md`). MÉG NINCS: több csempefajta,
oszlop beszúrása/törlése középen. Fejetlen Edge-ben tesztelve (húzás, jobb gomb, visszavonás, szélesség, mentés-
visszatöltés, hibás fájl elutasítása); valódi egérrel és a valódi "Mentés másként" ablakkal NEM.

## Befosas átalakítók (`resources\`, 2026-10-10)

- `csempe_to_bin.ps1 -In csempe.bmp -Out csempe.bin`: egy 8x10-es csempe -> a pixeles scroll 110 byte-os csempe-`.bin`-je
  (alap + 1 pixellel eltolt + szél-táblák; `formats.md`). A felhasználónak NEM kell külön eltolt képet rajzolnia.
- `tilemap_to_bin.ps1 -In palya.json -Out palya.bin`: a tilemap szerkesztő `.json`-ja -> oszlopfolytonos pálya-`.bin`.
- `bmp_to_image16.ps1 -In/-Out [-Repeat N] [-ShiftBg szín]`: BMP -> nyers `GE::Image` bitmap (régebbi próbákhoz).
- `make_im_labels.ps1`: "IM1"/"IM2" próbafeliratok képként (a scroll-kísérletekhez készült, a játék nem használja).
Kép vagy pálya cseréje után a megfelelő szkriptet ÚJRA kell futtatni, utána build.

**tilemap_szerkeszto.html v2 (2026-10-10, mentés: `.bak_v1`):** a csempe 6x10 pixel = 3 byte széles lett (`TW = 6`,
egy sor a forrásban - a `csempe3.bmp` méretéhez igazodik); a mező a rajzon 12x10 egység; a sárga képernyőhatár
64 BYTE-onként van (= 21 és 1/3 csempe, nem esik csempehatárra); az állapotsor byte-ban és képernyőben is ebből számol;
"+1 képernyő" = +21 csempe; a "van tile" keret nélküli fehér mező. A `.json` `tileW` mezője 6 (a régi fájlok 8-at
mondanak - megnyitáskor a szerkesztő nem veszi figyelembe). Fejetlen Edge-ben újratesztelve.
**csempe_to_bin.ps1 v2:** tetszőleges páros szélesség (2..16 pixel), 10 pixel magas; a kimenet 2 byte fejléccel
(szélesség byte-ban, magasság) és OSZLOPFOLYTONOSAN: alap, eltolt, szomszéd-tábla, üres (6x10 -> 82 byte); a saját szél
= az eltolt kép utolsó oszlopa (`formats.md` korábbi 110 byte-os leírása ELAVULT). `tilemap_to_bin.ps1 -CsempeBajt 3`.
**tilemap_szerkeszto.html v3 (2026-10-10, mentés: `.bak_v2`):** a pálya 12 csempe magas (`H = 12`; 120 képsor - a Befosas
két képernyős scrollja legfeljebb 128-at enged); más magasságú `.json` megnyitásakor a pálya ALJÁHOZ igazít; "▲ sor" /
"▼ sor": az egész pálya függőleges eltolása körbe (visszavonható). A pálya-`.bin` fejlécében a magasság most 12, a
játék onnan olvassa. Fejetlen Edge-ben tesztelve (10 soros fájl -> 12, sor fel/le, visszavonás, mentés 12 sorral).
- `sprite_to_bin.ps1 -In figura.bmp -Out figura.bin` (Befosas, 2026-10-10): GRAPHICS16 BMP -> MASZKOLT sprite a `Befosas.tru`
  `Sprite_Init`-jéhez. A FEKETE pixel átlátszó; páros szélesség, legfeljebb 256 byte (szél_byte x magasság).
  Kimenet: 3 byte fejléc `02, szélesség byte-ban, magasság`, utána OSZLOPFOLYTONOSAN (byte-oszloponként, felülről lefelé)
  `MASZK, ADAT` párok - NEM a Bery GE sprite sorrendje (ott soronként jönnek a párok), a GE `Sprite.Init` NEM tudja olvasni.
  **v2 (2026-10-10, mentés: `.bak_v1`): a párok SORFOLYTONOSAK** (soronként, balról jobbra) = a Bery GE maszkolt sprite
  elrendezése; legfeljebb 16 pixel (8 byte) széles. Ok: a `Befosas.tru` gyorsított kirakója soronként halad. A fenti
  oszlopfolytonos leírás a v1-re igaz (azt a `Befosas_OK.tru` / `Befosas_byte_OK.tru` várja - a `.bin`-jük: `fosos.bin.bak_oszlop`).
**tilemap_szerkeszto.html v4 (2026-10-10, mentés: `.bak_v3`):** "Mentés másként…" (`prompt` új névre, a Név mező is átíródik,
utána a szokásos mentés); pályarész másolása: "Kijelöl" mód (3) + húzás = zöld téglalap -> "Másol" (Ctrl+C) -> "Beilleszt"
(Ctrl+V): kék előnézet az egér alatt, kattintás = lerakás (a bal felső sarok a mezőre; többször is; a pályáról kilógó rész
lemarad), Esc = kilépés; "Töröl" (Delete) = a kijelölt rész ürítése. Mind visszavonható. A vágólap csak az oldalon belül él
(nem a rendszer vágólapja, újratöltéskor elvész). Fejetlen Edge-ben tesztelve szimulált egér-eseményekkel (rajz, kijelölés,
másolás, beillesztés kétszer, szélen levágás, törlés, visszavonás, mentés másként); valódi egérrel NEM.

## Reklámvideó ffmpeg-gel (Befosas, 2026-10-10)
Emulátor-felvételből (`C:\Users\LG\Videos\TVC-Work\befosas.avi`, 640x570, 50 kép/mp, msrle) rövid reklám `.mp4`.
ffmpeg: `winget install Gyan.FFmpeg.Essentials`; a binárisok `%LOCALAPPDATA%\Microsoft\WinGet\Packages\Gyan.FFmpeg.Essentials_*\
ffmpeg-*-essentials_build\bin\` alatt (régi shellben nincs a PATH-on - teljes útvonallal hívd). Python nincs a gépen.
Módszer (a kész receptek a videók mellett: `befosas_reklam_filter.txt`, `befosas_reklam2_filter.txt`):
- Előbb ÁTTEKINTŐ KÉPTÁBLA: `-vf "fps=1,scale=256:-1,tile=6x5" -frames:v 1 lap.png`, ezt megnézve választható ki, melyik
  másodpercben mi történik (ugrás, zuhanás, felirat a pályán). A kész videóról ugyanígy ellenőrző tábla (`fps=2`).
- Jelenetenként külön bemenet (`-ss kezdet -t hossz -i fajl`, többször ugyanaz a fájl), a szűrőgráf fájlból:
  `-/filter_complex recept.txt` (az új ffmpeg-ben a `-filter_complex_script` helyett). A receptfájlt bash-sel érdemes
  generálni (jelenetenként egy függvényhívás: sebesség, effekt, felirat, méret, színek).
- Jelenet: `setpts=PTS/SEBESSEG,fps=50,scale=640:570:flags=neighbor,trim=duration=1.0,setpts=PTS-STARTPTS`, utána effekt,
  felirat, villanás (`fade=t=in:d=0.12:c=white`), a végén `setsar=1,format=yuv420p`; összefűzés `concat=n=..`, majd
  `scale=1280:1140:flags=neighbor` (éles pixelek), `drawgrid=w=iw:h=6:t=2:c=black@0.30` (tévécsíkok), `vignette`.
- Bevált effektek: `rgbashift=rh=-9:bh=9` (színszétcsúszás), `hue=H='2*PI*t':s=2.5` (színforgás), `lagfun=decay=0.9`
  (elhúzott csík), rázás `crop=600:534:x='20+18*sin(t*41)':y='18+15*cos(t*57)'` + visszanagyítás, ütemre lüktető zoom
  `scale=w='2*trunc(320*(1+0.10*exp(-9*mod(t,0.5))))':h=...:eval=frame,crop=640:570`, tükrözés (`crop` fél kép, `split`,
  `hflip`, `hstack`), `negate=enable='lt(mod(t,0.2),0.1)'`, `noise=alls=40:allf=t`, `edgedetect=mode=colormix` (neon).
- Felirat: `drawtext=fontfile='C\:/Windows/Fonts/impact.ttf':text='...'`, a `fontsize` lehet kifejezés
  (`'120+110*exp(-11*t)'` = nagyból beugrik), `x=(w-tw)/2`. Az ékezetes szöveg UTF-8 receptfájlból jól megy.
- CSAPDA: a `fade=t=in:st=0.6` az `st` ELŐTTI kockákat is a villanás színére festi (az egész eleje fehér lett) -
  késleltetett villanáshoz `drawbox=...:t=fill:enable='between(t,0.6,0.64)'` kell.
- CSAPDA: a `noise` miatt a fájl óriási lesz (12 mp = 37 MB `crf 17`-tel) -> `-crf 24 -preset slow` (12 MB).
- Hang: szintetizált ütem `aevalsrc`-ből (lábdob = lefelé csúszó szinusz `exp` burkolóval, basszus = `sgn(sin())`,
  cin/pergő = `random()` zaj rövid burkolóval, minden a `mod(t, ütemhossz)`-ra építve), `aecho`, `alimiter`; a vágások
  az ütemre essenek (120 ütés/perc -> 0,5 mp; jelenet = 1 mp). Hangerő ellenőrzése: `-af volumedetect`.
- A felhasználó ízlése: "brutális pörgős", de az első (2x sebesség, 0,8 mp-es vágások) túl gyors volt -> 1,25x, 1 mp-es
  vágások, "tele effekttel", nagy magyar feliratok. Amit NEM tudok ellenőrizni: lejátszva megnézni / meghallgatni.

## Befosas dallamszerkesztő (`Befosas\tools\dallam_szerkeszto.html`, v1, 2026-10-10)

Zene a TVC egyetlen (négyszögjel) hangcsatornájára; a játék képkockánként (1/50 mp) állítja a hangmagasságot és a hangerőt.
- **Modell / projekt `.json`:** `{"format":"befosas-dallam","version":1,"name","tempo","steps","ero","lecseng","notes":[],"kick":[],"snare":[]}`
  - `tempo` = képkocka / lépés; `notes[lépés]`: -1 üres (az előző hang szól tovább), -2 szünet, 0..36 = hang (0 = A1 = 55 Hz,
    félhangonként: `55 * 2^(n/12)`); `kick` / `snare`: 0/1 lépésenként; `ero` = kezdő hangerő (1..15), `lecseng` = halkulás.
- **A játék táblája (a `tabla()` függvény; ugyanez a `resources\make_zene.ps1` logikája):** képkockánként
  hangmagasság / 16 = `round((4096 - 195312.5 / Hz) / 16)` és hangerő = `round(ero * exp(-lecseng * képkocka_a_hang_óta / 50))`;
  a lábdob a lépés első 3 képkockáját (153 / 104 / 78 Hz, hangerő 15 / 14 / 12), a pergő a következő 2-t (1200 / 800 Hz,
  8 / 5) veszi el a dallamtól (ha nincs lábdob, a pergő a 0-1. képkocka).
- **`.bin` a játéknak:** 2 byte hossz (képkocka, alsó byte elöl) + a hangmagasság / 16 byte-ok + a hangerő byte-ok
  (`Befosas.tru`: `Zene_Indit(#bin)`, `Zene_Kov()`). Helye: `resources\sfx\`, pl. `zene_menu.bin` (+ `zene_menu.json`).
- **Önellenőrzés:** `...dallam_szerkeszto.html?teszt` fejetlen Edge-ben `--dump-dom`-mal: a rejtett `<pre id="teszt">`-be
  `TESZT OK N=48 bin=98` kerül, ha az alap dallam táblája egyezik a játék eredeti menüzenéjével. Egérrel és hanggal NINCS
  automatikusan tesztelve. Autosave: localStorage `befosas_dallam`.
- A felhasználó a saját dallamát írja vele - a dallamot nem szabad helyette "variálni" (2026-10-10: a 4 ütemes
  változatomat elvetette, az eredetit kérte vissza).
- **v2 (2026-10-11, mentés `.bak_v1`):** másolás (`mtol` / `mig` mezők vagy kattintás a rács fölötti lépésszámra, Shift =
  utolsó; `masol()` -> `vagolap`, `beilleszt(ide)` felülír és szükség esetén növeli a `steps`-et, max 256), `Megduplázás`,
  `TOP` = a lépésszámok sora (a rács koordinátái ennyivel lejjebb), `dobhang()` = a lábdob / pergő előhangja kattintáskor.
  A `?teszt` már a másolást is ellenőrzi: `TESZT OK N=48 bin=98 MASOL OK lepes=8`.
- **Dallamszerkesztő v3 (2026-10-11, mentés `.bak_v2`):** kijelölés egérrel a tilemap-szerkesztő mintájára (`mod`: rajz /
  kijelol / beilleszt; `kij` = { s0, s1, r0, r1 }; `masol()`, `beillesztIde(s, r)` - más sorba téve TRANSZPONÁL, a szünet /
  dob csak dy = 0 mellett megy; `torol()`, `visszavon()`), a v2 számmezős másolása megszűnt. Új projektmező: `ism` = az
  ismétlés kezdete (lépés, 0-tól). **A `.bin` fejléce 4 byte:** hossz + ismétlés-kezdet képkockában (2-2 byte, alsó elöl).
  `resources\dallam_to_bin.ps1 -In x.json`: ugyanez a számítás PowerShellben (JS-kerekítéssel: `Floor(x + 0.5)`).
  A zenék helye: `Befosas\resources\zene\`. `?teszt`: `TESZT TABLA OK MASOL OK OKTAV OK TOROL OK VISSZA OK ISMETLES OK`.

**tilemap_szerkeszto.html v5 (2026-10-11, mentés `.bak_v4`): TÖBB CSEMPEFAJTA.** `csempek[]` = { name, px[60] } a Sprite16
projektből ("Csempék betöltése…": `sprites[]` vagy `anims[]`, `frames[0]` = pixelenként egy hexa színindex, `.` -> 0; csak a
6x10-esek); paletta képes gombokkal (`paletta()`, `csKepek()` = előre rajzolt képek a nagyításhoz). Pálya `.json` version 2:
`rows` karakterenként egy mező 36-os számrendszerben (0-9, a-z; max 35 fajta), `tileset` = a csempék képe (a játéknak nem
kell). Billentyűk: 1-9 csempe, 0 üres, K kijelöl; jobb gomb / Ctrl = törlés. A version 1 fájl változatlanul megnyílik.
`tilemap_to_bin.ps1`: a karaktert `"0123...xyz".IndexOf`-fal olvassa (**a .NET `Convert.ToInt32(x, 36)` NEM létezik** - csak
2 / 8 / 10 / 16; ezzel egyszer felülírtam a `palya1.bin`-t hibás futással - konvertert előbb másolatra kell próbálni).
`csempek_to_bin.ps1`: BMP-lista -> 1 byte darabszám + csempénként 30 byte oszlopfolytonosan. `?teszt` -> `document.title`.

## UPDATE 2026-10-25: charset editor and font.bin are now 1-bit, pixel-width (WaterPumpGame)

`tools\charset_szerkeszto.html` was rewritten (old 4-colour version kept as `charset_szerkeszto_regi4szin.html`).
New `font.bin`: `[0] = $80 + height` (the $80 marks the new format), `[1..91]` = width in PIXELS (0..8, includes
the letter gap) for ASCII 32..122, then the glyphs row by row: row r, glyph i at `92 + r*91 + i`, bit7 = left pixel.
729 bytes at height 7 (old format: 1366). Editor: draw black / erase, width with -/+ or `[` `]`, "Automatikus" =
rightmost pixel + 2, preview lays text out exactly like the game (pixel advance, byte-rounded line width), loads
both the new and the old 4-colour font.bin (old -> converted). Converter script: `resources\font_1bit.ps1`.
The game's `Ir` renderer reads this format (see the project CLAUDE.md).

## UPDATE 2026-10-26: Hungarian letters, multi-page rules text, AQUALIQUE title (WaterPumpGame)

**charset_szerkeszto.html / font.bin - 109 glyphs.** After ASCII 32..122 (index 0..90) come 18 Hungarian letters,
index 91..108 = game code 123..140, order `ÁÉÍÓÖŐÚÜŰáéíóöőúüű`. `font.bin` = `[0] $80+h`, `[1..109]` widths, then row r
glyph i at `1 + 109 + r*109 + i` (873 bytes at h = 7). The editor loads the old 91-glyph file and the old localStorage
work too (`padHU`: missing accented glyphs start as a copy of the base letter, with an accent if there are 2 free rows
above it); `charIndex()` maps preview text. The game's `Ir` asm has three constants for this: `cp 141` (2x),
`ld de,109` (row stride), `Font_Data+110` (first image row). Changing the glyph count = change these + `Spr_Hossz`.

**`resources\make_szabaly_bin.ps1` -> `SZABALY.BIN`** from `resources\szovegek\szabaly.txt` (PLAIN text, the user
edits it; all layout is computed from the font widths):
- `N. oldal` = new page; first line of a page = title (centred, y 2), last line = footer (centred, y 226);
- an ALL-CAPS line = section heading (5 px gap before it); any other line = paragraph, word-wrapped from x 2 to 63;
- `@PUMPA @KRATER | text` = legend item: icon(s) at x 2, 5, ... and the text wrapped from x 8; `"R" gomb | text` =
  label put in front of the text as `"R" gomb: text`. Icon names: PUMPA TALAJ KRATER SZIKLA FAL KERET VIRUS BOMBA AKNA
  (= ids 0..8, the game's `Szov_Ikon`);
- line pitch 10 (falls back to 9 if a page overflows), error if a page does not fit or is over 2048 bytes;
- output: text record `x, y, codes..., 0`; icon record `253, id, x, y`; `254` = end of page; `255` = end; padded to 4096.
`make_szoveg_bin.ps1` / `jatekszabaly.txt` / `SZOVEG.BIN` are obsolete (the old one-page legend).

**Title logo generated in PowerShell (scratch script, not kept in the repo).** The 100x40 GR16 `Cim_C16` sprite in
`resources\Menu\WaterPump_Menu.json` was rebuilt as AQUALIQUE by reusing glyphs cut out of the old WATERPUMP logo
(A, E, U), drawing Q/L/I masks coloured from the old E stem row-by-row (keeps the vertical gradient), then an 8-neighbour
black outline + 1 px right/down shadow. Preview PNG via System.Drawing with GR16 pixel aspect ~2:1 (6x3 px per pixel).
The JSON was patched as TEXT (object substring), not via `ConvertTo-Json`, to keep the editor's format; the old sprite
was kept as `Cim_C16_WaterPump`. `make_menu16_bin.ps1` then rebuilds `MENU16.BIN` (size unchanged, 6196).
