# WaterPumpGame — projekt-memória (CLAUDE.md, RÖVIDÍTETT 2026-10-25)

Szándékosan RÖVID (minden munkamenet elején betöltődik). A teljes korábbi szöveg és a dátumozott
napló: **`docs/NAPLO_archiv.md`** (a végén a 2026-10-25-i teljes CLAUDE.md is). NE olvasd be egészben -
grep-pel keress rá a kulcsszóra. Érdemi változás után ezt a fájlt frissítsd röviden; hosszú indoklás az
archívum VÉGÉRE. Projektmemória: `C:\Users\LG\.claude\projects\c--TVC-TRSE-Projects-WaterPumpGame\memory\`.
TVC/TRSE tudás: **TVC-TRSE skill** (mindig töltsd be); PC-s eszközök: **TVC-Utils skill**.

## A projekt
- Videoton TV-Computer (Z80, 3 MHz), TRSE/Rascal, saját GE unit (`units\TVC\GE.tru`, 304 KB, NINCS a repóban).
  Fő forrás: `WaterPumpGame.ras`; saját unit: `WaterPump.tru` (pumpa-kirakás `PutAt`, táblák).
- Az eredeti játék: Commocore Aqualique 1.0 (C64). Viselkedési referencia (vírus/pumpa/gazdaság): a felhasználó
  C64 TRSE-portja, `C:\Users\LG\Documents\-- DEY --\` (`aqualiquex.ras`, `units.tru`, `raster.tru`).
- GE dokumentáció: `docs/GE_GameEngine_Dokumentacio.md`. Testvérprojekt: `tutorials_bertok\SpaceWar.ras`.

## Fordítás és futtatás
- **Fordító ÁTMENETILEG a nightly:** `C:\TVC\TRSE_Nightly\trse.exe -cli op=project project=LG_TVC_Projects.trse input_file=WaterPumpGame.ras assemble=yes`
  (kimenet: `Start-Process ... -RedirectStandardOutput`). A régi `C:\TVC\TRSE` is működik (a .ras-ban egy
  `; kitolto sor` asm-megjegyzés van a régi exe összeomlása ellen). VS Code Build: a projekt
  `.vscode\settings.json`-ja állítja a nightly-t (törölve = régi). Részletek, nightly-csapdák: skill `trse-compiler.md`.
- Kód vége: `WaterPumpGame.sym` `EndBlock19ef` < `$8000`. **Jelenleg `$7E96`, kb. 360 byte szabad.**
- Memóriatérkép: `/memoria` (vagy `powershell -File resources\memoria_terkep.ps1`).
- **Futtatás csak lemezről** (a `.cas` gyorsbetöltésénél nincs fájleszköz, minden fájlnyitás hibás = piros keret):
  `resources\make_dsk.ps1 -Files @("WaterPumpGame.cas=WATERPG.CAS","SPRITES.BIN=SPRITES.BIN","PALYAK_lemez.BIN=PALYAK.BIN","SZABALY.BIN=SZABALY.BIN","MENU16.BIN=MENU16.BIN")`
  (RELATÍV útvonalakkal!). `PALYAK_lemez.BIN` = a játékbeli versus-szerkesztővel mentett pályaadat - ezt kell
  használni, nem a generált `PALYAK.BIN`-t. Valós géphez: a `.dsk` kibontva a `WaterSDCARD\` mappába
  (scratchpad `dsk_kibont.ps1`), a felhasználó a pendrive `E:\WP` mappájába másolja. 64K-s gép, SD-olvasó.

## Fájlok és memória
- Indításkor betöltött adatfájlok (saját asm `Fajl_Olvas`, a Lemmings ROM-hívássorával - a TVC unit olvasó
  hívásai valós gépen NEM működnek): `SPRITES.BIN` -> U3 `$C000` (hangok, sprite-ok, font `$E100`; hossz =
  `Spr_Hossz`, a `make_sprites_bin.ps1` kiírja - ha változik, a .ras-ban átírni!), `PALYAK.BIN` -> `$EF00`
  (`Pal_Hossz`), `SZABALY.BIN` -> U2 `$9000` (4096 byte, oldalanként max 2048, `resources\szovegek\szabaly.txt` +
  `make_szabaly_bin.ps1`; a régi `SZOVEG.BIN`/`jatekszabaly.txt` már NEM kell, `$FA00-$FDFF` szabad),
  `MENU16.BIN` -> U2 `$A000` (16 színű főmenükép; cím = AQUALIQUE `Cim_C16`, a régi `Cim_C16_WaterPump`). Átmeneti puffer: `$8000` (U2; a pályamentés is).
- Hiba betöltéskor: keret PIROS = nem nyílik, LILA = olvasási hiba (gombra vár).
- U3 szabad: `$F57F-$F9FF` (1153 byte, a pályák nőhetnek ide), `$FE00-$FFFF`. U2 szabad: `$8000-$8FFF` (a `$9000-$9FFF` a SZABALY.BIN; játék
  közben nem látszik; a `Kep_Rajz` mintája: pufferen át, `$13A0`). Videó-RAM: a kép alatt 1 KB (`$BC00`).
- `MEM_48K_VID` (U0,U1,VID,U3) a játék alatt.

## Szöveg és font (2026-10-26: font, szabály-képernyő, jelmagyarázat, AQUALIQUE főcím VISSZAIGAZOLVA, működik)
- `Ir` / `Ir_Hossza`: pixelre arányos kiíró (betűnként 0..8 px szélesség a betűközzel), sorpuffer `$1460`,
  1-es szín, byte-határon kezd, a végét byte-ra kerekíti. `font.bin` 1 bites: `$80+magasság`, 109 szélesség
  (ASCII 32..122 + kód 123..140 = ÁÉÍÓÖŐÚÜŰáéíóöőúüű, 2026-10-25), soronként 109 byte; 873 byte
  (`Spr_Hossz` 9321). A `make_szabaly_bin.ps1` az ékezeteseket 123..140-re kódolja; a .ras-beli string-literálokban NE legyen ékezet. Szerkesztő: `tools\charset_szerkeszto.html` (átírva).
  A kisbetűket a felhasználó újrarajzolja. Az eredeti font: `font_eredeti.bin`.
- Játékszabály (2026-10-26, visszaigazolva): főmenü 5. pont -> `Szabaly_Kepernyo` (1. oldal sztori; oldalanként U2 `Szab_Src` -> `Pause_Buf`,
  `Szov_Kiir` 254/255 jelig, `Tuz_Var` lapoz) -> a jelmagyarázat is itt (4-5. oldal, `@IKON | szöveg` sorok, 253-as ikon-rekord, `Szov_Ikon`). A `szabaly.txt` SIMA SZÖVEG ("N. oldal", 1. sor cím, utolsó lábsor, CSUPA NAGY = fejezet);
  a `make_szabaly_bin.ps1` tördel a font szélességeiből és hibát ír, ha egy oldal nem fér el.

## Játék - aktuális állapot (részletek: archívum, `Map` értékek, eszközök)
- 30x18 `Map` (az egyetlen állapot-tömb). Pumpa (`WaterPump::PutAt`, 8 fázis, P1 kék `Pumpa.bin`, P2 zöld
  `Pumpa2.bin`), fal, bomba, akna (4. eszköz), meteor (pályánként `MeteorTor`/`MeteorVir`), vírus (C64-modell).
- Módok: egy játékos, co-op, versus (vírus-lerakás CSAK versusban, `Ikon_Sor(j)` rajzolja az ikonsort -
  valós gépen visszaigazolva). Joystickos ikon-menü, M/Y eszközváltás, P pause, ESC/Q kilépés, R újrakezdés.
- 11 egyjátékos/co-op + 6 versus pálya; import: `resources\palyak_import.ps1`, mérvadó `waterpump_palyak.json`.
- Nyitott: LEVEL COMPLETED doboz nem végleges; HISCORE nincs; HOW TO USE szöveg; többfájlos betöltő
  (címkép, pályák fájlba) - lásd memória `watergame-multifile-loader-plan`.
- Utolsó mentett béta: `WaterPump_Final_Betav1.4` (09-25) - azóta minden munka bétán kívül.

## Teendők, amiket a felhasználó kért
- **Az asm-et tartalmazó eljárásokat unitokba költöztetni** (17 eljárás, 729 asm-sor; csoportok: szöveg,
  fájl/kép, képernyő-effekt, véletlen, játéklogika) - még nem kezdtük el.
- **TVC known-bugs skill-oldal** (a SANE 82 hibájának TVC-re szűrése) - még nincs kész, új munkamenetben szólj.

## Munkastílus
Magyarul, tömören; a lemez az igazság; `.bak_<név>` minden változtatás előtt; kétértelmű kérésnél az
értelmezést egy mondatban kimondani; a felhasználó tesztel (emulátor: WinTVC/TMC20 - a TMC20 pumpa-lerakáskori
képszétesése emulátorhiba); a CLAUDE.md-t frissíteni. A régi "ez a minta omlasztja össze a fordítót"
tanulságok (globális boolean stb.) valószínűleg a régi exe mutató-hibája voltak (skill `trse-compiler.md`).
