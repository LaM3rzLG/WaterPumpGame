---
name: tvc-utils
description: >
  Knowledge base for the PC-side (web / HTML / PowerShell) tools built for Videoton
  TV-Computer (TVC) development: the Sprite16 editor (sprite16_szerkeszto.html -
  16-colour GRAPHICS16 sprites, screen layout, animator, animation containers, image
  import with dithering, PNG/Bery .bin export), the charset/font editor, the level/map
  editor, the image2tvc converter, and the resource-conversion PowerShell scripts
  (BMP -> Bery GE .bin, digi sound, .dsk images), and the build-output memory map
  (memoria_terkep.ps1 + memory_map_c64.html, /memoria). Use it whenever the user works on,
  asks about, or wants to extend a PC program that produces or edits TVC data (sprites,
  fonts, maps, images, sounds, file formats), or needs the exact byte layout of Bery GE
  sprite files, GRAPHICS16/GRAPHICS4 pixel encoding, or the project/JSON formats these
  tools use. For the TVC game code itself (TRSE/.ras, GE unit, Z80, hardware) use the
  tvc-trse skill instead.
---

# TVC Utils - PC-s eszközök a TVC-fejlesztéshez

A felhasználó (magyar nyelvű, TVC/TRSE hobbifejlesztő) a TVC-s játékaihoz (elsőként a
WaterPumpGame) **PC-n futó segédprogramokat** készíttet: önálló, offline HTML-oldalakat
(böngészőben dupla kattintással, `file://`-ról futnak, külső függőség nélkül) és
PowerShell-szkripteket. Ez a skill ezek tudásanyaga. A játék kódja (TRSE, GE unit, Z80,
TVC-hardver) NEM ide tartozik - arra a **tvc-trse** skill és a projekt `CLAUDE.md`-je való.

## Eszközök (projektek: a WaterPumpGame repó (Windows: `C:\TVC\TRSE_Projects\WaterPumpGame\`, Mac: `~/Documents/TVC Projects/WaterPumpGame/`) - `tools\` (a HTML-ek 2026-10-22 óta, előtte a gyökérben) és `resources\`; `C:\TVC\TRSE_Projects\Befosas\` - `tools\` és `resources\`)

