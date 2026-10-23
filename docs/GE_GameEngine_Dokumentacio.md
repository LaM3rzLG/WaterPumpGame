# GE Game Engine — TRSE utasításreferencia

**Forrás:** `C:\TVC\TRSE\units\TVC\GE.tru` (BerySoft — Zsolt Bertok, 2023–2026)
**Cél platform:** Videoton TV-Computer (TVC)
**Ez a dokumentum** a `GE` unit TRSE (Rascal) szintű, játékfejlesztés közben ténylegesen használt utasításait (osztályok, metódusok, globális eljárások, konstansok) foglalja össze, a belső Z80 assembly implementáció részletei nélkül.

Használat a kódban: `@use "GE"` majd `GE::Eljárás(...)` vagy `sprite_változó.Metódus(...)`.

---

## Tartalom

1. [Alapfogalmak és inicializálási sorrend](#1-alapfogalmak-és-inicializálási-sorrend)
2. [Konstansok](#2-konstansok)
3. [`GE::Sprite` osztály](#3-gesprite-osztály)
4. [`GE::Image` osztály](#4-geimage-osztály)
5. [`GE::List` osztály](#5-gelist-osztály)
6. [Rendszer / inicializálás](#6-rendszer--inicializálás)
7. [Sprite-csoportos globális eljárások](#7-sprite-csoportos-globális-eljárások)
8. [Képernyő (Screen)](#8-képernyő-screen)
9. [Scroll (hardveres görgetés)](#9-scroll-hardveres-görgetés)
10. [Grafika](#10-grafika)
11. [Billentyűzet és Joystick](#11-billentyűzet-és-joystick)
12. [Hang](#12-hang)
13. [Digitális hang (Digi Sound)](#13-digitális-hang-digi-sound)
14. [Szövegkiírás](#14-szövegkiírás)
15. [Segédfüggvények](#15-segédfüggvények)
16. [Memóriatérkép](#16-memóriatérkép)

---

## 1. Alapfogalmak és inicializálási sorrend

A motor két renderelési módot támogat:

- **`DIRECT_TO_SCREEN`** — minden rajzolás közvetlenül a látható képernyőre történik.
- **`USE_BACK_SCREEN`** — a rajzolás egy háttérképernyőre (Page 3, `$C000`) történik, amit külön kell kimásolni a látható képernyőre (`CopyToScreen` / `CopyAllSpritesToScreen` / `CopyBackScreenToScreen`). Ehhez 64k memória szükséges.

Egy tipikus program felépítése:

```pascal
program MyGame;
@use "TVC"
@use "GE"

var
  PlayerBitmap : incbin("resources/Player.bin");
  Player       : GE::Sprite;

begin
  GE::SetGraphics(GE::GRAPHICS4);
  GE::SetPalette(0, GE::PALETTE_GRAY);
  GE::Init(GE::DIRECT_TO_SCREEN);

  Player.Init(#PlayerBitmap, 0, 0, True);

  while (true) do
  begin
    GE::WaitForSync();
    GE::GetKeyboard();
    GE::GetJoysticks();
    if (GE::Joystick(1, GE::JOY_LEFT)) then Player.MoveLeft();
    GE::RenderAllSprites();
  end;
end.
```

Fontos sorrendi szabályok:

- `GE::Init` előtt semmilyen sprite/image műveletet vagy képernyőre rajzolást nem szabad végezni.
- Minden sprite-hoz meg kell hívni a `.Init()`-et, mielőtt bármi mást hívnánk rá.
- `GE::Init` automatikusan letiltja a TVC rendszer megszakítás-kezelőjét (lásd [DisableTVCITHandler](#disabletvcithandler)) a gyorsabb működés érdekében — emiatt a billentyűzet mátrixot kézzel kell frissíteni (`GE::GetKeyboard`).
- Ha `GE::DigiSoundOn()` aktív, a `GE::WaitForSync()` helyett `GE::WaitForDigiSoundSync()` használandó.

---

## 2. Konstansok

### Memória lapozás (`GE::SetMemory`)

| Konstans | Érték | Jelentés |
|---|---|---|
| `MEM_DEFAULT` | `$70` | U0, U1, U2, SYS |
| `MEM_VID_ON` | `$50` | U0, U1, VID, SYS |
| `MEM_FULL_64K` | `$B0` | U0, U1, U2, U3 |
| `MEM_48K_VID` | `$90` | U0, U1, VID, U3 |

### Grafikus módok

| Konstans | Érték | Felbontás |
|---|---|---|
| `GRAPHICS2` | 0 | 512×240, 2 szín |
| `GRAPHICS4` | 1 | 256×240, 4 szín |
| `GRAPHICS16` | 2 | 128×240, 16 szín |

### Renderelési mód (`GE::Init` paramétere)

| Konstans | Érték |
|---|---|
| `DIRECT_TO_SCREEN` | 0 |
| `USE_BACK_SCREEN` | 1 |

### Paletta színek (Graphics 2 / Graphics 4 — `GE::SetPalette`)

| Konstans | Érték |
|---|---|
| `PALETTE_BLACK` | `$00` |
| `PALETTE_DARKBLUE` | `$01` |
| `PALETTE_DARKRED` | `$04` |
| `PALETTE_DARKMAGENTA` | `$05` |
| `PALETTE_DARKGREEN` | `$10` |
| `PALETTE_DARKCYAN` | `$11` |
| `PALETTE_DARKYELLOW` | `$14` |
| `PALETTE_GRAY` | `$15` |
| `PALETTE_BLACK2` | `$40` |
| `PALETTE_BLUE` | `$41` |
| `PALETTE_RED` | `$44` |
| `PALETTE_MAGENTA` | `$45` |
| `PALETTE_GREEN` | `$50` |
| `PALETTE_CYAN` | `$51` |
| `PALETTE_YELLOW` | `$54` |
| `PALETTE_WHITE` | `$55` |

### Keret színek (`GE::SetBorder`)

`BORDER_BLACK`, `BORDER_DARKBLUE`, `BORDER_DARKRED`, `BORDER_DARKMAGENTA`, `BORDER_DARKGREEN`, `BORDER_DARKCYAN`, `BORDER_DARKYELLOW`, `BORDER_GRAY`, `BORDER_BLACK2`, `BORDER_BLUE`, `BORDER_RED`, `BORDER_MAGENTA`, `BORDER_GREEN`, `BORDER_CYAN`, `BORDER_YELLOW`, `BORDER_WHITE`

### Graphics 4 / Graphics 16 pixelminták

- `GR4_COLOR0..GR4_COLOR3` (0, 240, 15, 255) — Graphics 4 byte-minták `FillRect`/`ClearScreen` stílusú eljárásokhoz.
- `GR16_COLOR_BLACK`, `GR16_COLOR_DARKBLUE`, …, `GR16_COLOR_WHITE` — teljes 16 színű paletta byte-mintaként.

### Animáció típusok (`Sprite.InitAnimation`)

| Konstans | Jelentés |
|---|---|
| `LOOP_FORWARD` | első fázistól az utolsóig, majd újra elölről |
| `LOOP_PINGPONG` | oda-vissza (első→utolsó→első) |
| `LOOP_BACKWARD` | utolsó fázistól az elsőig, majd újra a végétől |

### Scroll irányok (`GE::Scroll`)

`SCROLL_UP`, `SCROLL_UP_RIGHT`, `SCROLL_RIGHT`, `SCROLL_DOWN_RIGHT`, `SCROLL_DOWN`, `SCROLL_DOWN_LEFT`, `SCROLL_LEFT`, `SCROLL_UP_LEFT`

### Joystick irányok/gomb (`GE::Joystick`)

| Konstans | Érték |
|---|---|
| `JOY_UP` | 2 |
| `JOY_DOWN` | 4 |
| `JOY_LEFT` | 64 |
| `JOY_RIGHT` | 32 |
| `JOY_FIRE` | 8 |

GameCard joystickokhoz: `GAMECARD_JOY_UP`, `GAMECARD_JOY_DOWN`, `GAMECARD_JOY_LEFT`, `GAMECARD_JOY_RIGHT`, `GAMECARD_JOY_FIRE`.

### Billentyűkódok (`GE::Pressed`)

Minden billentyűre van egy `KEY_xxx` konstans (pl. `KEY_A`, `KEY_SPACE`, `KEY_RET`, `KEY_ESC`, `KEY_CTRL`, `KEY_SHIFT`, `KEY_DEL`, `KEY_INS`, magyar ékezetes betűk: `KEY_AA`(Á), `KEY_EE`(É), `KEY_II`(Í), `KEY_OO`(Ó), `KEY_OE`(Ö), `KEY_OOE`(Ő), `KEY_UU`(Ú), `KEY_UE`(Ü), `KEY_UUE`(Ű), stb.) — lásd a `GE.tru` 197–275. sorait a teljes listáért.

### Digi hang paraméterek

| Konstans | Jelentés |
|---|---|
| `DIGI_FREQ_2_KHZ`, `DIGI_FREQ_4_KHZ`, `DIGI_FREQ_8_KHZ` | mintavételi frekvencia |
| `DIGI_TYPE_1x4BIT` | 1 byte = 1×4 bit adat, ~12,6% CPU |
| `DIGI_TYPE_2x4BIT` | 1 byte = 2×4 bit adat, ~20% CPU, feleannyi hely |

---

## 3. `GE::Sprite` osztály

Maszkolt (átlátszó hátterű, `SpriteType = 2`) vagy nem maszkolt (`SpriteType = 1`) mozgó objektum, opcionális animációval, ütközésvizsgálattal és háttérmentéssel.

### Mezők

| Mező | Típus | Leírás |
|---|---|---|
| `Visible` | boolean | Kirajzolva van-e (l. `Show`/`Hide`) |
| `SpriteType` | byte | 1: maszk nélküli; 2: maszkolt |
| `Width` | byte | Szélesség byte-ban |
| `Height` | byte | Magasság pixelben |
| `X`, `Y` | byte | Pozíció (X: 0–63 byte; Y: 0–239 pixel) |
| `LastX`, `LastY` | byte | Előző pozíció (`UpdateLastPos` állítja) |
| `AnimSet` | pointer | Az animációs fázisok kezdőcíme |
| `AnimType` | byte | `LOOP_FORWARD` / `LOOP_PINGPONG` / `LOOP_BACKWARD` |
| `AnimPhaseCount` | byte | Animációs fázisok száma |
| `AnimPhaseNr` | byte | Aktuális fázis sorszáma |
| `AnimDelay` | byte | Hányadik `Animation()` hívásra lépjen tovább |
| `WasAnimated` | boolean | `Animation()` állítja True-ra; a felhasználónak kell False-ra visszaállítania |
| `UseBackground` | boolean | Van-e lefoglalt háttér-buffere |
| `Mirrored` | boolean | Tükrözve rajzolódjon-e (mirroring eljárásokkal) |
| `GroupNr` | byte | Csoportazonosító (`CollidedWith`-hoz) |
| `State`, `Direction`, `Timer`, `Counter`, `Delay` | byte | **Szabadon felhasználható** mezők saját logikához |

### `Init(ImagePtr, X, Y, GetBackgroundBuffer)`

Sprite inicializálása. `ImagePtr`: bitmap memóriacíme (`incbin`); `X`, `Y`: kezdőpozíció; `GetBackgroundBuffer`: foglaljon-e automatikusan háttérmentő buffert.

```pascal
var
  PlayerBitmap : incbin("resources/images/Player.bin");
  Player : GE::Sprite;
begin
  Player.Init(#PlayerBitmap, 0, 0, True);
end;
```

### Kirajzolás — kézi vezérlésű változatok

Ezek a metódusok **nem** kezelik automatikusan a háttérmentést/visszaállítást — ahhoz `SaveBackground`/`RestoreBackground` kell köréjük, vagy helyettük a [`Render`](#render) használandó.

| Metódus | Maszkolt? | Megjegyzés |
|---|---|---|
| `Draw` | igen | Digi hang mellett is használható |
| `FastDraw` | igen | SP regisztert használ → **megszakítást tilt**, digi hang mellett NEM ajánlott |
| `DrawMirror` | igen | vízszintesen tükrözve rajzol |
| `FastDrawMirror` | igen | mint `FastDraw`, tükrözve |
| `ScrollDraw` | igen | hardveres scroll közben használatos `Draw` |
| `ScrollFastDraw` | igen | hardveres scroll közben használatos `FastDraw` |
| `Put` | nem | felülíró kirakás, hosszabb/gyorsabb kód |
| `SmallPut` | nem | felülíró kirakás, rövidebb/lassabb kód |
| `PutMirrored` | nem | felülíró, tükrözött |
| `ScrollPut` | nem | felülíró kirakás scroll közben |

Példa (kézi vezérléssel):

```pascal
Player.X := 30;
Player.Y := 100;
Player.SetPosition();
Player.Draw;
```

### `SetPosition()`

Kiszámolja a sprite képernyő-pozícióját (`Position`) az `X`, `Y` mezők alapján. Minden kirajzolás előtt szükséges, ha az `X`/`Y` változott.

### `UpdateLastPos`

`LastPosition/LastX/LastY := Position/X/Y`. Akkor kell kézzel hívni, ha nem `RenderAllSprites`-t, hanem `RestoreBackground` + `Draw`/`Put` párost, vagy `CopyToScreen`-t használunk `GE::CopyAllSpritesToScreen` helyett.

### `Show` / `Hide`

`Show`: egy eddig `Visible = False` (nem kirakott) sprite-ot a következő `RenderAllSprites()` híváskor megjelenít, és `Visible := True`.
`Hide`: fordítva — a következő `RenderAllSprites()` eltünteti, `Visible := False`.

```pascal
MissileSprite.Init(#MissileBitmap, 0, 0, False);
MissileSprite.Visible := False;
...
if (GE::Joystick(1, GE::JOY_FIRE)) then
begin
  MissileSprite.X := PlayerSprite.X + PlayerSprite.Width;
  MissileSprite.Y := PlayerSprite.Y + 5;
  MissileSprite.SetPosition();
  MissileSprite.Show();
end;
```

### Háttérkezelés

| Metódus | Leírás |
|---|---|
| `SetBackground(BackgroundBuffer: pointer)` | Kézzel beállított háttér-buffer cím |
| `SaveBackground` | Elmenti a sprite alatti hátteret (pl. induláskor) |
| `ScrollSaveBackground` | mint fent, scroll közben |
| `RestoreBackground` | Visszamásolja a korábban elmentett hátteret a képernyőre |
| `ScrollRestoreBackground` | mint fent, scroll közben |
| `CopyToScreen` | Sprite kimásolása a háttérképernyőről (`USE_BACK_SCREEN`) a látható képernyőre |

### `Render`

**A javasolt, automatikus kirakó eljárás.** Ha `Visible = True`:
1. visszaállítja a sprite hátterét (ha van buffere),
2. elmenti az új háttért,
3. kirajzolja a sprite-ot típusa szerint (`Draw` vagy `Put`),
4. frissíti a `LastPosition`-t (ha nem háttérképernyős a mód).

Ha `Visible = False`, nem csinál semmit.

```pascal
GE::WaitForSync();
Player.MoveDownBy4();
Player.Render();
```

`ScrollRender` / `ScrollFastRender`: ugyanez hardveres scroll közben (`ScrollFastRender` az SP regisztert használja, digi hanggal nem kompatibilis).

### Gyors mozgatás (`SetPosition` helyett)

Ezek közvetlenül módosítják `Position`-t és `X`/`Y`-t, gyorsabbak, mint `X := X ± n` + `SetPosition()`.

| Metódus | Elmozdulás |
|---|---|
| `MoveLeft()` / `MoveRight()` | 1 byte (Gr.2: 8px, Gr.4: 4px, Gr.16: 2px) |
| `MoveLeftBy2()` / `MoveRightBy2()` | 2 byte |
| `MoveUp()` / `MoveDown()` | 1 pixelsor |
| `MoveUpBy2()` / `MoveDownBy2()` | 2 pixelsor |
| `MoveUpBy4()` / `MoveDownBy4()` | 4 pixelsor |
| `MoveUpBy8()` / `MoveDownBy8()` | 8 pixelsor |

*(Balra/jobbra csak 1 és 2 byte-os lépés létezik, fel/le 1, 2, 4 és 8 pixelsoros is.)*

### Ütközésvizsgálat

**`Collided(Sprite2: pointer): boolean`** — átfedésben van-e a két sprite (téglalap alapú, AABB-ütközés).

```pascal
if (Missile.Collided(Enemy)) then Enemy.Hide();
```

**`CollidedWith(GroupNr: byte): integer`** — végigmegy az összes látható sprite-on, és megnézi, ütközött-e bármelyikkel a megadott `GroupNr` csoportból. Visszatérési érték: 0, ha nem ütközött, egyébként a talált sprite pointere.

```pascal
const ENEMIES_GROUP : byte = 2;
var Enemies : array[10] of GE::Sprite;
    EnemySprite : pointer of GE::Sprite;

for i := 0 to 10 do Enemies[i].GroupNr := ENEMIES_GROUP;
EnemySprite := PlayerSprite.CollidedWith(ENEMIES_GROUP);
if EnemySprite <> 0 then PlayerCollided();
```

### Animáció

**`InitAnimation(AnimPhaseCount, AnimDelay, AnimType: byte)`** — animáció beállítása. `AnimDelay`: hány `Animation()`-hívás után lép a következő fázisra.

```pascal
// 6 fázis, elejétől a végéig, majd újra elölről, minden hívásra lép
PlayerSprite.InitAnimation(6, 1, GE::LOOP_FORWARD);
```

**`Animation()`** — a következő animációs fázisra lépteti a sprite-ot (a beállított `AnimType` és `AnimDelay` szerint).

**`ResetAnimation(ImageSet: pointer)`** — más animációs fázis-készletre állítja a sprite-ot, és visszaállítja az első fázisra (pl. irányváltáskor másik bitmap-sorozatra váltáshoz).

---

## 4. `GE::Image` osztály

Egyszerűbb, **statikus** grafikai elem: nincs maszk, nincs automatikus háttérmentés, nincs animáció, nincs ütközésvizsgálat. Csempékhez, hátterekhez, UI-elemekhez való.

### Mezők

| Mező | Típus | Leírás |
|---|---|---|
| `Bitmap` | integer | bitmap memóriacíme |
| `Width` | byte | szélesség byte-ban |
| `Height` | byte | magasság pixelben |
| `X`, `Y` | byte | pozíció |

### `Init(ImagePtr, Width, Height)`

```pascal
var TitleBitmap : incbin("images/TestImage.bin");
    TileImage : GE::Image;
begin
  TileImage.Init(#TitleBitmap, 4, 20);
  TileImage.X := 10;
  TileImage.Y := 0;
  TileImage.Put();
end;
```

### Kirakás

| Metódus | Leírás |
|---|---|
| `FastPut` | gyorsabb, de több memóriát használ |
| `Put` | normál kirakás |
| `ScrollPut` | kirakás hardveres scroll közben |
| `PutToPos` | kirakás megadott (előre kiszámolt) képernyőpozícióba |
| `ScrollPutToPos` | mint fent, scroll közben |
| `PutRect(StartX, StartY, Width, Height: byte)` | csak az image egy résztéglalapjának kirakása — pl. csempekészletből egy adott csempe kivágása |

```pascal
TileImage.Init(#TitleBitmap, 128, 10);
TileImage.X := 0;
TileImage.Y := 230;
TileImage.PutRect(10, 0, 64, 10);
```

### `SetPosition()`

Kiszámolja a képernyőpozíciót `X`/`Y` alapján (mint a Sprite-nál).

### Mozgatás

`MoveLeft`, `MoveRight` (1 byte); `MoveUp`, `MoveUpBy2`, `MoveUpBy4`, `MoveDown`, `MoveDownBy2`, `MoveDownBy4`.

---

## 5. `GE::List` osztály

Legfeljebb 20 elemű pointer-lista (pl. sprite-ok csoportosítására).

```pascal
var
  PlayerSprite  : GE::Sprite;
  EnemySprite1  : GE::Sprite;
  EnemySprite2  : GE::Sprite;
  EnemyList     : GE::List;

procedure Init();
begin
  PlayerSprite.Init(#PlayerSpriteBin, 30, 200, True);
  EnemySprite1.Init(#EnemySpriteBin,  0,  50, True);
  EnemySprite2.Init(#EnemySpriteBin, 30,  50, True);
  EnemyList.Init();
  EnemyList.Add(#EnemySprite1);
  EnemyList.Add(#EnemySprite2);
end;
```

| Metódus | Leírás |
|---|---|
| `Init()` | lista létrehozása |
| `Add(ItemAddr: integer)` | elem hozzáadása |
| `Count(): byte` | elemek száma |
| `Get(Nr: byte): integer` | a Nr. elem (0-alapú indexelés) |
| `Clear()` | lista ürítése |

---

## 6. Rendszer / inicializálás

### `Init(UseBackScreen: boolean)`

A Game Engine inicializálása — minden más művelet előtt kötelező meghívni. Paraméter: `GE::DIRECT_TO_SCREEN` vagy `GE::USE_BACK_SCREEN`. Automatikusan letiltja a TVC rendszer megszakítás-kezelőjét ([`DisableTVCITHandler`](#disabletvcithandler)).

```pascal
GE::Init(GE::DIRECT_TO_SCREEN);
```

### `SetMemory(Mode: byte)` / `GetMemoryMapping(): byte`

Memórialapozás beállítása/lekérdezése (`MEM_DEFAULT`, `MEM_VID_ON`, `MEM_FULL_64K`, `MEM_48K_VID`, vagy tetszőleges 0–255 érték).

### `EnableTVCITHandler` / `DisableTVCITHandler` {#disabletvcithandler}

`DisableTVCITHandler`: a Game Engine saját, minimális megszakítás-kezelőjét állítja be a rendszer helyett — gyorsabb futást eredményez, de a billentyűzet-mátrixot nem tölti fel automatikusan (`GE::GetKeyboard()` kézi hívása szükséges). A `GE::Init` automatikusan meghívja.
`EnableTVCITHandler`: visszaállítja az eredeti TVC megszakítás-kezelőt — akkor kell, ha fájlműveletet vagy más rendszerfunkciót akarunk használni.

### `ResetSpriteList()`

Törli a sprite-listát és felszabadítja a lefoglalt háttér-buffereket. Több szakaszból (pl. menü → játék → game over) álló programoknál hasznos, ha szakaszonként más sprite-okat használunk — utána minden újra használt sprite-ra `Init`-et kell hívni.

### `InitSpriteMirroring()`

A tükrözési tábla előkészítése — a `DrawMirror`, `PutMirrored`, `PutAllSpritesWithMirroring` használata előtt, a program elején egyszer kell meghívni.

---

## 7. Sprite-csoportos globális eljárások

Ahelyett, hogy minden sprite-ra egyenként hívnánk meg a metódusait, ezek egy körben végigmennek az `Init`-tel regisztrált összes sprite-on (az inicializálás sorrendjében).

| Eljárás | Mit csinál |
|---|---|
| `RenderAllSprites` | **A leggyakrabban használt.** Minden sprite hátterét visszaállítja, majd újrarajzolja és elmenti az új hátterét (ekvivalens az egyenkénti `Render()`-rel) |
| `RenderScrollSprites` | mint fent, hardveres scroll közben |
| `CopyAllSpritesToScreen` | minden sprite kimásolása a háttérképernyőről a látható képernyőre (`USE_BACK_SCREEN` módban) |
| `SaveAllSpritesBackground` | minden sprite hátterének elmentése (pl. induláskor, pálya kirajzolása után) |
| `RestoreAllSpritesBackground` | minden sprite háttere visszamásolása |
| `DrawAllSprites` | minden sprite kirajzolása a `Draw` metódussal (háttérkezelés nélkül) |
| `PutAllSprites` | minden sprite kirakása a `Put` metódussal |
| `PutScrollSprites` | mint fent, scroll közben |
| `PutAllSpritesWithMirroring` | mint `PutAllSprites`, de figyeli az egyes sprite-ok `Mirrored` mezőjét is |
| `CopyBackScreenToScreen` | a teljes háttérképernyő kimásolása a látható képernyőre |
| `CopyBackScreenRectToScreen(X, Y, Width, Height: byte)` | egy téglalap kimásolása a háttérképernyőről |
| `CopyBackScreenRectFromPosToScreen(Position: integer; Width, Height: byte)` | mint fent, előre kiszámolt pozícióval |

```pascal
GE::WaitForSync();
GE::RenderAllSprites();
```

---

## 8. Képernyő (Screen)

### `SetGraphics(Mode: byte)`

Grafikus mód beállítása **ROM-funkcióval** — mellékhatásként törli a képernyőt és inicializálja a rendszer szövegkiírót. Paraméter: `GRAPHICS2` / `GRAPHICS4` / `GRAPHICS16`.

### `GetGraphics(): byte`

Az aktuális grafikus mód lekérdezése (0/1/2).

### `SetGraphMode(Mode: byte)`

Grafikus mód beállítása közvetlen port-írással — **nem törli** a képernyőt. Hasznos, ha a képernyő felső és alsó fele más grafikus módban fut (raster-megszakításban átváltva).

### `SetPalette(Nr, Color: byte)`

Graphics 2/4 módban a paletta egy adott indexű színét állítja be. `Nr`: Gr.2 esetén 0–1, Gr.4 esetén 0–3. `Color`: lásd a `PALETTE_*` konstansokat.

```pascal
GE::SetPalette(1, GE::PALETTE_RED);
```

### `SetBorder(Color: byte)`

A keret színének beállítása (`BORDER_*` konstansok).

### `WaitForSync()`

Várakozás a raszter-megszakításra (alapból a képernyő jobb alsó sarka). **Minden sprite-kirakás és képernyőművelet előtt hívandó.** Ha `DigiSoundOn()` aktív, helyette `WaitForDigiSoundSync()` kell.

### `SetRasterInterruptPos(LineNr: byte)` / `SetRasterInterruptPosEx(LineNr, CharNr: byte)`

A raszter-megszakítás pozíciójának beállítása egy adott sorra (`LineNr`: 0–239), az `Ex` változat pontos karakterpozícióra is (`CharNr`: 0–63). Ezzel lehet pl. osztott képernyőt (split-screen) csinálni különböző grafikus módokkal.

### `SetScreenLines(ScreenLines: byte)` / `SetVerticalSyncPos(VertSyncPos: byte)`

A megjelenített sorok száma (csak 4-gyel osztható értékek), illetve a függőleges szinkronpozíció finomhangolása (alapérték: 66, 240 soros képnél).

---

## 9. Scroll (hardveres görgetés)

Csak `DIRECT_TO_SCREEN` módban működik (a háttérképernyőt nem lehet hardveresen scrollozni).

| Eljárás | Leírás |
|---|---|
| `ScrollUp(UpdateSpritePos: boolean)` | képernyő felfelé görgetése 1 egységgel (4 pixelsor) |
| `ScrollDown(UpdateSpritePos: boolean)` | képernyő lefelé görgetése 1 egységgel |
| `Scroll(ScrollDirection: byte; UpdateSpritePos: boolean)` | görgetés a megadott 8 irány egyikébe (`SCROLL_*` konstansok) |
| `ResetScroll()` | scroll-eltolás és raszter-megszakítás pozíció alapállapotba állítása |

`UpdateSpritePos = True`: a sprite-ok pozíciója frissül, így nem mozdulnak el a scrollal együtt (pl. HUD elemek). `False`: a sprite-ok is "scrollozódnak" a háttérrel.

```pascal
GE::WaitForSync();
GE::ScrollUp(True);
Sprite.ScrollRestoreBackground();
Sprite.ScrollDraw();
Sprite.UpdateLastPos();
```

---

## 10. Grafika

| Eljárás | Paraméterek | Leírás |
|---|---|---|
| `ClearScreen(Pattern: byte)` | minta byte | Teljes képernyő törlése egy byte-mintával |
| `FillRect(X, Y, Width, Height, Pattern: byte)` | X,Y: bal-felső sarok (byte/pixel); Width: byte; Height: pixel | Kitöltött téglalap rajzolása |
| `FillRectAtPos(Position: integer; Width, Height, Pattern: byte)` | előre számolt képernyőcím | mint fent, pozícióval |
| `VBytesLine(Position: integer; Count, Pattern: byte)` | | Függőleges, 1 byte széles vonal |
| `HBytesLine(Position: integer; Count, Pattern: byte)` | | Vízszintes, byte-okból álló vonal |
| `PutByte(Position: integer; Pattern: byte)` | | Egy byte minta kirakása egy képernyőpozícióba |
| `GetMemByte(MemAddr: integer): byte` | | Egy byte beolvasása (mint BASIC `PEEK`) |
| `GetMemInt(MemAddr: integer): integer` | | Egy 2 byte-os integer beolvasása |

```pascal
// Sárga, 30 byte széles, 80 pixel magas téglalap a (20,100) pozícióban Graphics16 módban:
GE::FillRect(20, 100, 30, 80, GE::GR16_COLOR_YELLOW);
```

---

## 11. Billentyűzet és Joystick

### `GetKeyboard`

Kiolvassa a teljes billentyűzet-mátrixot (a két beépített joystickkal együtt). **A `Pressed`/`KeyPressed` előtt kötelező.**

### `Pressed(KeyCode: integer): boolean`

Egy adott billentyű (`KEY_*` konstans) lenyomva van-e.

```pascal
GE::GetKeyboard();
if (GE::Pressed(GE::KEY_SPACE)) then Fire();
```

### `KeyPressed(): boolean`

Van-e **bármelyik** gomb lenyomva.

### `GetJoysticks`

Kiolvassa a joystick-ek állapotát. Ha már hívtuk a `GetKeyboard`-ot, nem kell külön hívni.

### `Joystick(Nr, JoyCode: byte): boolean`

`Nr`: 1–2 (beépített/csatlakoztatott joystick), 3–4 (GameCard 1./2. joystick — előtte `InitGameCard()` szükséges). `JoyCode`: `JOY_LEFT/RIGHT/UP/DOWN/FIRE` (vagy `GAMECARD_JOY_*`).

```pascal
GE::GetJoysticks();
if (GE::Joystick(1, GE::JOY_LEFT))  then PlayerMoveLeft();
if (GE::Joystick(1, GE::JOY_FIRE))  then PlayerFire();
```

### `InitGameCard()`

GameCard bővítőkártya detektálása és a joystick-portok beállítása — a program elején, egyszer hívandó, ha a 3–4-es joystickokat használjuk.

---

## 12. Hang

| Eljárás | Leírás |
|---|---|
| `SoundOn()` | hangjel bekapcsolása (a `Sound()` automatikusan hívja) |
| `SoundOff()` | hangjel kikapcsolása, elnémítja az aktuális hangot |
| `Sound(Pitch: integer)` | hang lejátszása; `Pitch`: 0–4095 (4095 = néma). Frekvencia: `195312.5 / (4096 - Pitch)` Hz |
| `NoSound()` | az éppen szóló hang elnémítása |
| `Volume(SoundVolume: byte)` | hangerő, 0–15 |

```pascal
GE::Sound(3677); // A4 hang (466.16 Hz)
```

---

## 13. Digitális hang (Digi Sound)

4 bites mintavett hangeffektek lejátszása raszter/hang-megszakítás segítségével. Az `AudaCity` + `TVC digi` eszközökkel készíthető `.bin` hangminta.

| Eljárás | Leírás |
|---|---|
| `DigiSoundOn(Frequency, DigiSoundType: byte)` | inicializálás; `Frequency`: `DIGI_FREQ_2/4/8_KHZ`; `DigiSoundType`: `DIGI_TYPE_1x4BIT` / `DIGI_TYPE_2x4BIT`. Engedélyezi a hangmegszakítást, letiltja a raszter-megszakítást |
| `DigiSoundOff()` | digi hang lejátszás leállítása, visszaáll a raszter-megszakításra |
| `PlayDigiSound(SoundEffect: pointer)` | egy hangminta lejátszásának elindítása |
| `WaitForDigiSoundSync()` | `WaitForSync()` helyettesítője, ha `DigiSoundOn` aktív |
| `IsDigiSoundPlaying(): boolean` | fut-e még a lejátszás |
| `Is2x4bitDigiSoundPlaying(): boolean` | mint fent, `DIGI_TYPE_2x4BIT` típushoz |

```pascal
var ExplosionSFX : incbin("resources/ExplosionSFX.bin");
GE::DigiSoundOn(GE::DIGI_FREQ_4_KHZ, GE::DIGI_TYPE_1x4BIT);
GE::PlayDigiSound(#ExplosionSFX);
```

⚠️ `FastDraw`/`FastDrawMirror`/`ScrollFastDraw`/`ScrollFastRender` az SP regisztert használva letiltja a megszakításokat — digi hang lejátszása közben **nem ajánlott** ezeket használni.

---

## 14. Szövegkiírás

### `InitCharSet(CharSetPtr: pointer; CharSetImgWidth: integer; CharWidth, CharHeight: byte)`

A karakterkészlet beállítása — **a `WriteText` előtt kötelező.** `CharSetPtr`: a betűkép memóriacíme; `CharSetImgWidth`: a teljes karakterkép szélessége byte-ban; `CharWidth`/`CharHeight`: egy karakter mérete.

```pascal
var CharSet : incbin("resources/images/CharSet.bin");
GE::InitCharSet(#CharSet, 118, 2, 7);
```

### `WriteText(X, Y: byte; Text: ^byte)`

Szöveg kiírása a megadott pozícióba (X: 0–63, Y: 0–239). `Text`: idézőjeles szöveg vagy egy `string` változó címe (`#`). Támogatja a magyar ékezetes karaktereket is.

```pascal
var Text1 : string = ("TV-COMPUTER");
GE::WriteText(0, 100, "HELLO WORLD!");
GE::WriteText(0, 130, #Text1);
```

---

## 15. Segédfüggvények

| Függvény/Eljárás | Leírás |
|---|---|
| `In(Nr: byte): byte` | byte beolvasása egy hardver portról |
| `Out(Nr, Value: byte)` | byte kiküldése egy hardver portra |
| `Rnd(): byte` | pszeudo-véletlen byte (0–255). *Egymás után hívva közeli, növekvő értékeket ad — jobb véletlent a TRSE `random` unitja biztosít* |
| `Delay(DelayTicks: integer)` | várakozás `DelayTicks × 20,096 ms`-ig (digi hang mellett az egység 1/4 ms-ra változik) |
| `MicroDelay(Count: byte)` | rövid, finomhangolható NOP-alapú késleltetés |
| `Odd(Nr: byte): boolean` | páratlan-e a szám |
| `IntToStr(IntNum: integer): integer` | integer → string konverzió; eredmény a `GE::NumStr`-ben |
| `ByteToStr(Nr: byte)` | byte → string konverzió; eredmény a `GE::NumStr`-ben |
| `FillMem(MemAddr, Size: integer; Pattern: byte)` | memóriaterület feltöltése egy byte-mintával |
| `MemCopy(SourcePtr, DestPtr: pointer; Size: integer)` | byte-tömb másolása |
| `CopyLines(SourcePtr, DestPtr: pointer; ScreenLines: byte)` | grafikai sorok másolása (1 sor = 64 byte) |
| `ZX7Decompress(SourcePtr, DestPtr: pointer)` | ZX7-tömörített adat kicsomagolása egy memóriacímre |

```pascal
GE::IntToStr(Drill_Cash);
GE::WriteText(16, 4, #GE_NumStr);
```

---

## 16. Memóriatérkép

A `GE.tru` fejlécében dokumentált, a motor által lefoglalt memóriaterületek (decimális címek):

| Terület | Méret | Funkció |
|---|---|---|
| 255–2815 | 2560 B | sprite-háttér mentési terület (szabad, ha egyik sprite sem foglal háttérbuffert) |
| 3696–3735 | 40 B | Game Engine változók |
| 3736–3755 | 20 B | Game Engine változók 2 (eredetileg PROG_ID) |
| 5300–5803 | 504 B | verem (stack) |
| 5888–6143 | 256 B | tükrözési tábla (szabad, ha nincs `InitSpriteMirroring`) |
| 6144–6343 | 200 B | SpriteList |
| 6344–6623 | 280 B | `List` osztály objektumok |

Szabad területek: 3056–3655 (600 B, ha nincs fájlművelet), 3756–5299 (1544 B, verem alatti terület), 5804–5887 és 6624–6638 (BASIC munkaterület maradékai).

---

## Kapcsolódás a `WaterPumpGame.ras`-hoz

A jelenlegi játékkód a fenti API-ból az alábbiakat használja: `GE::SetGraphics`, `GE::SetPalette`, `GE::InitCharSet`, `GE::Init`, `GE::SetMemory`, `GE::SetRasterInterruptPos`, `Sprite.Init`, `Sprite.InitAnimation`, `Sprite.SetPosition`, `Sprite.SaveBackground`/`RestoreBackground`, `Sprite.Put`, `Sprite.Animation`, `GE::FillRect`, `GE::WriteText`, `GE::IntToStr`/`ByteToStr`, `GE::GetKeyboard`/`GetJoysticks`/`Joystick`, `GE::Pressed`, `GE::WaitForSync`.

Még kihasználatlan, de a jövőbeni fejlesztéshez releváns lehetőségek: `Render`/`RenderAllSprites` (automatikus háttérkezelés helyette a kézi `SaveBackground`/`RestoreBackground`/`Put` láncnak), `GE::List` + `CollidedWith` (csoportos ütközésvizsgálat), `Sound`/`DigiSoundOn` (hangeffektek), `ZX7Decompress` (tömörített grafikai assetek).
