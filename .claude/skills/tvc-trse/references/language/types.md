# TRSE types

The built-in base types available in TRSE, plus the small set of
type-system modifiers (`pure`, `pure_number`, `pure_variable`) that
constrain how a value can be used rather than describing storage. These
are all compiler-frontend, platform-independent language mechanics —
they behave the same whether the compile target is the C64 or the
Videoton TV-Computer (TVC) — **except** where a Known Limitations note
below says otherwise, and except `cstring`, which is flagged separately
as an open question for this skill (see its section).

Content here is sourced from SANE's TRSE documentation (bundled at
`sources/sane-trse-docs/`), filtered to **vanilla TRSE** behavior only:
where a page is tagged `TRSE (modified in SANE)`, this file documents the
original/vanilla behavior, including any bug, not SANE's fix. Pages
tagged plain `TRSE` have identical behavior in both compilers. See the
"Excluded" section at the end for anything left out and why.

## Numeric types

### `byte`

An 8-bit unsigned value, `0` to `255`. The smallest and most commonly
used numeric type, matching the width of a single memory
location/register. Add `signed` before it for a signed interpretation
(`-128` to `127`) instead.

**Syntax**

```
var
    <name> : byte;
    <name> : byte = <initial value>;
    <name> : signed byte;
```

- `<name>`: the variable's identifier.
- `<initial value>`: optional, `0`-`255` (or `-128`-`127` for `signed
  byte`).

**Known limitations**

- Widening a `signed byte` into a wider type (`integer`) always
  zero-extends instead of sign-extending. A negative `signed byte`
  should keep its negative value when mixed into 16-bit arithmetic
  (`-1` becoming `$FFFF`), but instead comes out as the small positive
  value its raw bit pattern represents (`$FF` becomes `$00FF`, i.e.
  `255`). A plain (unsigned) `byte` widening into `integer` is
  unaffected, always correct.

### `integer`

A 16-bit value, `0` to `65535` unsigned, or `-32768` to `32767` with
`signed`. The general-purpose "word-sized" numeric type; there is no
separately-spelled `word` type, `integer` is the only 16-bit type.

**Syntax**

```
var
    <name> : integer;
    <name> : integer = <initial value>;
    <name> : signed integer;
```

- `<name>`: the variable's identifier.
- `<initial value>`: optional, `0`-`65535` (or `-32768`-`32767` for
  `signed integer`).

**Known limitations**

- Signed comparison is incomplete: for a `signed integer`, only `<`
  and `<=` are implemented; every other comparison operator (`>`, `>=`,
  `=`, `<>`) fails to compile with "Signed integer comparison: only
  'less' is currently implemented."

### `long`

A 24-bit value, stored as three bytes. Available on every 6502-family
target, not just wider CPUs; useful for a counter or address range that
outgrows a 16-bit `integer` without reaching for full 32-bit arithmetic.

**Syntax**

```
var
    <name> : long;
    <name> : long = <initial value>;
```

- `<name>`: the variable's identifier.
- `<initial value>`: optional, a 24-bit constant.

**Known limitations**

Several operations that work correctly on `byte`/`integer` are
incomplete or wrong specifically for `long`:

- Signed comparison isn't implemented at all for `signed long`; every
  comparison operator fails to compile with "Signed long comparison not
  implemented yet."
- Bitwise `&`/`|`/`xor`/`^` silently miscompute the result when the
  right-hand operand is a non-trivial expression rather than a plain
  variable: the top byte isn't combined into the result at all (it's
  overwritten with the right operand's own top byte), and the middle
  byte can come out off by one.
- `Lo`/`Hi`/`bankbyte` are all a silent no-op on a `long` value: no
  code at all is emitted, unlike on a `pointer`, where all three work
  correctly.
- `abs()` only negates the low byte of a `long` (checking the wrong
  byte for the sign, leaving the other two untouched), giving a wrong
  result for any negative `long`.
- `long` multiplication and division aren't supported at all; `*`/`/`
  on two `long` operands is a compile error, not a silently wrong
  result.
- A negative decimal literal with a magnitude of 65536 or higher
  (needed to fit in 24 bits but not 16) is silently truncated to a
  16-bit magnitude, both as a `var`-declaration initializer
  (`lv : long = -100000;`) and in ordinary code (`lv := -100000;`),
  storing the wrong value with no error or warning. A related, smaller
  gap: a small-magnitude negative literal (one that fits in a single
  byte, like `-1`) compared directly against a `long` variable isn't
  sign-extended for the comparison's upper two bytes, so
  `if (lv = -1)` can wrongly compare unequal even when `lv` really is
  `-1`.

### `boolean`

A true/false value. Used for flags, loop/`if` conditions, and the
result of a comparison or logical expression (`and`, `or`, `not`).

