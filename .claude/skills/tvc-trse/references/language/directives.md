# Directives

Directives are the `@`-prefixed build-time instructions: compile-time
conditionals, file/asset operations, macros, and project configuration.
Unlike a plain keyword, a directive doesn't generate runtime code by
itself — it controls something about the *build*, not the compiled
program's behavior.

This page is adapted from SANE's directive reference (SANE is a C64-only
TRSE fork whose docs are the best-organized, source-cross-checked TRSE
language reference available), scoped down to plain/vanilla TRSE
behavior, since that is what the TVC toolchain actually runs. Every
directive below was checked against real TVC `.ras`/`.trse` sources
(`sources/tutorials/`) where possible.

**A note on `@export` and its family.** It would be easy to assume any
directive whose name starts with `@export` is tied to C64 `.flf`/VIC-II
graphics formats and exclude the whole family. That assumption is wrong:
`.flf` ("FLUFF64") is TRSE's own generic binary asset format (produced by
TRSE's built-in image/charset/sprite/level editor), not something
Commodore-specific, and real TVC code uses the exact same
`@export "<file>.flf" "<file>.bin" <width>` pattern shown in the generic
reference below — see `tutorial_image.ras`, `tutorial_image2.ras`,
`tutorial_image3.ras`, `twister.ras`, and
`project_template_tvc_image/files/main.ras` under `sources/tutorials/`.
Most of the `@export*` family is kept in the main reference below for the
same reason: they operate on the generic `.flf`/binary-file level (region
coordinates, byte offsets, compression thresholds), not on VIC-II
registers or C64 color palettes. Only the handful that are provably tied
to Commodore-specific formats or 6502 assembly (a C64 `.prg` load
address, PETSCII text-mode blocks, raw VIC-II character-bitmap layout,
generated 6502 `(pointer),y` opcodes) are split into the C64-specific
section further down.

---

## Conditionals

### `@define`

Defines a compile-time text substitution: every later occurrence of
`@<name>` in the source is replaced with `<value>`, verbatim, before
parsing continues. Also usable as a flag for `@ifdef`/`@ifndef`, since
those just check whether a given name was defined at all.

**Syntax:**

    @define <name> <value>;

**Parameters:**

- `<name>`: the identifier that `@<name>` will be replaced with `<value>`
  wherever it's referenced later in the source.
- `<value>`: the raw text to substitute in. Not limited to numbers: any
  token sequence works, since the substitution happens on the raw source
  text before tokenizing.

### `@ifdef`

Compile-time conditional compilation: includes the code between `@ifdef`
and its matching `@else`/`@endif` only if the named symbol has been set
with `@define`. Unlike the `if` statement, this is resolved before
compilation starts, so the excluded branch's code doesn't exist in the
compiled program at all, not even as dead code.

**Syntax:**

    @ifdef <name>
        <code, only compiled if <name> was @defined>
    @endif

    @ifdef <name>
        <code, only compiled if <name> was @defined>
    @else
        <code, only compiled otherwise>
    @endif

**Parameters:**

- `<name>`: the symbol to check, as previously set with `@define <name>
  <value>;` (or left absent entirely).

### `@ifndef`

The inverted form of `@ifdef`: includes the code between `@ifndef` and
its matching `@else`/`@endif` only if the named symbol has **not** been
set with `@define`.

**Syntax:**

    @ifndef <name>
        <code, only compiled if <name> was NOT @defined>
    @endif

    @ifndef <name>
        <code, only compiled if <name> was NOT @defined>
    @else
        <code, only compiled if it WAS @defined>
    @endif

**Parameters:**

- `<name>`: the symbol to check.

### `@if`

Compile-time conditional compilation, like `@ifdef`, but checking a
defined symbol against a specific value instead of just whether it was
`@define`d at all. Only the matching branch's code exists in the
compiled program; the other one was never compiled in the first place.

**Syntax:**

    @if <name> = <value>
        <code, only compiled if <name> was @defined as <value>>
    @endif

    @if <name> = <value>
        <code, only compiled if <name> was @defined as <value>>
    @else
        <code, only compiled otherwise>
    @endif

**Parameters:**

- `<name>`: the symbol to check, as previously set with `@define <name>
  <value>`.
- `<value>`: the value to compare against. The comparison is an exact
  text match against whatever `<name>` was `@define`d as, not a numeric
  evaluation, so `@define count 01` would not match `@if count = 1`.

`=` is the only comparison supported; there's no `<>`, `>`, `<`, etc.
form. If `<name>` was never `@define`d at all, the condition is treated
as false, the same as `@ifdef` on an undefined symbol. Not to be confused
with the `if` statement, which is a runtime conditional resolved every
time the program runs, not once at compile time.

### `@endif`

Closes an `@ifdef`/`@ifndef`/`@if` conditional-compilation block.

**Syntax:**

    @endif

Takes no argument; just marks where the conditional block ends.

---

## File & include operations

### `@include`

A build-time directive that splices the contents of another file
directly into the source, at the exact point `@include` appears, as if
it had been typed there. It's a textual insertion, not a module/unit
system: whatever the included file contains has to be valid at the
position it's inserted into (a declaration, if included among
declarations; a statement, if included inside a `begin ... end` block).

