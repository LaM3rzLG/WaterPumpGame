# TVC unit tour: a non-GE "systems" demo

This is the single broadest example of `TVC.tru` usage in the bundled tutorial set,
and the best single reference for programs that want `TVC.tru`'s firmware-friendly
style rather than `GE.tru`'s game-engine style. It is deliberately a "kitchen sink"
tour, not a focused single-technique example like the other cookbook docs: one
program sets a graphics mode, writes text, controls the palette, redefines
characters to fake a running-man sprite, draws and fills vector shapes, animates a
bouncing XOR line, synchronizes timing to the raster interrupt, reads the joystick,
and drives the sound chip from an inline note table — all without touching `GE.tru`.
If you're building a demo, utility, or tool that wants to stay in ROM-call
firmware-style territory (see `references/api/tvc-unit.md`'s framing of `TVC.tru` vs.
`GE.tru`), this is the program to study end to end.

Source: `sources/tutorials/tutorials_bertok/tutorial_tvc.ras` (338 lines, by Bery/Zsolt
Bertók).

## What this uses

- **`TVC::SetGraphicsMode`** — selects Graphics 4 (256×240, 4-color) for the whole
  demo. See `references/api/tvc-unit.md`'s Screen table and
  `references/hardware.md`'s "Graphic modes" section.
- **`TVC::WriteAt` / `TVC::SetColor` / `TVC::TextBackground`** — character-grid text
  output and ink/paper color, used for the title, the "RASCAL"/"PASCAL" diagonal logo,
  and the footer line. See `references/api/tvc-unit.md`'s Text table.
- **`TVC::SetPalette` / `TVC::SetBorder`** — programs palette slots 0 and 1 and the
  border color; palette slot 1 is re-programmed live as the bouncing line changes
  color. See `references/api/tvc-unit.md`'s Constants/Screen tables and
  `references/hardware.md`'s "Colors and palette" section.
- **`TVC::DefChar` / `TVC::CreateCharImage` / `TVC::PutCharImage`** — the
  character-redefinition trio used to build and blit a 12-frame (24-character)
  run-cycle animation. See `references/api/tvc-unit.md`'s Text table (which calls this
  out explicitly as "TVC's character-based approach to sprite-like animation without
  the `GE` unit") and `references/hardware.md`'s "Safe-to-reuse memory areas" table
  (definable-character matrices at `$0740`).
- **`TVC::Rectangle` / `TVC::Line` with `TVC::SetLineMode(TVC::LINE_MODE_XOR)`** —
  vector drawing in the abstract 1024×960 coordinate space, including a
  flicker-free bouncing box drawn by XOR-mode lines (draw once to show, draw again
  to erase). See `references/api/tvc-unit.md`'s Graphics table and
  `references/hardware.md`'s "two coordinate systems" note.
- **`TVC::MoveTo` / `TVC::Fill`** — flood-fill from a pen position, used to fill the
  two outlined rectangles.
- **`TVC::FillRect`** — fast, non-firmware, byte-grid rectangle fill, used both for a
  solid decorative block and to erase the running man's trailing column each frame.
  See `references/api/tvc-unit.md`'s Graphics table's coordinate-system caveat.
- **`TVC::SetRasterInterruptPos` / `TVC::WaitForSync`** — programs a raster interrupt
  at a fixed screen line and blocks the main loop on it once per frame, giving the
  whole demo a stable ~50Hz heartbeat. See `references/api/tvc-unit.md`'s Screen table
  and `references/hardware.md`'s "CRTC 6845" section (raster-interrupt register math
  and the `Xpos`-must-not-be-0 quirk, both handled internally by the wrapper).
- **`TVC::Joystick`** — reads joystick 1's LEFT/RIGHT (toggle border-blink) and
  UP/DOWN (adjust music note duration) directions. See `references/api/tvc-unit.md`'s
  Keyboard table and `references/hardware.md`'s "Keyboard and joystick" section.
