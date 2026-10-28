# Plasma effect

A "plasma" is the classic demo-scene screen filler: a few overlapping sine
waves are used to index a color-ramp lookup table, then every pixel on
screen is repainted from that table each frame. Nothing about the algorithm
is complicated — it's table lookups and addition — but it has to run for
every byte of every scanline, every frame, on a 3.125 MHz Z80. That makes it
a good worked example for a pattern that recurs constantly on the TVC:
**write the setup, state, and frame loop in ordinary TRSE Pascal, then drop
into raw [`asm`](../language/keywords.md#asm) for the one inner loop that
actually needs to be fast.** `plasma.ras` keeps everything outside that inner
loop in normal TRSE code — sine table generation, palette setup, the
per-frame driver — and hand-writes only the pixel-fill loop, unrolled with
`repeat`/`repend`.

## What this uses

- **The `crtc` unit** — `Crtc::SetMode`, `Crtc::EnableVRAM`, and
  `Crtc::SetPalette` for entering 4-color graphics mode and setting up the
  palette. See [`references/api/crtc-unit.md`](../api/crtc-unit.md) (note
  from that doc: most of `crtc.tru` is stub code, but these three
  procedures — plus `SetBorder` — are the ones that are actually
  implemented).
- **`buildsinetable`** — fills the 256-entry base sine table `sin` at
  compile time, instead of writing 256 values by hand or computing them at
  runtime. See
  [`references/language/keywords.md#buildsinetable`](../language/keywords.md#buildsinetable)
  (a shorthand over the more general
  [`buildtable`](../language/keywords.md#buildtable)).
- **Fixed, page-aligned variable placement via `at`** — `siny`/`sinx` are
  pinned to `$7F00`/`$7E00` so the inner asm loop can address into them
  cheaply. See
  [`references/language/keywords.md#at`](../language/keywords.md#at).
- **`asm()` with `repeat`/`repend` unrolling** — the hand-written,
  branch-free inner pixel loop. See
  [`references/language/keywords.md#asm`](../language/keywords.md#asm),
  [`#repeat`](../language/keywords.md#repeat), and
  [`#repend`](../language/keywords.md#repend).

## The pattern

The full program, from `sources/tutorials/tutorials/plasma.ras`:

```pascal
program Plasma;
@use "crtc"


// Good old plasma example!

var  
	// some plasma variables
	val,val2,c2x, c2y,ax, ay,time, time2 : byte;
	x,y,shift : byte;
	dst : ^byte;
	// mini sine table
	const width : byte = 512/8;
	const height : byte = 64/2;	
	// The tables must be aligned at $xx00
    siny : array[width] of byte at $7F00; 
	sinx : array[height] of byte at $7E00; 
	// Org sine table
	sin : array[256] of byte = buildsinetable(127);
 	// smooth data generated in resources/fjong/generate_data.fjo
	data : incbin("data/smooth_data.bin", $7D00);

// Plasma procedure

procedure Calculate();
begin
	c2x:=ax;
	c2y:=ay;
	
	// Set up y-sine table
	for x:=0 to height do begin 
		siny[x]:=  sin[c2x] + sin[c2y]-time2;
		c2x:=c2x+2;
		c2y:=c2y+5;
	end;

	ax:=ax+2;
	ay:=ay-3;

	// Set up x-sine table
	for x:=0 to width do begin 
		sinx[x] := sin[c2x] + sin[c2y];
		c2x:=c2x+3;
		c2y:=c2y+7;

	end;
	// alternate every 2nd line
	dst:=$8000+shift<<7 + 128*32;
	
end;


procedure Plasma();
begin
	for y:=0 to height  offpage do 
	begin
		val:=siny[y];
/*		for x:=0 to width do 
		begin
			val2:=data[ (sinx[x] +val) ];
			dst^:=val2;
			zp+=1;
			dst+=1;
		end;*/
		//unrolled
		asm("
			ld de,[dst]
			ld a,[val]
			ld b,a
			repeat 64
			
			ld hl,sinx +[i]
			
			ld a,b  ; a = val
			add a,[hl] ; a+ sinx[x]
			; lookup table data [ ...]
			ld hl,data
			ld l,a ; +data[a]
			
			ldi ; ld [de],[hl], inc de
			
			repend
		
		");
		dst+=64*4;
	end;

end;


begin
	Crtc::SetMode(Crtc::mode_4_color);
	Crtc::EnableVRAM();
	Crtc::SetPalette(0,Crtc::black);
	Crtc::SetPalette(1,Crtc::dark_blue);
	Crtc::SetPalette(2,Crtc::dark_magenta);
	Crtc::SetPalette(3,Crtc::yellow);
	
	// Clearscreen
	Fill($8000,0,64*height);
	while (true) do
	begin
		Calculate();
		time2+=5;
		time+=1;
		shift:=time&1;
		Plasma()
		
	end;

end.
```

## How it works

**The three sine tables.** `sin` is a 256-entry base table, filled once at
compile time by `buildsinetable(127)` — one full sine cycle, amplitude
127/2, peak-to-peak height 127 (see the keyword's exact formula in
[`keywords.md#buildsinetable`](../language/keywords.md#buildsinetable)).
`siny` and `sinx` are small *derived* tables, recomputed every frame in
`Calculate()` by walking two independent cursors (`c2x`/`c2y`) through `sin`
with different phase increments per pass (`+2`/`+5` while filling `siny`,
then `+3`/`+7` while filling `sinx`). Because the walk's starting point
(`ax`/`ay`) also drifts by a fixed amount every call to `Calculate()`, the
two tables never repeat the same way twice — that slow drift between two
out-of-sync sine walks is what produces the plasma's swirl. `siny`/`sinx`
must live at `at $7F00`/`at $7E00` — page-aligned addresses — because the
inner asm loop indexes into `sinx` by patching only the low byte of an
address (see below); that trick only works if the table's own base address
already has a zero low byte.

**Why the pixel loop is hand-written asm.** The commented-out block right
above the `asm(...)` call shows what the loop would look like as ordinary
TRSE: a `for x:=0 to width do` reading `sinx[x]`, adding `val`, indexing
`data`, and storing to `dst^`. That's exactly what the asm block does — but
a TRSE `for` loop pays a per-iteration cost (bump the counter, compare,
branch) on top of the actual work, 64 times per scanline, every frame,
forever. The hand-written version uses
[`repeat 64 ... repend`](../language/keywords.md#repend) to paste 64 copies
of the loop body one after another at compile time, so there's no runtime
loop overhead at all — just straight-line code. Inside each copy, `[i]` is
substituted with that copy's iteration index, so `ld hl,sinx +[i]` becomes a
different fixed address (`sinx+0`, `sinx+1`, ... `sinx+63`) in each unrolled
copy — again only possible because `sinx`'s address is fixed and known at
compile time via `at`. The `data` lookup uses a similar trick: `data` is
placed by `incbin` at `$7D00` (also page-aligned), so `ld hl,data` followed
by `ld l,a` builds the address `$7D00 + a` by overwriting just the low byte
of `HL`, without an explicit add. `ldi` then does load-from-`[HL]`,
store-to-`[DE]`, and increment both `HL`/`DE` in one instruction, which is
what actually writes the pixel and advances the destination pointer. Because
this unrolled block is much bigger than an ordinary loop body, the
surrounding `for y:=0 to height offpage do` uses
[`offpage`](../language/keywords.md#offpage) to force a long jump for the
loop's own branch — the default short relative branch might not reach over
a block this size.

**The color-ramp data dependency.** `data` is loaded via `incbin` from
`data/smooth_data.bin`, a precomputed color-ramp lookup table. The source
comment says it plainly: *"smooth data generated in
resources/fjong/generate_data.fjo"* — that `.fjo` file drives an external
tool ("fjong") that is **not part of TRSE and not documented by this
skill**; it's a separate ramp-generation utility whose output happens to be
what this example consumes. The generated `smooth_data.bin` is already
checked into `sources/tutorials/tutorials/data/smooth_data.bin`, so
`plasma.ras` compiles and runs as-is with no extra tooling. If you want to
build a *different* color ramp, you'd need that external fjong tool — this
doc only flags that it exists; reproducing or explaining its format is out
of scope here.

**4-color mode and palette.** `Crtc::SetMode(Crtc::mode_4_color)` selects
Graphics 4 (2 bits/pixel, 4 colors per line, see
[`references/hardware.md`](../hardware.md#graphic-modes)),
`Crtc::EnableVRAM()` pages VRAM in at `$8000`, and four
`Crtc::SetPalette(slot, color)` calls assign the four palette registers
(black, dark blue, dark magenta, yellow) that the 2-bit pixel values in
`data` are ultimately being remapped through — see
[`references/hardware.md`](../hardware.md#colors-and-palette) for the
palette-register mechanics those calls wrap.

## When to drop into inline asm

The general takeaway isn't "plasma effects need asm" — it's about
recognizing the shape of a loop that TRSE's own codegen can't make fast
enough on its own. This example hits three things worth watching for in
your own code:

- **A tight loop that runs an enormous number of times per frame.** Here
  it's 64 byte-writes per scanline, every scanline, every frame, forever —
  the per-iteration overhead of an ordinary `for` loop (counter bump,
  compare, branch) stops being negligible at that scale, and unrolling with
  `repeat`/`repend` removes it entirely.
- **Address arithmetic that can be made free by fixing memory layout.**
  Because `sinx` and `data` are pinned to page-aligned addresses with `at`
  and `incbin`'s address argument, the asm can build a table address by
  overwriting one register byte instead of doing a real add — a trick that
  only works because the *TRSE-level* declaration guaranteed the alignment.
- **A single instruction does more than TRSE's statement-level model can
  express.** `ldi` combines "read", "write", and "increment both pointers"
  into one Z80 instruction; there's no way to ask a TRSE `for` loop to emit
  exactly that.

When none of these apply — the loop runs rarely, or the addresses aren't
fixed, or nothing needs an instruction TRSE doesn't already generate — plain
TRSE Pascal is almost always the better choice: it's what the rest of
`plasma.ras` (table setup, the main loop, palette/mode setup) is written in,
and hand-asm should stay scoped to the one loop that actually earns it.