**Syntax:**

    @include "<file>";

**Parameters:**

- `<file>`: path to the file to insert. Looked up first in the current
  project's own directory, then in the system-specific standard library
  directory, then in the shared standard library directory.

**Known limitations:**

- A file generated by `@bin2inc` or `@vbmcompilechunk` earlier in the
  *same* compile cannot be `@include`d in that same compile. On a clean
  build it fails with "Could not open file for inclusion", even though
  the generating directive runs first in the same file. The workaround is
  to generate the include file with a `@bin2inc`-only compile first, then
  `@include` it from a separate file, or check the generated file into
  the project ahead of time.
- `@include`'s standard-library fallback (used once the file isn't found
  in the current project's own directory) is only found correctly when
  the compiler is invoked with the repository's own root as the current
  working directory. This mostly surfaces from inside a `unit` (`.tru`
  file) that itself does `@include` against the shared standard library,
  since `@use`'s own unit lookup isn't affected. The ordinary, documented
  way of invoking the compiler (`cd`'d into the project's own directory,
  passing relative paths) triggers this: the fallback silently looks in
  the wrong place and the compile fails with "Could not open file for
  inclusion", even though the file genuinely exists in the standard
  library.

### `@use`

Pulls a `unit` (a `.tru` file) into the current compile. The unit's
procedures, functions, and variables become reachable through a
`<UnitName>::` prefix. The compiler looks for `<name>.tru` in the current
project directory first, then in the system-specific, CPU-specific, and
global folders of the shared unit library, in that order. Confirmed used
this way throughout real TVC code (`@use "crtc"`, `@use "GE"`, `@use
"tvc"`, etc.).

**Syntax:**

    @use "<unit name>";
    @use <UnitName>;

Both a quoted path-like form (`@use "system/str"`, for a unit that lives
in a subfolder of the unit library) and a bare identifier form (`@use
MathHelper`, for a unit sitting next to the current file) are accepted.

**Parameters:**

- `<unit name>`: the unit's file name (without the `.tru` extension),
  optionally with a subfolder path.

**Known limitations:**

- **On a case-sensitive filesystem (Linux), the `<unit name>` string must match the
  actual `.tru` filename's case exactly** — confirmed directly: `@use "Music"` fails
  to compile against the actual file `music.tru` (lowercase) with `Could not find TRU
  file for inclusion : Music`, and `@use "tvc"` fails against the actual file
  `TVC.tru` (uppercase) the same way, both on the Linux `trse` build tested while this
  skill was authored. Several of this skill's own bundled tutorial examples use
  inconsistent casing this way (some presumably written/tested on a case-insensitive
  filesystem, e.g. Windows or macOS default, where this never surfaces). If a `@use`
  that looks correct fails with "Could not find TRU file," check the actual filename's
  case on disk before assuming anything else is wrong.
- Builtins that auto-initialize themselves the first time a matching call
  appears in the source text (`sine[`, `rand(`, `sqrt(`, `joystick(`, and
  similar) only scan the **current file's own text** for that first-use
  pattern, so a call written only inside a `@use`d unit, with no matching
  call anywhere in the main program text, can fail to trigger the
  auto-init. `sine[]` is the one confirmed to actually misbehave this way
  (silently returning `0` from every read, since its table-fill routine
  never runs). The workaround is to add at least one real, uncommented
  `sine[...]` call somewhere in the main file.

### `@copyfile`

A build-time directive that copies a file within the project directory.
Useful for staging a copy of an asset before another build directive
modifies it in place, without touching the original.

**Syntax:**

    @copyfile "<source>" "<destination>";

**Parameters:**

- `<source>`: path (relative to the project directory) of the file to
  copy. Compilation fails with an error if it doesn't exist.
- `<destination>`: path to copy it to. If a file already exists there, it
  is overwritten.

### `@deletefile`

A build-time directive that deletes a file within the project directory,
if it exists.

**Syntax:**

    @deletefile "<file>";

**Parameters:**

- `<file>`: path (relative to the project directory) of the file to
  delete. Unlike `@copyfile`, it is **not** an error if the file doesn't
  exist: `@deletefile` silently does nothing in that case.

### `@splitfile`

A build-time directive that splits a binary file into two separate files
at a given byte offset. Useful for breaking a large asset into pieces
that need to be loaded or placed separately, without an external tool.

**Syntax:**

    @splitfile "<input file>" "<output file 1>" "<output file 2>" <split position>

**Parameters:**

- `<input file>`: path to the binary file to split.
- `<output file 1>`: path to write the first part to (bytes before the
  split position).
- `<output file 2>`: path to write the second part to (bytes from the
  split position onward).
- `<split position>`: the byte offset to split at. Must be smaller than
  the input file's size, compilation fails with an error otherwise.

### `@requirefile`

A build-time directive that checks a file exists before compilation is
allowed to continue. Useful for a project that depends on an
auto-generated asset (compressed data, a converted image, and similar):
instead of failing later with a confusing "file not found" from whatever
actually reads it, this stops compilation immediately with a clear,
custom message pointing at the missing build step. Confirmed used this
way in real TVC code (`twister.ras`, guarding a `fjong`-tool-generated
data file).