- **`TVC::Sound` / `TVC::Volume`** with an inline note-pitch data table — a
  184-entry `MusicData` array of raw pitch values drives a simple decaying-volume
  tune, with `TVC::SILENT_SOUND` as the rest marker. See `references/api/tvc-unit.md`'s
  Sound table and `references/hardware.md`'s Sound section.

## The pattern

From `sources/tutorials/tutorials_bertok/tutorial_tvc.ras`. **Compiling on Linux**:
this file's `@use "tvc"` (lowercase) will fail with "Could not find TRU file for
inclusion" against the actual unit file `TVC.tru` (uppercase) — `@use` is
case-sensitive against the on-disk filename on a case-sensitive filesystem. This is a
confirmed, real gotcha, not hypothetical — see `references/language/directives.md`'s
`@use` entry. Change the directive to `@use "TVC"` (matching the actual filename) if
you hit this.

```pascal
program Tutorial_TVC;
/*==================================================================
This tutorial presents the TVC unit.

The TVC unit uses the VIDEOTON TV-Computer system ROM routines 
and some helper functions coded in Assembly.

Author:  Bery (Zsolt Bertók)
Version: 22 February 2023.
==================================================================*/
@use "tvc"

var	
	TVComputerStr : string = "TV-COMPUTER";
	PascalStr			: string = "PASCAL";
	TRSEStr				: string = "TRSE";
	i 						: integer;
	y 						: byte;
	xPos 					: integer;
	yPos 					: integer;
	direction 		: byte = 0;
	lineX1Pos 		: integer = 512-150 + 4;
	lineY1Pos 		: integer = 718-150 + 4;
	lineX2Pos 		: integer = 512+150 - 4;
	lineY2Pos 		: integer = 718+150 - 4;
	lineDirection : byte = 1;	
	lineColor 		: byte = 2;	
	ColorCodes		: array[16] of byte = (0,1,4,5,16,17,20,21,64,65,68,69,80,81,84,85);
	ColorIdx 			: byte = 12;
	// Running man animation phases for character definition data - an animation phase consists of 2 characters (top, bottom)
	// Runnin left (6 phases)
	RunL1p1				: array[10] of byte = (0,48,48,48,48,24,60,60,124,124);
	RunL1p2				: array[10] of byte = (24,24,56,56,120,126,78,66,66,192);
	RunL2p1 			: array[10] of byte = (96,96,96,96,48,120,120,120,120,48);
	RunL2p2				: array[10] of byte = (48,48,48,56,60,20,16,16,16,48);
	RunL3p1 			: array[10] of byte = (96,96,96,96,48,112,112,112,112,48);
	RunL3p2				: array[10] of byte = (48,48,48,48,48,56,8,8,4,12);
	RunL4p1				: array[10] of byte = (0,48,48,48,48,16,56,56,56,56);
	RunL4p2				: array[10] of byte = (56,24,56,120,112,92,92,68,68,192);
	RunL5p1 			: array[10] of byte = (96,96,96,96,48,112,112,112,112,48);
	RunL5p2				: array[10] of byte = (48,48,48,48,56,24,24,16,16,48);
	RunL6p1				: array[10] of byte = (96,96,96,96,48,112,112,112,112,48);
	RunL6p2				: array[10] of byte = (48,48,112,112,48,24,24,56,4,12);
	// Runnin right (6 phases)
	RunR1p1				: array[10] of byte = (0,12,12,12,12,24,60,60,62,62);
	RunR1p2				: array[10] of byte = (24,24,28,28,30,126,114,66,66,2);
	RunR2p1				: array[10] of byte = (6,6,6,6,12,30,30,30,30,12);
	RunR2p2 			: array[10] of byte = (12,12,12,28,60,40,8,8,8,12);
	RunR3p1				: array[10] of byte = (6,6,6,6,12,14,14,14,14,12);
	RunR3p2				: array[10] of byte = (12,12,12,12,12,28,16,16,32,48);
	RunR4p1				: array[10] of byte = (0,12,12,12,12,8,28,28,28,28);
	RunR4p2 			: array[10] of byte = (28,24,28,30,14,58,58,34,34,2);
	RunR5p1				: array[10] of byte = (6,6,6,6,12,14,14,14,14,12);
	RunR5p2				: array[10] of byte = (12,12,12,12,28,24,24,8,8,12);
	RunR6p1				: array[10] of byte = (6,6,6,6,12,30,30,30,30,12);
	RunR6p2				: array[10] of byte = (12,12,14,14,12,24,24,28,32,48);	
	RunDirection	: byte = 2;
	RunXPos				: byte = 14;
	RunYPos				: byte = 176;
	RunFirstChar	: byte = 166;
	RunDelay		  : byte = 1;
	const MusicLength : integer = 184;
	MusicBorder		: boolean = false;
	MusicPos		  : integer = 0;
	MusicDuration : byte = 6;
	MusicDelay		: byte = 6;		
	MusicPitch    : integer = 4095;
	MusicVolume   : byte = 15;
	MusicData			: array [MusicLength] of integer = (3598,4095,4095,4095,4095,4095,3763,3723,3763,4095,4095,4095,3598,4095,4095,4095,3468,4095,4095,4095,4095,4095,3782,3763,3782,4095,
																										3763,4095,3723,4095,4095,4095,3468,4095,4095,4095,4095,4095,3782,3763,3782,4095,4095,4095,3598,4095,4095,4095,3537,4095,4095,4095,
																										4095,4095,3723,3677,3723,4095,3677,4095,3652,4095,3723,4095,3598,4095,4095,4095,4095,4095,3763,3723,3763,4095,4095,4095,3598,4095,
																										4095,4095,3468,4095,4095,4095,4095,4095,3782,3763,3782,4095,3763,4095,3723,4095,4095,4095,3468,4095,4095,4095,4095,4095,3782,3763,
																										3782,4095,4095,4095,3598,4095,4095,4095,3537,4095,4095,4095,4095,4095,3723,3677,3723,4095,3677,4095,3652,4095,3723,4095,3677,4095,
																										4095,4095,4095,4095,3652,3677,3723,4095,4095,4095,4095,4095,3677,3723,3763,4095,3723,4095,3677,4095,3652,4095,3598,4095,4095,4095,
																										3782,4095,4095,4095,3763,4095,4095,4095,4095,4095,4095,4095,4095,4095,4095,4095,3431,3782,3763,3723,3763,4095,4095,4095,4095,4095,
                                                    4095,4095);	
	
	procedure InitScreen();
	begin
		TVC::SetGraphicsMode(TVC::GRAPHICS4); // set graphic mode
		TVC::TextBackground(3);
		TVC::Cls(); // clear the screen
		TVC::SetBorder(TVC::BORDER_BLUE);
		TVC::SetPalette(0, TVC::PALETTE_WHITE);
		// Define characters
		// Running left animation phases
		TVC::DefChar(154, #RunL1p1); // User define charater to chr(154) from RunL1p1 data (10 bytes)
		TVC::DefChar(155, #RunL1p2);
		TVC::DefChar(156, #RunL2p1);
		TVC::DefChar(157, #RunL2p2);
		TVC::DefChar(158, #RunL3p1);
		TVC::DefChar(159, #RunL3p2);
		TVC::DefChar(160, #RunL4p1);
		TVC::DefChar(161, #RunL4p2);
		TVC::DefChar(162, #RunL5p1);
		TVC::DefChar(163, #RunL5p2);
		TVC::DefChar(164, #RunL6p1);
		TVC::DefChar(165, #RunL6p2);
		// Running right animation phases
		TVC::DefChar(166, #RunR1p1);
		TVC::DefChar(167, #RunR1p2);
		TVC::DefChar(168, #RunR2p1);
		TVC::DefChar(169, #RunR2p2);
		TVC::DefChar(170, #RunR3p1);
		TVC::DefChar(171, #RunR3p2);
		TVC::DefChar(172, #RunR4p1);
		TVC::DefChar(173, #RunR4p2);
		TVC::DefChar(174, #RunR5p1);
		TVC::DefChar(175, #RunR5p2);
		TVC::DefChar(176, #RunR6p1);
		TVC::DefChar(177, #RunR6p2);
		// Create 24 images from the 24 redefined characters
		TVC::CreateCharImage(154, 24, 3, 0); 
		// draw screen		
		TVC::SetColor(1);	
		TVC::WriteAt(6, 1, "TRSE TVC Unit Tutorial"); // write text to character position
		TVC::SetColor(2);
		// Draw RASCAL V logo
		y := 3;
		for i := 0 to 8 do
		begin
   		TVC::WriteAt( 1+i, y, #PascalStr);
			TVC::WriteAt(27-i, y, "RASCAL");
			y := y + 2;
		end;
		TVC::SetColor(2);
		TVC::WriteAt(11, y+2, #TVComputerStr);
		// Footer line
		TVC::WriteAt(1, 24, #TVComputerStr);
		TVC::SetColor(0);
		TVC::WriteAt(13, 24, "ROM routines by");
		TVC::SetColor(1);
		TVC::WriteAt(29, 24, #TRSEStr);
		// Draw rectangles
		TVC::Rectangle (10, 280, 160, 130);
		TVC::Rectangle (1023-160, 280, 1023-10, 130);
		// Fill the rectangles
		TVC::SetColor(2);
		TVC::MoveTo(20, 260);  // move pen to specified position
		TVC::Fill(); // fill area by TextColor
		TVC::MoveTo(900, 260);
		TVC::Fill();
		// filled rectangles (using character position and size in horizontal)
		TVC::TextBackground(0);
		TVC::FillRect(25, 34, 14, 50); // fill color specified by TextBackround procedure		
		// init for text movement
		TVC::TextBackground(3);
  	TVC::SetColor(1);	
		xPos := 440;
		yPos := 236;
		TVC::SetRasterInterruptPos(230); // set the raster-interrupt position
	end; /* InitScreen */
	
	
	procedure RunAnimation();
	begin
		Dec(RunDelay);
		if (RunDelay = 0) then
		begin
		  RunDelay := 2;
			RunFirstChar := RunFirstChar + 2;		
			if (RunDirection = 1) then
			begin
				// Running left			
				if (RunFirstChar > 164) then
					RunFirstChar := 154;	
				RunXPos := RunXPos - 1;
				if (RunXPos <= 14) then
				begin
					RunDirection := 2;
					RunFirstChar := 166;
				end;
			end
			else
			begin
				// Running right
				if (RunFirstChar > 176) then
					RunFirstChar := 166;
				RunXPos := RunXPos + 1;
				if (RunXPos >= 47) then
				begin
					RunDirection := 1;
					RunFirstChar := 154;
				end;
			end;
			// Put running man
			TVC::WaitForSync();
			TVC::PutCharImage(RunXPos, RunYPos, RunFirstChar, 1);
			TVC::PutCharImage(RunXPos, RunYPos+10, RunFirstChar+1, 1);
			// clear running man previous position
			if (RunDirection = 1) then 
				TVC::FillRect(RunXPos+2, RunYPos, 1, 20)
			else
				TVC::FillRect(RunXPos-1, RunYPos, 1, 20);
		end
		else
			TVC::WaitForSync();
	end; /* RunAnimation */
		
	
	procedure PlayMusic();
	begin
		Dec(MusicDelay);
		if (MusicDelay = 0) then
		begin
			MusicDelay := MusicDuration;
      MusicPitch := MusicData[MusicPos]; // next note of music			
      if (MusicPitch <> TVC::SILENT_SOUND) then
      begin
	      MusicVolume := TVC::MAX_VOLUME;
			  TVC::Volume(MusicVolume);
      end;
			TVC::Sound(MusicPitch); // Play note			
			if (MusicBorder) then
			begin
				// blinking border by music
				if (MusicData[MusicPos] <> TVC::SILENT_SOUND) then
					TVC::SetBorder(TVC::BORDER_DARKBLUE)
				else
					TVC::SetBorder(TVC::BORDER_BLUE);
			end;
			inc (MusicPos);
			if (MusicPos >= MusicLength) then
				MusicPos := 0;
		end
		else
		begin
			if (MusicPitch <> TVC::SILENT_SOUND) then
			begin
				MusicVolume := MusicVolume - 2; 
				TVC::Volume(MusicVolume);
			end;
		end;
		// Joystick
		if (TVC::Joystick(1, TVC::JOY_LEFT)) then
		begin
			// switch off the border blinking
			MusicBorder := False;
			TVC::SetBorder(TVC::BORDER_BLUE)
		end;
				if (TVC::Joystick(1, TVC::JOY_RIGHT)) then
		begin
			// switch on the border blinking
			MusicBorder := True;
		end;
		if (RunDelay = 1) then
		begin
			// Set music duration
			if (TVC::Joystick(1, TVC::JOY_UP)) then
			begin
				if (MusicDuration < 8) then
					Inc(MusicDuration);
				while (TVC::Joystick(1, TVC::JOY_UP)) do
				  TVC::Delay(1);
			end;
			if (TVC::Joystick(1, TVC::JOY_DOWN)) then
			begin
				if (MusicDuration > 2) then
					Dec(MusicDuration);
				while (TVC::Joystick(1, TVC::JOY_DOWN)) do
				  TVC::Delay(1);
			end;
		end;
	end; /* PlayMusic */
	
	
	procedure ChangeLineColor();
	begin
		inc (lineColor);
		if (lineColor > 3) then
			lineColor := 1;
		inc (ColorIdx);
		if (ColorIdx = 8) then
		  ColorIdx := 11;
		if (ColorIdx > 15) then
		  ColorIdx := 5;
		TVC::SetPalette(1, ColorCodes[ColorIdx]);
	end; /* ChangeLineColor */
	
	
	procedure LineAnimation();
	begin		
		case (lineDirection) of
			 1: begin	
				 		// move right
			 			lineX1Pos := lineX1Pos - 4;
			 			lineX2Pos := lineX2Pos + 4;
			 			if (lineX2Pos >= 512+150) then
			 			begin
			 				lineDirection := 2;
							ChangeLineColor();
			 		  end;
					end;	
			2: begin	
				 		// move down
			 			lineY1Pos := lineY1Pos + 4;
			 			lineY2Pos := lineY2Pos - 4;
			 			if (lineY1Pos >= 718+150) then
			 			begin
			 				lineDirection := 3;
			 				ChangeLineColor();
			 		  end;			 				
					end;
			3: begin	
				 		// move left
			 			lineX1Pos := lineX1Pos + 4;
			 			lineX2Pos := lineX2Pos - 4;
			 			if (lineX1Pos >= 512+150) then
			 			begin
			 				lineDirection := 4;
			 				ChangeLineColor();
			 		  end;
					end;	
			4: begin	
				 		// move up
			 			lineY1Pos := lineY1Pos - 4;
			 			lineY2Pos := lineY2Pos + 4;
			 			if (lineY2Pos >= 718+150) then
			 			begin
			 				lineDirection := 1;
			 				ChangeLineColor();
			 		  end;
					end;	
		end; // case
		TVC::SetLineMode(TVC::LINE_MODE_XOR);
		TVC::SetColor(lineColor);	
		TVC::Line(lineX1Pos, lineY1Pos, lineX2Pos, lineY2Pos);			
	end; /* LineAnimation */
	
	
begin
	InitScreen();
	while (true) do // infinity loop
	begin
		RunAnimation();
		LineAnimation();		
		PlayMusic();
	end;
end.
```

