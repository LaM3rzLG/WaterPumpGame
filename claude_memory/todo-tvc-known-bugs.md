---
name: todo-tvc-known-bugs
description: PARKED (2026-10-28) - TVC known-bugs skill page (SANE 82-bug triage); take it up only when we hit compiler problems; overlap analysis already done
metadata:
  node_type: memory
  type: project
  originSessionId: a8242841-819d-4ac7-b464-0263d873eaa8
  modified: 2026-10-28T20:11:40.599Z
---

2026-10-25 planned, 2026-10-28 PARKED by the user: do NOT remind at session start any more. Take it up when we have
compile / wrong-codegen problems. Target page: `.claude/skills/tvc-trse/references/language/known-bugs-tvc.md` (does not exist).

Source: `.claude/skills/tvc-trse/sources/sane-trse-docs/known-bugs.md` (82 bugs, site https://v8id-mmo.github.io/SANE/known-bugs/;
"fixed" there = SANE C64 fork, not our TRSE). The skill's operators/types/keywords pages already list SANE bugs, but from
the docs, NOT tested on TVC. Method when resumed: tiny test programs, read the Z80 output (like `references/language/builtins.md`); do not touch the game.

Overlap found 2026-10-28 (ours tested on TVC <-> SANE): Fill writes count+1 <-> FillFast +1 byte; Fill count 0 = 64K <->
MemCpy/FLD/Wait count 0 = 256; Peek reads nothing <-> Peek wrong with literal address; case..else / nested case parser error
<-> case..else desync; byte/integer mix overflow <-> signed byte + integer loses sign; sprite-array field / writetype-index
bugs <-> record/class assignment bugs (same weak area); @startblock no effect <-> @startblock missing @endblock; Call(#Proc)
asm error <-> literal address fails for builtins; CLI exit code unreliable (our builds check output files - correct).
Only ours: integer-array write via 16-bit index var, MemCpyFast broken on Z80, Nop(n) = 2n nops, old-exe crash, nightly `//` in asm.

Worth testing when resumed (~6 tiny programs): byte compare vs literal 0; for loop with end < start; `not` on integer;
`xor` of two conditions; `return` in interrupt; signed compare/multiply (only if signed is ever used). Rest = C64-only.

Compiler versions: Mac `/Applications/trse.app` build 2026-10-18; Windows `C:\TVC\TRSE_Nightly` (zip after 2026-10-15, exact
date not recorded). Same game output on both. A bug seen on the Mac is almost surely on Windows too; a bug NOT seen on the
Mac should be confirmed on Windows (or put both machines on the same nightly).

**Why:** the user wants it only when compile problems actually show up.
**How to apply:** no session-start reminder; when a codegen/compile oddity appears, check this list first, then resume the triage.