**Syntax:**

    @requirefile "<file>" "<message>"

**Parameters:**

- `<file>`: path to the file to check for, relative to the project
  directory. Compilation fails immediately if it doesn't exist.
- `<message>`: a custom message appended to the error, telling the
  developer what to do about it (e.g. which build step to run first).

### `@bin2inc`

A build-time directive that converts a binary file into a TRSE source
file declaring a byte array with the same contents, so raw binary data (a
sprite sheet, a compressed asset, etc.) can be brought into a program as
an ordinary array via `@include`.

**Syntax:**

    @bin2inc "<input file>" "<output file>" <array name>;

**Parameters:**

- `<input file>`: path to the binary file to convert.
- `<output file>`: path to write the generated TRSE source to.
- `<array name>`: the identifier the generated `var ... : array[...] of
  byte = (...)` declaration will use.

**Known limitations:**

- `@bin2inc`'s output file cannot be `@include`d in the *same* compile
  that generates it. On a clean build, `@include "<output file>"` fails
  with "Could not open file for inclusion", even though `@bin2inc`
  appears earlier in the same file. The workaround is to generate the
  include file with one project first (`@bin2inc` alone), then `@include`
  it from a separate `.ras`/`.tru` file, or check the generated file into
  the project ahead of time.

---

## Error & warning

### `@error`

Immediately aborts compilation with a custom error message. Typically
paired with `@ifdef`/`@ifndef` as a compile-time assertion, to fail fast
with a clear message when a required `@define` hasn't been set, instead
of letting compilation continue and fail confusingly somewhere else.

**Syntax:**

    @error "<message>"

**Parameters:**

- `<message>`: the text shown as the fatal error. Compilation stops right
  there; nothing after it is processed.

### `@raiseerror`

Immediately aborts compilation with a custom error message, functionally
identical to `@error`.

**Syntax:**

    @raiseerror "<message>"

**Parameters:**

- `<message>`: the text shown as the fatal error. Compilation stops right
  there; nothing after it is processed.

### `@raisewarning`

Emits a custom compile-time warning without stopping compilation, unlike
`@raiseerror`/`@error`, which abort. Meant for flagging a questionable
but non-fatal setup.

**Syntax:**

    @raisewarning "<message>"

**Parameters:**

- `<message>`: the warning text. Compilation continues normally right
  after it.

**Known limitations:**

- When compiling from the command line, the warning message is never
  shown anywhere: not printed to the terminal, written to a log, or
  included in the compiled output. It's only ever wired up to be read
  from the original graphical IDE's own output console. Compilation
  itself still succeeds; the message is just silently discarded. This
  differs from `@raiseerror`/`@error`, whose abort message does reach the
  console through a separate mechanism.

---

## Macros

### `@macro`

Defines a compile-time text generator written in **JavaScript**, not TRSE
itself. The code between `@macro` and `@endmacro` runs once, at compile
time, and produces real TRSE source text, which the compiler then parses
as if it had been typed there directly.

**Syntax:**

    @macro "<name>" <paramCount>
        <JavaScript code, using write()/writeln() to emit TRSE source text>
    @endmacro

    // elsewhere:
    @<name>(<arg0>, <arg1>, ...)

**Parameters:**

- `<name>`: the identifier used to invoke the macro later, as
  `@<name>(...)`.
- `<paramCount>`: how many arguments the macro takes. Inside the
  JavaScript body, they're available as the variables `p0`, `p1`, ... up
  to `p<paramCount - 1>`.
- The body itself is plain JavaScript. `write(text)`/`writeln(text)`
  append `text` (plus a newline for `writeln`) to the TRSE source the
  compiler will parse next, right where the macro was invoked.

### `@endmacro`

Closes a `@macro` block. Takes no argument; just marks where the
JavaScript body ends.

**Syntax:**

    @endmacro

---

## Build & output controls

### `@startblock` / `@endblock`

Opens (and closes) a fixed-address memory region. Everything declared
between `@startblock <address> "<name>"` and `@endblock` is placed
starting at that fixed address, instead of wherever the compiler would
otherwise put it.

**Syntax:**

    @startblock <address> "<name>"
      <declarations / code>
    @endblock

**Parameters:**

- `<address>`: the fixed address to place everything in the block at
  (hex, e.g. `$f000`, or decimal).
- `<name>`: a label for the block, doesn't need to be unique.
- `@endblock` itself takes no argument.

**Known limitations:**

- Starting a new block before closing the previous one with `@endblock`
  is not detected. The compiler silently switches to the new block
  instead of raising an error (the reverse case — `@endblock` without a
  matching `@startblock` — does fail with a clear error). A forgotten
  `@endblock`, or a `@startblock` nested inside another one, won't be
  flagged; it just silently changes which fixed address everything after
  it gets placed at.

### `@userdata`

Reserves a fixed address range so the compiler's automatic memory
allocator never places a variable or generated code inside it. Useful for
protecting a block of memory that something outside the compiled program
(a loader, a fixed-address asset, hand-placed data) needs to own.

**Syntax:**

    @userdata "<from address>" "<to address>" "<name>";