**Syntax**

```
var
    <name> : boolean;
    <name> : boolean = true;   // or false
```

- `<name>`: the variable's identifier.
- `true`/`false`: the two literal values a `boolean` can hold.

No known limitations reported.

## Structural types

### `array`

A fixed-size, zero-indexed sequence of elements sharing one type,
declared with a compile-time-known (or initializer-list-inferred) size.

**Syntax**

```
name : array[<size>] of <type>;
name : array[<size>] of <type> = (v1, v2, ...);
name : array[] of <type> = (v1, v2, ...);   // size inferred from the list
```

- `<size>`: the element count, a compile-time constant. Can be omitted
  (`array[]`) when an initializer list is given, in which case the size
  is inferred from how many values are listed.
- `<type>`: the shared element type: `byte`, `integer`, `boolean`, a
  `record`/`class` name, or another named type.

**Known limitations**

- Arrays can't be nested directly: `array[N] of array[M] of byte` is
  rejected. Workaround: a flat array with manual `row*width + col`
  indexing, or a record wrapping an array.
- An array of `record` can't use a record type that itself contains an
  array field: `array[N] of SomeRecord` fails to compile if
  `SomeRecord` has an array member, with an explicit error naming the
  record type. This restriction is specific to `record`; a `class`
  with an array field can be used as an array element type without
  triggering it.
- Whole-array assignment (`b := a;` for two same-shaped arrays) isn't
  supported: it fails to compile with a message suggesting `#a` (taking
  its address) instead. Copy element-by-element in a loop, or use
  `MemCpy`/`BlockMemCpy` for a raw byte-range copy.

### `record`

A fixed collection of named fields grouped under one type, like a
Pascal record or a C struct. The base for `class` (a `record` that can
also declare its own methods); a plain `record` has fields only, no
methods.

**Syntax**

```
var
    <RecordName> = record
        <field1>, <field2>, ... : <type>;
    end;

    <name> : <RecordName>;
    <name>.<field> := <value>;
```

- `<RecordName>`: the type name, defined once inside a `var` block,
  then usable as an ordinary type anywhere after (including as an
  `array` element type, or a field's own type for nesting).
- `<field>`: any of the record's declared fields, accessed with `.`.

**Known limitations**

- Whole-record assignment always fails. `p2 := p1;` (no field selector
  on either side, for two variables of the same record type) fails to
  compile with "Cannot assign a record of type '&lt;name&gt;' to a
  single variable," for any `record` shape. This isn't a deliberate
  restriction — working field-by-field copy code exists in the
  compiler for exactly this case, but an earlier, unconditional check
  rejects the assignment before that code is ever reached. Copying
  each field individually, as `p2.x := p1.x; p2.y := p1.y;`, works,
  and remains the only way to copy a `class` (see below).
- A pointer field inside a record/class isn't allowed; every field
  must be a plain value type, another record/class instance, or an
  array of one.
- An array of records can't use a record type that itself has an
  array field (`array[N] of SomeRecord` fails to compile if
  `SomeRecord` contains an array member; a single, non-array instance
  of the same record is unaffected). This restriction doesn't apply to
  `class`.
- `private`/`public` visibility keywords exist but have no working
  implementation for record (or class) members. Every field is
  effectively public.

### `class`

A `record` that can also declare its own procedures/functions alongside
its fields, using `this` inside those methods to refer to the calling
instance. Otherwise declared and used exactly like a `record`: plain
fields, array fields, and instances (or arrays of instances) all work
the same way.

**Syntax**

```
var
    <ClassName> = class
        <field1>, <field2>, ... : <type>;

        procedure <MethodName>(<params>);
        begin
            this.<field> := ...;
        end;
    end;

    <name> : <ClassName>;
    <namePtr> : pointer of <ClassName>;
```

- `<ClassName>`: the type name, defined once inside a `var` block, then
  usable as an ordinary type anywhere after.
- `this`: inside a method body, refers to the specific instance the
  method was called on.
- A method is called as `<name>.<MethodName>(...)`, or
  `<namePtr>^.<MethodName>(...)` through a pointer.

**Known limitations**

- No inheritance: a `class` can't extend another `class`, so sharing
  behavior between related classes means composition (one class
  holding a field of another) rather than a base/derived relationship.
  This is a scope boundary rather than a bug.
- Unlike a plain `record`, a `class` is exempt from the "no array
  field in an array element type" restriction: `array[N] of SomeClass`
  compiles fine even when `SomeClass` has an array field.
- `private`/`public` visibility keywords exist but have no working
  implementation for either `record` or `class` members. Every field
  and method declared is effectively public.
- Whole-instance assignment (`hero2 := hero;`, for two variables of
  the same class type) compiles without any error, but silently
  doesn't copy any fields. Unlike a plain `record` (where the same
  shape of assignment is a compile error), a `class` was never blocked
  from compiling here — it just doesn't do the copy, and gives no
  warning that it didn't.

