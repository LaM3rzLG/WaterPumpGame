# Képkonverzió PC-s képről TVC 16 színre (Sprite16 import-ablak)

## Két betöltési mód

1. **1:1 - TVC-re készült kép** (`imCompute11`): minden TVC-pixel = egy képpixel-blokk, a legközelebbi
   TVC-színnel (euklideszi, a 8-as 2. fekete 0-ként jön vissza). Nincs átméretezés, szűrés, dithering.
   "Egy TVC-pixel a képen": 1x1, 2x1, 2x2, 4x2, 4x4, 8x4. Max 128x240; páratlan szélességnél 1 oszlop háttér.
   **Automatikus felismerés** megnyitáskor (`imDetectTvc`): ha minden átlátszatlan pixel <= 40 távolságra van
   egy TVC-színtől (a 127/128/146-os sötétek is) ÉS belefér -> 1:1; a blokkméret a legnagyobb olyan
   `[8,4],[4,4],[4,2],[2,2],[2,1]`, amelyen belül minden képpixel azonos. Így a Sprite16 mind a 4 PNG-módja
   oda-vissza pixelpontos. Korlát: csupa páros/blokkos rajzú 1:1 sprite-ot nagyítottnak vélhet (kézzel 1x1).
2. **Átalakítás - PC-s kép** (`imCompute`), a lánc sorrendje:
   1. **Méret:** a jelenlegi sprite mérete / a kép mérete (max 128x240) / egyéni; illesztés: arányos egész kép
      (a maradék háttér) / arányos kitöltés (levágás) / nyújtás; **TVC 2:1 korrekció** (alap be: vízszintesen feleannyi pixel).
   2. **Kicsinyítés** (`imResample`): többlépcsős felezés `imageSmoothingQuality:"high"`-gal (szebb, mint egy lépés).
      Opcionálisan **zajszűrés az eredeti képen** (`imPreDenoise`): előbb max. 4x célméretre kicsinyít, ott
      arányosított sugarú gyors dobozszűrő (`imBoxBlur`, szétválasztott, futó összeg, O(n)), majd a célméretre.
   3. **Átlátszóság:** alfa < 128 -> átlátszó (ha maszkolt és be van kapcsolva); "bal felső sarok színe átlátszó"
      tűréssel; félig átlátszó pixel fekete fölé keverve.
   4. **Képjavítás** (a kicsinyített képen): zajszűrés (`imDenoise`, dobozszűrő, >50%: 2 px sugár) ->
      élkiemelés (`imSharpen`, mag `[0,-1,0,-1,5,-1,0,-1,0]`, keverés erősség/50) -> színkorrekció (`imAdjust`,
      0..1 tartományban: dinamika-tömörítés `l/(1+l*(1-t))` (Reinhard-szerű), fényerő `+b/100`,
      kontraszt `(x-.5)*(c+100)/100+.5`, gamma `x^(1/g)` (0,2..3,0), telítettség luma körül 0..200%).
   5. **Színek:** használható színek (16 kapcsolható minta, a 8-as alapból ki); **auto szín** (`imAutoColors`):
      mohó kiválasztás, az N (2..8) legjobban illő szín, ~1500 mintapont átlagos távolsága alapján.
   6. **Kvantálás / dithering** (`imCompute` törzse), színtávolság `imDist`: látás alapú "redmean"
      (`(2+rm/256)dr² + 4dg² + (2+(255-rm)/256)db²`) vagy euklideszi.
   7. **Pötty-szűrés** (`imClean`): a 8 szomszédból <= 1 egyező pixel a leggyakoribb szomszéd színét kapja.

## Dithering-módok (16)

