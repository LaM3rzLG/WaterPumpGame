# SANE Docs — Structure & Template Notes (for modeling a TVC/TRSE skill)

Source: `/home/dey/SANE/docs` — a MkDocs site (`mkdocs.yml` in `/home/dey/SANE/`)
documenting SANE (a C64-only TRSE fork) and, by its own stated intent,
vanilla TRSE's generic Pascal-like language as well.

## 1. Information architecture

Top-level pages (all flat, at `docs/`):
- `index.md` — landing page, explains SANE vs TRSE relationship, links out.
- `getting-started.md` — CLI compile workflow (project file + settings file
  + `input_file=`), links to `project-files.md` for detail.
- `goals.md` — project philosophy/roadmap, not technical reference.
- `project-files.md` — full reference for `.trse` project file and `.ini`
  settings file keys, plus command-line flags.
- `platform-notes.md` — prose essays on hardware subsystems (banking, VIC
  bank switching, raster IRQs, compression mechanisms, zero-page
  allocation, file-role glossary), cross-linking into `reference/`.
- `known-bugs.md` (1500 lines) — every confirmed compiler defect, grouped
  under `##` category headings (Signed arithmetic, Procedures & functions,
  Builtin auto-init, Loops, Preprocessor directives, Compression,
  Image/asset directives, Object model, Types, Branch optimization, Inline
  assembler, Bitwise operators, Logical operators, Builtins…), each bug a
  `###` subsection with vanilla-TRSE behavior, root cause, and (if fixed)
  a SANE fix note. Mostly a superset of what's echoed in each page's own
  "Known limitations" section.
- `tags.md` — defines the compatibility-tag system (see §5).
- `google...html` — search-engine verification file, ignore.

`reference/` — the language reference proper, one subfolder per category,
each with its own `index.md` acting as an alphabetized table-of-contents
with one-line descriptions linking to individual pages:
- `reference/keywords/` (51 pages) — statement/control-flow/declaration
  keywords (`for`, `if`, `procedure`, `interrupt`, `record`-adjacent
  keywords, etc.)
- `reference/operators/` (19 pages) — comparison, arithmetic, bitwise,
  logical, assignment operators. Called out as its own category (split out
  of keywords) specifically because signed-arithmetic bugs cluster here.
- `reference/types/` (17 pages) — base types (`byte`, `integer`, `long`,
  `array`, `record`, `class`, `string`, `pointer`, `address`, etc.) plus
  parameter-modifier pseudo-types (`pure`, `pure_number`, `pure_variable`).
- `reference/directives/` (~60 pages) — `@`-prefixed build-time
  instructions (conditionals, file/asset import-export, project-setting
  overrides, macros). Explicitly distinguished from keywords: directives
  control the *build*, not runtime behavior.
- `reference/builtins/` (140 pages) — one page per builtin function/array.
- `reference/errors/` — not per-error pages; 5 grouped pages by category
  (syntax/types/variables, procedures/expressions/control-flow, builtin
  function parameters, files/assets, assembler/internal errors), each
  presumably a flat list of message → cause → fix entries.
- `reference/constants.md` — a single page (not a folder), constants
  grouped into markdown tables by category (colors, keyboard, joystick,
  VIC-II/sprite/SID registers, 6502 registers) rather than one page each.

`examples/` — flat folder, ~17 "cookbook" style worked programs (not one
feature in isolation), each downloadable as a `.ras` file, indexed in
`examples/index.md` with one-line descriptions.

Every runnable example (in `reference/*` pages and in `examples/`) links a
downloadable `.ras` source file plus reuses one shared, generic
`project.trse`/`trse.ini` bundle (documented in `getting-started.md`) — the
compile command is identical for every example, only `input_file=` changes.

## 2. Per-page template pattern

### Keyword / operator / type / builtin pages — near-identical structure

Observed fixed skeleton, present (with minor optional sections) across
every page in `keywords/`, `operators/`, `types/`, `builtins/`:

1. `# <Name>` — page title.
2. Compatibility badge line, immediately under the title, format:
   `:material-tag: [**<TAG>**](../../tags.md): <one-sentence explanation>`
3. Prose description (1 short paragraph): what it does, in plain terms.
4. `## Syntax` — indented code block showing the exact call/declaration
   shape (not fenced as pascal, just indented monospace).
5. `## Parameters` — bullet list, `` `<name>` ``: description, valid
   ranges/types.
