# Memóriatérkép (Befosas, 2026-10-12 / átírva 2026-10-16)

Fájlok a projektben (`C:\TVC\TRSE_Projects\Befosas\`):
- `resources\memoria_terkep.ps1` - build UTÁN fut, a fordítás kimenetéből írja a `tools\memoria_adat.js`-t.
- `tools\memory_map_c64.html` - **részletes nézet** (a felhasználó választása, a C64-es minta kinézetével).
- `tools\memoria_terkep.html` - **lapos nézet** (függőleges összesítő + laponkénti sávok + "Kód bontása" táblázat).
- A két oldal ugyanazt a `.js`-t olvassa, a fejlécben hivatkoznak egymásra.
- `.claude\commands\memoria.md` = a `/memoria` parancs: szkript + MINDKÉT oldal megnyitása (a felhasználó "/memória"-nak írja).
- Minta: a felhasználó C64-es eszköze, `C:\TVC\TRSE_Projects\C64Memmap\` (`memmap.py` + `memmap.template.html` + `memmap.json`).
  Abból NEM vettük át: fázisok, tervező mód (áthelyezés-szimuláció), nullás lap, ROM / I/O alatti RAM - TVC-n nincs rá szükség.

## Honnan jön az adat (a szkript fejkommentje is leírja)

| Forrás | Mit ad |
|---|---|
| `<Nev>.asm` | `org $X` + `incbin "út"` = a rekeszek neve és kezdete; `Név equ $cím` = változó, ha a névben van KISBETŰ (a csupa nagybetűs `EQU` állandó); a `Defining procedure : X` ... `end_procedure_X:` határok = melyik címke melyik eljárásé |
| `<Nev>.sym` | MINDEN címke címe (`al $cím .név`); `EndBlock<kezdet>` = a blokk vége (kód vége, incbin hossza). Az `.asm` a címeket NEM tartalmazza |
| `<Nev>.tru` | csak a tömbök MÉRETE (`array[N] of byte at $cím`) - az `.asm`-ben csak a cím van |
| `$Fix` lista a szkriptben | rendszerváltozók, verem, videó-RAM, U2 - kézzel; `hat = 1` = "háttér": nem foglal, csak a beleeső lyukak nevét adja |

**Kód bontása:** a `.sym` címkéi a kódblokkban cím szerint rendezve; egy címke mérete = a következő címke címe - a sajátja
(azonos címen több címke: a sorban utolsó viszi). Gazda: az eljáráshatárokon belül az eljárás; kívül a név eleje
(`MainProgram*` / `main_block*` -> főprogram; `<Unit>_` -> unit változói; egyéb adat -> a főprogram globálisai; egyéb kód ->
TRSE-rutinok). A `$19EF`-`$1A02` 20 byte a BASIC-indító. Ellenőrzés: az elemek összege = a kódblokk mérete (Befosas: 12992).

## Az adatformátum (`var MEMORIA = {...}` - `.js`, mert `file://` oldal nem olvashat `.json`-t)

```
nev, datum (az .asm ideje), kodVeg, baj (hibás részek száma),
reszek: [{ e, v (utolsó byte), n, t: k|r|u|v|vid|a|sz, o (csoport), h (rekeszben a fájl hossza), l: vid|u2, baj }],
kod:    [{ n, u: ras|unit|GE|TVC|trse, k (kódbyte), a (adatbyte), r: [[cím, hossz, "k"|"a"], ...], c: [[címke, cím, hossz] x12] }]
```
`t`: k = kód (a részletes nézet a `kod` darabjaival helyettesíti), r = rendszer, u = unit-tömb, v = verem, vid = videó,
a = adatfájl-rekesz, sz = szabad. Új mezőnél MINDKÉT HTML-t ellenőrizni (a lapos nézet `x.r[0][0]`, `d[0]`, `d[1]`-et használ).

## Más projektre

`powershell -File resources\memoria_terkep.ps1 -Nev <Program>`; a `$kodKezd` (`$19EF`) és a `$Fix` lista TVC + GE-specifikus;
a két HTML-ben a projektnév az adatból jön. A unit-előtag felismerése: a főprogram globálisai az `.asm`-ben ELŐTAG NÉLKÜL
vannak, a unité `<Unit>_` előtaggal (akkor is, ha a unit neve = a program neve).

## PowerShell 5.1 csapdák (ezen a szkripten jöttek elő)

- **`-match` / `-cmatch` felülírja a `$Matches`-t** - a csoportokat előbb változóba kell menteni, utána szabad újra illeszteni.
- **Parancsmódú függvényhívásban a `-1` és a `0xFFFF` SZÖVEG** -> `"-1" -ge 0` igaz (kultúrafüggő összehasonlítás), `{0:X4}`
  `0xFFFF`-et ír. A paramétert típusozni kell: `function Uj([int]$e, ...)`.
- **`$x = if (...) { $tomb } else {...}` MÁSOLATOT ad** (a kimenet kiterül és újra összeáll) - a tömb elemének módosítása elvész.
  Közvetlenül indexelj: `$lista[$i][1] += ...`.
- **`ConvertTo-Json` (5.1) a csővezetékből / `+= ,@()`-ből jövő tömböt `{"value":[...],"Count":3}` alakban írja.** Új tömbként
  rakd össze: `[void]$al.Add(@([string]$a, [int]$b))`. Rendezett szótáron a `Group-Object u` nem megy -> `Group-Object { $_.u }`.
- Ékezetes szöveg a szkriptben: UTF-8 **BOM-mal** mentsd (különben az 5.1 elrontja); a kimeneti `.js` BOM nélkül.

## Tesztelés

Fejetlen Edge (`testing-headless-edge.md`). Az oldal relatív útvonalon tölti a `memoria_adat.js`-t, ezért a teszt-másolatot a
`tools\` mappába kell tenni (utána törölni). A DOM-ban a "Nincs adat" szöveg-keresés HAMIS riasztás (a szöveg a scriptben is
benne van) - a kirajzolt elemeket számold (`class="seg `, `<tr data-k="k`).