**Parameters:**

- `<from address>`, `<to address>`: the reserved range, as quoted
  hexadecimal strings (e.g. `"$c000"`).
- `<name>`: a label for the reservation, purely descriptive.

### `@donotprefix`

Intended to disable automatic unit-name prefixing for a single named
symbol (a more targeted version of `@donotprefixunit`, which disables it
for the whole unit).

**Syntax:**

    @donotprefix <symbolName>;

**Parameters:**

- `<symbolName>`: the identifier to exempt from prefixing.

**Known limitations:**

- **This directive does not compile, in any configuration.** It fails
  both as a plain top-level directive in a `.ras` main program, and
  inside a `.tru` unit file (its actual intended context). The
  directive's own symbol-name argument is never fully consumed while
  parsing it, which desyncs everything parsed afterward, so the resulting
  error surfaces somewhere else in the file rather than pointing at the
  `@donotprefix` line itself. Its sibling directive, `@donotprefixunit`
  (which takes no argument), is unaffected, so the bug is specific to
  this argument-taking form. In practice, `@donotprefix` is not usable at
  all on the plain-TRSE toolchain TVC compiles with.

### `@donotprefixunit`

Disables automatic name-prefixing for an entire unit (`.tru`). Normally,
compiling a unit prefixes every symbol it declares with the unit's own
name (so `HelperUnit`'s `myVar` becomes `HelperUnit_myVar` internally);
this directive turns that off for the whole file.

**Syntax:**

    @donotprefixunit;

Takes no argument; place it once, anywhere in the unit file.

### `@donotremove`

Tells the compiler's unused-symbol removal pass to keep a symbol even if
nothing in the visible TRSE source appears to reference it. Useful for a
variable or label that's only ever referenced from inside a raw `asm`
block, which the compiler can't statically see as a use.

**Syntax:**

    @donotremove <symbolName>;

**Parameters:**

- `<symbolName>`: the identifier to protect from removal.

### `@setvalue`

Sets a raw project/settings configuration key directly from source code,
by its exact internal name. This is the low-level counterpart to
`@projectsettings`: `@projectsettings` only exposes a small, curated set
of friendly setting names, while `@setvalue` can set any configuration
key the compiler reads, as long as you know its exact internal name.
There's no validation of the key name: an unrecognized key is silently
accepted and simply has no effect.

**Syntax:**

    @setvalue "<key>" <value>

**Parameters:**

- `<key>`: a quoted string naming the configuration key to set, exactly
  as the compiler's internal settings file would spell it.
- `<value>`: the new value, a quoted string or a bare number.

### `@projectsettings`

Overrides a project setting directly from source code, the same settings
that would otherwise come from the project's own configuration file. Lets
a single `.ras` file carry a setting override with it, rather than
requiring every project that uses it to remember to set it up separately.
Only a small, curated set of friendly setting names is recognized here;
see `@setvalue` for setting an arbitrary raw configuration key.

**Syntax:**

    @projectsettings "<key>" <value>

No parentheses and no comma between the key and the value; just the
directive followed by a quoted key name and the value.

**Parameters:**

- `<key>`: a quoted string naming which setting to override, e.g.
  `"startaddress"`.
- `<value>`: the new value. A quoted string or a bare number/address
  (e.g. `$0900`), depending on what the key expects.

### `@startassembler` / `@endassembler`

Prepends (`@startassembler`) or appends (`@endassembler`) a raw line of
text to the generated assembly source — the very start or the very end,
respectively. Typically used to inject assembler-specific header/footer
text (segment directives, origin markers, end-of-file markers) that a
particular target assembler expects.

**Syntax:**

    @startassembler "<text>";
    @endassembler "<text>";

**Parameters:**

- `<text>`: the raw line of text to prepend/append to the generated
  `.asm` file, exactly as given (no processing or validation).

**Known limitations:**

- Only one `@startassembler` (and, separately, one `@endassembler`) per
  compile has any effect: if either appears more than once in a project,
  only the last one processed wins, rather than accumulating multiple
  lines.

### `@execute`

A build-time directive that runs an external command-line program and
waits for it to finish, before compilation continues. Useful for invoking
an external asset-conversion tool, packer, or script as part of the
build.

**Syntax:**

    @execute "<program>" "<arguments>"

**Parameters:**

- `<program>`: path to the executable to run. If it isn't an absolute or
  relative path (no `/` in it), it's resolved the same way a shell would
  resolve a bare command name, via the `PATH` environment variable.
- `<arguments>`: a single string containing all arguments, separated by
  plain spaces (no quoting support for arguments that themselves contain
  spaces).

The program's standard output and standard error are captured but not
shown anywhere in the compiler's own output. A non-zero exit code from
the program does not fail the TRSE compile; compilation just continues.

### `@compress`

A build-time directive that LZ4-compresses a file on disk, by shelling
out to an external `lz4` command-line tool. Unlike the `compressed`
variable flag (which uses the compiler's own bundled LZ4 implementation),
`@compress` needs a real `lz4` binary installed and configured.

**Syntax:**

    @compress "<source>" "<destination>";
    @compress "<source>" "<destination>" <split>;

**Parameters:**

- `<source>`: path (relative to the project directory) of the file to
  compress.
- `<destination>`: path to write the compressed output to.
- `<split>` (optional): if given and greater than 1, the source file is
  split into `<split>` equal-sized chunks first, and each chunk is
  compressed separately, written to `<destination>0`, `<destination>1`,
  etc. Omit it (or use `1`) to compress the whole file as one block.

Requires the `lz4` command-line tool to be installed, with its path set
in the project's settings `.ini` under the `lz4` key. Compilation fails
with an explicit error if that path doesn't exist.

**Known limitations:**

- There is no compiler builtin that decompresses this data back at
  runtime: `decrunch()` cannot be used on it (it only accepts
  `IncBin`-typed data, and decompresses a different format, Exomizer, not
  LZ4). `@compress`'s output also isn't the same *container* as the
  `compressed` variable flag's own LZ4 output (legacy vs. modern LZ4
  frame format, different magic bytes) — the two aren't interchangeable.
  `@compress` is useful for shrinking a file's on-disk size for
  consumption by external tooling, not for a compress-then-decompress-at-
  runtime round trip.

### `@ignoremethod`

Opts a named `init...` routine out of TRSE's automatic initialization
scan. Several builtins (`sine[`, `rand(`, `sqrt(`, `joystick(`, and
others) normally get an automatic call to their matching `init...`
routine inserted at program start, the first time the compiler spots the
triggering pattern anywhere in the source text. `@ignoremethod` suppresses
that automatic insertion, for programs that want to call the `init...`
routine themselves instead.

**Syntax:**

    @ignoremethod <initRoutineName>

**Parameters:**

- `<initRoutineName>`: the name of the `init...` routine to exclude from
  auto-initialization, not the triggering builtin's own name (e.g.
  `initsinetable` to stop `sine[...]` usages from auto-inserting that
  call; writing `sine` here has no effect).