6. `## Returns` — (builtins/operators only) what comes back and its width.
7. `## Example` — a complete, compilable ` ```pascal ` program (full
   `program ... begin ... end.` structure, not a snippet), followed by a
   `[:material-download: Download this example](...)  { .md-button
   download }` link to the matching `.ras` file.
8. `## Known limitations` — optional, present only when relevant. Bulleted;
   bold lead sentence stating the vanilla-TRSE behavior/bug, then detail.
   If SANE fixed it, closes with a `:material-check-decagram:
   **[Fixed in SANE](../../tags.md#known-limitation-status-fixed-in-sane)**:`
   paragraph describing what SANE does differently — the original bug
   description is never deleted, only appended to.

Concrete example 1 (`reference/operators/division.md`):
```
# `/` (Division)

:material-tag: [**TRSE (modified in SANE)**](../../tags.md): vanilla TRSE
never implemented signed division at all...

Divides the left-hand value by the right-hand value...

## Syntax
    <a> / <b>

## Parameters
- `<a>`, `<b>`: `byte` or `integer` values...

## Returns
The integer quotient...

## Example
```pascal
program DivisionDemo; ...
```
[:material-download: Download this example](...)

## Known limitations
- **`long` (24-bit) division isn't supported at all**...
- **In vanilla TRSE, signed division isn't implemented at all.** ...
  :material-check-decagram: **[Fixed in SANE](...)**: ...
```

Concrete example 2 (`reference/keywords/interrupt.md`) — a page with NO
Known Limitations section (nothing to report), showing the section is
truly optional:
```
# `interrupt`

:material-tag: [**TRSE**](../../tags.md): same behavior as vanilla TRSE.

Declares a procedure as an interrupt handler instead of an ordinary
procedure...

## Syntax
    interrupt <name>();
    begin
      ...
    end;

## Parameters
None beyond the procedure's own declaration.

## Example
```pascal
program InterruptDemo; ...
```
[:material-download: Download this example](...)
```
(No "Known limitations" — page just ends after the example.)

Index pages (`reference/<category>/index.md`) are a short intro paragraph
+ a flat alphabetized bullet list, one line per page: `` [`Name`](file.md):
one-sentence description. `` — this is the pattern to replicate for a TVC
reference index.

### Directive pages — same skeleton, no "Returns" section (directives
don't produce a runtime value); see `@define` and `@use` above. `@use`
shows the pattern extends naturally to include prerequisite-file notes
("also needs `mathhelper.tru`...").

### Errors pages — different template entirely: not one page per error,
but grouped category pages (5 total) each presumably listing message →
cause → fix triples. `errors/index.md` explains the grouping rationale and
calls out an "internal errors" subset (compiler-bug indicators, phrased
"should not happen") worth flagging separately for a TVC equivalent.

### Examples ("cookbook") pages — different, richer template:
1. `# <Title>` (task-oriented, e.g. "Waiting for a keypress")
2. Short framing paragraph.
3. `## What this uses` — bullet list of links to the specific
   builtins/keywords the example demonstrates, each with a clause
   explaining its role in *this* example.
4. Full `` ```pascal `` program + download link (same convention as
   reference pages, but under `../assets/examples/cookbook/`).
5. `## How it works` — a walkthrough paragraph or two explaining the
   program's logic/control-flow, not just restating the code.

## 3. Compatibility-tagging convention (`tags.md`)

Every reference page (keywords/operators/types/builtins) carries exactly
one page-level badge, directly under the `#` title, answering: *does
SANE's compiler currently produce different behavior for this than
vanilla TRSE?*

Three possible values:
- **`TRSE`** — inherited unchanged from vanilla TRSE; SANE behaves
  identically (even if a known bug exists — documenting a bug is not the
  same as fixing it). This is the default and covers most pages.
- **`TRSE (modified in SANE)`** — inherited from vanilla TRSE, but SANE's
  compiler has actually been changed to behave differently (usually a bug
  fix).
- **`SANE`** — does not exist in vanilla TRSE at all; wholly new to the
  fork.

Decision procedure: (1) does it exist in vanilla TRSE? No → `SANE`. Yes →
(2) does SANE's actual codegen differ from an unmodified `leuat/TRSE`
checkout? No → `TRSE`. Yes → `TRSE (modified in SANE)`.

A second, finer-grained, independent marker — **`Fixed in SANE`** — tags
one specific bullet inside a page's "Known limitations" section (not the
whole page): this exact limitation used to be true in both compilers and
SANE has since fixed it. The original bug description is *never deleted*
when fixed, only appended to with the fix note — the bullet is the only
record a vanilla-TRSE reader has that the bug exists at all. A page can
carry `TRSE (modified in SANE)` from one fixed bullet while other bullets
on the same page remain untagged (open in both compilers).

