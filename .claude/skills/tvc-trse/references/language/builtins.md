# TRSE builtin functions on TVC (Z80)

Source of the list: TRSE's own `resources/text/syntax.txt` (vanilla `leuat/TRSE`, same in the
C64 fork `v8id-mmo/SANE`). Each builtin there names the CPUs / machines it exists for. TVC is
not named anywhere; it gets everything tagged **`Z80`** or **`ALL`**. Everything else in the SANE
builtin pages (`docs/reference/builtins/`, 140 pages under `sources/sane-trse-docs/`) is 6502 /
C64 only - do not use it on TVC (e.g. `initrandom`, `Random`, `MemCpyUnroll`, `FillFast`,
`WaitForRaster`, `printdecimal`, `moveto`, sprite/VIC/SID helpers).

**Verified 2026-10-25:** every builtin below was compiled for TVC with the local `trse.exe`
(`LG_TVC_Projects.trse`) and the generated Z80 code was read. Four of them generate WRONG code -
marked BROKEN. The SANE pages describe the 6502 code; parameter lists differ on Z80.

| Builtin | Z80 syntax | Generated code / notes |
|---|---|---|
| `Fill` | `Fill(#addr, value, count)` | `ld (hl),a` + `ldir` with BC = count -> **writes count+1 bytes** (one past the end). `count = 0` -> 65 536 bytes. Pass `count-1`, or write the fill in asm. |
| `MemCpy` | `MemCpy(#from, #to, count)` - **3 parameters**, count is `integer` | HL = from, DE = to, BC = count, `call z80_copy_mem` (unrolled `ldi`). Correct. The 6502 version has 4 parameters (`src, offset, dst, byte count`) - do not copy C64 examples. |
| `MemCpyCont` | `MemCpyCont(count)` | Z80-only: copies `count` more bytes, continuing from the HL/DE left by the previous `MemCpy`. Compiles; behaviour not run-tested. |
| `MemCpyFast` | (6502 form `a,b,a,b`) | **BROKEN on Z80:** `MemCpyFast(#a, 0, #b, 8)` gives `ld de,$0` / `ld hl,a` / `ld hl,b` / `call z80_copy_mem` with BC not set - copies a random number of bytes to address `$0000`. Never use; use `MemCpy`. |
| `Poke` | `Poke(#addr, offset, value)` | `ld hl,addr` + offset, `ld (hl),a`. Correct. |
| `Peek` | `x := Peek(#addr, offset)` | **BROKEN on Z80:** emits NO memory read - `x` gets whatever is in register A (test: `buf[3]:=42; c:=7; b:=Peek(#buf,3)` gave 7). Use array indexing `buf[i]` or a `^byte` pointer instead. |
| `Inc` / `Dec` | `Inc(x)` / `Dec(x)` | `add a,1` / `sub 1` on the variable. Correct. |
| `Lo` / `Hi` | `b := Lo(i)` / `b := Hi(i)` | Reads the low / high byte of the integer variable directly. Correct. |
| `mod` | `r := mod(a, b)` (integer, byte) | Calls the software routine `_Mod_16` (a division loop - slow; avoid in hot loops, use masks/shifts for powers of 2). Exists on Z80, so `a-(a/b)*b` is not needed. |
| `Abs` | `b := Abs(b)` | `or a` / `jp p` / `neg` - treats the byte as signed. |
| `Nop` | `Nop(n)` | **Emits 2·n `nop`s** (`Nop(1)` = 2, `Nop(3)` = 6, `Nop(4)` = 8). Mind it in cycle-exact code. |
| `Wait` | `Wait(n)` | `ld a,n` / `sub 1` / `jr nz` - a short busy loop (about 19 T-states per step). |
| `Push` / `Pop` | `Push(); ... Pop();` | Pushes / pops AF, BC, DE, HL (in that order / reversed). |
| `Call` | `Call(ptrVar)` or `Call(constAddr)` | Pointer: `ld hl,[ptr]` / `jp [hl]` through a local `call`. `const x : address = $1A00; Call(x)` -> `call $1a00`. **`Call(#Proc)` fails to assemble** (`Symbol '$Proc' undefined`) - put `#Proc` into a pointer first (`p := #Proc; Call(p);`). |
| `Loop` | `Loop();` | Endless `jr` to itself. |
| `ReturnValue` | `ReturnValue(x);` | Function result (in A for byte). |
| `addbreakpoint`, `disassemble` | | Debugger helpers (ALL). |

Commented out in `syntax.txt` (not available): `ToggleBit`, `GetBit` (Z80), `ProcedureToPointer`.

Keywords (`r;` entries) are all `ALL` - every keyword in `keywords.md` exists on TVC. The
platform constants in `syntax.txt` (`c;` entries: `VRAM`, `PAD_*`, `SCROLLX`...) belong to other
machines (Game Boy, Spectrum, MSX, Coleco...) - none for TVC; use the `TVC::`/`GE::` unit
constants.
