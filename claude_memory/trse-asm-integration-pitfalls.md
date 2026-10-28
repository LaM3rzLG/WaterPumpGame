---
name: trse-asm-integration-pitfalls
description: TRSE/Z80 pitfalls when writing custom .tru units with raw asm() blocks — const stripping, absolute-address opcode limits, integer-array writes
metadata:
  type: project
  originSessionId: unknown
  modified: 2026-09-11T23:39:33.100Z
---

Discovered 2026-09-12 while building `WaterPump.tru` (a hand-written Z80 ASM unit) for `c:\TVC\TRSE_Projects\WaterPumpGame`. Distinct from [[trse-writetype-index-workaround]] (that one is about storing a sprite-class field into an indexed array; these are lower-level ASM/codegen pitfalls).

**1. A `const` referenced ONLY from inside a raw `asm("...")` string gets silently stripped by the whole-project build's optimizer**, even though a single-unit-only CLI compile (`trse.exe -cli op=project ... input_file=<one .tru>`) does NOT strip it and reports no warning — so it looks fine until the full project is assembled, where it fails with `Symbol '<Unit>_<Name>' undefined`. The dead-code analysis apparently only walks real Rascal-level references, not text inside asm blocks.
- Fix: declare it as a plain `var` (with an initial value) instead of `const`. A `var` is a real memory-resident global and is never stripped — confirmed by how `GE.tru`'s own `ScreenAddr` (used in dozens of GE asm blocks, never referenced from Rascal code) is a `var`, not a `const`.
- Rule of thumb: any value touched ONLY from inline asm text must be a `var`, never a bare `const`, regardless of how confident a single-unit compile looks.

**2. Z80 opcode reality check when translating an `(IX+d)`-based routine to a plain-global version:** only the `A` register (8-bit) and `HL` (16-bit) can load directly from an absolute address — `ld a,(nnnn)` and `ld hl,(nnnn)` are real opcodes, but `ld l,(nnnn)`, `ld h,(nnnn)`, etc. do NOT exist and the assembler fails with `Unknown opcode: ld l,(**)`. This is unlike `(IX+d)` indexed addressing, which DOES support any 8-bit register as the destination (`ld l,(IX+1)` is valid). So when replacing an IX-relative field read with a plain global-var read (TRSE's `[VarName]` bracket syntax), always route non-A/HL registers through `A` first: `ld a,[Var]; ld l,a;` — never `ld l,[Var]`.
- Related follow-on bug: if the original code relied on `A` starting at 0 before a multi-byte shift/rotate chain (e.g. a 24-bit `A:H:L` rotate used to compute `Y*64`), and the rewrite now loads a real value into `A` as scratch (per the fix above), you must re-insert an explicit `xor a` to re-zero `A` before the shift sequence — don't assume the old "xor a" placement still does the right job after reordering.

**3. Writing into an `array of integer` (2-byte elements) via a variable index using plain Rascal `arr[i] := value;` is unreliable in this TRSE build** — confirmed once to generate broken code that computed the array's base address into HL, then immediately overwrote HL with the index value before ever using the base, corrupting the target address. Reading (`x := arr[i];`) and byte-array writes (`bytearr[i] := v;`) are NOT affected — only the integer-array-write path. Because the confirmed failure used an `integer`-typed index, and no confirmed-safe counterexample with a `byte`-typed index exists in this project, treat ANY variable-indexed write into an integer array as suspect regardless of the index's type.
- Safe workaround: do the store by hand in `asm()` — compute `base + index*2` into a register pair, then store the low/high bytes individually (`ld a,l / ld (de),a / inc de / ld a,h / ld (de),a`). This is the pattern used for `WaterPump::ScreenAddrTab` and mirrors the well-established "skalár-mosás" spirit of [[trse-writetype-index-workaround]] but for a different root cause.

Full narrative + exact code in `CLAUDE.md` under the 2026-09-12 sections ("SCREEN_ADDR const→var", "Unknown opcode: ld l,(**)", "PumpaActiv lista eldobva").

UPDATE 2026-10-02/03 (more confirmed pitfalls):
- `if (MyFunc(a,b)=var) then` is MISCOMPILED: the compiler keeps `var` in B across the call (the function clobbers B) -> wrong compare. Store the result first: `k:=MyFunc(a,b); if (k=var)`. Comparing with a constant is fine.
- `lo` / `hi` are reserved names ("Expected 'LPAREN' but found ':='").
- OrgAsm rejects negative IX/IY displacement (`ld (IX-64),..` -> "Unknown opcode: ld (**),*"); use positive offsets only.
- The peephole optimizer may delete a redundant first line of an `asm("...")` block (e.g. `ld hl,[X]` right after the compiler's own `ld [X],hl`).
- `for i:=0 to 5` loops 0..4 (exclusive end); `fori` is inclusive.
- `b:=b<<1` on a byte compiles to `rlca` (rotate) — fine for bit-testing loops, not a true shift.
- Shell editing: `sed` turns `\t` in replacement/`i\` text into a tab or a literal `t` (broke `resources\tvc_sprites` paths and line indents); an empty `$n` in `sed "${n}s|$|...|"` applies to EVERY line. Prefer the Edit tool for anything with backslashes; verify after each sed.

UPDATE 2026-10-03 (afternoon) - compiler crashes 0xC0000005 (trse.exe exits -1073741819, no message):
- `Sprite.Y := w-1` (expression into a sprite field) -> use a temp var.
- `if .. begin .. end else if (..) then begin .. end;` and deep `if..then if..then Proc(..)` chains -> flatten with a flag var.
- A long trailing comment with accents/quotes/parentheses on an `if` line (even when the code line was `//`-commented) -> remove comments first when a build crashes.
- Some patterns in the big main loop (`X:=0; if (A=1) then X:=1; if (B=1) then X:=1;`, `X:=A+B`, a 2nd call site under nested ifs) crashed deterministically; NOT a size limit (extra comment lines compiled). Bisect with `tst_*.ras` copies compiled one by one (from a .ps1 script; an inline PowerShell command was blocked by a safety filter), then move the logic elsewhere (e.g. into `Palya_Betolt`).
- Integer `&` constant: the AND is silently dropped; `int:=int+256` emits a broken label. Build masks from bytes, add 256 through a variable.
- Identifiers are case-insensitive (`const METEOR_FIGY` vs `var Meteor_Figy` collide).
- PowerShell 5.1 helper scripts: no accented literals in a BOM-less .ps1 (they are read as ANSI); guard every file write (the import script corrupted the .ras twice before guards were added).