**Known limitations:**

- The argument must be written in **all-lowercase** (`initgetkey`, not
  `initGetKey`), regardless of how the routine's name is normally cased
  everywhere else. Writing it in normal casing silently fails to match,
  and the automatic insertion stays active alongside the program's own
  explicit call. For most `init...` routines the result is just harmless
  redundancy (the routine guards itself against running its setup
  twice), but for `initGetKey` specifically, there's no such guard, and
  the mismatch produces a hard build failure (a duplicate-symbol error
  from the keyboard-input code being assembled twice).

### `@ignoresystemheaders`

Intended to suppress automatically-included system/platform header
content from the compiled output.

**Syntax:**

    @ignoresystemheaders

Takes no arguments.

**Known limitations:**

- **Currently has no effect.** The directive compiles cleanly (it also
  prints a stray debug line to the console, harmless but a little
  unexpected), but nothing else in the compiler ever checks the flag it
  sets. Using it doesn't change the compiled output in any observable
  way.

---

## Asset export (`.flf`-based, target-agnostic)

These all operate on TRSE's own `.flf` ("FLUFF64") binary asset format —
the format produced by TRSE's built-in image/charset/sprite/level editor,
not a common format like PNG. **That editor is part of the GUI IDE**,
which most CLI-only TRSE toolchains (including the one bundled for TVC)
don't include, so a new `.flf` file generally can't be created or edited
from scratch; only pre-existing `.flf` assets (such as the ones bundled
with project templates) can be used as input. Confirmed used on TVC via
`tutorial_image.ras`, `tutorial_image2.ras`, `tutorial_image3.ras`,
`twister.ras`, and `project_template_tvc_image/files/main.ras` (all use
plain `@export "<file>.flf" "<file>.bin" <width>`).

### `@export`

Exports the contents of a `.flf` image/asset file to a raw binary file,
so it can be brought into a program (typically via `@bin2inc` on the
resulting binary, or loaded at runtime from disk/tape).

**Syntax:**

    @export "<input .flf file>" "<output file>" <param1>;
    @export "<input .flf file>" "<output file>" <param1> <param2>;

**Parameters:**

- `<input .flf file>`: path to the `.flf` asset to export. Compilation
  fails with an error if it doesn't exist.
- `<output file>`: path to write the raw binary export to.
- `<param1>` / `<param2>` (second is optional): meaning depends on the
  asset type. For charset-family assets, a single param is taken as an
  end index and a pair as a start/end range (which characters/tiles to
  include); for most other asset types they're unused.

### `@exportsubregion`

Exports a rectangular region of a `.flf` image/asset file to a raw binary
file, instead of the whole thing.

**Syntax:**

    @exportsubregion "<input .flf file>" "<output file>" <x> <y> <w> <h>;
    @exportsubregion "<input .flf file>" "<output file>" <x> <y> <w> <h> <type>;

**Parameters:**

- `<input .flf file>`: path to the `.flf` asset to export.
- `<output file>`: path to write the raw binary export to.
- `<x>`, `<y>`: top-left corner of the region to export, in the asset's
  own units (pixels or characters, depending on asset type).
- `<w>`, `<h>`: width and height of the region.
- `<type>` (optional): export format variant; meaning is asset-type
  specific. Defaults to `0`.

### `@exportblackwhite`

