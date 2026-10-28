# TVC fájlformátumok a PC-s eszközökhöz

## Bery GE sprite `.bin` (a GE unit `Sprite.Init(#Data,...)` ezt olvassa)

```
byte 0 : típus      1 = nem maszkolt (Put), 2 = maszkolt (Draw, háttérpufferrel)
byte 1 : szélesség  byte-ban (GRAPHICS16: pixel/2, GRAPHICS4: pixel/4)
byte 2 : magasság   sorban
utána  : soronként: típus 1 -> szél db ADAT-byte
                    típus 2 -> szél db bytepár: MASZK, ADAT   (a GE előbb AND-el a maszkkal, aztán OR-ol)
több fázis: a fázisok egymás után, a fejléc csak egyszer (fázisméret = szél*mag, maszkoltnál *2)
```
- Maszk: átlátszó pixel bitjei 1 (a képernyő-byte marad), átlátszatlanéi 0; az adat-bitek átlátszónál 0.
- A TRSE-ben a fázisváltás: `Sprite.AnimSet := #Data+3; Sprite.Data := AnimSet + faz*FAZIS_MERET;`
  (maszkoltnál a fázisméret `W*H*2`, NEM `Sprite.Size`).

## GRAPHICS16 pixel-kódolás (16 szín, 128x240, 64 byte/sor)

- 1 byte = 2 pixel, a bitek **váltakoznak**: bal pixel = bit 7,5,3,1 (I,G,R,B), jobb pixel = bit 6,4,2,0 (I,G,R,B).
- Színindex `I*8+G*4+R*2+B`: 0 fekete, 1 sötétkék, 2 sötétvörös, 3 sötétbíbor, 4 sötétzöld, 5 sötétcián,
  6 sötétsárga, 7 szürke, 8 fekete (2.), 9 kék, 10 vörös, 11 bíbor, 12 zöld, 13 cián, 14 sárga, 15 fehér.
  Két azonos pixel byte-ja = a GE `GR16_COLOR_*` konstans (pl. sötétkék 3, fehér 255).
- Igazolás a GE.tru-ból: `GR16_COLOR_*` értékek + `InitSpriteMirroring` maszkjai (170 = bal pixel bitjei, 85 = jobb).
- Maszk-byte: bal pixel átlátszó `$AA`, jobb `$55`, mindkettő `$FF`.
- A TVC pixele kétszer olyan széles, mint magas (2:1) - a szerkesztő és minden előnézet így rajzol;
  PC-s képnél a "TVC 2:1 korrekció" vízszintesen feleannyi pixelt ad.
- Kódolás/dekódolás a szerkesztőben: `encPix(c,left)`, `decPix(b,left)`.

## GRAPHICS4 pixel-kódolás (4 szín, 256x240)

- 1 byte = 4 pixel; pixel n (0..3, balról): szín alsó bitje -> bit(7-n), felső bitje -> bit(3-n)
  (GE `GR4_COLOR0..3` = `$00,$F0,$0F,$FF`). A WaterPumpGame palettája: 0 szürke, 1 fekete, 2 zöld, 3 kék.

## Paletta RGB (megjelenítéshez, képimporthoz)

- A szerkesztők: sötét = `0x92` (146), világos = 255 (az image2tvc konverter értéke). Régebben 128 volt;
  más programok 127-et is használnak - az 1:1 import mindhármat elfogadja (távolság <= 40).
- A TVC paletta-/border-regiszter byte-ja más kódolású (PALETTE: bit 6,4,2,0 = I,G,R,B; BORDER: bit 7,5,3,1) -
  lásd a tvc-trse skill `references/hardware.md`.

## Arányos betűkészlet `font.bin` (charset_szerkeszto.html, a játék `Ir()` kiírója)

`1 byte magasság` + `91 byte szélesség` (ASCII 32..122, értéke 1 vagy 2 byte) + kép: 91 x 2 byte = 182 byte
széles, `magasság` sor, GRAPHICS4 (minden karakternek 2 byte hely, a keskeny a bal felét használja).
A régi GE-készlet `CharSetGR4.bin`: 59 karakter (ASCII 32..90) x 2 byte = 118 byte széles, 7 sor.

## Sprite16 projekt `.json` (version 3)