### `pointer`

A 16-bit memory address that can be dereferenced to read or write the
value it points to. Can point at a `byte`, `integer`, `long`, or a
`record`/`class` instance. Two equivalent declaration styles exist:
`^<type>` and `pointer of <type>`.

**Syntax**

```
var
    <name> : ^byte;
    <name> : ^integer;
    <name> : ^long;
    <name> : pointer of byte;
    <name> : pointer of <ClassOrRecordName>;

<name> := #<variable>;   // point at a variable's address
<name>^ := <value>;      // write through the pointer
<value> := <name>^;      // read through the pointer
```

- `<name>`: the variable's identifier.
- `<type>`: what the pointer targets: `byte`, `integer`, `long`, or a
  named `record`/`class` type. No other target type is accepted.

**Known limitations**

- No real pointer-to-pointer support, despite the language reserving a
  `ppointer` keyword for it: `ppointer` isn't actually wired up as a
  usable type at all (`var x : ppointer;` fails with "Unknown or
  illegal type"). The two spellings that look like they should give
  double indirection don't work either: `^pointer` is a hard compile
  error ("Must point to either byte, integers, long"), and
  `pointer of pointer` parses successfully but silently generates the
  exact same single-level indirect store as a plain byte pointer,
  i.e. it's not a real double dereference. There is currently no way
  to point at a pointer.

### `string`

A text literal stored as-is (plain, unconverted source text), with a
null terminator appended automatically. The type text-output builtins
(e.g. `printstring`/`Tile`) expect. See `cstring` below for the
pre-converted-encoding variant (flagged as a TVC open question — do not
assume it behaves the same way on TVC as described there).

**Syntax**

```
var
    <name> : string = "<text>";
    <name> : array[<size>] of string = ("<text1>", "<text2>", ...);
    <name> : string = "<text>" no_term;
```

- `<name>`: the variable's identifier.
- `"<text>"`: the literal text.
- `no_term`: optional flag, suppresses the trailing terminator byte.

**Known limitations**

- An `array` of `string` is really an array of pointers, not an array
  of inline text blocks: each string literal is emitted as its own
  separately addressed block of data, and the array itself just stores
  a table of 16-bit addresses pointing at them. This matters if the
  array's raw bytes are ever inspected or copied directly (e.g. with
  `MemCpy`): what's actually stored per element is an address, not the
  text itself.

### `address`

A 16-bit memory location: a hardware register, a fixed data address, or
anywhere else in the address space that a program needs to name.
Unlike `integer`, which holds an ordinary numeric value, `address` is
meant to identify *where* something lives, most often passed straight
into builtins like `Peek`/`Poke` instead of being read or written as a
value in its own right.

**Syntax**

```
const <name> : address = <address value>;
```

- `<name>`: the constant's identifier.
- `<address value>`: a 16-bit numeric literal, usually written in
  hexadecimal (e.g. `$D020`).

**Known limitations**

- `address` only works declared as a `const`. Declaring one as a
  plain `var`, with or without an initial value, and whether or not
  it's ever referenced anywhere in the program, is a compile error.
  Every real usage of this type declares it as `const`; there is
  currently no working way to have a mutable, runtime-assignable
  `address` variable. If a location genuinely needs to change at
  runtime, use a `pointer` instead, which supports normal assignment.
- Separately, a bare numeric literal address passed directly to
  several builtins (`Call`, `ClearBitmap`, and others) fails to
  assemble; a named `address` constant like the ones above always
  works correctly in every one of those cases, which is why naming the
  address first, then passing the name, is good practice.

## Parameter-modifier pseudo-types

These are not storage types — they don't describe how a value is kept
in memory. They're flags written after a procedure/function parameter's
type that restrict what kind of *argument* the caller may pass at that
call site. Mostly used in unit-authoring to pick between multiple
overloads of the same procedure at compile time (e.g. one overload for
a compile-time constant, another for a runtime variable), but usable in
any procedure/function declaration.

### `pure`

Restricts a parameter to either a compile-time constant number or a
plain variable reference, not a computed expression — the either/or of
the two narrower variants below.

**Syntax**

```
procedure <name>(<param> : <type> pure) inline;
begin
    ...
end;
```

**Known limitations**

- Passing anything more complex than a constant or a plain variable
  fails to compile, rather than being silently accepted: calling a
  procedure with a `pure` parameter using an expression (e.g.
  `SetLevel(level+1);`) fails with "Procedure 'SetLevel' requires
  parameter 0 to be a pure variable or number."