Intended to export a `.flf` image/asset as 1-bit-per-pixel black & white
data.

**Syntax:**

    @exportblackwhite "<input .flf file>" "<output file>" <x> <y> <w> <h>;
    @exportblackwhite "<input .flf file>" "<output file>" <x> <y> <w> <h> <type>;

**Parameters:**

- `<input .flf file>`: path to the `.flf` asset to export.
- `<output file>`: path to write the raw binary export to.
- `<x>`, `<y>`, `<w>`, `<h>`: region of the source image to export.
- `<type>` (optional): export format variant. Defaults to `0`.

**Known limitations:**

- **Only works for one specific `.flf` asset type**: an image imported
  directly from a plain bitmap file (PNG etc.) through TRSE's GUI
  image-import dialog — part of the GUI IDE most CLI-only toolchains
  don't include. Every other asset type (charset, sprite, multicolor
  bitmap, level, etc.) falls back to a do-nothing default that silently
  produces a zero-byte output file, with no warning or error. In
  practice this makes the directive effectively unreachable unless a
  `.flf` of that specific type is produced by some other means.

### `@exportframe`

Exports one or more "frames" from a `.flf` image/asset to a raw binary
file. What a "frame" means depends on the asset type: for a level-editor
asset it's a level number; the directive was also intended to support
animation-frame export from charset/sprite assets (see Known limitations).

**Syntax:**

    @exportframe "<input .flf file>" "<output file>" <frame> <frameCount> <type> <col> <row> <width> <height> <rowOrder>;

**Parameters:**

- `<input .flf file>`: path to the `.flf` asset to export.
- `<output file>`: path to write the raw binary export to.
- `<frame>`: first frame/level index to export.
- `<frameCount>`: how many consecutive frames/levels to export, starting
  at `<frame>`.
- `<type>`: for a level-editor asset: `0` = level data, `1` = colour
  data, `2` = extra data, `3` = all of the above, sequentially.
- `<col>`, `<row>`: starting column/row within each frame.
- `<width>`, `<height>`: how many columns/rows to export; `0` for either
  means "use the frame's full width/height".
- `<rowOrder>`: `0`-`3`, selects column/row order and full/half-height
  colour map, per the source file.

**Known limitations:**

- **Only actually implemented for level-editor assets.** Every other
  `.flf` asset type (charset, sprite sheets included) hits a dead stub:
  it builds an output buffer, never fills it with anything, and writes
  that empty buffer to the output file, with no warning that anything
  went wrong.

### `@exportcompressed`

Exports a charset-family `.flf` image/asset as a compressed
screen/charset/colour triplet: three separate output files for the
screen (character index) data, the charset (bitmap) data, and the colour
data.

**Syntax:**

    @exportcompressed "<input .flf file>" "<output file>" <x> <y> <w> <h> <compression>;

**Parameters:**

- `<input .flf file>`: path to a charset-family `.flf` asset (charmap,
  sprite sheet, or similar).
- `<output file>`: base name; the compiler appends `_screen.bin`,
  `_charset.bin`, and `_color.bin` to it for the three actual output
  files.
- `<x>`, `<y>`, `<w>`, `<h>`: region of the source image to export.
- `<compression>`: a similarity threshold, `0`-`100`, for merging
  near-identical characters into one reused entry; `0` only merges exact
  duplicates, higher values merge increasingly different-looking
  characters together to save space. See `@setcompressionweights` to
  tune how that similarity is scored.

### `@setcompressionweights`

Tunes the perceptual similarity check that `@exportcompressed` uses when
deciding whether two characters/tiles look close enough to be merged into
one reused entry. Three separate weights push the comparison toward
caring more about overall brightness, fine structural detail, or
contrast.

**Syntax:**

    @setcompressionweights <luminosity> <structure> <contrast>

**Parameters:**

- `<luminosity>`: how much overall brightness difference counts toward
  "these two characters are different", 0-100.
- `<structure>`: how much fine-detail/edge structure difference counts,
  0-100.
- `<contrast>`: how much contrast difference counts, 0-100.

All three are percentages (divided by 100 internally) feeding into the
same similarity score `@exportcompressed`'s `<compression>` threshold is
compared against; this directive only matters when used together with
`@exportcompressed`.

### `@exportrgb8palette`

Exports a `.flf` image/asset's colour palette as raw 8-bit-per-channel
RGB data (3 bytes per colour).

**Syntax:**

    @exportrgb8palette "<input .flf file>" "<output file>";

**Parameters:**

- `<input .flf file>`: path to the `.flf` asset whose palette should be
  exported.
- `<output file>`: path to write the raw RGB palette data to. If it
  already exists, it's overwritten.

### `@export_parallax_data`

Generates pre-shifted charset and screen data for a horizontally-
scrolling parallax layer, from a full-screen character `.flf` image (one
with an attached charset, not a plain sprite/bitmap). Writes two output
files: `<output file base>_charset.bin` (pre-shifted charset data) and
`<output file base>_screens.bin` (the corresponding screen/tile-index
data).

**Syntax:**

    @export_parallax_data "<input .flf file>" "<output file>" <x0> <y0> <x1> <y1> <weight> <type> <eor>;

**Parameters:**