## How it works

### (a) The running-man animation via character redefinition

`InitScreen` calls `TVC::DefChar` 24 times (character codes 154-177), each supplying a
10-byte bitmap from a `RunL*p1`/`RunL*p2`/`RunR*p1`/`RunR*p2` array. Each pair of codes
(e.g. 154/155) is one animation frame split into a top half and a bottom half — a
"sprite" two characters tall. There are 6 running-left frames (codes 154-165) and 6
running-right frames (codes 166-177), giving 12 frames total, drawn as 24 distinct
redefined characters. `TVC::CreateCharImage(154, 24, 3, 0)` then pre-renders all 24 of
them into a fast-blit buffer once, up front (`references/api/tvc-unit.md` notes this
step is Graphics-4-only and must happen before any `PutCharImage` calls).

`RunAnimation` picks the current frame's first character code (`RunFirstChar`,
stepping by 2 to move between top/bottom pairs), and every other call (gated by
`RunDelay`) does the actual work: wait for the raster sync, then
`TVC::PutCharImage(RunXPos, RunYPos, RunFirstChar, 1)` and
`TVC::PutCharImage(RunXPos, RunYPos+10, RunFirstChar+1, 1)` blit the top and bottom
halves at the current character-grid position. Movement is one column per delayed
tick; the trailing edge is erased with a 1-column-wide `TVC::FillRect` behind the
figure as it moves. Direction reversal at the screen edges (`RunXPos <= 14` /
`RunXPos >= 47`) swaps which 12 character codes are used (154 vs. 166) and flips
`RunDirection`.

