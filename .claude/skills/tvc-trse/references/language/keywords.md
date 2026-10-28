# TRSE Language Keywords

Reference for every reserved word in TRSE's Pascal-style language front end —
control flow, declarations, and declaration modifiers. These are parsed and
type-checked the same way regardless of compile target, so everything below
applies to TVC exactly as it does to any other TRSE target: the frontend
(parser, semantic checks, most codegen) is shared, only final opcode emission
differs per CPU.

This reference documents **vanilla TRSE** behavior, including known bugs and
gaps, since that's what a TVC build actually runs on. A few entries carry a
"Known limitations" section for exactly that reason — a documented wart is not
a defect in this document, it's a warning about what the real compiler does.
Examples are short, generic snippets, not full programs, and avoid assuming
any particular hardware API.

Entries are alphabetical.

## `absolute`

**Description:** Declares a variable at a fixed, specific memory address
instead of letting the compiler choose where it lives. Synonym for [`at`](#at)
for plain variable declarations; the parser accepts either keyword in the
same position with identical effect.

**Syntax**

    var
      <name> : <type> absolute <address>;

`<address>` is a constant address expression: a literal (decimal or `$hex`),
optionally combined with `+`, `-`, `&`, `|`, and parentheses.

**Known limitations**

- Accepted for plain byte/word/array/string variable declarations, but
  **not** for pointer declarations: `^byte absolute $9000;` fails to compile,
  even though `^byte at $9000;` works fine. Use [`at`](#at) instead of
  `absolute` when declaring a pointer at a fixed address.

## `asm`

**Description:** Inserts raw target-assembler source directly into the
compiled program, for an instruction the language doesn't expose or to
hand-optimize a hot path. The string is spliced into the generated assembly
file more or less verbatim, after resolving any TRSE variable/label names
referenced inside it.

**Syntax**

    asm("<assembler source>");

Can span multiple lines inside one string literal.

**Known limitations**

- The first column of each line is treated as a label position, not part of
  the instruction. Indent every real instruction so it doesn't start in
  column one, or it gets parsed as a label instead.

**Example**

```pascal
asm("
       nop
mylbl  nop
");
```

## `assembler`

**Description:** A procedure modifier marking the whole procedure body as
hand-written assembler instead of a normal `begin...end` block of TRSE
statements — shorthand for a procedure that's nothing but a raw [`asm`](#asm)
block, without the outer `begin`/`end`.

**Syntax**

    procedure <name>(); assembler;
    asm("<assembler source>");

**Known limitations**

- An `assembler` procedure does not get the compiler's automatic epilogue
  that a normal procedure body gets, since the assembler body is expected to
  manage its own control flow (typically ending in the target's own return
  instruction). A body that falls through without one falls through into
  whatever code follows it in memory.

## `at`

**Description:** Declares a variable at a fixed, specific memory address —
how TRSE lets you name a hardware register as if it were an ordinary
variable. [`absolute`](#absolute) is a synonym with the same effect for plain
variable declarations.

**Syntax**

    var
      <name> : <type> at <address>;

`<address>` is a constant address expression (decimal or `$hex`, optionally
combined with `+`, `-`, `&`, `|`, and parentheses).

**Example**

```pascal
var
  status : byte at $8000;
```

**Known limitations**

- On a pointer declaration (`^byte at <address>`), `at` pins the pointer
  **variable's own** storage slot to `<address>`; it does **not** make the
  pointer point *at* that address. The pointer still starts out pointing
  nowhere in particular and must be assigned a target with real code after
  declaration.
- Only `at` is recognized on pointer declarations; [`absolute`](#absolute)
  fails to compile there with a parse error.

## `begin`

**Description:** Marks the start of a block of statements, Pascal-style.
Always closed by a matching [`end`](#end) (or, for the program's own
top-level block, `end.` with a trailing period).

**Syntax**

    begin
      <statements>
    end;

Used for the program's top-level block, a procedure/function body, and the
body of `if`/`while`/`for`/`fori` when it spans more than one statement.

## `break`

**Description:** Immediately exits the innermost enclosing loop, skipping any
remaining iterations.

**Syntax**

    break;

## `buildsinetable`

**Description:** Fills an array's initializer at compile time with one full
cycle of a sine wave, sized to the array's own element count. A shorthand for
the sine-wave case of [`buildtable`](#buildtable).

**Syntax**

    var
      <name> : array[<count>] of <type> = buildsinetable(<height>);

`<height>` is the peak-to-peak height of the wave; internally the amplitude
used is `<height> / 2`, and each element is computed as
`sin(i / count * 2*pi) * amplitude + amplitude`, oscillating roughly between
`0` and `<height>` over `<count>` steps.

**Example**

```pascal
var
  wave : array[256] of byte = buildsinetable(200);
```

## `buildtable`

**Description:** Fills an array's initializer at compile time by evaluating a
JavaScript expression once per element, instead of writing every value by
hand. The expression is evaluated with a variable `i` bound to the element's
index (starting at 0). The result is truncated to fit the array's element
type.

**Syntax**

    var
      <name> : array[<count>] of <type> = buildtable("<js expression>");

**Example**

```pascal
var
  lookupDiv16 : array[256] of byte = buildtable("i/16");
```

## `buildtable2d`

**Description:** The two-dimensional version of [`buildtable`](#buildtable):
fills an array's initializer at compile time by evaluating a JavaScript
expression once per `(i, j)` cell of a `width` by `height` grid, flattened
into a single one-dimensional array (row-major: `j` outer, `i` inner).

**Syntax**

    var
      <name> : array[<width> * <height>] of <type> =
        buildtable2d(<width>, <height>, "<js expression>");

**Example**

```pascal
var
  grid : array[64] of byte = buildtable2d(8, 8, "i+j*8");
```

## `case`

**Description:** A multi-way branch on a single value, Pascal-style:
evaluates an expression once and runs the statement next to the matching
value.

**Syntax**

    case <expression> [onpage | offpage] of
      <value1>: <statement>;
      <value2>: <statement>;
      ...
    else
      <statement>;
    end;

The `else` branch is optional; if omitted, no branch runs when the expression
matches nothing listed. `onpage`/`offpage` is also optional; see
[`onpage`](#onpage)/[`offpage`](#offpage).

**Known limitations**

- A `case` statement whose `else` branch is a single statement (not wrapped
  in its own `begin...end`) fails to compile, and the error doesn't point at
  the `case` statement — it surfaces at the very end of the file, as a
  confusing parse error near the file's own closing `end.`. **Workaround:**
  always wrap the `else` block in `begin...end`:

  ```pascal
  case x of
    0: y := 1;
  else begin
    y := 0;
  end;
  end;
  ```

- Forcing `onpage`/`offpage` on a `case` statement has no effect at all: both
  parse without error, but the generated comparison code is unaffected
  either way — it's a silent no-op on `case` specifically (unlike on
  `if`/`while`/`for`, where it works as documented).

## `compressed`

**Description:** A flag on an array, string, or c-string declaration that
compresses its initializer data at compile time (via the compiler's bundled
LZ4 implementation), so it takes less space in the final compiled output.

**Syntax**

    var
      <name> : array[<count>] of <type> compressed = (<values>);

The flag can also appear right after `of`, before the element type:
`array[<count>] of compressed <type> = (...)`. Both positions are accepted.

**Known limitations**

- Nothing in the language decompresses this data back at runtime. It's
  useful for shrinking the data embedded in the compiled output, but not for
  a compress-then-decompress-at-runtime round trip — there is no built-in
  counterpart that reads a `compressed`-flagged initializer back out.

## `const`

**Description:** Declares a named, compile-time constant. Unlike a regular
variable, a `const` occupies no storage: every use of its name resolves to
its literal value at compile time.

**Syntax**

    var
      const <name> : <type> = <value>;

`const` declarations are written as individual lines *inside* the same `var`
block as regular variables, not as a separate top-level section. `<type>`
must be `address`, `byte`, `integer`, or `long`.

**Example**

```pascal
const maxLives : byte = 3;
```

## `continue`

**Description:** Skips the rest of the current loop iteration and jumps
straight to the next one, in the innermost enclosing loop. In a `for`/`fori`
loop this still runs the loop's own step/increment before re-testing the
condition.

**Syntax**

    continue;

## `do`

**Description:** Separates a loop's header (the `for`/`fori`/`while`
condition) from its body.

**Syntax**

    for <var> := <from> to <to> do <statement or block>
    while (<condition>) do <statement or block>

## `else`

**Description:** The optional branch of an `if`/`then` statement that runs
when the condition is false. Also usable inside [`case`](#case), as its
optional default branch.

**Syntax**

    if (<condition>) then <statement>
    else <statement>;

As in standard Pascal, there must be **no semicolon** directly before `else`
— a semicolon ends the whole `if` statement, detaching `else` from it.

## `end`

**Description:** Closes a block opened by [`begin`](#begin), or a
[`case`](#case) statement. The program's own top-level block is closed with
`end.` (trailing period), marking the end of the whole file; every other
`end` is followed by a semicolon.

**Syntax**

    begin
      <statements>
    end;

    // only for the program's own top-level block:
    begin
      <statements>
    end.

## `for`

**Description:** A counted loop: runs a block once per value of a loop
variable, counting up from a start value to an end value. `for` is the
**exclusive** form — the end value itself is not included. See
[`fori`](#fori) for the inclusive variant.

**Syntax**

    for <var> := <start> to <end> do
        <statement>;

    for <var> := <start> to <end> do
    begin
        <statements>;
    end;

[`step`](#step), `unroll`, `loopx`, `loopy`, [`onpage`](#onpage), and
[`offpage`](#offpage) modifiers can appear between `to <end>` and `do`.

**Example**

```pascal
for i := 0 to 10 do   // body runs with i = 0..9
```

**Known limitations**

- The loop body always runs **at least once**, even if the end value is
  already behind the start value — `for`/`fori` only check the range after
  each pass through the body, never before entering it. `for i := 5 to 0 do
  ...` doesn't skip the loop like a typical exclusive range would; it runs
  once with the start value, then keeps counting up and wraps around the
  counter's full range until it happens to land back on the end value,
  running far more times than intended. If the end value can be behind the
  start value at runtime, guard the loop with an explicit `if` first.

## `fori`

**Description:** The **inclusive** counted loop: identical to [`for`](#for),
except the end value itself is included as the loop body's last pass. Not
every target supports it; compilation fails with a clear error if the
current one doesn't.

**Syntax**

    fori <var> := <start> to <end> do
        <statement>;

Same `step`, `unroll`, `loopx`, `loopy`, `onpage`, `offpage` modifiers as
[`for`](#for) are available before `do`.

**Example**

```pascal
fori i := 0 to 10 do  // body runs with i = 0..10
```

**Known limitations**

- Shares [`for`](#for)'s "always runs at least once" behavior: `fori i := 5
  to 0 do ...` doesn't skip the loop, it runs once and then wraps around the
  full counter range before stopping. See `for`'s Known limitations.

## `forward`

**Description:** Declares a procedure or function's signature without its
body, so it can be called before its real implementation appears later in
the file. Used for mutual recursion, or simply to control declaration order.

**Syntax**

    procedure <name>(<params>); forward;

    // ... later in the same file ...

    procedure <name>(<params>);
    begin
        <statements>;
    end;

The real definition that follows must repeat the same parameter list.

**Example**

```pascal
procedure Ping(); forward;

procedure Pong();
begin
	Ping();
end;

procedure Ping();
begin
	// ...
end;
```

## `function`

**Description:** Declares a procedure that returns a value; otherwise
behaves like an ordinary procedure (same parameter syntax, same
`forward`/`inline`/`assembler` modifiers).

**Syntax**

    function <name>(<params>) : <returnType>;
    begin
        <statements>;
        <name> := <value>;
    end;

The return value is set by assigning to the function's own name inside its
body, Pascal-style — not with a `return <value>` statement (`return` just
exits the current procedure/function early, without setting a value). Only
`byte`, `integer`, `boolean`, and `long` are currently supported as return
types.

**Example**

```pascal
function Double(x : byte) : byte;
begin
	Double := x + x;
end;
```

## `global`

**Description:** A parameter-declaration flag that binds a procedure/
function parameter directly to an existing global variable of the same name,
instead of giving the parameter its own private storage. A call compiles
down to a plain assignment into that global variable, followed by the call —
no parameter-passing overhead.

**Syntax**

    procedure <name>(<param> : global <type>);

A global variable named exactly `<param>` must already be declared (in the
top-level `var` block) before the procedure is declared.

**Example**

```pascal
var c : byte;

procedure SetC(c : global byte);
begin
	// ...
end;
```

**Known limitations**

- Because a `global` parameter is really just the one shared variable
  underneath, it isn't safe for recursion or reentrancy: if the procedure
  calls itself, or gets interrupted by a handler that calls it again, the
  second call's argument overwrites the first's, since there's only ever one
  storage location involved.

## `if`

**Description:** The standard conditional statement: runs one branch of code
if a condition is true, and optionally a different branch (via
[`else`](#else)) if it's false.

**Syntax**

    if <condition> then
        <statement>;

    if <condition> then
        <statement>
    else
        <statement>;

    if <condition> then
    begin
        <statements>;
    end
    else
    begin
        <statements>;
    end;

`<condition>` is any boolean expression (comparison, `and`/`or`/`not`
combination, or a boolean variable).

## `inline`

**Description:** A procedure/function modifier requesting that every call
site have the body's code inserted directly in place, instead of a real
call/return. A simple parameter (a plain variable or numeric literal) is
passed by direct text substitution; anything more complex is substituted the
same way, which is exactly the source of this keyword's known limitation.

**Syntax**

    procedure <name>(<params>) inline;
    begin
      ...
    end;

Goes right after the closing `)` of the parameter list (and before a
function's `: <returnType>`, if any).

**Known limitations**

- Passing anything more complex than a plain variable or numeric literal
  isn't reliable if the parameter is referenced more than once inside the
  body. An `inline` procedure doesn't evaluate its parameters once and store
  the result — the parameter expression's own text is substituted in at
  every reference inside the body. For an array index, a pointer
  dereference, or any computed expression, referencing the parameter more
  than once re-evaluates the whole expression each time, which can
  duplicate side effects or produce a different result than expected.
  **Workaround:** copy the value into a local temp variable first and pass
  that instead:

  ```pascal
  tmp := someArray[complexIndex];
  SetValue(tmp);
  ```

## `interrupt`

**Description:** Declares a procedure as an interrupt handler instead of an
ordinary procedure. Used exactly like `procedure`, but the compiler ends the
generated routine with an interrupt-return instead of a normal one, so it
can be installed as an interrupt handler.

**Syntax**

    interrupt <name>();
    begin
      ...
    end;

**Example**

```pascal
interrupt UpdateFrame();
begin
	frameCounter := frameCounter + 1;
end;
```

## `invert`

**Description:** A type flag for `cstring` variables that sets the high bit
on every character's byte value at compile time, useful for text formats
where the high bit of a character byte flags reverse/inverted display.

**Syntax**

    var
      <name> : cstring invert = "<text>";

**Example**

```pascal
message : cstring invert = "HELLO";
```

**Known limitations**

- Only allowed on `cstring` declarations; using it on any other type is a
  compile error.

## `krillsloader`

**Description:** A C64-only argument to `@use` that sets up Krill's Loader,
a third-party C64 disk fastloader/installer. **Not applicable to TVC** — it
exists in the shared TRSE grammar but its whole purpose (bundling a C64 disk
fastloader, wiring up C64-specific loader builtins) is C64 hardware, and it
has no TVC counterpart. Included here only for completeness/traceability.

## `length`

**Description:** Returns the number of elements in an array (or the declared
size of a string), as a compile-time constant, worked out entirely from the
variable's own declaration.

**Syntax**

    length(<variable>)

`<variable>` must be an actual declared variable, not an arbitrary
expression. For a `byte` array this is the same as its declared size; for
`integer`/`long`/pointer arrays it's the element count, not the byte count
(`array[10] of integer` reports `10`, not `20`) — see [`sizeof`](#sizeof) for
the byte-count version.

## `no_term`

**Description:** A flag on a `string`/`cstring` declaration that suppresses
the automatic terminator byte normally appended after the text data — useful
for building a raw, fixed-width lookup table out of character data instead
of a terminated string.

**Syntax**

    name : cstring = ( "a", "b", ... ) no_term;
    name : no_term string[<size>];

Can appear either right after the initializer or right before the type; both
are accepted.

**Example**

```pascal
raw : cstring = ("A","B","C") no_term;
```

**Known limitations**

- Only legal on `string`/`cstring` declarations; using it on any other type
  is a compile-time error, not a silent no-op.

## `of`

**Description:** Grammar glue, not a standalone statement. Links a bound (an
array size) or a pointer to the element type that follows it, and separates
a [`case`](#case) statement's expression from its list of branches.

**Syntax**

    name : array[<size>] of <type> [= (v1, v2, ...)];
    name : array[] of <type> = (v1, v2, ...);   // size inferred from the list

    name : pointer of <type>;
    name : lpointer of <type>;

    case <expression> of
      ...
    end;

`<type>` can also be `buildtable(...)`, `buildsinetable(...)`, or
`buildtable2d(...)` in the array form, to auto-generate the initializer at
compile time.

**Known limitations**

- Arrays can't be nested directly: `array[N] of array[M] of byte` is
  rejected rather than working as a 2D array. Use a record wrapping an
  array, or manual index arithmetic (`row*width + col` into a flat array),
  for grid-shaped data instead.

## `offpage`

**Description:** A manual override on `if`, `while`, `for`, or `case`,
forcing the compiler to generate a long jump instead of a short relative
branch for that statement's condition, regardless of how big the block turns
out to be. See [`onpage`](#onpage) for the opposite override, and for the
normal automatic behavior this overrides.

**Syntax**

    if <condition> offpage then ...
    while <condition> offpage do ...
    for <var> := <start> to <end> [step <n>] offpage do ...
    case <expression> offpage of ... end;
    repeat ... until <condition> offpage;

**Known limitations**

- Has no effect at all on a `case` statement: `case <expr> offpage of ...`
  parses without error, but the generated comparison code is unaffected
  either way — a silent no-op.
- Not usable on `repeat...until` at all: writing `until <condition>
  offpage;` produces a confusing, misplaced parse error rather than
  applying the override, even though the code generator has working support
  for it there.

## `onpage`

**Description:** A manual override on `if`, `while`, `for`, or `case`,
forcing the compiler to use a short relative branch even if its own size
check would otherwise have chosen a long jump. The opposite of
[`offpage`](#offpage); see that entry for the normal automatic behavior this
overrides.

**Syntax**

    if <condition> onpage then ...
    while <condition> onpage do ...
    for <var> := <start> to <end> [step <n>] onpage do ...
    case <expression> onpage of ... end;
    repeat ... until <condition> onpage;

**Known limitations**

- No safety check backs this up on `if`/`while`/`for`: forcing `onpage`
  tells the compiler to emit a short relative branch unconditionally, and if
  the block turns out too large for that branch's range, nothing catches the
  mistake at compile time — it can surface much later, at the assembler
  stage, as a confusing error pointing at a generated internal label rather
  than the `onpage` keyword itself.
- Has no effect at all on a `case` statement, same silent no-op as
  [`offpage`](#offpage).
- Not usable on `repeat...until`: `until <condition> onpage;` desyncs the
  parser instead of applying the override, same as `offpage` in that
  position.

## `private`

**Description:** Reserved as part of a `class`/`record` member-visibility
system (paired with `public`), in the usual Pascal/object-oriented sense of
marking a field or method internal to the type. **Not currently usable.**

**Syntax**

    <ClassName> = class
      private
        <fields>
      public
        <fields/methods>
    end;

**Known limitations**

- Using `private` (or `public`) as a class/record visibility section is a
  hard compile error, not a silently-ignored no-op — neither keyword is
  actually read while parsing a `class`/`record` body. In practice, every
  field and method in a TRSE `class`/`record` is effectively public; there
  is currently no way to mark a member private.

## `procedure`

**Description:** Declares a named, callable block of statements,
Pascal-style. Compiles down to a real subroutine call (jump to a label, run
the body, jump back), not inlined text, unless separately marked
[`inline`](#inline).

**Syntax**

    procedure <name>(<params>);
    begin
        <statements>;
    end;

    procedure <name>(<params>); forward;   // declare signature only
    procedure <name>(<params>); assembler; // body is raw assembler

`<params>` is a comma-separated list of `name : type` pairs. Each parameter
can optionally carry a flag before its type:

- plain (no flag): copied into the parameter's own storage before the call.
- [`global`](#global): aliases an existing global variable of the same name.
- [`stack`](#stack): lives on a real runtime stack (pushed before the call,
  popped after). Only `byte` parameters are currently allowed with this
  flag.

A [`function`](#function) is the same thing with a return value: add
`: <returnType>` after the parameter list.

## `program`

**Description:** Opens every top-level source file, giving the compiled
program a name. Mandatory — every source file must start with one.

**Syntax**

    program <name>;

    <declarations>

    begin
        <statements>
    end.

`<name>` can be any valid identifier; it doesn't need to match the filename.
Note the trailing `.` (not `;`) on the final `end` of the program's own
block — that marks the end of the whole file.

**Known limitations**

- The name isn't purely cosmetic: it's emitted as a real label at the very
  start of the generated assembly output. Because of this, a name that
  happens to start with the word "repeat" (case-insensitive), such as
  `RepeatDemo`, can be misread by an unrelated part of the assembler as the
  start of an inline-assembler unrolling block (see [`repend`](#repend)),
  causing a confusing compile failure that has nothing to do with the
  program's actual code. Simply avoiding that word as a name prefix
  sidesteps it entirely.

## `public`

**Description:** Reserved as part of a `class`/`record` member-visibility
system (paired with `private`), meant to mark a field or method externally
accessible. **Not currently usable.**

**Syntax**

    <ClassName> = class
      private
        <fields>
      public
        <fields/methods>
    end;

**Known limitations**

- Using `public` (or `private`) as a class/record visibility section is a
  hard compile error, not a silently-ignored no-op, for the same reason
  described under [`private`](#private).

## `repeat`

**Description:** A post-condition loop, Pascal-style: the body always runs
at least once, then repeats until the paired [`until`](#until) condition
becomes true.

**Syntax**

    repeat
        <statements>
    until <condition>;

No `do`, and no `begin`/`end` needed around the body — the statement list
between `repeat` and `until` is the body.

**Example**

```pascal
repeat
	i := i + 1;
until (i = 10);
```

**Known limitations**

- Naming the program (or, seemingly, any procedure/variable) something that
  starts with the literal word "repeat", case-insensitively, can cause an
  unrelated compile failure that has nothing to do with this loop — a
  naming collision with the separate `repeat <count>`/[`repend`](#repend)
  inline-assembler unrolling feature's detection logic (which scans
  generated assembly text for any line starting with "repeat", including an
  auto-generated name label). The `repeat...until` loop itself is always
  unaffected and works correctly; simply avoid "repeat" as the start of a
  program/procedure/variable name. See [`repend`](#repend).

## `repend`

**Description:** Closes a `repeat N` inline-assembler unrolling block. A
separate feature from the Pascal-level [`repeat`](#repeat)/[`until`](#until)
loop: it operates on raw text inside an [`asm`](#asm) block, duplicating a
sequence of assembler lines a fixed number of times instead of using a real
runtime loop — useful for hand-optimized, branch-free hot code.

**Syntax**

    asm
        repeat <count>
            <lines to duplicate>
        repend
    end;

    asm
        repeat <countX> <countY>
            <lines to duplicate>
        repend
    end;

`<count>` (or `<countX> <countY>` for the two-dimensional form) must be a
positive whole number; the block is duplicated that many times (or
`countX * countY` times). Inside the duplicated lines, `[i]`, `[i+1]`,
`[i-1]`, and similar bracketed expressions are replaced with the current
iteration's index each time the block repeats.

**Example**

```pascal
asm
	repeat 5
		nop
	repend
end;
```

**Known limitations**

- A program, procedure, or variable name that happens to start with the word
  "repeat" (case-insensitively) can be mistaken for the start of an unroll
  block, even in code that never uses `repeat`/`repend` at all — the
  detection scans every line of the already-generated assembly text for one
  that starts with "repeat" rather than checking that the rest of the line
  actually looks like a valid `repeat <count>` directive. See
  [`repeat`](#repeat)'s Known limitations for the full explanation; avoid
  starting a program/procedure/variable name with that word.

## `return`

**Description:** Exits the current procedure or function immediately,
skipping any remaining statements. Works like
[`break`](#break)/[`continue`](#continue) do for loops, except it exits the
whole procedure rather than just an iteration.

**Syntax**

    return;

Takes no value and no parentheses; a plain `return;` is enough (an optional
empty `return();` is also accepted).

**Known limitations**

- `return;` always exits the same way a procedure normally falls off its own
  `end;`, regardless of what kind of procedure it's used in. Inside an
  `interrupt` procedure specifically, that's the wrong exit: `return;` used
  partway through an interrupt handler's body leaves the interrupt without
  properly restoring processor state on the way out, unlike reaching the
  handler's own `end;` naturally, which does it correctly. Use a dedicated
  interrupt-safe return builtin (e.g. `ReturnInterrupt`) instead of `return;`
  for an early exit from inside an `interrupt` procedure.

## `signed`

**Description:** A variable declaration modifier that marks a numeric
variable as holding a signed value (negative numbers allowed), rather than
the default unsigned interpretation. Changes how comparisons, arithmetic,
and type-widening code the compiler generates for that variable behave, not
just how it's displayed.

**Syntax**

    var
        <name> : signed <type>;

Goes before the base type in the declaration. `<type>` is `byte`, `integer`,
or `long`.

**Example**

```pascal
var dx : signed byte;
```

**Known limitations**

Signed arithmetic and comparisons are unevenly implemented:

- 16-bit signed comparison is incomplete: for `signed integer`, only `<` and
  `<=` are implemented; every other comparison operator (`>`, `>=`, `=`,
  `<>`) throws a compile error instead of producing wrong code. Signed
  comparison for `signed long` isn't implemented at all — any comparison
  operator errors out.
- Byte-level signed comparison is unverified at the extremes (comparing,
  e.g., `-128` and `127`), because the generated code doesn't apply the same
  overflow correction the 16-bit `<`/`<=` case does.
- Signed multiplication (`*`) silently gives the wrong result for a negative
  operand widened to a wider type — the multiply routine wired up behind `*`
  is always the unsigned one, regardless of whether either operand is
  `signed`.
- Signed division (`/`) isn't implemented at all — division always uses
  unsigned arithmetic, ignoring the `signed` modifier entirely.
- Mixing a `signed byte` into a wider expression (`integer`) always
  zero-extends instead of sign-extending: a negative signed byte widened to
  16 bits should keep its negative value, but instead comes out as the small
  positive value its raw bit pattern represents.
- Signed right shift (`shr`/`>>`) always fills in `0`s instead of preserving
  the sign — shifting a negative signed value right gives a wrong, positive
  result rather than a proper arithmetic shift.

## `sizeof`

**Description:** Returns the size of a variable in bytes, as a compile-time
constant, worked out entirely from its declaration (or, for an `incbin`
variable, the size of the loaded file). Always counts raw bytes — different
from [`length`](#length), which counts elements (`array[10] of integer`:
`length()` is `10`, `sizeof()` is `20`).

**Syntax**

    sizeof(<variable>)

`<variable>` must be an actual declared variable (or record), not an
arbitrary expression.

## `stack`

**Description:** A modifier on a procedure/function parameter that passes it
through a real runtime stack, instead of TRSE's normal fixed-memory-location
parameter passing. This is what makes working recursion possible: TRSE
normally gives each parameter one fixed address, so a recursive call
clobbers the location its own caller is still using. A `stack` parameter
gets a genuine, separate slot per call.

**Syntax**

    function <name>(<param> : byte stack) : <returnType>;

**Example**

```pascal
function Factorial(p : byte stack) : byte;
begin
	if (p > 1) then
		p := p * Factorial(p - 1);
	Factorial := p;
end;
```

**Known limitations**

- Only `byte` parameters can be flagged `stack`; `integer`, `word`, `long`,
  an array, a pointer, or any other type fails to compile.
- Only valid on a procedure/function parameter, not on an ordinary `var`
  declaration.

## `step`

**Description:** An optional modifier on a [`for`](#for)/[`fori`](#fori)
loop header that sets how much the loop counter advances by each pass,
instead of the default of `1`.

**Syntax**

    for <var> := <start> to <end> step <amount> do
        <statement>;

`<amount>` can be any expression, not just a literal number.

**Example**

```pascal
for i := 0 to 10 step 2 do
	total := total + i;
```

**Known limitations**

- A `step` that doesn't evenly divide into the loop's range can cause the
  counter to skip right over the end value and keep going until it wraps
  around the full range — the loop only checks whether the counter has
  landed *exactly* on the end value, never whether it's passed it. `step 3`
  on `for i := 0 to 10 ...` never lands exactly on `10` (`0, 3, 6, 9, 12,
  ...`), so it runs far longer than intended.

## `then`

**Description:** Separates an [`if`](#if) statement's condition from the
branch of code that runs when the condition is true.

**Syntax**

    if <condition> then
        <statement>;

    if <condition> then
        <statement>
    else
        <statement>;

**Known limitations**

- `if` and `while` are parsed by shared code that doesn't check which of the
  two it's parsing before accepting the separator keyword. In practice,
  `then` is silently accepted after a `while` condition (in place of the
  idiomatic `do`), and `do` is silently accepted after an `if` condition (in
  place of the idiomatic `then`). Neither is standard style and neither
  should be relied on, though both compile without error.

## `to`

**Description:** Separates a [`for`](#for) loop's start value from its end
value. Used nowhere else in the language.

**Syntax**

    for <var> := <start> to <end> do
        <statement>;

**Known limitations**

- The value after `to` is only checked for equality against the loop
  counter, not compared as an upper bound. See [`for`](#for)'s Known
  limitations for what this means in practice.

## `type`

**Description:** Declares a named alias for a type expression (an array
shape, a record, a pointer, etc.) so that name can be reused instead of
writing the full type expression out again in every `var` declaration that
needs it.

**Syntax**

    var
      type <name> = <type expression>;

Written as an individual line *inside* the same `var` block as regular
variables, the same way [`const`](#const) works. `<type expression>` is
anything valid on the right-hand side of a variable declaration's colon,
most usefully `array[<size>] of <type>`.

**Example**

```pascal
type TByteArray = array[4] of byte;
```

## `unit`

**Description:** Declares a source file as a reusable unit: a separate file
of variables, procedures, and functions that a program (or another unit)
pulls in with `@use`. Plays the same role as `program` does for a
compiled-on-its-own file.

**Syntax**

    unit <name>;

    var
      <declarations>

    <procedure/function declarations>

    end.

`<name>` becomes the prefix (`<name>::`) used to reach the unit's
procedures/functions/variables from wherever it's `@use`d, and the filename
it's looked up by.

**Known limitations**

- A unit file needs a `var` block even if it declares no variables in it;
  leaving it out entirely fails to compile.

## `unroll`

**Description:** A [`for`](#for)/[`fori`](#fori) loop modifier that expands
the loop at compile time instead of generating a runtime loop: the body is
emitted once per iteration, back to back, with the loop variable replaced by
the actual literal value for that pass. Trades code size for speed (and
removes loop-counter overhead entirely).

**Syntax**

    for <var> := <start> to <end> unroll do
        <statement>;

`<start>` and `<end>` must both be constant, compile-time-known values, not
variables or runtime expressions.

**Example**

```pascal
for i := 0 to 4 unroll do
	total := total + 1;
```

**Known limitations**

- On `fori`, `unroll` always treats the end value as **exclusive**, silently
  dropping the loop's last, inclusive pass — [`fori`](#fori)'s whole point
  versus plain `for` is that the end value is normally included, but
  unrolling doesn't look at whether the loop was written as `for` or `fori`
  at all; it always expands up to, but not including, the end value. A
  plain (non-unrolled) `fori` loop is unaffected.

## `until`

**Description:** Pairs with [`repeat`](#repeat) to close a post-condition
loop: the condition after `until` is checked after each pass through the
body, and the loop keeps running while it's false, exiting the moment it
becomes true. Used nowhere else in the language.

**Syntax**

    repeat
        <statements>
    until <condition> [onpage | offpage];

**Known limitations**

- `onpage`/`offpage` cannot be applied to a `repeat...until` loop at all,
  even though the code generator has full working support for both
  directions here — writing either keyword on a `repeat...until` loop
  desyncs the parser instead of applying the override. See
  [`onpage`](#onpage)'s Known limitations.

## `var`

**Description:** Opens a block of variable declarations. Every program,
procedure, function, and unit that declares any variables (or
[`const`](#const)/[`type`](#type) entries) starts one with `var`.

**Syntax**

    var
      <name> : <type>;
      <name> : <type> = <initial value>;
      <name1>, <name2>, ... : <type>;

A `var` block declared at the top of a `program` (or `unit`) is global,
visible everywhere after it. A `var` block declared inside a
[`procedure`](#procedure)/`function` is local to that procedure/function
instead.

## `volatile`

**Description:** A variable declaration modifier that stops the
post-optimizer from removing or merging accesses to that variable. Needed
for a variable that changes outside the compiler's view of normal program
flow, such as one written by an [`interrupt`](#interrupt) handler and read
from the main loop — without it, the optimizer can see a repeated load as
redundant and strip it, even though the value could have changed via the
interrupt in the meantime.

**Syntax**

    var
        <name> : volatile <type>;

Goes before the base type, the same position as [`signed`](#signed).

**Example**

```pascal
frameCounter : volatile byte = 0;
```

## `wedge`

**Description:** Declares a procedure the same way [`interrupt`](#interrupt)
does: used in place of `procedure`, compiled with an interrupt-return
instruction at the end instead of a normal one, so it can be installed as an
interrupt handler.

**Syntax**

    wedge <name>();
    begin
      ...
    end;

**Known limitations**

- Compiles to exactly the same code as [`interrupt`](#interrupt), with no
  distinct behavior of its own. The specific "wedge" behavior (chaining onto
  an already-installed interrupt vector instead of replacing it outright)
  lives entirely in separate builtin functions, unrelated to this
  declaration keyword. Treat `wedge` and `interrupt` as interchangeable
  spellings at the declaration level.

## `while`

**Description:** A pre-condition loop: the condition is checked before each
pass through the body, so the body may run zero times if the condition is
already false. The counterpart to
[`repeat`](#repeat)/[`until`](#until), which always runs the body at least
once.

**Syntax**

    while (<condition>) do
        <statement>;

    while (<condition>) do
    begin
        <statements>;
    end;

`onpage`/`offpage` can be applied the same way as on [`if`](#if).

---

## Excluded (SANE-only, not real TRSE)

None. Every page under `reference/keywords/` in the source documentation
carried a `TRSE` or `TRSE (modified in SANE)` tag — no page was tagged
`SANE`-only, so nothing was excluded from this reference.
