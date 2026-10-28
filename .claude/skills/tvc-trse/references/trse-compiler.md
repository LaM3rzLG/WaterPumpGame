# TRSE compiler: versions, crashes, build facts (TVC)

Load when the build crashes (0xC0000005 / exit -1073741819), when choosing or switching the trse.exe,
or before reading generated code for size. Verified on WaterPumpGame, 2026-10-22..25.

## Which trse.exe

- **Old build (2024-03-16, `C:\TVC\TRSE`)**: has the Windows post-optimiser crash below.
- **Nightly (from 2026-10-15 on, here `C:\TVC\TRSE_Nightly`, zip `github.com/leuat/TRSE/releases/tag/nightly`
  -> `trse_win.zip`)**: crash fixed; same Z80 code bytes as the old exe for WaterPumpGame; writes a CORRECT
  `.cas` header block count (old exe wrote it 164 bytes short; `make_dsk.ps1` patches it either way).
- Setting up the nightly: never unzip it straight into the folder of the old install (the zip has one `trse`
  folder = the old `TRSE` folder on Windows). Copy over your own `units\TVC` (custom `GE.tru`!),
  `tutorials\TVC`, `project_templates\tvc_image`; keep the stock ones as `*_gyari`.
- **Nightly pitfall:** its OrgAsm does not strip `// comments` inside `asm("...")`: a comment like
  `// A := 0` or `// HL = x` becomes a constant definition -> "OrgAsm error: constant '' already defined"
  (the error shows the asm line number). The stock `TVC.tru` has 440 such lines - replace `//` with `;`
  inside its asm blocks. Use `;` comments in your own asm.
- VS Code SANE-TRSE: the compiler is `sane-trse.compilerPath` (user settings.json); a per-project
  override goes into `.vscode\settings.json`. Running from the extension quick-loads the `.cas`: there is
  NO file device then, every file open fails - test file loading from the `.dsk` / real machine.
- TRSE source: `github.com/leuat/TRSE` (clone at `C:\TVC\TRSE_Projects\TRSE-source`). Useful places:
  `source/Compiler/optimiser/postoptimizerz80.cpp`, `source/OrgAsm/orgasm.cpp` (assembler),
  `source/Compiler/codegen/`, `resources/text/syntax.txt` (which builtin exists on which CPU).

## The 0xC0000005 crash of the old exe (root cause found 2026-10-25)

- Symptom: trse.exe dies with no message (exit -1073741819, `Qt6Core.dll` offset 0x13ab3f in the Windows
  event log), before the `.asm` is written. Tiny unrelated edits trigger or cure it: +1 asm line crashed,
  +10 compiled, +40 crashed; removing a line elsewhere (even in a `.tru` unit) cured it.
- Cause: the Z80 post-optimiser keeps a raw pointer `prevLine` to the previous `SourceLine` while
  appending to a `QVector`; when the vector reallocates, the pointer dangles and the next `ld` line reads
  freed memory (Windows only). Fixed upstream in commit 097adbb2 (2026-10-15).
- **Older notes that blamed a specific pattern were almost certainly this bug** (an `if..then
  GE::SetBorder(..) else GE::SetBorder(..)`, `case..else`, "one more statement in a long procedure",
  "asm block at the start of a procedure", "global boolean across procedures", long accented comments).
  Rewriting the "bad" pattern only helped because it moved the code layout.
- Workaround with the old exe: add or remove 1..N asm COMMENT lines (`; kitolto`) in any asm block until
  it compiles - same effect as code lines, zero bytes. Two instructions on one line (`a : b`) is not
  accepted by OrgAsm ("Unknown opcode"). The project post-optimiser flags in the `.trse` do not control
  this pass (it is the global `post_optimize` setting).
- Bisect method: work on `tst_*.ras` copies; compare exit codes; never debug the "pattern" first.

## Code-size facts

- `case x of` = the same compare chain as separate `if`s (reloads `x` per branch) + a 3-byte `jp caseend`
  per branch: bigger, not faster (5 chains = +50 bytes). Keep `if` chains when space is tight.
- A nested `case` inside a `case` branch, and `case .. else begin .. end;`, gave "After declarations,
  BEGIN is expected" at the procedure end (parser problem, separate from the crash).
- `djnz` / `jr` reach -128..+127 bytes: a long asm loop body gives "Branch out of range"; move part of the
  body into a `call`ed sub-label inside the same asm block (`jp` over it to the end label).

## Writing a file after `GE::Init`

`GE::EnableTVCITHandler`, paging `$70` (also store it in `($3)`), `TVC::CreateFile` / `BlockWrite` /
`CloseFile`, then `GE::DisableTVCITHandler` + `GE::SetMemory(...)`; the source buffer must be visible
under `$70` (U0/U1/U2). For READING files see `cookbook/multifile-loader-design.md` (do not use the TVC
unit's read calls on a real machine).
