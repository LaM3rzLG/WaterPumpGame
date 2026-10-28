---
name: watergame-working-style
description: How the user works on the WaterPumpGame (TVC/TRSE) project — iteration style and expectations
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 048c5f87-4323-40c7-a726-f8e9958caafe
  modified: 2026-09-11T23:39:01.969Z
---

A WaterPumpGame (TVC / TRSE, `c:\TVC\TRSE_Projects\WaterPumpGame`) fejlesztésén a felhasználó:

- **Nagyon gyors, apró lépésekben iterál** — egy-egy üzenet = egy konkrét kis feladat vagy bugjelentés. Ne akarj több lépést előre menni; csináld meg a kértet, és állj meg.
- **Menet közben maga is szerkeszti a `.ras` fájlt** két forduló között (főleg a hangolható konstansokat: `Pumpa_price`, `Termel_Utem`, `MAX_ENEMY`, `Enemy_*_Utem`, `Keret_Mozog_Utem`). Mindig a lemezen lévő aktuális állapot az igazság, ne a korábbi context.
- **A számértékek hangolása az ő dolga** — ne pin-eld őket a doksiba fix értékként, csak nagyságrendként. Új tunable kérésnél mindig külön `..._Utem` változót adj (a beégetett küszöb rossz mintának bizonyult).
- **Tömör választ kér.** Kód-diff + 2-3 mondat indoklás + "build után figyeld: X". Ne magyarázz túl.
- **Verziókat gyakran mentet**: "mentsd el X.Y-ként" → `WaterPumpX.Y.ras` a projekt gyökerében (másolat), és a CLAUDE.md verziótörténetébe egy bejegyzés.
- **A CLAUDE.md-t minden érdemi változás után frissíteni kell** — ez a project-memória, új session ebből indul.
- Build hibát általában tőle kapunk vissza (a SANE-TRSE VS Code extension adja sor+üzenet formában a build-task hibáját). A TRSE-nek VAN CLI/headless módja is (`trse.exe -cli op=project ...`, megerősítve 2026-09-12) — egy önálló `.tru` unit gyorsan ellenőrizhető vele, de a TELJES projekt whole-program-optimalizálása (pl. csak-asm-ből-hivatkozott `const` kiszedése) csak a project-szintű build/assemble lépésben derül ki, nem az önálló unit-fordításnál — ld. [trse-writetype-index-workaround](trse-writetype-index-workaround.md) kapcsolódó csapdák.

**Why:** enélkül könnyű túltervezni vagy elavult értékekkel dolgozni.
**How to apply:** egy feladat egyszerre, tömören, a lemez az igazság, CLAUDE.md + verziómentés a végén ha kéri.
