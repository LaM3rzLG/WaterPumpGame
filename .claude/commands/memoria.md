---
description: Memóriatérkép frissítése a legutóbbi fordításból és megnyitása (mindkét nézet)
---
Futtasd a projekt gyökerében: `powershell -NoProfile -File resources\memoria_terkep.ps1` (ez írja a közös
`tools\memoria_adat.js`-t), utána nyisd meg MINDKÉT nézetet (`Start-Process`): `tools\memoria_terkep.html` (lapos nézet)
és `tools\memory_map_c64.html` (részletes, a C64-es minta szerint). NE fordíts újra, hacsak a felhasználó nem kéri.
Válaszban egy-két sor: a kód vége, a szabad hely `$8000`-ig, és ha a szkript átfedést / túlcsordulást jelzett, az melyik rész.
