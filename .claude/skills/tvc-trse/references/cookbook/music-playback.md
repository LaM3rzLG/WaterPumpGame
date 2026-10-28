# Background music playback with the Music unit

The TVC's sound hardware gives you exactly **one** channel — a single square-wave
oscillator, 6 octaves, 4-bit volume (see `references/hardware.md`'s Sound section).
That's enough for a beep or a jingle via `TVC::Sound`/`SoundEx`, but not for a
multi-voice chiptune playing underneath your game or demo. To get real background
music you need `music.tru`, which throws away the simple one-tone model entirely and
synthesizes 3 independent voices in software, mixed into that same single hardware
volume port by a custom high-frequency timer interrupt. The full API is documented in
`references/api/music-unit.md` — this page walks through the worked example that
exercises it.

## What this uses

- [`Music::Init`](../api/music-unit.md) — prepares the frequency table for a chosen
  interrupt tick rate; must be called before `Play`.
- [`Music::Play`](../api/music-unit.md) — installs the custom interrupt handler and
  starts streaming/mixing a music data blob.
- [`Music::IsMusicFinished`](../api/music-unit.md) — non-blocking poll: `0` while
  playing, `255` once the track hits its `FINISH` marker.
- [`Music::Stop`](../api/music-unit.md) — hands the interrupt vector back and silences
  the sound port. See "How it works" below for why this is mandatory.
- Two playback configurations, shown back-to-back in the same program:
  - `Music::INTERRUPT_FREQ_5008` (`$D9`) + `Music::BPM_SID_5008` (884) — used here on a
    **non-looped** track (`FINISH` ends it, the poll loop exits).
  - `Music::INTERRUPT_FREQ_8491` (`$E9`) + `Music::BPM_SID_8491` (500) — used here on a
    **looped** track (`LOOP` restarts it forever, so the caller never polls
    `IsMusicFinished` and just runs its own `while(True)` loop instead).

## The pattern

Full source: `sources/tutorials/tutorials/music.ras`. This is the same plasma demo
covered in `references/cookbook/plasma-effect.md` — the plasma fill is only here as a
visible backdrop to play music over; its mechanics aren't repeated in this doc.

```pascal
program MusicUnitDemo;
@use "Music"
@use "crtc"

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

	music_1_data : incbin("data/music_test1_sid.bin");	// music with disabled loop
	music_2_data : incbin("data/music_test2_sid.bin");	// music with enabled loop
	bg_color: byte = 1;

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
	// test non blocking music player @5008Hz interrupt frequency
	// music is not looped
	Music::Init(Music::INTERRUPT_FREQ_5008);
	Music::Play(#music_1_data, Music::BPM_SID_5008, Music::GRAPHICS_MODE_4);
	
	Crtc::SetMode(Crtc::mode_4_color);
	Crtc::EnableVRAM();
	Crtc::SetPalette(0,Crtc::black);
	Crtc::SetPalette(1,Crtc::dark_blue);
	Crtc::SetPalette(2,Crtc::dark_magenta);
	Crtc::SetPalette(3,Crtc::green);
	
	// Clear full screen
	Fill($8000,0,64*240);
	while (Music::IsMusicFinished() = 0) do
	begin
		Calculate();
		time2+=5;
		time+=1;
		shift:=time&1;
		Plasma()
	end;
	Music::Stop();
	
	Crtc::SetMode(Crtc::mode_16_color);

	// test non blocking music player @8491Hz interrupt frequency		
	// music is looped
	Music::Init(Music::INTERRUPT_FREQ_8491);
	Music::Play(#music_2_data, Music::BPM_SID_8491, Music::GRAPHICS_MODE_16);
	
	while(True) do 
	begin
		Fill($8F00,bg_color,64*132);
		Inc(bg_color);
	end;
end.
```

## How it works

The lifecycle is always **Init → Play → poll `IsMusicFinished` → Stop**:

1. `Music::Init(freq)` builds the frequency lookup table for the tick rate you're
   about to run at (`INTERRUPT_FREQ_5008` or `INTERRUPT_FREQ_8491`) — it does not
   start any sound by itself.
2. `Music::Play(#data, bpm, graphics_mode)` is where playback actually starts: it
   installs the custom interrupt handler at `$38`, disables the CRTC cursor interrupt,
   and begins streaming/mixing the 3-channel data. From this point the interrupt
   vector belongs to the music player, not the firmware.
3. The main loop is non-blocking — `Music::IsMusicFinished()` is just a flag read, so
   the caller is free to do real work (here, the plasma `Calculate()`/`Plasma()` pair)
   on every iteration while music plays in the background via interrupts. This is
   exactly what happens in the first half of the demo: the loop runs plasma frames
   until the non-looped track hits its `FINISH` marker and the poll returns `255`.
4. `Music::Stop()` **must** be called once playback ends (or to abort early). Per
   `references/api/music-unit.md`, hitting `FINISH` only mutes the sound port and sets
   the finished flag — the custom interrupt handler is still installed. `Play`'s
   interrupt takeover is the same kind of firmware hijack documented in
   `references/api/system-unit.md` (alongside `System::DisableFirmware` and
   `GE::DisableTVCITHandler`): once something else owns `$38`, only an explicit
   restore call gives it back. `Stop()` is that restore call — it puts back a
   stock-ish interrupt entry and re-enables the CRTC cursor interrupt. Skipping it
   leaves the machine with the music ISR permanently wedged into the interrupt vector.
5. The demo's second half never calls `IsMusicFinished`/`Stop` at all — `music_2_data`
   has looping enabled (`LOOP` control byte, see `references/api/music-unit.md`'s data
   format table), so the track restarts forever and the program just runs its own
   infinite `while(True)` loop underneath it until the machine is reset.

## Asset pipeline: getting a .sid tune onto TVC

`music.ras`'s header comments document the actual, real pipeline used to produce the
`.bin` files it `incbin`s (`data/music_test1_sid.bin`, `data/music_test2_sid.bin`).
As written in the source:

1. **Get a `.sid` tune.** Either download one from a SID archive, or create a new one
   in a tracker:
   - Archives: [deepsid.chordian.net](https://deepsid.chordian.net/) and
     [hvsc.c64.org/downloads](https://www.hvsc.c64.org/downloads) — "58000+ SID music"
     per the comment.
   - Recommended tracker (Windows): **GoatTracker 2.76** —
     [sourceforge.net/projects/goattracker2](https://sourceforge.net/projects/goattracker2/files/GoatTracker%202/2.76/).
     Other SID trackers are listed at
     [chordian.net/c64editors.htm](https://chordian.net/c64editors.htm).
2. **Convert the `.sid` file into a `.bin`** using `SIDDumpTVCGUIv1.1.exe` — a Windows
   GUI tool, packaged with the underlying `SIDDumpTVC` converter. Both are credited in
   the comments: `SIDDumpTVC` (c) Béla Szalontai, 2023-2024; `SIDDumpTVCGUI` (c) Károly
   Kiss, 2023-2024. Download:
   [tvc.hu/cas/2024/Util/SidDumpTvcGUI_v1.1.zip](http://tvc.hu/cas/2024/Util/SidDumpTvcGUI_v1.1.zip).
3. **`incbin` the converted `.bin`** into your TRSE app, e.g.
   `music_1_data : incbin("data/music_test1_sid.bin");`, and pass `#music_1_data` as
   the `data_pointer` argument to `Music::Play`.

The comments also point to the original implementation manual and music-format
description, packaged as a PDF inside the "Fast&Force" music player source release:
[tvc.hu/cas/2024/Szalontai_Béla(Fast&Force)/FF_Music_Player_Source.zip](http://tvc.hu/cas/2024/Szalontai_B%c3%a9la(Fast&Force)/FF_Music_Player_Source.zip).
That's the primary source for the byte-level format summarized in
`references/api/music-unit.md`'s "Music data format" section.

## Common mistakes

- **`@use "Music"` failing with "Could not find TRU file for inclusion" on Linux.**
  The actual unit file is `music.tru` (lowercase); `@use` is case-sensitive against
  the on-disk filename on a case-sensitive filesystem. This is a real, confirmed
  gotcha (not hypothetical) — see `references/language/directives.md`'s `@use` entry.
- **Forgetting `Music::Stop()`.** `IsMusicFinished() = 255` only means the track ended
  and sound is muted — the custom interrupt handler from `Play` is still installed.
  Leaving it in place (e.g. exiting the poll loop straight into other code, or into a
  routine that assumes firmware interrupts) will misbehave the same way any unhandled
  `System::DisableFirmware`-style hijack does. Always pair `Play` with a later `Stop`.
- **Passing the wrong `graphics_mode` to `Play`.** The third argument isn't
  informational — per `references/api/music-unit.md`, the volume port's usable
  bit-width depends on it, so it must match whatever the last actual
  `TVC::SetGraphicsMode`/`GE::SetGraphics`/`Crtc::SetMode` call set (`GRAPHICS_MODE_2`
  /`4`/`16`), not just whatever mode you happen to be about to switch to next. In the
  example, `Music::Play(..., Music::GRAPHICS_MODE_4)` is called *before*
  `Crtc::SetMode(Crtc::mode_4_color)` runs, but it's still correct because the value
  passed describes the color-depth family the volume-bit mask should use, matching
  what the CRTC is set to for that playback segment — not a request to change modes.
- **Mismatching interrupt frequency and BPM constants.** `INTERRUPT_FREQ_5008` pairs
  with `BPM_SID_5008`, `INTERRUPT_FREQ_8491` with `BPM_SID_8491` — the tick rate and
  tempo base are derived together (`BPM_DIVIDER` in `references/api/music-unit.md`
  converts BPM into a per-frame divisor relative to the interrupt rate `Init` was
  called with). Mixing a `5008` `Init` with an `8491` BPM constant will play the track
  at the wrong tempo.
- **Reusing a `TVC::Volume` value for anything music-related.** `Music`'s
  `MAX_VOLUME` is 20, a different scale than `TVC.tru`'s 0-15 — see
  `references/api/music-unit.md`'s Constants table.
