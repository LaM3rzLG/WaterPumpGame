---
name: trse-writetype-index-workaround
description: TRSE compiler cannot store a class-field value into an indexed array element; launder it through a plain scalar/const first
metadata: 
  node_type: memory
  type: project
  originSessionId: f20b35d7-4c94-438f-9252-a3238d086e23
  modified: 2026-09-07T17:51:27.819Z
---

**TRSE (SANE-TRSE, `trse.exe`) codegen limit — discovered 2026-09-08 in the WaterPumpGame pump-pool rewrite.**

`arr[i] := <GE::Sprite field>` does NOT compile — fatal `Storing writetype index not supported yet`.
This hits ANY sprite field on the RHS of an INDEXED store: pointer fields (`Pumpa.AnimSet`, `.Data`) AND
integer fields (`Pumpa.Position`, `.Size`), whether by plain assign or inside an expression
(`arr[i] := arr[i] + Pumpa.Size` also fails). The same error also killed `array[N] of GE::Sprite` +
`Pumpak[i].Data := ...`.

**Workaround — "skalár-mosás": copy the field into a plain scalar/const first, then use that.**
- `Pumpa_Faz0_Cim : integer;` … `Pumpa_Faz0_Cim := Pumpa.AnimSet;` (once) → `arr[i] := Pumpa_Faz0_Cim;` ✓
- `poz : integer;` (local) … `poz := Pumpa.Position;` → `Pumpa_Pos[i] := poz;` ✓
- `const PUMPA_FAZIS_MERET : byte = 16;` → `arr[i] := arr[i] + PUMPA_FAZIS_MERET;` ✓ (instead of `+ Pumpa.Size`)

**What still works (no laundering needed):**
- SCALAR lvalue with sprite field on either side: `Pumpa.Data := arr[i];`, `Pumpa_Faz0_Cim := Pumpa.AnimSet;`
- Indexed store of a byte array: `Pumpa_Aktiv[i] := 1;`
- Method call on an array element: `Pumpak[i].Init(...)`, `Pumpak[i].Animation()` (this was the escape hatch for the `array of GE::Sprite` attempt — the GE `Animation()` writes `this.Data` from ASM).

Full rule + examples also in [[CLAUDE.md]] "TRSE nyelvi tanulságok". Apply this proactively whenever
writing sprite state into parallel arrays (SoA pump/enemy pools).