```json
{"format":"sprite16-projekt","version":3,"cur":0,"acur":0,"ek":"sprite",
 "sprites":[{"name":"x","W":16,"H":16,"masked":true,"frames":["....0f..."],"anim":{"speed":5,"loop":true}}],
 "anims":[ ...ugyanígy... ],
 "scene":{"border":7,"bg":0,"zoom":2,"grid":false,"items":[{"s":0,"x":10,"y":40}]},
 "ui":{"colL":15,"colR":-1,"zoom":16,"tool":"pen","view":"edit","onion":false,"png":"2,1","name":"projekt"}}
```
Egy fázis = `W*H` karakteres string, soronként összefűzve (`0`-`f` szín, `.` átlátszó).

## Pályák `.json` (terkep_szerkeszto.html -> WaterPumpGame)

`levels[]` (egy játékos / co-op) és `levels2[]` (versus, LEVEL 20-tól; 2026-10-02-től) + `set`, `cur`; pályánként `name`, `kod` (5 betű A-Z, pályakód), `cells` (540 db 0/1; 1 = blokkolt -> `Talaj3Map`=13, 0 -> `Talaj1Map`=10), `cel`, `celCoop`,
`pumpaAr`, `falAr`, `bombaAr`, `penz`, `termel`, `meteor`, `virus`, `fal`, `bomba`. A szerkesztő a `.ras`
PÁLYÁK-blokkját is kiadja (`Terkepek`, `Palya_*` tömbök) - részletek a projekt `CLAUDE.md`-jében.

## GE digi hang `.bin` (make_*_sfx.ps1)

`DIGI_TYPE_2x4BIT`, 4 kHz: egy byte = 2 minta, ELŐSZÖR az alsó nibble; 8 = csend; a 0 byte a vég (a hangban
máshol nem lehet 0 byte).

## Befosas tilemap `.json` (tilemap_szerkeszto.html, version 1)

```json
{"format":"befosas-tilemap","version":1,"name":"palya1","width":64,"height":10,"tileW":8,"tileH":10,
 "tiles":["nincs","csempe"],"rows":["0000...","0010...", "... összesen 10 sor ..."]}
```
`rows`: `height` db string, soronként felülről lefelé, egy karakter = egy mező balról jobbra (`0` = nincs, `1` = csempe);
minden string `width` hosszú. `tileW`/`tileH` TVC-pixelben (8x10 = 4 byte x 10 sor). A játék oszloponként rajzol
(byte-scroll), ezért a játékba importáláskor OSZLOPFOLYTONOS sorrendbe érdemes átforgatni.

### Befosas pálya `.bin` (a játék formátuma, `resources\tilemap_to_bin.ps1 -In x.json -Out x.bin`, 2026-10-10)

3 byte fejléc: szélesség csempében (2 byte, alsó elöl) + magasság (1 byte = 10); utána **oszlopfolytonosan**
oszloponként `magasság` byte, felülről lefelé, mezőnként a csempe száma (0 = nincs). Pl. 96x10 -> 963 byte.
A `Befosas.tru` `Scroll_Init(#Kep_A, #Kep_B, #Palya)` a fejlécből olvassa a szélességet; legalább 16 csempe széles kell.

### Befosas csempe `.bin` a pixeles scrollhoz (`resources\csempe_to_bin.ps1 -In x.bmp -Out x.bin`, 2026-10-10)

Bemenet: EGY 8x10 pixeles GRAPHICS16 BMP (keret nem kell; soronként P0..P7). Kimenet 110 byte:
`0..39` alap kép, 10 sor x 4 byte `(P0,P1)(P2,P3)(P4,P5)(P6,P7)`; `40..79` 1 pixellel balra tolt kép
`(P1,P2)(P3,P4)(P5,P6)(P7,-)` (az utolsó byte jobb pixele üres); `80..89` saját szél `(P7,-)` soronként;
`90..99` szomszéd `(-,P0)` soronként; `100..109` 10 nulla byte. Az eltolt képernyőn egy mező utolsó byte-oszlopa =
saját szél (ha a mező csempe) VAGY a jobb szomszéd mező szomszéd-táblája (ha az csempe) - `Befosas.tru` `Oszlop_Ki_Szel`.
A pálya `.bin` végén ezért 2026-10-10 óta egy plusz üres oszlop áll (a fejléc szélessége nem számolja bele; 96x10 -> 973 byte).