- `<input .flf file>`: path to a full-screen-character `.flf` asset.
- `<output file>`: base name for the two generated files.
- `<x0>`, `<y0>`, `<x1>`, `<y1>`: the region of the source image to use.
- `<weight>`: passed through to the underlying char-compression pass as
  its weight/threshold parameter.
- `<type>`: if non-zero, remaps any "ambiguous" 2-bit colour value to
  this value before packing; `0` leaves the data unmodified.
- `<eor>`: a byte XORed into every generated charset byte; `0` for no
  transform.

### `@perlinnoise`

Fills a raw binary file with 2D coherent ("Perlin-style") noise, the same
kind of compile-time data generation as `buildsinetable`/`buildtable2d`,
but for a full 2D noise field instead of a mathematical function. Meant
for procedurally generated terrain, cloud/fire textures, or organic
fade patterns.

**Syntax:**

    @perlinnoise "<output file>" <width> <height> <octaves> <scaleX> <scaleY> <persistence> <amplitude> [<power>];

**Parameters:**

- `<output file>`: path to write the raw noise bytes to (`width *
  height` bytes, one per pixel). A `.png` preview image is also saved
  alongside it automatically, at `<output file>.png`.
- `<width>`, `<height>`: dimensions of the generated noise field.
- `<octaves>`: how many layers of noise to combine; more octaves add
  finer detail on top of the base pattern.
- `<scaleX>`, `<scaleY>`: how stretched the noise pattern is along each
  axis.
- `<persistence>`: how much each additional octave contributes, as a
  whole number divided by 100 (so `170` means a persistence of `1.7`).
- `<amplitude>`: overall brightness scale of the output. See Known
  limitations before pushing this high.
- `<power>` (optional): a whole number divided by 1000 (so `1000` means
  a power of `1.0`, the default if omitted), applied as an exponent to
  shape the noise curve before scaling by amplitude.

**Known limitations:**

- **The exported byte data isn't clamped to the 0-255 range, but the
  `.png` preview image is.** If `<amplitude>`/`<power>` push a pixel's
  computed value above 255 or below 0, that pixel's real, compiled-in
  byte silently wraps/truncates instead of clamping, while the preview
  image next to it is clamped and looks perfectly clean. The preview can
  therefore be misleading: it's possible for the `.png` to look
  completely fine while the actual noise data compiled into the program
  has wrapped-around, incorrect values at the same pixels. Keep
  amplitude/power conservative, and don't rely on the preview alone to
  judge whether the output range is safe.

### `@pathtool`

A build-time directive that fits a smooth curve through a list of 2D
points and samples it at regular intervals, writing the resulting
position (and direction) data to raw binary files — for something like a
sprite following a path.

**Syntax:**

    @pathtool "<input file>" "<output base name>" <sampleCount> <degreeSteps>;

**Parameters:**

- `<input file>`: a plain text file of whitespace-separated coordinate
  points to fit a curve through.
- `<output base name>`: a filename prefix. Three files are produced from
  it: `<prefix>x.bin`, `<prefix>y.bin`, and `<prefix>t.bin` (position and
  direction data).
- `<sampleCount>`: how many evenly-spaced points to sample along the
  fitted curve.
- `<degreeSteps>`: scales the direction value written to the `t.bin`
  file, intended for picking one of several pre-rotated sprite frames
  along the path.

**Known limitations:**

- **This directive does not compile, in any configuration.** Placing
  `@pathtool` at the top level of a program, and inside a `var` block
  (its only sensible location, since its output is meant to be pulled in
  via `incbin`), both fail the same way. The directive's own side
  effects (reading the input file, writing the three output `.bin`
  files) do run successfully, but something afterward leaves the parser
  out of sync with the rest of the file, and the resulting error surfaces
  much later, worded as if the problem were a missing `begin` rather than
  pointing at the `@pathtool` line itself. `@pathtool` is not usable at
  all as shipped in plain TRSE.

---

## C64-specific — TVC equivalent not yet written

The directives below are tied to Commodore-family formats, 6502
assembly, or VICE-emulator/C64-disk tooling specifically — not to the
generic `.flf` file mechanics of the `@export*` family above. Using them
on a TVC project either has no meaning (there's no VICE, no `.prg`
format, no PETSCII, no 6502 to generate opcodes for) or would require a
ground-up TVC-specific reimplementation. Each entry below notes what the
directive does for C64, so a future pass knows what a TVC equivalent
would need to cover — if one is ever warranted.

- **`@exportprg2bin`** — extracts a byte range from an existing compiled
  `.prg` file into a raw binary slice, reading the file's first two bytes
  as **"the C64 load address"** to establish where the rest of the data
  starts in memory. `.prg` (with its 2-byte load-address header) is a
  Commodore-specific executable container; TVC's compiled output and tape
  (`.cas`) format are different. A TVC equivalent would need to key off
  whatever load-address convention TVC's own compiled output actually
  uses, if this kind of "slice out of an already-built binary" operation
  is ever needed.
