# Operators

TRSE's operators (arithmetic, comparison, bitwise, logical, assignment) are
implemented in the compiler frontend and are platform-independent — they
behave the same on the TVC target as on any other TRSE target. This page is
adapted from SANE's operator reference (SANE is a C64-only TRSE fork whose
docs are the best-organized, source-cross-checked TRSE language reference
available), scoped down to plain/vanilla TRSE behavior, since that is what
the TVC toolchain actually runs.

**Read this warning before relying on signed arithmetic.** SANE's name
stands for "Signed Arithmetic, No Errors" — the fork exists specifically
because vanilla TRSE's compiler has a long list of real, unfixed bugs
around `signed` values: silent zero-extension instead of sign-extension,
missing signed code paths for several comparison operators, an
unimplemented signed division, a non-arithmetic (sign-losing) `shr` on
signed values, and more. None of these are fixed in vanilla TRSE, which is
what TVC-target TRSE compiles with. Every such bug still open in vanilla
TRSE is documented below, under the relevant operator's **Known
limitations**. When in doubt, test signed expressions at their extremes
(near `0`, near the type's min/max, and mixed byte/wider-type expressions)
rather than trusting the sign to propagate correctly.

---

**Arithmetic**

## Addition (`+`)

**Syntax:** `<a> + <b>`

**Parameters:** `<a>`, `<b>` — numeric values (`byte`, `integer`, or
`long`), unsigned or `signed`.

**Returns:** The sum. The result stays at whichever width is wider: the
operands' own declared type, or, when the sum is assigned straight into a
variable, that variable's type.

**Known limitations:**

- Assigning a `byte + byte` sum directly into a wider variable widens it
  correctly (e.g. `200 + 100` assigned straight into an `integer` variable
  gives `300`). This only happens when assigning straight into a variable
  of the wider type; a `byte + byte` sum used any other way (assigned to
  another `byte`, passed as a `byte` parameter, or used inside a larger
  expression with nothing wider around it) stays 8-bit and silently wraps
  on overflow instead (`200 + 100` comes out as `44`, not `300`).
- Mixing a negative `signed byte` into a wider expression **zero-extends
  instead of sign-extending** its value: a `-1` byte widened into an
  `integer` comes out as `255` (`$00FF`) instead of `-1` (`$FFFF`).
  Same-width addition (`signed byte + signed byte`, or `signed integer +
  signed integer`) is unaffected; the problem is specific to combining a
  negative byte with an already-wider operand in the same expression.

## Subtraction (`-`)

**Syntax:** `<a> - <b>`

**Parameters:** `<a>`, `<b>` — numeric values (`byte`, `integer`, or
`long`), unsigned or `signed`.

**Returns:** The difference, at whichever width is wider (operands' own
type, or the destination variable's type on direct assignment).

**Known limitations:**

- Assigning a `byte - byte` result directly into a wider variable widens it
  correctly, including correctly representing a result that went negative
  when the destination is `signed`. This only applies when assigning
  straight into the wider variable; a `byte - byte` result used any other
  way stays 8-bit and wraps on underflow instead (`0 - 1` comes out as
  `255`, not `-1`).
- Mixing a negative `signed byte` into a wider expression **zero-extends
  instead of sign-extending** its value, the identical bug described under
  [Addition](#addition): a `-1` byte widened into an `integer` comes out as
  `255` (`$00FF`) instead of `-1` (`$FFFF`). Same-width subtraction is
  unaffected.

## Multiplication (`*`)

**Syntax:** `<a> * <b>`

**Parameters:** `<a>`, `<b>` — `byte` or `integer` values. `long` (24-bit)
operands aren't supported.

**Returns:** The product. Whether it's computed as an 8-bit or 16-bit
multiply depends on the operand and destination types (see widening note
below).

**Known limitations:**

- `long` (24-bit) multiplication isn't supported at all; using `*` with a
  `long` operand fails to compile.
- Assigning a `byte * byte` product directly into an `integer` variable
  correctly computes the full 16-bit product (`20 * 20 = 400`). This only
  happens when assigning straight into the wider variable; a `byte * byte`
  product used any other way (assigned to another `byte`, passed as a
  `byte` parameter, or used inside a larger expression with nothing wider
  around it) keeps only the low 8 bits and silently discards the rest, with
  no warning (`20 * 20` comes out as `144`, not `400`).
- **Multiplying two byte values where the product widens to an `integer`
  and at least one operand is a negative signed number gives a wrong
  result, with no compile error or warning.** A plain `byte * byte` product
  kept as a `byte` is never affected, since a two's-complement product's
  low byte is identical whether the inputs are interpreted as signed or
  unsigned — only the word-widening case is wrong.

## Division (`/`)

**Syntax:** `<a> / <b>`

**Parameters:** `<a>`, `<b>` — `byte` or `integer` values. `long` (24-bit)
operands aren't supported.

**Returns:** The integer quotient, truncated (no fractional/remainder
value kept). Computed as an 8-bit or 16-bit divide depending on operand and
destination types, the same as multiplication.

**Known limitations:**

- `long` (24-bit) division isn't supported at all; using `/` with a `long`
  operand fails to compile.
- **Signed division isn't implemented at all.** Division always uses
  unsigned arithmetic, completely ignoring the `signed` modifier on either
  operand; there's no signed-aware division routine. `mod`/`mod16` share
  the identical gap.
- **A plain `byte / byte` division that stays a `byte` result (not widened
  to `integer`) is unsigned only.** Unlike multiplication, a
  two's-complement quotient's low byte is *not* sign-independent, so a
  negative signed operand genuinely gives a wrong result here.
- **Dividing by zero at runtime doesn't crash or hang, but doesn't produce
  a meaningful result either.** The generated division routine is a
  fixed-length loop with no zero-check, so it finishes normally and returns
  some fixed, meaningless quotient. The compiler only catches division by
  zero at compile time when both sides of `/` are literal constants it can
  evaluate ahead of time; a runtime value that happens to be zero is not
  caught.

---

**Comparison**

All six comparison operators take `<a>`, `<b>` of the same declared type
(`byte`, `integer`, or `long`), either both unsigned or both `signed`, and
return a boolean, usable directly wherever a condition is expected (`if`,
`while`, `until`, `case`, ...).

## Less than (`<`)

**Syntax:** `<a> < <b>`

**Known limitations:**

- Works correctly for unsigned `byte`, `integer`, and `long` values, and is
  one of only two comparison operators (along with `<=`) implemented at all
  for `signed integer` values.
- On a `signed byte`, accepted without a compile error, but wrong right at
  the extreme boundary values (e.g. comparing `-128` against `127`): the
  generated code uses a plain positive/negative flag check, without the
  overflow-correction step the 16-bit signed path applies.
- **On a `signed long`, not implemented at all** — fails to compile no
  matter which operator is used.
- **Comparing an unsigned byte against the literal `0` gives the wrong
  result:** `x < 0` always evaluates true regardless of `x`'s actual value;
  the same applies to a signed comparison against literal `0`.

## Less or equal (`<=`)

**Syntax:** `<a> <= <b>`

**Known limitations:** same shape as `<` — works correctly for unsigned
`byte`/`integer`/`long`, and is one of the two operators (with `<`)
implemented for `signed integer`.

- On a `signed byte`, wrong right at the extreme boundary values, same flag
  -check-without-overflow-correction cause as `<`.
- On a `signed long`, not implemented at all; fails to compile.
- `x <= 0` always evaluates **true** regardless of `x`'s actual value
  (unsigned or signed byte against literal `0`).

## Greater than (`>`)

**Syntax:** `<a> > <b>`

**Known limitations:**

- Works correctly for unsigned `byte`, `integer`, and `long` values.
- On a `signed byte`, accepted without a compile error but wrong right at
  the extreme boundary values, same cause as `<`.
- **On a `signed integer`, not implemented at all** — only `<` and `<=`
  were implemented for signed 16-bit comparisons; `if (signedWord > 0)
  then ...` fails to compile even though `signedWord < 0` works.
- On a `signed long`, not implemented at all; fails to compile.
- `x > 0` always evaluates **false** regardless of `x`'s actual value
  (unsigned or signed byte against literal `0`).

## Greater or equal (`>=`)

**Syntax:** `<a> >= <b>`

**Known limitations:**

- Works correctly for unsigned `byte`, `integer`, and `long` values.
- On a `signed byte`, accepted without a compile error but wrong right at
  the extreme boundary values, same cause as `<`.
- **On a `signed integer`, not implemented at all** — only `<`/`<=` were
  implemented for signed 16-bit comparisons.
- On a `signed long`, not implemented at all; fails to compile.
- `x >= 0` always evaluates **false** regardless of `x`'s actual value
  (unsigned or signed byte against literal `0`).

## Equal (`=`)

**Syntax:** `<a> = <b>`

**Known limitations:**

- Works correctly for unsigned `byte`, `integer`, and `long` values, and
  also works correctly on a **`signed byte` at every value**, including
  right at the `-128`/`127` boundary — equality only cares whether two bit
  patterns match, not how the sign bit is interpreted, so it isn't affected
  by the boundary-value risk that applies to the ordering operators.
- **On a `signed integer` or `signed long`, not implemented at all.** The
  compiler only allowed `<`/`<=` on a signed 16-bit value, and nothing at
  all on a signed 24-bit value; `if (signedWord = 0) then ...` fails to
  compile even though equality doesn't inherently need sign-aware logic.

## Not equal (`<>`)

**Syntax:** `<a> <> <b>`

**Known limitations:** identical shape to `=`.

- Works correctly for unsigned `byte`/`integer`/`long`, and correctly on a
  **`signed byte` at every value** (same bit-pattern-only reasoning as
  `=`).
- **On a `signed integer` or `signed long`, not implemented at all** —
  `if (signedWord <> 0) then ...` fails to compile.

---

**Bitwise**

`&`, `|`, `xor`/`^`, `shl`/`<<`, and `shr`/`>>` operate on `byte`,
`integer`, or `long` values. Except for `shr`, bitwise operations never
distinguish `signed` from unsigned — they only ever look at raw bits.

## Bitwise AND (`&`)

**Syntax:** `<a> & <b>`

**Returns:** The bit-by-bit AND of the two values (each result bit is `1`
only where both inputs have a `1`).

**Known limitations:**

- Works correctly between two `byte` or two `integer` values, and mixing a
  `byte` with an `integer` (the byte is zero-extended, which is always
  correct for AND).
- **On a `long` (24-bit) value, only works correctly when the right-hand
  side is a plain variable or literal.** As soon as the right-hand side is
  a more complex expression (an addition, for example), two things go
  wrong at once: the top byte of the result isn't ANDed at all — it's
  overwritten with whatever the right-hand expression's own top byte
  happened to be — and the middle byte can come out one off from correct,
  from leftover state bleeding in from evaluating the right-hand
  expression.

## Bitwise OR (`|`)

**Syntax:** `<a> | <b>`

**Returns:** The bit-by-bit OR of the two values (each result bit is `1`
where either input has a `1`).

**Known limitations:** identical shape to `&`.

- Works correctly between two `byte` or two `integer` values, and mixing a
  `byte` with an `integer` (zero-extended, correct for OR).
- **On a `long` value, only works correctly when the right-hand side is a
  plain variable or literal.** With a complex right-hand expression, the
  top byte of the result is overwritten with the right-hand expression's
  own top byte instead of being ORed, and the middle byte can come out one
  off from leftover state.

## XOR (`xor` / `^`)

**Syntax:** `<a> xor <b>` or `<a> ^ <b>`

**Returns:** The bit-by-bit XOR of the two values (each result bit is `1`
where exactly one input has a `1`).

**Known limitations:**

- Works correctly between two `byte` or two `integer` values, and mixing a
  `byte` with an `integer` (zero-extended, correct for XOR).
- **On a `long` value, only works correctly when the right-hand side is a
  plain variable or literal**, the same top-byte-overwritten /
  middle-byte-off-by-one bug as `&` and `|`, triggered by a complex
  right-hand expression.
- **`xor` written between two parenthesized conditions (not two plain
  numeric values) compiles without error but always evaluates true**,
  regardless of what either condition actually is. For example,
  `if ((a>5) xor (b<3)) then ... else ...;` compiles cleanly, but the
  `else` branch becomes unreachable: both conditions are evaluated
  correctly, but the step that combines them with `xor` and branches on
  the result is missing, so execution always falls into the "true" branch.
  This is separate from plain numeric bitwise `xor`, which is unaffected.

## Shift left (`shl` / `<<`)

**Syntax:** `<value> shl <amount>` or `<value> << <amount>`

**Parameters:** `<value>` — a `byte`, `integer`, or `long` value.
`<amount>` — how many positions to shift left by.

**Returns:** The shifted value, at the same width as `<value>`. Each shift
by one position is equivalent to multiplying by 2, as long as the result
still fits in the value's declared width.

**Known limitations:**

- Works the same regardless of whether the value is `signed`: shifting left
  never needs sign-aware handling, since the bit pattern moves the same way
  either direction.
- Shifting by an amount equal to or greater than the value's own width
  isn't rejected or capped; it's implemented as a literal repeated shift,
  so it naturally saturates to `0` after enough repetitions.
- No automatic widening trick for the result the way `+`/`-`/`*` have: the
  shift always happens at `<value>`'s own declared width. To get a wider
  result from a narrower starting value, declare `<value>` itself as the
  wider type rather than relying on the destination variable's type.

## Shift right (`shr` / `>>`)

**Syntax:** `<value> shr <amount>` or `<value> >> <amount>`

**Parameters:** `<value>` — a `byte`, `integer`, or `long` value.
`<amount>` — how many positions to shift right by.

**Returns:** The shifted value, at the same width as `<value>`. Each shift
by one position is equivalent to dividing by 2 and discarding the
remainder, for an unsigned value.

**Known limitations:**

- Shifting an **unsigned** value works correctly at every width (`byte`,
  `integer`, `long`), including shifting by an amount equal to or greater
  than the value's own width (saturates to `0`).
- **On a `signed` value, `shr`/`>>` is always a plain logical shift, never
  an arithmetic one.** The vacated high bits are always filled with `0`,
  the same as for an unsigned value, instead of replicating the sign bit.
  A negative value shifted right gives a wrong, positive result instead of
  preserving its sign:

  ```pascal
  var x : signed byte = -8;
  var y : signed byte;
  y := x >> 1;   { y ends up 124, not the mathematically correct -4 }
  ```

  Shifting an already non-negative signed value is unaffected.
- No automatic widening trick for the result, same as `shl`/`<<`: the shift
  always happens at `<value>`'s own declared width.

---

**Logical**

`and`/`or` combine two parenthesized *conditions* (comparisons or boolean
values), not raw numeric values — for bitwise combination of numbers, use
`&`/`|` instead.

## Logical AND (`and`)

**Syntax:** `(<condition1> and <condition2>)` — the whole combined clause
must sit inside one pair of parentheses.

**Parameters:** `<condition1>`, `<condition2>` — comparisons or boolean
values/variables.

**Returns:** True only if both conditions are true.

**Known limitations:**

`and` works correctly as a condition combinator, with real short-circuit
evaluation: if the left condition is already false, the right condition's
code doesn't run at all (so a right-hand side with a side effect, like a
function call, won't happen when short-circuited).

- **`and` is only usable to combine two conditions inside an `if`/`while`/
  `until` test, not as a bitwise operator on plain numeric values.**
  Writing `byteA and byteB` outside a conditional is a compile error that
  suggests using `&` instead.
- **The whole combined clause needs one pair of parentheses around it, not
  one pair around each individual condition.** `if (a>5) and (b<3) then`
  (each condition separately parenthesized, no outer wrap) is a parse
  error; the working form wraps the entire combination in one more set of
  parentheses: `if ((a>5) and (b<3)) then`. Chaining three or more
  conditions needs explicit nested parentheses the same way, e.g.
  `((a=5) and ((b=7) and (c=255)))` — there's no flat, unparenthesized
  chain of `and`s.

## Logical OR (`or`)

**Syntax:** `(<condition1> or <condition2>)` — same one-pair-of-parens
requirement as `and`.

**Parameters:** `<condition1>`, `<condition2>` — comparisons or boolean
values/variables.

**Returns:** True if either condition is true.

**Known limitations:** identical shape to `and`.

`or` works correctly as a condition combinator, with real short-circuit
evaluation: if the left condition is already true, the right condition's
code doesn't run at all.

- **`or` is only usable to combine two conditions inside an `if`/`while`/
  `until` test, not as a bitwise operator on plain numeric values.**
  Writing `byteA or byteB` outside a conditional is a compile error that
  suggests using `|` instead.
- **The whole combined clause needs one pair of parentheses around it, not
  one pair around each individual condition.** `if (a>5) or (b<3) then` is
  a parse error; the working form is `if ((a>5) or (b<3)) then`. Chaining
  three or more conditions needs explicit nested parentheses.

## Logical NOT (`not`)

**Syntax:** `not <boolean value or variable>` or `not <numeric value>`

**Parameters:** A boolean literal (`true`/`false`), a boolean variable, or
a numeric `byte` value.

**Returns:** For a boolean, the opposite truth value. For a numeric
`byte`, the bitwise complement.

**Known limitations:**

`not true`/`not false` used directly in an expression (e.g. `flag := not
true;`) and `not` on a plain `byte` value (`not $0F` correctly gives `$F0`)
work correctly.

- **On an `integer`/`long` value, `not` only complements the low byte; the
  upper byte(s) pass straight through unchanged.** `not` on an `integer`
  holding `$00FF` should give `$FF00`, but the upper byte is left as `$00`
  and the actual result comes out `$0000`.
- **`not` can't correctly negate a whole comparison or condition.** Three
  related issues, all in the same shape:
  - `not (a > 5)`, with the comparison in parentheses, fails to compile at
    all.
  - Writing it without the parentheses, `not a > 5`, does compile, but
    silently means something different: it computes `not a` (a bitwise
    complement) first, and only then compares that complemented value
    against `5`, instead of negating the result of `a > 5`. For `a = 10`,
    this reads as `(not 10) > 5`, which comes out true — the opposite of
    the intended `not (10 > 5)`, which should be false.
  - Even `not` directly on a bare boolean flag used as a condition (`if
    not someFlag then`) only gives the right answer when the flag holds
    exactly `false` (`0`): any other nonzero "true" value (such as `1`) is
    wrongly still treated as true after negation, since the implementation
    bitwise-complements the value and re-tests the complement for
    non-zero, rather than actually inverting the truth value.

---

**Assignment**

## Assignment (`:=`)

**Syntax:** `<variable> := <expression>;`

**Parameters:** `<variable>` — the destination to store into.
`<expression>` — the value to compute and store.

**Returns:** Not applicable; `:=` is a statement, not an expression that
produces a value itself.

**Known limitations:**

Assigning between two variables of the same declared type works exactly as
expected. Assigning a narrower value into a wider variable (`byte` into
`integer`, for example) auto-widens correctly, the same way the arithmetic
operators do.

- **Assigning a wider value into a narrower variable truncates silently,
  keeping only the low byte(s), with no overflow warning.** An `integer`
  holding `300` assigned into a `byte` variable doesn't clamp or error, it
  just keeps the low byte: `300` (`$012C`) becomes `44` (`$2C`); the
  value's high byte is simply dropped.
- **Chained assignment isn't supported.** `a := b := 5;` is a compile error
  (not silently misinterpreted); each assignment needs to be its own
  statement.
- Assigning a variable to itself (`a := a;`) is recognized and optimized
  away entirely: it emits no code at all. Harmless, but worth knowing if
  you're looking for a statement's generated code and it appears to be
  missing.

Array element and record field assignment have their own separate
semantics beyond plain scalar assignment; those belong with the array and
record type documentation rather than here.

---

## Excluded (SANE-only)

None. All 19 operator reference pages in SANE's `reference/operators/`
section carry either the `TRSE` tag (unchanged from vanilla TRSE:
`and`, `or`, `shl`/`<<`, `:=`) or the `TRSE (modified in SANE)` tag
(exists in vanilla TRSE, and this page documents vanilla's original
behavior/bugs, not SANE's fix). No operator page carries the `SANE`
tag, so none were excluded.