| Csoport | Módok | Megjegyzés |
|---|---|---|
| nincs | `none` | legközelebbi szín (+ opcionális zaj) |
| hibaterjesztés | `fs` Floyd–Steinberg, `atk` Atkinson, `sierra` Sierra Lite, `stucki`, `burkes`, `jarvis` | magok: `KERNELS`; erősség = a hiba szorzója; **szerpentin** (páratlan sorok jobbról balra, a mag tükrözve); ±1 jitter, ha nincs zaj |
| rendezett | `b2`,`b4`,`b8`,`b16` Bayer, `cluster` pontfürt 8x8, `blue` kék zaj 8x8 | küszöb `((M+0.5)/(n*n)-0.5)*128*erősség` hozzáadva mindhárom csatornához |
| TVC-minta | `pat` kétszínű sakktábla, `patd` ugyanez hibaterjesztéssel, `yli` Yliluoma-féle | `pat`: minden színpár átlaga (`imPairs`), a pixelhez legközelebbi átlagú pár, `(x+y)&1` választ c1/c2 közül; `yli`: 8 elemű keverési terv gamma-helyes (2.2) lineáris átlaggal (`imYliPlan`), a Bayer 8x8 indexeli, 15 bites kulccsal cache-elve |

- **Simító küszöb** (alap 24): ha az EREDETI (korrigált) pixel négyzetes távolsága a legközelebbi színtől
  < küszöb², pontosan azt kapja, hibaterjesztés nélkül (a sima felületek tiszták). `none`/`pat` módban nem hat.
- **Zaj**: ±zaj*32 véletlen érték; a véletlen **seedelt xorshift** (`imRng(12345)`), így az előnézet stabil.
- A Bayer-mátrix: `bayer(n)` rekurzív, `M(2k) = 4*M(k) + [[0,2],[3,1]]` (a BAYER8 0..63 permutáció - teszttel igazolva).

## Alapértékek és alaphelyzet

`IM_DEF`/`IM_CHK` + `imDefaults()`: képjavítás 0 (gamma 1,00, telítettség 100%), Floyd–Steinberg 80%, zaj 0,
küszöb 24, szerpentin be, látás alapú be, pötty-szűrés ki, auto szín ki, arányos illesztés, 2:1 korrekció be,
zajszűrés az eredetin ki, minden szín (a 8 kivételével), alfa-átlátszóság be, sarokszín ki (tűrés 30).
**Minden megnyitás alapértékről indul** (a méret: "a jelenlegi sprite mérete"); "minden beállítás alaphelyzetbe"
gomb (méret/háttér/cél kivételével); a kisebb "alaphelyzet" csak a képjavító csúszkákat.

## Az image2tvc konverter (`image2tvc_offline_v4_2.html`) - forrás-elemzés

Külső fejlesztő munkája: Vite/React build, egyetlen minifikált modul (579 KB, 557 sor). Az algoritmusokat
a minifikált kódból olvastuk ki és SAJÁT kóddal írtuk újra (nem másoltuk). Kulcsfüggvények (minifikált nevek,
csak tájékozódásra - buildenként változhatnak): `Ub` zajszűrés, `Hb` élkiemelés, `Fb` színkorrekció, `Ui`
redmean-távolság, `Gr` euklideszi, `Zb` auto szín, `Rb`/`Zg`/`Sf` TVC-színpár tábla (32^3 LUT), `_b`/`Vb`
Yliluoma-terv, `$b` pötty-szűrés; a fő ciklus a `pattern-tvc`, `yliluoma`, `ordered-*`, hibaterjesztés ágakkal.
Keresés a minifikált fájlban: kulcsszóra (`dither`, `unsharp`, `serpentine`, `solidSnap`) `grep -o '.\{0,300\}kulcs.\{0,300\}'`,
függvényre `grep -o "[ ,;(]Nev=[^=].\{0,1200\}"` (arrow-függvények). Amit NEM vettünk át: tiltott színpárok
(felhasználói lista), automatikus beállítás-kereső, 4/2 színű módok, 32^3 LUT (sprite-méretnél felesleges).
Érdekesség: a konverter tooltipje szerint a zajszűrés "kicsinyítés előtt" fut, a kódban viszont utána.