- **`@pbmexport`** — converts a bitmap graphic into "PET Bitmap Mode"
  (PBM) data: 16 PETSCII characters representing 2x2 pixel blocks, giving
  a blocky double-resolution look on text-mode-only Commodore machines
  (PET, and still usable on C64/VIC-20). PETSCII is a Commodore-specific
  character encoding; TVC has its own character set and would need a
  from-scratch equivalent, if this double-resolution-via-text-mode trick
  is ever wanted on TVC hardware.
- **`@importchar`** — intended to copy a single character/tile from one
  `.flf` asset into another. The actual copy step is unimplemented for
  every C64-reachable asset type (charset, sprite, multicolor bitmap,
  full-screen character); the only asset type it actually works for is
  NES, unrelated to either C64 or TVC. Not usable as shipped on any
  target relevant here; would need its own implementation entirely if a
  TVC asset-editing workflow ever wants this.
- **`@spritecompiler`** — intended to read a region out of an image asset
  and generate hardware-sprite-drawing code for it. Produces no usable
  output on the C64 target (a dead no-op for every C64 asset type); the
  generated code, where implemented at all on other TRSE targets, is
  necessarily target-specific machine code. A TVC equivalent would need
  its own codegen against TVC's actual display hardware, and only makes
  sense if TVC has an analogous hardware/software sprite concept worth
  compiling directly (TVC's `GE` unit's software sprites are handled at
  the unit level today, not via a directive).
- **`@spritepacker`** — packs a source image into a Game Boy or SNES
  sprite/tile format specifically (`<type>` only accepts `"gameboy"` or
  `"snes"`); not usable for C64 either, let alone TVC. Effectively dead
  weight outside those two targets; no known TVC use case.
- **`@vbmexport`**, **`@vbmexportchunk`**, **`@vbmexportcolor`** —
  export raw character-cell bitmap pixel data (8 bytes per character —
  the C64/VIC-II hi-res character format) and, separately, per-character
  colour-RAM-style data, optionally in "multicolor mode" (a VIC-II
  display-mode concept). The 8-bytes-per-character layout and the
  multicolor flag are both VIC-II hardware conventions. A TVC equivalent
  would need to match TVC's own CRTC-based character-cell layout instead
  (see `sources/tru-units/TVC/crtc.tru` and the `crtc`/`text` units used
  throughout `sources/tutorials/`), which is not the same shape.
- **`@vbmcompilechunk`** — reads a region of an image asset and emits
  real TRSE source: one procedure per column, each containing
  **hand-built inline 6502 assembly** (literally emits `sta
  (<pointer>),y`-style opcodes) that draws that column through a
  pointer. Since TVC is Z80-based, not 6502, the generated assembly is
  categorically inapplicable; any TVC equivalent would need entirely
  different, Z80-targeted inline-asm generation.
- **`@addcpmheader`** — prepends a 2-byte length header (low byte `size &
  127`, high byte `size / 128`) to a binary file in place, described as
  "the header format some CP/M-derived loaders expect." Mechanically this
  is just a generic binary-file transform (no VIC-II/VICE dependency at
  all), and TVC's own hardware is Z80-based, the same family CP/M itself
  ran on — so this is flagged here per the original C64-tooling triage
  pass, but it is **not confirmed** to be C64-exclusive the way the
  VBM/sprite directives above are. Nothing in the bundled TVC sources
  (tutorials, `.tru` units, hardware notes) currently documents a
  matching length-prefixed loader/tape-header convention for TVC's own
  `.cas` format, so there's no evidence either way yet. Worth a dedicated
  look before assuming it transfers or excluding it outright.
- **`@sparklefile`** — embeds a [Sparkle 3](https://csdb.dk/release/?id=236718)
  disk-authoring script (a C64-scene `.sls` script format) directly in
  the source, for building a multi-file D64 disk image with the external
  Sparkle 3 tool. Entirely specific to Commodore 1541-style disk images
  and that one external tool; no TVC equivalent exists or is likely
  needed (TVC's tutorials use tape/`.cas`-oriented workflows instead).
- **`@addemulatorparam`** — adds a custom command-line launch parameter
  for **the emulator** (VICE, implicitly) when running the project.
  Whatever TVC emulator a toolchain launches would need its own
  equivalent hook, if the build pipeline supports launching one at all.
- **`@addmonitorcommand`** — adds a **VICE monitor** command that runs
  automatically once the program loads in the emulator, used for
  scripting things like "save memory to a file and quit" (this is how
  SANE's own unit-test suite reports results). VICE's monitor is
  Commodore-emulator-specific; a TVC equivalent would need whatever
  scripting/automation hook (if any) a TVC emulator exposes.

---

## Excluded (SANE-only)

None. Every one of the 54 directive pages checked (everything under
`reference/directives/` except `index.md`) carries either a plain `TRSE`
tag or a `TRSE (modified in SANE)` tag — none are tagged `SANE`-only.
Unlike keywords/builtins, SANE doesn't appear to have added any wholly
new directives of its own; every directive that exists in this fork's
docs also exists in vanilla TRSE. Directives tagged `TRSE (modified in
SANE)` are still included above, but described by their **original,
vanilla-TRSE behavior** (including the bug SANE fixed), per this skill's
general policy of documenting the plain-TRSE toolchain TVC actually
compiles with, not SANE's patched behavior.