### `pure_number`

Restricts a parameter to a compile-time constant number only, rejecting
both computed expressions and plain variable references. The narrower
of `pure`'s two variants.

**Syntax**

```
procedure <name>(<param> : <type> pure_number) inline;
begin
    ...
end;
```

**Known limitations**

- Passing a variable instead of a constant fails to compile: "Procedure
  '...' requires parameter 0 to be a pure number / constant."

### `pure_variable`

Restricts a parameter to a plain variable reference only, rejecting
both computed expressions and literal constants. The opposite
restriction from `pure_number`.

**Syntax**

```
procedure <name>(<param> : <type> pure_variable) inline;
begin
    ...
end;
```

**Known limitations**

- Passing a literal instead of a variable fails to compile: "Procedure
  '...' requires parameter 0 to be a pure variable."

## Asset types

### `incbin`

Declares a variable whose storage is the raw bytes of an external
binary file, included directly at assemble time. With no address given,
the data sits inline with the program's other variables and is directly
indexable like a byte array; with an address, the bytes are placed at
that fixed location instead. Unlike `@bin2inc` (which writes a separate
source file to `@include`), `incbin` needs no intermediate file: the
binary is pulled in directly at the declaration. This is the mechanism
used throughout TVC projects to embed images, sprites, and other binary
asset data directly into a compiled program.

**Syntax**

```
var
    <name> : incbin("<file>");
    <name> : incbin("<file>", $<address>);
```

- `<name>`: the variable's identifier; also usable as a byte array
  (`<name>[<index>]`) when no fixed address is given.
- `<file>`: path to the binary file, resolved relative to the project
  file's own directory.
- `<address>`: optional, a fixed memory location to place the data at
  instead of packing it inline with other variables.

**Example**

```pascal
var
    rawData : incbin("sample_data.bin");
    i : byte;
    total : integer;
begin
    total := 0;
    for i:=0 to 7 do
        total := total + rawData[i];
end.
```

No known limitations reported.

### `cstring` — TVC open question, do not treat as documented

SANE describes `cstring` as: a text literal stored as C64 **screen
codes** instead of PETSCII/ASCII text, with every character converted
at compile time into the byte value the VIC-II expects in screen
memory, so the result can be copied straight into screen memory (or
color memory) with no runtime conversion step.

As a *type mechanism*, this is a genuinely useful, generic pattern
worth keeping in mind for TVC: **a string literal that gets
pre-converted, at compile time, into a target-specific byte encoding**,
so it can be written directly into video/attribute memory without a
runtime conversion pass. That general shape (compile-time literal → target
byte encoding) is not itself C64-specific.

What is C64-specific, and does **not** apply to TVC: the specific
conversion table (PETSCII → VIC-II screen-code mapping) that SANE's
page describes. TVC has entirely different video hardware (CRTC 6845,
no hardware text/character mode analogous to the C64's screen-code
scheme — see `references/hardware.md`), and this skill does not yet
have TVC's own character/font encoding table documented anywhere.

**TODO / open question**: figure out and document TVC's actual
character encoding (whatever byte values its font/character-generator
setup actually expects, if anything analogous exists) before treating
`cstring` as usable/meaningful for TVC output. Until that's done, don't
invent or assume a mapping — treat any TVC code sample using `cstring`
with C64-style screen-code assumptions as suspect, and prefer plain
`string` (or raw `incbin` byte data with a manually-defined encoding)
until this is resolved.

**Syntax** (as inherited from TRSE; semantics of the resulting bytes on
TVC are exactly the open question above)

```
var
    <name> : cstring = "<text>";
    <name> : cstring = ("<part1>", "<part2>", ...);
    <name> : cstring invert = "<text>";
    <name> : cstring = ("<text>") no_term;
```

- `<name>`: the variable's identifier.
- `"<text>"`: one string literal, or several concatenated together as a
  comma-separated list in parentheses.
- `invert`: optional flag, ORs `$80` into every character's converted
  byte value (reverse video on C64); meaning on TVC is unknown/unverified.
- `no_term`: optional flag, suppresses the trailing terminator byte
  normally appended after the data.

No known limitations reported (beyond the TVC encoding gap above).

## Excluded (SANE-only or C64-specific)

- **`incsid`** — excluded entirely. Loads a Commodore `.sid` music file
  and exposes its init/play addresses (via the SID chip's register
  layout) as constants. TVC has no SID chip and no equivalent file
  format/mechanism documented in this skill, so there is nothing
  platform-neutral to extract from this page.

No type pages in `reference/types/` carried a `SANE`-only tag (all 16
are `TRSE` or `TRSE (modified in SANE)`); the only exclusion driven by
the tag system would have been a `SANE` tag, and none was found.