**Relevance for a TVC skill:** pages/bullets tagged `SANE` are
by definition not part of vanilla TRSE and should be excluded entirely.
Pages/bullets tagged `TRSE (modified in SANE)` describe a **SANE-only
fix** — a TVC skill grounded in vanilla TRSE should document the
*original* (unfixed) vanilla-TRSE behavior/bug, not silently inherit
SANE's fix, since real TRSE-for-TVC won't have it. Plain `TRSE`-tagged
content (the majority) is safe to treat as accurate, unmodified vanilla
TRSE behavior and is the most directly reusable tier.

## 4. Platform-agnostic (TVC-reusable) vs C64-specific content

### Fully generic — reusable near-verbatim as language reference
- **All of `reference/keywords/`** (51 pages): control flow, declarations,
  loop modifiers, procedure/function mechanics (`for`, `if`, `case`,
  `while`, `repeat`, `procedure`, `function`, `interrupt`, `record`-related
  keywords, `unroll`, `const`, `var`, `type`, `global`, `inline`, `stack`,
  etc.) are pure TRSE language, not C64-hardware-tied. A couple
  (`compressed`, `krillsloader`) are build/loader-mechanism keywords tied
  to C64-specific compression/loader schemes and would need TVC
  equivalents or omission.
- **All of `reference/operators/`** (19 pages): arithmetic, comparison,
  bitwise, logical, assignment — pure language semantics, including the
  documented signed-arithmetic bug cluster (a compiler-frontend issue, not
  C64-specific, though whether it reproduces on the TVC/Z80 target of
  vanilla TRSE would need separate verification since codegen is
  per-target).
- **Nearly all of `reference/types/`** (17 pages): `byte`, `integer`,
  `long`, `array`, `record`, `class`, `string`, `pointer`, `address`,
  `boolean`, `pure`/`pure_number`/`pure_variable` — generic type system.
  Exceptions: `cstring` is explicitly "text pre-converted to **C64 screen
  codes**" — TVC would need its own equivalent (different character
  encoding); `incsid`/`incbin` are asset-embedding types where `incsid`
  is C64-SID-specific (TVC has no SID) but `incbin` (raw binary embed) is
  generic.
- **Most of `reference/directives/`** (~60 pages): compile-time
  conditionals (`@ifdef`/`@ifndef`/`@if`/`@define`/`@endif`), file
  operations (`@include`, `@use`, `@copyfile`, `@deletefile`), error/
  warning directives (`@error`, `@raiseerror`, `@raisewarning`,
  `@requirefile`), macros (`@macro`/`@endmacro`), and generic build
  controls (`@startblock`/`@endblock`, `@userdata`, `@donotprefix*`,
  `@donotremove`, `@setvalue`, `@projectsettings`) are target-agnostic
  preprocessor/build mechanics. Exceptions: the whole family of
  image/asset export directives (`@export*`, `@vbmexport*`,
  `@spritecompiler`, `@spritepacker`, `@pbmexport`, `@importchar`,
  `@perlinnoise`, `@setcompressionweights`) target C64 `.flf` image assets
  and VIC-II-oriented graphics formats — these need TVC-specific
  equivalents (TVC has entirely different graphics/palette hardware) or
  should be dropped/rewritten. `@addcpmheader`, `@sparklefile`,
  `@addemulatorparam`, `@addmonitorcommand` are VICE/C64-disk-tooling
  specific.
- **The general shape of `reference/errors/`** (parser/type/variable
  errors, procedure/expression/control-flow errors) is generic; the
  builtin-function-parameter and files/assets error categories would need
  re-authoring against TVC's actual builtin set.

### C64-hardware-specific — NOT applicable to TVC as-is
- **`reference/constants.md`** — confirmed entirely C64-specific: the
  color table (16 VIC-II palette values), keyboard/joystick codes, and
  especially the VIC-II/sprite/SID register-address constants
  (`SCREEN_BG_COL`, `SPRITE_POS`, `SID`, etc.) are C64 memory-map
  addresses with no TVC equivalent. TVC has different video/sound
  hardware entirely (no VIC-II, no SID), so this page would need a
  ground-up TVC rewrite, not adaptation.
