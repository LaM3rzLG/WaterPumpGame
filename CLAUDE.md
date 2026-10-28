# WaterPumpGame — projekt-memória (CLAUDE.md, RÖVIDÍTETT 2026-10-25)

Szándékosan RÖVID (minden munkamenet elején betöltődik). A teljes korábbi szöveg és a dátumozott
napló: **`docs/NAPLO_archiv.md`** (a végén a 2026-10-25-i teljes CLAUDE.md is). NE olvasd be egészben -
grep-pel keress rá a kulcsszóra. Érdemi változás után ezt a fájlt frissítsd röviden; hosszú indoklás az
archívum VÉGÉRE. **Projektmemória: a repó `claude_memory/` mappája** (2026-10-28 óta; a Claude memória-mappája
mindkét gépen erre mutat - Mac: symlink, Windows: junction, bekötés: `claude_memory/README.md`, ha még nincs kész).
**Skillek a repóban (`.claude/skills/`):** TVC/TRSE tudás **tvc-trse** (mindig töltsd be); PC-s eszközök **tvc-utils**.
**KÉT GÉP:** Windows (fő build-gép) és Mac. **Macen** a tvc-trse mellé töltsd be a **tvc-trse-mac**-et (build, útvonalak -
a lenti Windows-os parancsok helyett) és emulátorhoz a **tvc-emu-mac**-et; Windowson ez a kettő NEM használandó.
**Mac build (2026-10-28, működik, a Windows-ossal azonos kimenet):** `bash resources/build_mac.sh` = VS Code Cmd+Shift+B
("Mac: Build + EP emu": fordítás + u3_boot_patch + .dsk + EP128 emulátor). Windowson a SANE/`build.ps1` változatlan.
**Munka elején `git pull`, a végén commit + push** (a `claude_memory/` is!), különben a gépek elcsúsznak.

## A projekt
- Videoton TV-Computer (Z80, 3 MHz), TRSE/Rascal, saját GE unit (`units\TVC\GE.tru`; 2026-10-28 óta a repóban is: `tvc_units/` - a Windows nightly unitjai, a Mac build ezt használja; unit-módosítás után oda is másold).
  Fő forrás: `WaterPumpGame.ras`; saját unit: `WaterPump.tru` (pumpa-kirakás `PutAt`, táblák).
