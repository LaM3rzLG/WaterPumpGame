# Displaying a compressed static image

This is the closest thing TVC TRSE has to a "hello world": convert a piece of
pre-drawn art into VRAM-ready bytes at compile time, embed the compressed
result in the program, and unpack it straight into video memory at startup.
No animation, no input, no game loop — just `SetMode` → `EnableVRAM` →
`Decompress` → `loop()`. It's the pattern to reach for any time a program
needs a static picture on screen (a title screen, a splash image, a
background to draw sprites over), and it's short enough to be the first real
program worth typing in. The three bundled tutorials that use it
(`tutorial_image.ras`, `tutorial_image2.ras`, `tutorial_image3.ras`) are
identical in structure and differ only in which of TVC's three fixed graphics
modes they target — see "Variants by graphics mode" below.

## What this uses

- [`@export`](../language/directives.md) — a build-time directive that
  converts a `.flf` source art asset (TRSE's own image-editor format) into a
  raw `.bin` file during compilation. This is what turns hand-drawn art into
  something `incbin` can embed.
- `@use "compression"` — pulls in the `Compression` unit (see
  [`@use`](../language/directives.md)), which is what makes the
  `Compression::` prefix below resolve.
- [`incbin(...) compressed`](../language/types.md) — embeds the exported
  `.bin` file as a variable, with the [`compressed`](../language/keywords.md)
  flag telling the compiler to LZ4-compress that data at compile time so it
  takes less space in the final program.
- [`Crtc::SetMode`](../api/crtc-unit.md) — selects which of the three fixed
  graphics modes (2/4/16-color) the CRTC displays.
- [`Crtc::EnableVRAM`](../api/crtc-unit.md) — pages video RAM into the Z80's
  address space at `$8000` so the program can actually write to screen
  memory.
- `Compression::Decompress` — unpacks the compressed `incbin` data back out,
  writing the decompressed image bytes directly into VRAM.

## The pattern

Full source: `sources/tutorials/tutorials/tutorial_image2.ras` (128×240,
16-color / Graphics 16). This is the canonical version of the pattern —
`templates/main.ras`, the skill's own starter project skeleton, is derived
directly from it (same `@use` list, same `@export`/`incbin` shape, same
three-call runtime sequence, just a different `.flf` source asset).

```pascal
// sources/tutorials/tutorials/tutorial_image2.ras
program ShowCompressedImage2;
@use "crtc"
@use "memory"
@use "system"
@use "text"
@use "compression"
/*
	Loads a compressed TRSE image (located in the resources/images folder" for 128x240 16-colour mode

*/
 
 
// Automatically export
@export "resources/images/image1.flf" "resources/images/image1.bin" 256

var  
// Include the exported image data + palette
	image : incbin("resources/images/image1.bin") compressed;
	
	
begin
	Crtc::SetMode(Crtc::mode_16_color);
	Crtc::EnableVRAM();
	// Copy to VRAM
	Compression::Decompress(#image, $8000);

	loop();	

end.
```

## How it works

Two things happen here on two different timelines: an asset conversion at
**compile time**, and a three-call unpacking sequence at **runtime**.

**Compile time — the asset pipeline.** `@export "resources/images/image1.flf"
"resources/images/image1.bin" 256` runs before the rest of the program is
even compiled: it reads the `.flf` source art (produced by TRSE's own
built-in image editor — see [`directives.md`](../language/directives.md)'s
`@export` entry) and writes a raw `.bin` export next to it. The `var` block's
`incbin("resources/images/image1.bin") compressed` then pulls that `.bin`
file in as a byte array, LZ4-compressing it at compile time so the final
program carries less data. The net effect is that the `.flf` art asset never
has to be shipped or read at runtime at all — only the compiled `.bin`'s
compressed bytes end up in the program.

**Runtime — the three-call sequence.**

1. `Crtc::SetMode(Crtc::mode_16_color)` switches the CRTC to the graphics
   mode the exported image was drawn for. This must match the mode the art
   was actually authored in — see "Common mistakes" below.
2. `Crtc::EnableVRAM()` pages video RAM in at `$8000` (see
   `references/hardware.md`'s Screen/VIDEORAM layout section). Nothing
   written to `$8000` before this call reaches the screen — it lands in
   whatever RAM page happened to be mapped there instead.
3. `Compression::Decompress(#image, $8000)` unpacks the compressed `image`
   data (`#image` takes its address) and writes the decompressed bytes
   starting at `$8000`, i.e. directly into the now-paged-in screen memory.
4. `loop()` — the program has nothing left to do after the image is drawn,
   so it just spins forever rather than falling off the end of `begin...end`.

## Variants by graphics mode

All three tutorials share the exact same shape; only the graphics-mode
constant passed to `Crtc::SetMode` changes, plus — for Graphics 4 and
Graphics 2 — an explicit palette setup that Graphics 16 doesn't need.

| Tutorial | Resolution | Mode | `Crtc::SetMode` constant | Palette setup |
|---|---|---|---|---|
| `tutorial_image.ras` | 256×240 | Graphics 4 (4-color) | `Crtc::mode_4_color` | Yes — 4 slots |
| `tutorial_image2.ras` | 128×240 | Graphics 16 (16-color) | `Crtc::mode_16_color` | None |
| `tutorial_image3.ras` | 512×240 | Graphics 2 (2-color) | `Crtc::mode_2_color` | Yes — 1 slot |

Per `references/hardware.md`'s Colors section: Graphics 2 and Graphics 4 pick
their 2 or 4 active colors from the full 16-color palette via **programmable
palette registers** (ports `$60`-`$63`, wrapped by `Crtc::SetPalette`), so a
program in either mode has to explicitly assign a color to each palette slot
it uses or the image displays with whatever colors were left over from
before. Graphics 16 has **no palette registers at all** — its 4-bit pixel
value indexes the fixed 16-color palette directly — which is why
`tutorial_image2.ras` above has no `SetPalette` calls.

`tutorial_image.ras` (Graphics 4, 4 slots):

```pascal
Crtc::SetMode(Crtc::mode_4_color);
Crtc::EnableVRAM();
Crtc::SetPalette(0,Crtc::black);
Crtc::SetPalette(1,Crtc::yellow);
Crtc::SetPalette(2,Crtc::green);
Crtc::SetPalette(3,Crtc::blue);
// Copy to VRAM
Compression::Decompress(#image, $8000);
```

`tutorial_image3.ras` (Graphics 2, 1 slot — slot 0 is left at whatever it
already was):

```pascal
Crtc::SetMode(Crtc::mode_2_color);
Crtc::EnableVRAM();
Crtc::SetPalette(1,Crtc::green);
// Copy to VRAM
Compression::Decompress(#image, $8000);
```

Both exports in these two tutorials also pass `256` as `@export`'s width
parameter, the same as `tutorial_image2.ras`'s Graphics 16 export — despite
Graphics 4 being 256px wide and Graphics 2 being 512px wide. The `.flf`
asset's own stored dimensions are what actually control the exported image
data; see "Common mistakes" below before assuming this parameter has to
track the graphics mode's pixel width.

## Common mistakes

- **Calling `Decompress` before `EnableVRAM`.** `Compression::Decompress(#image,
  $8000)` writes to a raw address; it has no idea that address is supposed to
  be screen memory. If VRAM hasn't been paged in yet, `$8000` refers to
  whatever RAM page is currently mapped there instead (see
  `references/hardware.md`'s memory-mapping section), and the decompressed
  bytes silently vanish into ordinary RAM instead of appearing on screen.
  Always call `EnableVRAM()` before `Decompress`, matching all three
  tutorials' ordering.
- **Forgetting the palette on Graphics 4/2.** Since only Graphics 16 has a
  fixed palette, an image authored for Graphics 4 or Graphics 2 that skips
  `SetPalette` will decompress correctly but display with the wrong colors —
  whatever the palette registers were last set to (defaults, or leftovers
  from a previous mode), not the colors the art was actually drawn with.
- **Mismatching `@export`'s width parameter isn't as risky as it looks.**
  All three tutorials pass `256` regardless of the target graphics mode's
  actual pixel width (128, 256, or 512) — the export reads its real
  dimensions from the `.flf` asset itself. Don't assume this parameter has
  to be hand-tuned to match `Crtc::SetMode`'s resolution; treat the
  tutorials' own values as the safe default unless you have a specific
  reason (per `@export`'s docs in
  [`directives.md`](../language/directives.md), it's asset-type dependent)
  to change it.