This is explicitly the pattern `references/api/tvc-unit.md` calls out as "TVC's
character-based approach to sprite-like animation without the `GE` unit": instead of
a bitmap sprite compositor that can sit at any pixel offset and mask against the
background (as `GE.tru`'s `Sprite`/`Image` classes do — see `references/api/ge-unit.md`),
the "sprite" here *is* a handful of character-grid cells whose glyph bitmaps get
swapped out frame by frame. Movement is quantized to character-cell steps (here, one
column = 8 pixels in Graphics 4), and animation is "swap the glyph," not "move a
bitmap" — cheap, no masking/collision math needed, but confined to the text grid
and to the 128-223 redefinable-character-code budget (96 codes, 90 of which are
free once you account for whatever the program's static screen text uses).

### (b) The bouncing XOR-line box

`LineAnimation` moves two opposite corners of a rectangle (`lineX1Pos,lineY1Pos` /
`lineX2Pos,lineY2Pos`) inward or outward by 4 units per call, cycling through four
`lineDirection` states (right/down/left/up) that make the "box" alternately shrink
and grow while sliding around a fixed center. Before drawing,
`TVC::SetLineMode(TVC::LINE_MODE_XOR)` switches the line-draw combine mode to XOR
(`references/api/tvc-unit.md`'s Graphics table; `references/hardware.md` doesn't need
to be consulted further here since `TVC::Line` already operates in the abstract
1024×960 coordinate space). Drawing the same line twice in XOR mode toggles the same
pixels back off, so each frame's box outline erases the previous frame's outline for
free — no separate clear step, no flicker from redrawing over a filled background.
Each time a direction-cycle boundary is hit, `ChangeLineColor` advances both the ink
color index and reprograms palette slot 1 via `TVC::SetPalette(1, ColorCodes[ColorIdx])`,
so the box's outline color visibly shifts every few bounces.

### (c) Raster-interrupt-synced timing

`InitScreen` calls `TVC::SetRasterInterruptPos(230)` once, arming a raster interrupt
near the bottom of the visible screen (see `references/hardware.md`'s CRTC section for
what this programs under the hood — register 14/15 plus the `Xpos`-must-not-be-0
workaround, both handled by the wrapper). `RunAnimation` then calls
`TVC::WaitForSync()` on *every* invocation — both on the "do nothing new this tick"
branch and right before actually blitting the running man — which is what gives the
whole main loop (`RunAnimation` → `LineAnimation` → `PlayMusic`, looped forever) a
steady one-call-per-frame cadence instead of running as fast as the CPU allows. This
is the same technique any TVC program needs for frame-rate-independent animation
timing without a full engine's frame scheduler.

### (d) Joystick-controlled movement

`PlayMusic` reads `TVC::Joystick(1, TVC::JOY_LEFT)` and `TVC::JOY_RIGHT`) to toggle
`MusicBorder`, a flag that makes `SetBorder` flicker between blue and dark-blue in
time with the music when enabled. It also reads `TVC::JOY_UP`/`TVC::JOY_DOWN` (gated
behind `RunDelay = 1` so the check only runs once per animation tick, not every raw
call) to grow or shrink `MusicDuration` — i.e. the joystick live-tunes the tempo of
the background tune. Note the debounce idiom: after detecting the press, the code
spins in `while (TVC::Joystick(...)) do TVC::Delay(1);` until the direction is
released, so one physical push changes the value exactly once rather than
free-running for as long as the stick is held.

### (e) The inline note-pitch table for simple music/sound

`MusicData` is a flat 184-entry `array of integer` of raw pitch values (the same
0-4095 range `TVC::Sound` expects, with `TVC::SILENT_SOUND` = 4095 meaning "rest").
`PlayMusic` steps through it one entry every `MusicDuration` ticks: on a new note it
sets `MusicVolume` to `TVC::MAX_VOLUME` and calls `TVC::Volume`/`TVC::Sound`; on the
ticks in between it decays `MusicVolume` by 2 each call, giving each note a crude
plucked/decaying envelope rather than a flat-volume buzz. This is about as simple as
music gets on the TVC's single square-wave channel — for anything with multiple
simultaneous notes or a real instrument/tracker format, `references/hardware.md`'s
Sound section points to `music.tru` instead, which takes over the sound interrupt
entirely.

## When to use this vs. the GE unit

This example's character-redefinition animation and `GE.tru`'s software sprites solve
the same problem — something on screen that moves and changes appearance — with
different tradeoffs:

- **Character redefinition (this example, `TVC.tru`)**: cheap to set up (`DefChar` +
  `CreateCharImage` + `PutCharImage`, no engine initialization), needs no dedicated
  sprite-list or background-save RAM pool, and blits are fast because they're
  whole-character copies. The cost: motion is quantized to the character grid (8
  pixels/column, 8-or-10 pixels/row depending on mode), and you're budget-constrained
  by the 96 redefinable character codes (128-223) minus whatever your static screen
  text already uses — fine for a handful of small recurring figures (a running man,
  a cursor, a simple enemy), not for many independently-animated objects or anything
  that needs sub-cell precision.
- **`GE.tru` software sprites**: pixel-precise positioning and movement, proper
  background masking so sprites can overlap arbitrary scenery without character-cell
  seams, and built-in collision detection — but you pay for it with the full `GE`
  engine's setup (its own screen/memory conventions, sprite lists, background-save
  pools) and it's a firmware-free, faster-but-more-involved API family that doesn't
  mix bookkeeping cleanly with `TVC.tru` calls (see `references/api/tvc-unit.md`'s
  intro and `references/api/ge-unit.md`).

Rule of thumb: if you're already writing a `TVC.tru`-style utility/demo/tool and just
need one or two simple animated elements confined to grid steps, character
redefinition (as here) is far less machinery. If you're building an actual game with
several independently-moving pixel-precise objects that must collide and overlap
cleanly, use `GE.tru`'s sprite system instead of trying to stretch this technique.