- Az eredeti játék: Commocore Aqualique 1.0 (C64). Viselkedési referencia (vírus/pumpa/gazdaság): a felhasználó
  C64 TRSE-portja, `C:\Users\LG\Documents\-- DEY --\` (`aqualiquex.ras`, `units.tru`, `raster.tru`).
- GE dokumentáció: `docs/GE_GameEngine_Dokumentacio.md`. Testvérprojekt: `tutorials_bertok\SpaceWar.ras`.

## Fordítás és futtatás
- **Fordító ÁTMENETILEG a nightly:** `C:\TVC\TRSE_Nightly\trse.exe -cli op=project project=LG_TVC_Projects.trse input_file=WaterPumpGame.ras assemble=yes`
  (kimenet: `Start-Process ... -RedirectStandardOutput`). A régi `C:\TVC\TRSE` is működik (a .ras-ban egy
  `; kitolto sor` asm-megjegyzés van a régi exe összeomlása ellen). VS Code Build: a projekt
  `.vscode\settings.json`-ja állítja a nightly-t (törölve = régi). Részletek, nightly-csapdák: skill `trse-compiler.md`.
- **KÓD KÉT RÉSZBEN (2026-10-26, EMULÁTORRA, TESZTELENDŐ):** a .ras-ban az `U3_Hatar` eljárás (a `Fal_Mind_Kirak` előtt)
  `org $C000`-t tesz: onnan a forrás végéig + a főprogram az U3-ba fordul (`$C000`..`EndBlock19ef`, max `$D800`);
  lent `$19EF`..`U3_Also_Vege` (< `$8000`). Az egyblokkos 47 KB-os .cas "No memory"-val elszállt -> a fordítás után a
  `u3_boot_patch.ps1` SZÉTVÁGJA: `WaterPumpGame.cas`/.bin = csak a lenti rész (fejléc javítva), `U3KOD.BIN` = az U3-kód,
  amit a `Spr_Betolt` tölt be `$C000`-ra (`U3_Nev`, hossz: `U3_Hossz`, a szkript írja be). A `$1A03` `jp block1` ->
  `jp U3_Boot` (lent: `call ProgramInit` / `jp block1+3`).
  **BUILD MINDIG: `powershell -NoProfile -File resources\build.ps1`** (fordítás + `u3_boot_patch.ps1` + .dsk az U3KOD.BIN-nel;
  a javító MINDEN fordítás után kell, a felhasználó kérte) - a VS Code Build gomb ezt NEM csinálja!
  U3-ba csak MEM_48K_VID alatt futó, ROM-ot nem hívó eljárás kerülhet (a `Pal_Ment`/fájlkezelés maradjon lent).
  `@startblock` TVC-n hatástalan, visszafelé `org` és `phase` nincs (nightly-val tesztelve). Most: lent `$6B9A` (5222 szabad), U3 `$D492` (878 szabad).
- Memóriatérkép: `/memoria` (vagy `powershell -File resources\memoria_terkep.ps1`).
- **Futtatás csak lemezről** (a `.cas` gyorsbetöltésénél nincs fájleszköz, minden fájlnyitás hibás = piros keret):
  `resources\make_dsk.ps1 -Files @("WaterPumpGame.cas=WATERPG.CAS","SPRITES.BIN=SPRITES.BIN","PALYAK_lemez.BIN=PALYAK.BIN","SZABALY.BIN=SZABALY.BIN","MENU16.BIN=MENU16.BIN","U3KOD.BIN=U3KOD.BIN")`
  (a build.ps1 ezt hívja; RELATÍV útvonalakkal!). `PALYAK_lemez.BIN` = a játékbeli versus-szerkesztővel mentett pályaadat - ezt kell
  használni, nem a generált `PALYAK.BIN`-t. Valós géphez: a `.dsk` kibontva a `WaterSDCARD\` mappába
  (scratchpad `dsk_kibont.ps1`), a felhasználó a pendrive `E:\WP` mappájába másolja. 64K-s gép, SD-olvasó.

## Fájlok és memória
- Indításkor betöltött adatfájlok (saját asm `Fajl_Olvas`, a Lemmings ROM-hívássorával - a TVC unit olvasó
  hívásai valós gépen NEM működnek). **U3 (2026-10-26, TESZTELENDŐ): felülről lefelé, hézag nélkül:**
  `SPRITES.BIN` `Spr_Cim`..`$FFFF` (most `$E761`, 6303 byte), alatta `PALYAK.BIN` (`Terkepek`.., most `$E0E2`,
  `Pal_Hossz`), `$E000-$E0E1` tartalék a pályáknak, `Pause_Buf` `$D800-$DFFF`, **`$C000-$D7FF` (6 KB) szabad - kódnak**.
  Sprite/hang változásakor: `make_sprites_bin.ps1` (átírja a .ras `at` címeit, `Spr_Cim`, `Spr_Hossz`) -> `palyak_bin.ps1`
  (a sprite-ok alá teszi a pályablokkot) -> fordítás. `SZABALY.BIN` -> U2 `$9000` (4096 byte, oldalanként max 2048, `resources\szovegek\szabaly.txt` +
  `make_szabaly_bin.ps1`; a régi `SZOVEG.BIN`/`jatekszabaly.txt` már NEM kell),
  `MENU16.BIN` -> U2 `$A000` (16 színű főmenükép; cím = AQUALIQUE `Cim_C16`, a régi `Cim_C16_WaterPump`). Átmeneti puffer: `$8000` (U2; a pályamentés is).
- Hiba betöltéskor: keret PIROS = nem nyílik, LILA = olvasási hiba (gombra vár).
- U3 szabad: `$C000-$D7FF`. U2 szabad: `$8000-$8FFF` (a `$9000-$9FFF` a SZABALY.BIN; játék
  közben nem látszik; a `Kep_Rajz` mintája: pufferen át, `$13A0`). Videó-RAM: a kép alatt 1 KB (`$BC00`).
- `MEM_48K_VID` (U0,U1,VID,U3) a játék alatt.

## Szöveg és font (2026-10-26: font, szabály-képernyő, jelmagyarázat, AQUALIQUE főcím VISSZAIGAZOLVA, működik)
- `Ir` / `Ir_Hossza`: pixelre arányos kiíró (betűnként 0..8 px szélesség a betűközzel), sorpuffer `$1460`,
  1-es szín, byte-határon kezd, a végét byte-ra kerekíti. `font.bin` 1 bites: `$80+magasság`, 109 szélesség
  (ASCII 32..122 + kód 123..140 = ÁÉÍÓÖŐÚÜŰáéíóöőúüű, 2026-10-25), soronként 109 byte; 873 byte
  (a font most `$FC97`). A `make_szabaly_bin.ps1` az ékezeteseket 123..140-re kódolja; a .ras-beli szövegekben LEHET ékezet (2026-10-26): az assembler Latin-1-re fordít, az `Ir` (`Ir_Ekezet`, `Ir_EkTab`) a font kódjaira képezi; az ő/ű/Ő/Ű NINCS a Latin-1-ben (0 lenne belőle!) - helyettük `ô`/`û`/`Ô`/`Û` írandó (pl. "TÛZ"). A játék szövegei magyarok (J1/J2, ÉLET, PÁLYA); csak a pause sötétít, a többi doboz `Doboz`-zal, palettaváltás nélkül; a szabály-lapokon ESC = vissza. Szerkesztő: `tools\charset_szerkeszto.html` (átírva).
  A kisbetűket a felhasználó újrarajzolja. Az eredeti font: `font_eredeti.bin`.
- Játékszabály (2026-10-26, visszaigazolva): főmenü 5. pont -> `Szabaly_Kepernyo` (1. oldal sztori; oldalanként U2 `Szab_Src` -> `Pause_Buf`,
  `Szov_Kiir` 254/255 jelig, `Tuz_Var` lapoz) -> a jelmagyarázat is itt (4-5. oldal, `@IKON | szöveg` sorok, 253-as ikon-rekord, `Szov_Ikon`). A `szabaly.txt` SIMA SZÖVEG ("N. oldal", 1. sor cím, utolsó lábsor, CSUPA NAGY = fejezet);
  a `make_szabaly_bin.ps1` tördel a font szélességeiből és hibát ír, ha egy oldal nem fér el.
- Szabály-képernyő raszter-sáv (2026-10-26, TESZTELENDŐ): saját megszakítás (`Szab_IT_Be`/`Szab_IT_Ki`: a `$39-$3A`-as JP-cél
  átírva/visszaállítva). Az IT a sáv tetején jön, 24 sor `$61` (fekete paletta) a `Szab_SavSzin`-ből, 1 sor/képkocka
  lefelé, alul ki, fent be; finomhangolás: `ld b,8` (7 = jobb szélen, 9 = bal szélen látszik) a `Szab_IT` elején.
- Főmenü keret-sáv (2026-10-26, TESZTELENDŐ): ugyanaz a rutin (`IT_Telepit`; `Szab_SavPort` $00, `Szab_SavLep` 0, `Menu_SavSzin` zöld, 12 soros: P = tábla-12, Off = 12; a menüben a keret szürke, `Szab_SavVeg` 42),
  `Menu_IT_Be` a `Fomenu_Rajz` végén, `Szab_IT_Ki` a `Mod4` elején; a sor (`Szab_SavY`) a `Menu_Pumpa`-ból. A menüben a színek 4 képkockánként kifelé lépnek (`Szab_SavFr`, a tábla két fele forog); a CRTC-t a GE_SetRasterInterruptPos állítja. Gumi-mozgás: a `Menu_Pumpa` a `Szab_SavCel`-t írja, az IT a távolság negyedével (+1 lefelé) lépteti a `Szab_SavY`-t.

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