- **Large swaths of `reference/builtins/`** (140 pages) are C64-hardware
  wrappers: anything touching VIC-II registers/modes (`SetBank`,
  `SetBitmapMode`, `SetCharsetLocation`, `SetScreenLocation`,
  `SetMultiColorMode`, `SetRegularColorMode`, `ScreenOff`/`ScreenOn`,
  `ScrollX`/`ScrollY`, `hideborderx`/`hidebordery`), sprites
  (`SetSpriteLoc`, `SpritePos`), SID/sound (`PlaySound`, `SetFrequency`,
  `ClearSound`, `InitSid`, BCD helpers used for score display alongside
  it), raster IRQ mechanics tied to VIC-II raster registers (`RasterIRQ`,
  `RasterIRQWedge`, `EnableRasterIRQ`, `WaitForRaster`, `Jammer`, `FLD`),
  CIA/memory-banking (`SetMemoryConfig`, `EnableAllRam`,
  `DisableCIAInterrupts`), joystick/keyboard scanning tied to the C64
  matrix (`getKey`, `Joystick`, `ReadJoy1`/`ReadJoy2`, `initjoystick`),
  and screen-memory text routines assuming the C64's 1000-byte/40x25
  layout (`MoveTo`, `PrintString`, `PrintNumber`, `ClearScreen`,
  `DrawTextBox`, `Tile`, `CopyFullScreen`/`CopyHalfScreen`,
  `TransformColors`) are all non-portable as implementations, though many
  have generic TVC counterparts in *concept* (a TVC skill would need its
  own analogous builtin set, sourced from TVC's own TRSE standard-library
  unit, not copied from these pages).
- **Genuinely platform-neutral builtins** (pure math/memory/string
  utilities with no hardware register access): `Abs`, `Min`, `Max`, `Sqrt`,
  `Inc`/`Dec`/`IncRange`/`DecRange`, `Swap`, `mod`/`mod16`, `MemCpy`/
  `MemCpyFast`/`MemCpyUnroll`/`MemCpyUnrollReverse`/`BlockMemCpy`, `Fill`/
  `FillFast`, `Peek`/`Poke` (generic address read/write, though the
  addresses used with them are of course platform-specific), `StrCmp`/
  `StrSplit`/`StrGetFromIndex`/`StrToLower`/`StrToUpper`, `GetBit`/
  `ToggleBit`, `Lo`/`Hi`/`bankbyte`/`CreateInteger`/`CreatePointer`/
  `int2ptr`/`ToPointer`, `IsOverlapping`/`IsOverlappingWH`, `Nop`, `Call`,
  `AddBreakpoint`/`disassemble` (debugger-dependent but not C64-specific
  per se — VICE-specific in practice), `Sqrt`'s helper inits, `Rand`/
  `Random` (concept generic, but this specific implementation reads the
  **SID chip's noise register** — TVC has no SID, so the *algorithm* would
  need to change even though the *builtin name/contract* could carry
  over).
- **`platform-notes.md`, `project-files.md`, `known-bugs.md`'s hardware-
  adjacent sections** are written entirely in C64 terms (6510 `$01` port,
  VIC-II banking, CIA raster registers, zero-page carve-up, Exomizer/LZ4
  compression tooling) — useful as a *structural model* for an equivalent
  "TVC Platform Notes" page, but the content itself doesn't transfer.
  `project-files.md`'s `system` key is hard-locked to `C64` in this SANE
  fork; vanilla TRSE's project file presumably accepts a TVC target value
  instead — this needs verification against actual vanilla TRSE source/
  docs, not SANE's.

## 5. Practical implications for the TVC skill

- Reuse directly (near-verbatim, after tag-triage — see below): keyword,
  operator, and most type pages' Syntax/Parameters/Example structure and
  content, since these are compiler-frontend, target-independent.
- For any page tagged `TRSE (modified in SANE)`, use the **vanilla-TRSE
  behavior described in the badge/Known-limitations text**, not the "Fixed
  in SANE" behavior, when writing the TVC equivalent — unless separately
  verified that vanilla TRSE's TVC target also happens to carry the fix
  (unlikely, since SANE's fixes are its own patches on top of a
  `leuat/TRSE` checkout).
  For any page tagged `SANE`, exclude — it doesn't exist in vanilla TRSE
  at all, so no TVC target could have it either.
- Reuse the same per-page template (title, compatibility note if adapted,
  prose, Syntax, Parameters, Returns, Example w/ downloadable `.ras`,
  optional Known limitations) for a parallel TVC reference — but the
  compatibility badge would need a different axis (e.g. "vanilla TRSE" vs
  "TVC-target-specific extension" rather than SANE vs TRSE), since there's
  no analogous "fork" relationship for TVC docs, unless the TVC skill also
  distinguishes vanilla-TRSE-generic content from TVC-target-specific
  standard-library content, which is a very close parallel to what tags.md
  already does here.
- Builtins/constants/directives sections need a wholesale TVC-specific
  rewrite grounded in TRSE's actual TVC-target standard library/compiler
  source (not this C64 content), following the same page template.
- The `examples/` cookbook format (What this uses / full program / How it
  works) is a good reusable template for TVC worked examples once TVC
  builtins exist to reference.
