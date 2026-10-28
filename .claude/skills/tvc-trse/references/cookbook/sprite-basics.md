# Sprites, animation, and joystick movement with `GE`

This is the primary reference for `GE.tru`'s `Sprite`/`Image` API — the
software sprite engine that stands in for hardware sprites TVC doesn't have.
One worked example covers the whole surface a typical action game needs:
tiled background drawing, sprite init with background save/restore for
flicker-free movement, sprite-sheet animation via `InitAnimation`/`Animation`,
a custom bitmap charset for on-screen text, joystick-driven player movement, a
patrolling-droid / bouncing-ball physics demo, and double-buffering-aware
rendering. See [`references/api/ge-unit.md`](../api/ge-unit.md) for the full
`GE` unit reference this doc draws on throughout.

## What this uses

- [`GE::Image.Init`/`Put`](../api/ge-unit.md#image-class) — a simple
  positioned bitmap blit (no mask, no background save/restore, no animation),
  used here to tile the wall background.
- [`GE::Sprite.Init`/`SaveBackground`/`Put`](../api/ge-unit.md#sprite-class)
  — the core sprite lifecycle: load a `[SpriteType][Width][Height][data...]`
  resource blob, position it, and snapshot the screen underneath it so it can
  later be erased cleanly.
- [`GE::Sprite.MoveLeft`/`MoveRight`](../api/ge-unit.md#sprite-class) — 1
  byte-column position shifts used for both the droid patrol and player
  movement.
- [`GE::Sprite.InitAnimation`/`Animation`](../api/ge-unit.md#sprite-class) —
  sprite-sheet animation: cycling a run of equal-sized frames stored back to
  back in one resource blob.
- A custom bitmap charset for text via
  [`GE::CharSetPtr`/`WriteText`](../api/ge-unit.md#text) — renders strings
  through a hand-drawn font image instead of the firmware character
  generator.
- [`GE::ScreenAddr`/`BACK_SCREEN_ADDR`](../api/ge-unit.md#constants)
  double-buffering awareness — the same render loop runs correctly whether
  `GE::Init` was called with `DIRECT_TO_SCREEN` or `USE_BACK_SCREEN`.
- Joystick-driven movement via
  [`GE::GetJoysticks`/`Joystick`](../api/ge-unit.md#keyboard--joystick--gamecard).
- A simple bouncing-ball / patrolling-droid physics demo built entirely from
  byte arithmetic on `Sprite.X`/`Y` and the move methods above — no engine
  physics involved, just the pattern every simple GE game reinvents.

## ⚠️ Migration note

The original tutorial this doc is based on,
`sources/tutorials/tutorials_bertok/SpriteDemo.ras`, targets the **2023** `GE`
API and will **not compile unmodified** against the bundled **2026**
`sources/tru-units/TVC/GE.tru`. Per
[`ge-unit.md`'s migration section](../api/ge-unit.md#migrating-2023-code-to-the-2026-build),
two of the three known breaking changes affect this file:

```pascal
// 2023 (original) — will not compile against the 2026 GE.tru:
RunnerSpr.InitAnimation(6, 1);
FanAnimSpr.InitAnimation(4, 3);
GE::CharSetHeight := 6;

// 2026 (patched):
RunnerSpr.InitAnimation(6, 1, GE::LOOP_FORWARD);  // 3rd arg required
FanAnimSpr.InitAnimation(4, 3, GE::LOOP_FORWARD);
GE::CharHeight := 6;                              // renamed field
```

`SpriteDemo.ras` doesn't use any of the per-key convenience functions
(`SpacePressed()` etc.) removed by the 2026 build's third breaking change, so
it's unaffected by that one.

The patched, 2026-compatible copy lives at
[`references/cookbook/assets/SpriteDemo_2026.ras`](assets/SpriteDemo_2026.ras)
— identical to the original except for those three call sites and a header
comment noting the patch. **Use the patched version** if you're adapting this
example; "The pattern" below is reproduced directly from it.

**This patch is verified, not just reasoned about**: compiled successfully
with `trse -cli` against an isolated copy of the toolchain with the canonical
2026 `GE.tru` swapped in — clean build, `.bin`/`.cas`/`.asm`/`.sym` all
produced, zero errors (only the same pre-existing "procedure used as function"
style warnings the original 2023 build also emits, unrelated to this patch).
The `CharSetHeight`→`CharHeight` rename (a real 2026 field rename, not
optional) was actually caught *by* this compile attempt, not by static
reading — the first patch attempt (`InitAnimation` fix only) failed to
compile with `Could not find variable 'GE_CharSetHeight'`, which is what
surfaced the third breaking change now documented in `ge-unit.md`.

## The pattern

Full source: [`references/cookbook/assets/SpriteDemo_2026.ras`](assets/SpriteDemo_2026.ras)
(patched from `sources/tutorials/tutorials_bertok/SpriteDemo.ras`; needs the
sibling `resources/images/` folder — `CharSet.bin`, `R2D2.bin`,
`RunRightAnim.bin`, `RunLeftAnim.bin`, `FanAnim.bin`, `MetalBall.bin`,
`Wall1.bin`, `Wall2.bin` — to actually build).

```pascal
program SpriteDemo;
/*==================================================================
Sprite Demo with Game Engine unit
for VIDEOTON TV-Computer

Author:  Bery (Zsolt Bertók)
Version: April 21, 2023.

Patched from sources/tutorials/tutorials_bertok/SpriteDemo.ras for
GE.tru 2026-01-31 compatibility — see references/cookbook/sprite-basics.md
==================================================================*/

@use "GE" // Game Engine unit

var
	/* Image bitmaps */
	WallBmp1      		  	: incbin("resources/images/Wall1.bin");
	WallBmp2      		  	: incbin("resources/images/Wall2.bin");
	/* Sprites data */
	FanAnim       		  	: incbin("resources/images/FanAnim.bin");
  RunRightAnim	        : incbin("resources/images/RunRightAnim.bin");
  RunLeftAnim	          : incbin("resources/images/RunLeftAnim.bin");
  R2D2SpriteData   			: incbin("resources/images/R2D2.bin");
  BallSpriteData   			: incbin("resources/images/MetalBall.bin");
  /* character set */
  CharSet               : incbin("resources/images/CharSet.bin"); /* ASCII 32-90 characters (SPACE to Z); 118 bytes * 6 lines; 1 char width: 2 bytes, height: 6 pixel */
  /* Info text */
  InfoText1             : string = ("TVC GAME ENGINE");
  InfoText2             : string = ("FOR TRSE PASCAL");
  InfoText3             : string = ("SPRITE DEMO");
  InfoText4             : string = ("MOVE THE RUNNER: JOY ", 76, "EFT", "-", 82, "IGHT");
  /* Consts */
  const P_MOVE_DELAY		: byte = 1;
  const LEFT      			: byte = 1;
  const RIGHT     			: byte = 2;
  const UP        			: byte = 3;
  const DOWN      			: byte = 4;
  const BALL_TOP_Y      : byte = 80;
  const MAX_BALL_VSPEED : byte = 10;
  /* Images */
  BackgroundImg1  			: GE::Image;
  BackgroundImg2  			: GE::Image;
  /* Sprites */
  FanAnimSpr            : GE::Sprite;
  RunnerSpr       			: GE::Sprite;
  R2D2Spr         			: GE::Sprite;
  R2D2Spr2        			: GE::Sprite;
  BallSpr             	: GE::Sprite;
  BallSpr2             	: GE::Sprite;
  /* other variables */
  BallVDir            	: byte;
  BallYSpeed						: byte = 0;
  PlayerMoveDelay 			: byte;
  i, x, y, Speed   			: byte;


  procedure Init;
  begin
	  Speed := 1;
	  GE::SetGraphics(GE::GRAPHICS16);
	  GE::SetBorder(GE::BORDER_DARKBLUE);
	  /* Init CharSet */
	  GE::CharSetPtr := #CharSet;
	  GE::CharSetImgWidth := 118;
	  GE::CharHeight := 6;
	  /* Write info text */
	  GE::WriteText(17,  5, #InfoText1);
	  GE::WriteText(17, 20, #InfoText2);
	  GE::WriteText(21, 35, #InfoText3);
	  GE::WriteText( 1, 60, #InfoText4);
	  /* Draw background */
	  BackgroundImg1.Init(#WallBmp1, 8, 33);
	  BackgroundImg2.Init(#WallBmp2, 8, 33);
	  y := 67;
	  x := 0;
		while (x < 128) dO
		begin
			BackgroundImg1.Y := y;
			BackgroundImg1.X := x;
			BackgroundImg1.Put;
			x := x + 8;
		end;
	  y := 100;
	  while (y < 200) do
	  begin
		  x := 0;
			while (x < 128) dO
			begin
				BackgroundImg1.Y := y;
				BackgroundImg1.X := x;
				BackgroundImg1.Put;
				BackgroundImg2.Y := y+33;
				BackgroundImg2.X := x;
				BackgroundImg2.Put;
				x := x + 8;
			end;
			y := y + 66;
		end;
		/* Init sprites */
		R2D2Spr.Init(#R2D2SpriteData, 10, 198, True);
		R2D2Spr.Direction := RIGHT;
		R2D2Spr.SaveBackground;
		R2D2Spr.Put();

		R2D2Spr2.Init(#R2D2SpriteData, 60, 132, True);
		R2D2Spr2.Direction := LEFT;
		R2D2Spr2.SaveBackground;

		BallSpr.Init(#BallSpriteData, 20, BALL_TOP_Y, True);
		BallSpr.Direction := RIGHT;
		BallSpr.SaveBackground;
		BallVDir := DOWN;

		BallSpr2.Init(#BallSpriteData, 50, BALL_TOP_Y, True);
		BallSpr2.Direction := LEFT;
		BallSpr2.SaveBackground;

		RunnerSpr.Init(#RunRightAnim, 10, 133, True);
		RunnerSpr.InitAnimation(6, 1, GE::LOOP_FORWARD);
		RunnerSpr.Direction := RIGHT;
		RunnerSpr.SaveBackground;

		FanAnimSpr.Init(#FanAnim, 48, 170, False);
		FanAnimSpr.InitAnimation(4, 3, GE::LOOP_FORWARD);
  end; /* Init */


  procedure RenderSprites;
  begin
	  if (GE::ScreenAddr <> GE::BACK_SCREEN_ADDR) then
		  GE::WaitForSync();
		GE::RenderAllSprites();
		if (GE::ScreenAddr = GE::BACK_SCREEN_ADDR) then
  		GE::CopyAllSpritesToScreen;
  end; /* RenderSprites */


  procedure R2D2Movement;
  begin
		case R2D2Spr.Direction of
		  LEFT  : if (R2D2Spr.X > 0) then
		  					R2D2Spr.MoveLeft()
		  			  else
		  			    R2D2Spr.Direction := RIGHT;
      RIGHT : if (R2D2Spr.X < 61) then
		  					R2D2Spr.MoveRight()
		  			  else
		  			    R2D2Spr.Direction := LEFT;
		end;
		case R2D2Spr2.Direction of
		  LEFT  : if (R2D2Spr2.X > 0) then
		  					R2D2Spr2.MoveLeft()
		  			  else
		  			    R2D2Spr2.Direction := RIGHT;
      RIGHT : if (R2D2Spr2.X < 61) then
		  					R2D2Spr2.MoveRight()
		  			  else
		  			    R2D2Spr2.Direction := LEFT;
		end;
  end; /* R2D2Movement */


  procedure BallMovement;
  begin
	  /* Vertical movement */
	  if (BallVDir = DOWN) then
	  begin
		  BallSpr.Y := BallSpr.Y + BallYSpeed;
		  if (BallSpr.Y >= 134) then
			  BallVDir := UP
		  else
		  begin
			  if (BallYSpeed < MAX_BALL_VSPEED) then
			    Inc (BallYSpeed);
		  end;
	  end
	  else
	  begin
		  /* BallVDir = UP */
		  BallSpr.Y := BallSpr.Y - BallYSpeed;
		  if (BallSpr.Y < BALL_TOP_Y) then
			  BallVDir := DOWN
		  else
		  begin
			  if (BallYSpeed > 0) then
			    Dec (BallYSpeed)
			  else
			    BallVDir := DOWN;
		  end;
	  end;
	  BallSpr2.Y := BallSpr.Y;
	  /* Horizontal movement */
	  /* Ball #1 */
	  if (BallSpr.Direction = RIGHT) then
	  begin
		  if (BallSpr.X < 60) then
		    Inc (BallSpr.X)
		  else
		    BallSpr.Direction := LEFT;
		end
		else
		begin
			if (BallSpr.X > 00) then
		    Dec (BallSpr.X)
		  else
		    BallSpr.Direction := RIGHT;
	  end;
	  BallSpr.SetPosition;
	  /* Ball #2 */
	  if (BallSpr2.Direction = RIGHT) then
	  begin
		  if (BallSpr2.X < 60) then
		    Inc (BallSpr2.X)
		  else
		    BallSpr2.Direction := LEFT;
		end
		else
		begin
			if (BallSpr2.X > 00) then
		    Dec (BallSpr2.X)
		  else
		    BallSpr2.Direction := RIGHT;
	  end;
	  BallSpr2.SetPosition;
  end; /* BallMovement */


  procedure RunnerControl;
  begin
		if (PlayerMoveDelay > 0) then
			Dec (PlayerMoveDelay)
		else
		begin
			GE::GetJoysticks();
			if ((RunnerSpr.X < 60) and GE::Joystick(1, GE::JOY_RIGHT)) then
			begin
				PlayerMoveDelay := P_MOVE_DELAY;
				RunnerSpr.MoveRight;
				if (RunnerSpr.Direction <> RIGHT) then
				begin
					RunnerSpr.Direction   := RIGHT;
					RunnerSpr.AnimSet     := #RunRightAnim+3; // +3 -> skip sprite type, width and height bytes
					RunnerSpr.AnimPhaseNr := 1;
				end;
				RunnerSpr.Animation();
			end;
			if ((RunnerSpr.X > 0) and GE::Joystick(1, GE::JOY_LEFT)) then
			begin
				PlayerMoveDelay := P_MOVE_DELAY;
				RunnerSpr.MoveLeft;
				if (RunnerSpr.Direction <> LEFT) then
				begin
					RunnerSpr.Direction   := LEFT;
					RunnerSpr.AnimSet     := #RunLeftAnim+3; // +3 -> skip sprite type, width and height bytes
					RunnerSpr.AnimPhaseNr := 1;
				end;
				RunnerSpr.Animation();
			end;
		end;
  end; /* RunnerControl */


begin
	/*
	GE::Init(GE::DIRECT_TO_SCREEN);
	GE::Init(GE::USE_BACK_SCREEN);
	*/
	GE::Init(GE::DIRECT_TO_SCREEN);
	if (GE::ScreenAddr <> GE::BACK_SCREEN_ADDR) then
	begin
		GE::SetMemory(GE::MEM_VID_ON);
		GE::SetRasterInterruptPos(160);
	end;
	Init;
	if (GE::ScreenAddr = GE::BACK_SCREEN_ADDR) then
		GE::CopyBackScreenToScreen;
	while (True) do
	begin
		FanAnimSpr.Animation;
		R2D2Movement;
		BallMovement;
		RunnerControl;
		RenderSprites;
	end;
end.
```

## How it works

**Background/image setup.** `BackgroundImg1`/`BackgroundImg2` are plain
`GE::Image`s, not sprites — no mask, no background buffer, no animation, just
an 8×33-pixel wall tile blitted repeatedly. `Init` tiles the whole 128-pixel
screen width in two loops: a top strip using only `BackgroundImg1`, then
alternating `BackgroundImg1`/`BackgroundImg2` rows every 66 pixels down to
form the corridor walls the sprites move through. Because `Image` has no
background save/restore, this only works as a *static* backdrop drawn once —
anything that needs to move over it and be erased cleanly has to be a
`Sprite` instead, which is exactly the division of labor this demo
demonstrates.

**Sprite init with background-buffer allocation.** Every sprite here is
initialized with `Init(DataPtr, X, Y, True)` — that trailing `True` is
`GetBackgroundBuffer`, telling `GE::Sprite.Init` to allocate a save-buffer
from the bump allocator described in
[`ge-unit.md`'s Memory map](../api/ge-unit.md#memory-map) (the 2560-byte pool
at 255-2815, spilling onto page RAM once exhausted). `FanAnimSpr` is the one
exception (`Init(#FanAnim, 48, 170, False)`): it never calls
`SaveBackground`/`RestoreBackground` and is never moved, only animated in
place, so it has no need for a background buffer at all — skipping the
allocation with `False` saves 2560-pool space for the sprites that actually
move. Immediately after `Init`, each moving sprite calls `SaveBackground` once
to snapshot the wall tile currently under it, so the render loop can erase it
cleanly on every subsequent frame.

**The `InitAnimation`/`Animation` sprite-sheet pattern.** `RunnerSpr` and
`FanAnimSpr` are both initialized from a resource blob containing several
equal-sized frames back to back (`RunRightAnim`/`FanAnim`).
`InitAnimation(AnimPhaseCount, AnimDelay, AnimType)` tells the sprite how many
frames there are and how many `Animation()` calls to wait between advancing
one frame; `Animation()` itself is called once per game-loop iteration
(`FanAnimSpr.Animation` unconditionally every frame in the `begin...end`
loop; `RunnerSpr.Animation()` only while the player is actually moving, in
`RunnerControl`). The patched 3rd argument, `GE::LOOP_FORWARD`, is what makes
both cycle `1 → N → 1 → N …` — the same behavior the original 2023 two-argument
call always had, since 2023 `InitAnimation` had no loop-mode concept at all.
The two other 2026 loop modes, per
[`ge-unit.md`'s `Sprite` table](../api/ge-unit.md#sprite-class), would behave
differently here: `GE::LOOP_BACKWARD` would cycle `N → 1 → N …` instead (frames
played in reverse), and `GE::LOOP_PINGPONG` would bounce `1 → N → 1`,
reversing direction at each end instead of jumping back to frame 1 — closer
to a "breathing" fan-blade wobble than a continuous spin, and probably the
more natural choice for `FanAnimSpr` if you're experimenting, though
`LOOP_FORWARD` is what preserves this demo's original look. Note also
`RunnerControl`'s direction-change handling: switching between `RunRightAnim`
and `RunLeftAnim` isn't done via `InitAnimation` again — it just repoints
`AnimSet` directly (`RunnerSpr.AnimSet := #RunRightAnim+3`, skipping the
3-byte `[SpriteType][Width][Height]` header) and resets `AnimPhaseNr := 1`,
which is cheaper than re-running the full `InitAnimation` bookkeeping for a
same-shaped animation set.

**Joystick-driven movement.** `RunnerControl` first burns down
`PlayerMoveDelay` (set to `P_MOVE_DELAY` on every actual move) so the runner
doesn't move every single frame — a simple frame-based speed throttle common
to byte-grid sprite movement. Once the delay expires, `GE::GetJoysticks()`
refreshes the cached joystick state, and `GE::Joystick(1, GE::JOY_RIGHT)` /
`GE::Joystick(1, GE::JOY_LEFT)` test port 1's bitmask (see
[`ge-unit.md`'s Constants table](../api/ge-unit.md#constants) — built-in
joysticks 1/2 use `JOY_*`, not the differently-encoded GameCard `GAMECARD_JOY_*`
family). Bounds checks (`RunnerSpr.X < 60`, `RunnerSpr.X > 0`) keep the runner
from walking off the tiled corridor. A direction change swaps both the sprite
frame-set and the animation phase before calling `Animation()`, so the very
first frame after turning around is already the correct facing.

**Double-buffering awareness.** The program works unmodified whether
`GE::Init` is called with `GE::DIRECT_TO_SCREEN` or `GE::USE_BACK_SCREEN`
(the commented-out alternative at the top of the `begin...end` block) because
every place that matters branches on `GE::ScreenAddr` at runtime rather than
assuming one mode:

- In the top-level block, `GE::SetRasterInterruptPos`/`SetMemory` are only
  needed in direct-to-screen mode (`ScreenAddr <> BACK_SCREEN_ADDR`); in
  back-screen mode, an initial `GE::CopyBackScreenToScreen` flips the
  first fully-drawn frame into view instead.
- `RenderSprites` calls `GE::WaitForSync()` before rendering **only** in
  direct-to-screen mode (to avoid tearing against the live raster beam), then
  always calls `GE::RenderAllSprites()`, then — **only** in back-screen mode
  — calls `GE::CopyAllSpritesToScreen` to flip just the sprites' dirty
  rectangles from the off-screen `$C000` buffer to the live `$8000` screen.

This is the standard idiom for writing a `GE` render loop that works under
either rendering mode without duplicating the frame logic — see
[`ge-unit.md`'s Sprite-list bulk operations](../api/ge-unit.md#sprite-list-bulk-operations-ge) for `RenderAllSprites`/`CopyAllSpritesToScreen`/`CopyBackScreenToScreen`.

## Common mistakes

- **Copying 2023-era `InitAnimation` calls verbatim into 2026 code.** The
  2-argument form (`InitAnimation(PhaseCount, Delay)`) simply won't compile
  against the bundled `GE.tru` — always add the 3rd `AnimType` argument (see
  the migration note above). If you don't care about the loop style, use
  `GE::LOOP_FORWARD` to match old behavior.
- **Skipping `SaveBackground` after `Init`.** `Init(..., True)` only
  *allocates* the background buffer — it doesn't populate it. A sprite moved
  or rendered before its first `SaveBackground` call will smear/duplicate
  itself on screen instead of cleanly erasing its previous position, because
  `RenderAllSprites`/`RestoreBackground` are restoring stale (uninitialized)
  buffer contents.
- **Calling `RunnerSpr.Animation()` without checking `RunnerSpr.Direction`
  first when switching frame-sets.** `Animation()` just advances through
  whatever `AnimSet` currently points at; if you repoint `AnimSet` to a
  differently-sized frame-set without also resetting `AnimPhaseNr`, playback
  picks up mid-sequence at the wrong byte offset instead of starting clean
  from frame 1.
- **Mixing up `CopyAllSpritesToScreen` and `CopyBackScreenToScreen`.** The
  former only flips sprites' dirty rectangles (cheap, per-frame); the latter
  flips the *entire* back screen (expensive, meant for one-time full-frame
  transitions like the initial reveal after `Init`). Calling the full-screen
  version every frame instead of the sprite-only version works but costs far
  more CPU than this demo's render loop needs.
- **Forgetting `GE::EnableTVCITHandler()` if you mix in firmware-dependent
  `TVC::` calls.** Per
  [`ge-unit.md`'s intro](../api/ge-unit.md), `GE::Init` disables the stock
  TVC firmware interrupt handler; this demo never calls firmware services
  after `GE::Init`, but if you extend it with e.g. `TVC::` keyboard or file
  I/O calls, they'll misbehave silently unless you re-enable the firmware
  handler first.