**Ugh projekt (2026-10-29):** a közös HTML-szerkesztők (sprite16, sprite4, charset, tilemap, dallam, image2tvc, TVCTape.exe) a projekten KÍVÜL vannak: `C:\TVC\TRSE_Projects\!Toooools\` (README.md ott). Az Ugh `tools\` mappájában csak a memóriatérkép-nézetek vannak, a `resources\` szkriptjei a projekt gyökeréhez kötöttek.

| Eszköz | Mire | Részletek |
|---|---|---|
| `sprite16_szerkeszto.html` | 16 színű (GRAPHICS16) sprite-ok rajzolása, képernyő-elrendezés, animátor, konténerek, képimport ditheringgel, PNG/.bin export | `references/sprite16-editor.md`, változástörténet: `references/history-sprite16.md` |
| `sprite4_szerkeszto.html` | 4 színű (GRAPHICS4) sprite-ok - a Sprite16 másolata, választható paletta-készlettel (most: WaterPump); a játék `.bin`-jeit bájtazonosan olvassa/írja | `references/sprite4-editor.md` |
| `charset_szerkeszto.html` | a játék arányos betűkészlete (`font.bin`: 1 bites, pixelszélességű, 109 karakter = ASCII 32..122 + `ÁÉÍÓÖŐÚÜŰáéíóöőúüű`) | `references/other-tools.md` (UPDATE 2026-10-25/26), formátum: `references/formats.md` |
| `resources\make_szabaly_bin.ps1` | a többoldalas játékszabály + sztori + ikonos jelmagyarázat (`szabaly.txt` sima szövegből, automatikus tördeléssel) -> `SZABALY.BIN` | `references/other-tools.md` UPDATE 2026-10-26 |
| `terkep_szerkeszto.html` | a WaterPumpGame pályái (30x18 rács, pályaadatok -> `.ras` blokk / `.json`) | `references/other-tools.md` |
| `palya16_szerkeszto.html` (`!Toooools`, Ugh, 2026-10-29) | fix képernyős GRAPHICS16 pályák: csempe-rács (a betöltött képekből ajánlott mérettel) + szabadon lerakott tárgyak, több pálya; Sprite16 `.json` / Bery `.bin` képek; `.json` projekt + `.bin` export | `references/other-tools.md`, formátum: `references/formats.md` |
| `tilemap_szerkeszto.html` (Befosas `tools`) | a Befosas vízszintesen scrollozó pályája: 12 csempe magas, állítható szélességű tilemap -> `.json` (v4: mentés másként, pályarész másolása) | `references/other-tools.md` |
| `dallam_szerkeszto.html` (Befosas `tools`, v1 2026-10-10) | zene a TVC EGY hangcsatornájára: lépésrács (tempó = képkocka / lépés), 37 hang A1..A4, szünet, lábdob, pergő; WebAudio lejátszás; mentés `.json` projekt + `.bin` a játéknak | `references/other-tools.md` |
| Memóriatérkép: `resources\memoria_terkep.ps1` -> `tools\memoria_adat.js` -> KÉT nézet: `tools\memory_map_c64.html` (részletes, a felhasználó C64-es eszközének kinézetével) + `tools\memoria_terkep.html` (lapos) (Befosas, 2026-10-12 / 10-16) | a legutóbbi fordításból (`.asm` + `.sym` + `.tru`): a teljes 64 KB, a kód ELJÁRÁSONKÉNT (egységre szűrve, legnagyobb címkék), szabad helyek, rekeszek üres vége, átfedés. `/memoria` parancs = szkript + mindkét oldal. Élő frissítés ELVETVE (F5) | `references/memory-map.md` |
| `image2tvc_offline_v4_2.html` | KÜLSŐ fejlesztő konvertere (minifikált React); a képjavító algoritmusai át lettek véve a Sprite16-ba | `references/image-conversion.md` |
| `resources\*.ps1` | BMP -> Bery .bin, karakterkészlet export/import, digi hangok, `.dsk` lemezkép | `references/other-tools.md` |

## Mac-en (2026-10-28 óta a második gép)

- A HTML-eszközök bármely böngészőben futnak.
- **A `resources\*.ps1` szkriptek KÖZÖSEK (2026-10-28):** Windowson `powershell -File resources\x.ps1` (5.1),
  Macen `pwsh resources/x.ps1` (7). Mind a `resources\kozos.ps1`-et tölti be: `$Gyoker`, `$Mac`, `$Temp`, `$PsExe`,
  `Ut 'resources/x.bin'` (relatív -> teljes út, `/` és `\` is jó), gépfüggő utak (`$TrseExe`, `$DskSablon`, `$Bongeszo`;
  felülírható a gitből kihagyott `resources\gep_beallitas.ps1`-ben), és saját BMP-olvasó/író (`Bmp-Olvas`, `Bmp-Pixel`,
  `Bmp-Ir`) a csak Windowsos `System.Drawing` helyett. Új szkriptnél is ezt használd; maradjon 5.1-kompatibilis
  (BOM nélküli fájlban csak ASCII, nincs `??`/háromtagú `?:`). Gyerek-szkript: `& $PsExe -NoProfile -File ...`.
  Macen bájtra azonos kimenettel kipróbálva: sprites/pályák/szabály/menu16/nuke/talaj/charset/pályaimport/make_dsk.
  A `charset_export` feliratos PNG-előnézete csak Windowson készül. **Még nincs átírva: `memoria_terkep.ps1`**
  (később, az EP-emulátoros munkával együtt); `build.ps1` Windows-only (Macen `build_mac.sh`). Részletek, csapdák: **tvc-trse-mac**.

## Fájlformátumok (a legfontosabbak - teljes leírás: `references/formats.md`)

- **Bery GE sprite `.bin`:** 3 byte fejléc `típus, szélesség_byte, magasság_sor`; típus 1 = nem maszkolt
  (soronként `szél` adat-byte), típus 2 = maszkolt (soronként `szél` db **bytepár: MASZK, majd ADAT**).
  Több fázis (animáció) = a fázisok egymás után, a fejléc csak egyszer.
- **GRAPHICS16 (16 szín, 128x240):** 1 byte = 2 pixel, **a bitek váltakoznak** (NEM fél byte / pixel):
  bal pixel = 7,5,3,1. bit, jobb pixel = 6,4,2,0. bit, mindkettő I,G,R,B sorrendben. Színindex =
  `I*8+G*4+R*2+B` (= a GE `GR16_COLOR_*` sorrend). Maszkban a bal pixel átlátszó = `$AA`, a jobb = `$55`.
  **A TVC pixele 2:1 arányú** (kétszer olyan széles, mint magas) - minden előnézet így rajzol.
- **GRAPHICS4 (4 szín, 256x240):** 1 byte = 4 pixel; pixel n (0..3): szín alsó bitje -> bit(7-n), felső -> bit(3-n).
- **Paletta RGB a szerkesztőkben:** sötét = `0x92` (146), világos = 255 (az image2tvc konverter értéke; régebben 128 volt).

## Munkaszabályok (a felhasználó elvárásai)

- Magyarul, tömören. A kész eszköz a projekt gyökerében van; **minden nagyobb változtatás előtt
  `.bak_vN` mentés** (pl. `sprite16_szerkeszto.html.bak_v14`), a változást a history-fájlba (ebben a skillben) írd.
- Önálló, offline HTML: nincs CDN, nincs build; a böngészős tárolás (`localStorage`) csak kényelmi autosave -
  a tartós mentés a projekt `.json`-fájl.
- Kis lépésekben, a kérés hatókörén belül; ha a kérés félreérthető (pl. mi legyen konténer, mi sprite), kérdezz vissza.
- A felhasználó rajzait/képeit (minden pixelét) szándékosnak kell tekinteni.
- **Minden változtatás után automatikus teszt** fejetlen (headless) Edge-dzsel + képernyőkép - módszer:
  `references/testing-headless-edge.md`. A választ úgy írd meg, hogy kiderüljön, mi NINCS valódi
  böngészőben/egérrel kipróbálva.

## Döntések, amiket ne vegyél elő újra kérés nélkül

- **Claude-integráció (API-kulcsos generálás) a szerkesztőben: KIVÉVE.** Az Anthropic API külön,
  forgalom alapján fizetős; a felhasználó claude.ai-előfizetése nem fedezi, a Claude appból API-kulcs nem nyerhető ki.
  Előfizetésből működő alternatívák (egyik sincs megvalósítva): "Beillesztés szövegből" (karakterrács + kérés-sablon
  a Claude apphoz), a Claude Code-ban kért sprite (fájlt ír), vagy claude.ai-on közzétett Artifact "ask Claude" képességgel.
- **A sprite-ok önállóak (egyfázisúak); az animációt NÉVVEL ellátott konténerek gyűjtik** (Animátor fül), és a
  konténer exportálódik animált Bery GE `.bin`-ként. Ne kösd a fázisokat a sprite-okhoz.
- **Képimport:** a képjavítás és a dithering a CÉLMÉRETRE kicsinyített képen fut (mint az image2tvc-ben);
  a zajszűrés kapcsolhatóan futhat az eredeti képen is. TVC-palettás képet 1:1-ben tölt (automatikus felismerés).
- Oda-vissza animáció (ping-pong) nem kell; csak előre, kapcsolható körkörös ismétléssel.

## Ahol a játék-projekt tudása van (ne ide írd)

- `C:\TVC\TRSE_Projects\WaterPumpGame\CLAUDE.md`, `C:\TVC\TRSE_Projects\Befosas\CLAUDE.md` - a játékok állapota, döntések
  (a PC-s eszközökre ott csak egy-egy sor / hivatkozás van; az eszköz részletei IDE kerülnek).
- PowerShell 5.1 csapdák (`$Matches`, szöveges argumentum, `ConvertTo-Json` tömbök): `references/memory-map.md`.
- `claude_memory/` a repóban - a játék projektmemóriája (mindkét gépen a Claude memória-mappája erre mutat: Mac symlink, Windows junction).
- `.claude/skills/tvc-trse/` (projekt-skill a repóban) - TRSE/GE/TVC-hardver (a GRAPHICS16 bitkiosztás ott is javítva: `references/hardware.md`).
