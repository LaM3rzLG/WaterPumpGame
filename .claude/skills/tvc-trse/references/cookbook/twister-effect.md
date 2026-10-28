# The twister effect

A "twister" is a classic demoscene technique: a strip of text or graphics is
chopped into thin horizontal slices, and each slice is redrawn with a
sine-driven rotation/offset so the strip appears to twist and recede like the
inside of a tunnel. It's one of the oldest tricks in the 8-bit/16-bit scene
repertoire, alongside plasma and sinescroll, because it produces a
strikingly 3D-looking illusion from cheap, entirely 2D per-line table
lookups — no real rotation or perspective math happens at runtime.

`twister.ras` is included in this skill's tutorial set as a worked example of
that pattern on TVC: a scrolltext is pushed through a twisting tunnel, one
pair of screen rows at a time, driven entirely by precomputed tables and
`memcpy` blits into VRAM. It's also useful as a teaching example for a second
reason: it's the clearest bundled illustration of TRSE's "precompute
everything, do only table lookups + copies at runtime" style of effect, and
of a program that depends on an *external* asset-generation step rather than
data authored entirely in-language.

## What this uses

- **[`BuildTable`](../language/keywords.md#buildtable)** — used three times,
  compile-time-evaluated JS expressions that fill byte/integer arrays instead
  of hand-written initializers:
  - `sine32`: a 256-entry sine table (the actual twist/turn driver).
  - `charLookup` / `frameLookup`: pure index-arithmetic tables (`2*16*16*i`
    and `2*16*i`) that turn a "character index" and "rotation frame index"
    into byte offsets into the pregenerated data blob.
- **[`incbin`](../language/types.md#incbin)** — `data`/`table` are the two
  external binaries (`data/twister_data.bin`, `data/twister_table.bin`)
  pulled in as inline byte arrays; see [Asset pipeline
  note](#asset-pipeline-note) below.
- **[`@requirefile`](../language/directives.md#requirefile)** — guards the
  build with a clear error ("please run the corresponding fjong file") if the
  generated `.bin` data isn't present, instead of failing later inside the
  assembler with a confusing "file not found".
- **[`pointer`](../language/types.md#pointer) / `pointer of integer`
  arithmetic** — `tab`/`zp`/`dst`/`tp` are all raw pointers walked and offset
  by hand (`tab := #table + frameLookup[frame]`, `dst += 64`, `tp[j]`) to
  navigate the lookup tables and VRAM without bounds-checked array syntax.
- **[`offpage`](../language/keywords.md#offpage)** — forces the main render
  loop's `for k:=0 to 120 offpage do` to use a long jump rather than TRSE's
  automatically-chosen short relative branch, presumably because the loop
  body (table lookups plus two `memcpy` calls) is large enough that a short
  branch can't reach across it.
- **`memcpy` row copies into VRAM** — the actual pixel output mechanism: each
  iteration resolves a source address inside `data` and copies it straight
  into screen memory at `$8000`, following the row-copy pattern described in
  [hardware.md's Screen / VIDEORAM layout
  section](../hardware.md#screen--videoram-layout) (linear layout, 64-byte
  line stride).
- **The `crtc` unit** — `Crtc::SetMode`, `Crtc::EnableVRAM`, and
  `Crtc::SetPalette` set up 4-color mode and page in VRAM; see
  [api/crtc-unit.md](../api/crtc-unit.md) (these three are the handful of
  `crtc.tru` procedures that are actually implemented, per that reference's
  notes).

## The pattern

Full source, from `sources/tutorials/tutorials/twister.ras`:

```pascal
program Twister;
@use "crtc"

var  
  	k,j,time,tt,t2,ll,frame,y: byte; 
  	
//   	data : incbin("data/twister_data.bin");
   	data : incbin("data/twister_data.bin");
   	table : incbin("data/twister_table.bin");
   	
	dst,zp,tp,p1 : pointer;
	tab : pointer of integer;   
	text : string = ("WHOO THIS IS A SCROLLTEXT YES IT IS ");
    sine32 : array[256] of byte = BuildTable("(Math.sin(i/256.0*Math.PI*2.0)*80+79)/7");
@export "resources/images/image1.flf" "resources/images/image1.bin" 256 

	charLookup : array[32] of integer = BuildTable("(2*16*16*i)");
	frameLookup : array[16] of integer = BuildTable("(2*16*i)");

@requirefile "data/twister_data.bin" "Please run the corresponding fjong file (twister.fjo) before compiling this program"

procedure RenderTwister(tx:byte);
begin
	t2:=t2+1;
	tt:=0-tx; // Text goes up
	t2:=tx; // Twist goes down
	tp:=#text;
	j:=0;
	y:=0;
	dst:=$8000 + 30;
	for k:=0 to 120 offpage do
	begin
		j:=sine32[(k+t2)&255]; // Twist turning
		frame:=(((tx-j))&15); // Current rotation frame
		ll:=(k-tt); // Current shift & text position in y
		j:=ll>>4; // Twister yeah!
	 	j:=(tp[j]-1)&31; // Look up current character, store in j
		if (j=31) then j:=25;	
 	
		tab :=#table + frameLookup[frame];
		tab :=tab +charLookup[j];
		

		zp :=tab[ll&15];
		zp:=#data+zp;


		// Copy 2 rows of data
		memcpy(zp,dst,8);
		dst+=64; // next line
		memcpy(zp,dst,8);
		dst+=64; // next line
		

	end;
	
end;


begin
	Crtc::SetMode(Crtc::mode_4_color);
	Crtc::EnableVRAM();
	Crtc::SetPalette(0,Crtc::black);
	Crtc::SetPalette(1,Crtc::blue);
	Crtc::SetPalette(2,Crtc::gray);
	Crtc::SetPalette(3,Crtc::white);
	
	// Clearscreen
	Fill($8000,0,64*200);
	
	time := 0;	
	while (true) do
	begin
		RenderTwister(time);
		time:=time+1;
	end;



end.
```

Note the stray commented-out duplicate `data : incbin(...)` line on line 7 —
that's in the original source as bundled; it's dead (commented) and harmless,
left here verbatim rather than "cleaned up" so the example matches what
actually compiles.

## How it works

**Setup.** `main` puts the CRTC into 4-color mode, pages VRAM in at `$8000`,
sets a 4-entry grayscale-ish palette (black/blue/gray/white), clears the top
part of the screen, and then loops forever calling `RenderTwister(time)` with
an ever-incrementing frame counter — `time` is the single input that drives
the whole animation.

**The sine table drives the twist, not the geometry directly.** `sine32` is a
256-entry table built at compile time from
`(Math.sin(i/256*2*PI)*80+79)/7`, i.e. one full sine cycle rescaled into a
small integer range. In the render loop, for each output row `k` the code
reads `j := sine32[(k+t2)&255]` — indexing the sine table by *screen row plus
the current twist phase* (`t2`, which tracks `tx`, the frame counter). That
gives a per-row value that oscillates smoothly down the screen and slowly
rotates over time as `t2` advances — this is the actual "twist": each row of
the tunnel is nudged to a different rotation phase than its neighbors,
sine-distorted rather than linear, which is what reads visually as a
twisting/tunneling motion instead of a flat scroll.

That per-row sine value is combined with the frame counter into
`frame := (tx - j) & 15` — a value 0-15 selecting one of 16 precomputed
**rotation frames** (`frameLookup` has exactly 16 entries). So rather than
rotating a character's bitmap at runtime, the effect just picks a different
pre-rotated bitmap frame per row, per moment in time; the sine table's job is
purely to choose *which* pre-rendered frame each row shows.

**The scrolltext is driven through the same loop via a second, independent
offset.** `ll := k - tt` (with `tt = -tx`, so effectively `ll = k + tx`) gives
each row's position along the scrolling text axis, advancing as `tx`
increases — this is what makes the text climb the tunnel over time,
independently of the twist phase computed above. `ll >> 4` divides that by 16
to pick which character of `text` is showing at this row (each character
occupies a 16-row band), and `ll & 15` (used later) picks which of the 16
rows *within* that character's glyph this particular screen row shows.
Character codes are read from the string pointer `tp`, masked into a 0-31
range, with index 31 specially remapped to 25 (apparently a blank/space
glyph substitution, though the exact charset layout backing that isn't given
in the source).

**Rendering is pure table-offset chasing plus `memcpy`.** `charLookup`
(`2*16*16*i`) and `frameLookup` (`2*16*i`) are just address-arithmetic
tables converting a character index and a frame index into byte offsets. The
code walks the `table` pointer to the current frame's block, then to the
current character's sub-block within it (`tab := #table + frameLookup[frame]
+ charLookup[j]`), reads a 16-bit offset out of it at the current sub-row
(`tab[ll&15]`), and uses *that* as the final offset into `data`. In other
words, `table` (`twister_table.bin`) is an index of offsets, and `data`
(`twister_data.bin`) is the actual pixel payload it points into — a
two-level lookup that resolves "row k, this moment in time" down to one
8-byte pixel slice. That slice is `memcpy`'d straight into VRAM at `dst`
(which starts at `$8000 + 30`, i.e. 30 bytes into the first row — see
[hardware.md](../hardware.md#screen--videoram-layout) for why 64 bytes is one
full VRAM line). It's copied twice in a row, with `dst` advanced by a full
64-byte line stride between each copy, so every computed slice is stamped
onto two consecutive screen rows rather than one — stretching each table
entry's vertical resolution by 2x cheaply instead of computing (or storing)
twice as many table rows.

**External data-generation dependency.** None of the actual glyph pixel data
or its per-frame/per-character rotated variants are computed by this
program, or even stored as ordinary TRSE array literals — they're entirely
external, pulled in via `incbin` from `data/twister_data.bin` and
`data/twister_table.bin`, both produced ahead of time by TRSE's "fjong" data
tool from `resources/fjong/twister.fjo`. `RenderTwister` never computes a
rotated bitmap; it only ever looks one up. See the asset pipeline note below.

## Asset pipeline note

`twister.ras` does not fully stand on its own the way most `.ras` tutorials
do: it needs two generated binaries, `data/twister_data.bin` and
`data/twister_table.bin`, which are produced from `resources/fjong/twister.fjo`
by TRSE's separate **fjong** data-generation tool (not covered by this
skill — out of scope here).

The good news: both `.bin` files are **already generated and checked into
`sources/tutorials/tutorials/data/`** alongside the source, so this example
compiles and runs as-is with no extra steps — the `@requirefile` directive
at the top of the program will find them and let the build proceed.

The thing to flag for anyone adapting this example: those two files encode
one specific baked scrolltext/rotation-frame set (the "WHOO THIS IS A
SCROLLTEXT..." message and its matching pre-rotated glyph frames).
Changing the `text` string in the `.ras` file alone will *not* change what's
actually drawn in a meaningful way, because the glyph pixel data itself —
the rotated bitmaps `data`/`table` point into — was baked by fjong ahead of
time to match the original asset (whatever font/pattern `twister.fjo`
specifies). Retargeting this effect to different text or a different
twisted pattern requires regenerating both `.bin` files with fjong, a tool
this skill does not document or bundle instructions for.
