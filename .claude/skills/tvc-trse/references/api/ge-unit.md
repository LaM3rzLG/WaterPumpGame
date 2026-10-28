# `GE` unit reference — Berysoft's Game Engine

Source: `sources/tru-units/TVC/GE.tru`, the **canonical 2026-01-31 build** (8232
lines), authored by Zsolt Bertók ("Bery"/BerySoft). The prior build bundled with the
TRSE install (2023-05-10, 2951 lines) is kept at
`sources/tru-units/TVC/legacy/GE.2023-05-10.tru` for reference only — **use the 2026
build for new code.** Full raw catalogs: `sources/notes/notes_tru_units.md` §3 (2023
baseline) and `sources/notes/notes_ge_tru_2026.md` (2026 delta, authoritative for
anything that differs).

**What it's for**: a self-contained, firmware-free, faster alternative to `TVC.tru`,
purpose-built for games. Its core value is a **software sprite/image engine** — TVC
has no hardware sprites, so `GE::Sprite` implements them as byte-rectangle blits with
background save/restore for flicker-free movement — plus a bitmap-font text renderer,
hardware scrolling in all 8 directions, ZX7 asset decompression, sample-based "digi
sound" playback, and (new in 2026) a 3rd/4th-joystick expansion peripheral. It
duplicates most of `TVC.tru`'s screen/keyboard/sound/misc helpers under the same
names, independently implemented, TVC-firmware-free where possible.

`@use "GE"` to import. All calls use `GE::ProcName(...)` syntax.

**Don't mix `TVC::` and `GE::` casually** — see `references/api/tvc-unit.md`'s intro.
One additional GE-specific reason: **`GE::Init` disables the stock TVC firmware
interrupt handler** as of the 2026 build (see §Screen/graphics below) — any `TVC::`
call that depends on firmware housekeeping (e.g. keyboard-matrix auto-scan, cursor
blink) will misbehave after `GE::Init` unless you call `GE::EnableTVCITHandler()`
first.

## Migrating 2023 code to the 2026 build

**Three breaking changes** — found by actually compiling patched examples against the
canonical 2026 unit (see `references/cookbook/sprite-basics.md` and
`full-game-walkthrough.md` for the verification detail; the original research pass
that produced `sources/notes/notes_ge_tru_2026.md` only caught the first two).
Everything else is a strict additive superset:

1. **`Sprite.InitAnimation` gained a required 3rd argument.** 2023 code:
   `sprite.InitAnimation(PhaseCount, Delay)`. 2026: `sprite.InitAnimation(PhaseCount,
   Delay, AnimType)`, where `AnimType` is `GE::LOOP_FORWARD` (pass this to preserve
   the old behavior), `GE::LOOP_PINGPONG`, or `GE::LOOP_BACKWARD`.
2. **The per-key convenience functions were removed**: `SpacePressed()`,
   `ReturnPressed()`, `EscPressed()`, `CtrlPressed()`, `ShiftPressed()`, `AltPressed()`
   no longer exist. Replace with `GE::Pressed(KeyCode)` using the matching `KEY_*`
   constant: `GE::Pressed(GE::KEY_SPACE)`, `GE::Pressed(GE::KEY_RET)`,
   `GE::Pressed(GE::KEY_ESC)`, `GE::Pressed(GE::KEY_CTRL)`,
   `GE::Pressed(GE::KEY_SHIFT)`, `GE::Pressed(GE::KEY_ALT)`. Requires a prior
   `GetKeyboard()` call, same as the functions it replaces did.
3. **The `CharSetHeight` global was renamed to `CharHeight`.** 2023 code assigning
   `GE::CharSetHeight := N;` (as part of configuring the `WriteText` bitmap font)
   fails to compile against 2026 — this is a genuine rename, not an alias; the 2023
   name doesn't exist in the 2026 build at all. Change every `GE::CharSetHeight` to
   `GE::CharHeight` (or use the new `InitCharSet(...)` convenience wrapper, which
   takes `CharHeight` as its 4th parameter directly).

This directly affects the bundled tutorial examples — `sources/tutorials/
tutorials_bertok/SpriteDemo.ras` and `SpaceWar.ras` were written against the 2023 API
and will **not compile unmodified** against the 2026 `GE.tru`. Patched, verified-
compiling (for `SpriteDemo`) copies are at `references/cookbook/assets/
SpriteDemo_2026.ras` — apply all three fixes if adapting the originals yourself.
`SpaceWar.ras` needs the same three fixes but currently doesn't build clean with the
`trse` binary available at patch-writing time **even in its own original, unmodified
2023 form** — see `references/cookbook/full-game-walkthrough.md`'s migration note for
the full detail; this appears to be a toolchain/compiler-build sensitivity to
`SpaceWar`'s scale, unrelated to the API migration itself.

## Memory map

From the unit's own header comment — useful for RAM-budgeting when combining GE with
your own data structures:

```
 255 - 2815 (2560 bytes) sprite background buffers (free to use if no sprite.Init allocates one)
3696 - 3735 (  40 bytes) Game Engine variables
3736 - 3755 (  20 bytes) Game Engine variables 2 (originally: PROG_ID)
5300 - 5803 ( 504 bytes) Stack
5888 - 6143 ( 256 bytes) Mirror table (free to use if you don't call InitSpriteMirroring)
6144 - 6343 ( 200 bytes) SpriteList (100 sprites x 2-byte pointer)
6344 - 6623 ( 280 bytes) List class objects (free to use if you don't use List)

Free memory areas:
3056 - 3655 ( 600 bytes) tape working area (free if you don't use file operations)
3756 - 5299 (1544 bytes) Stack lower area
5804 - 5887 (  84 bytes) BASIC working area
6624 - 6638 (  15 bytes) BASIC working area
```

Sprite background buffers still primarily come from the 2560-byte pool at 255-2815 via
a bump allocator (`MemAllocPtr`/`FreeMemSize`/`MemAllocPage`), spilling onto Page 1/2/3
top-down once exhausted. The Mirror table and `List` pool are both explicitly
documented as reclaimable if you skip those two features.

## Constants

| Group | Values |
|---|---|
| Screen | `SCREEN_WIDTH`=64 (bytes/row), `SCREEN_HEIGHT`=240, `SCREEN_SIZE`=15360, `SCREEN_ADDR`=`$8000`, `BACK_SCREEN_ADDR`=`$C000` |
| Memory mapping | `MEM_DEFAULT`(0), `MEM_VID_ON`(1), `MEM_FULL_64K`(2), `MEM_48K_VID`(3) — same as `TVC.tru` |
| Graphics modes | `GRAPHICS2`(0), `GRAPHICS4`(1), `GRAPHICS16`(2) — same as `TVC.tru` |
| Rendering mode | `USE_BACK_SCREEN`(1), `DIRECT_TO_SCREEN`(0) — passed to `GE::Init` |
| Sound (square-wave) | `SOUND_LO_PORT`(4)/`SOUND_HI_PORT`(5)/`SOUND_VOLUME_PORT`(6), `SILENT_SOUND`, `MAX_VOLUME`(15) — same ports as `TVC.tru` |
| Joystick (built-in, `Nr`=1/2) | `JOY_LEFT`(64), `JOY_RIGHT`(32), `JOY_UP`(2), `JOY_DOWN`(4), `JOY_FIRE`(8) |
| Joystick (GameCard, `Nr`=3/4) | `GAMECARD_JOY_UP`(1), `_DOWN`(2), `_LEFT`(4), `_RIGHT`(8), `_FIRE`(16) — **different encoding than the built-in `JOY_*` set**, don't mix them across joystick numbers |
| Palette / Border | `PALETTE_*`, `BORDER_*` — same as `TVC.tru`; `GR4_COLOR0..3`, `GR16_COLOR_BLACK`..`GR16_COLOR_WHITE` for direct color-byte constants |
| Animation loop type | `LOOP_FORWARD`(0), `LOOP_PINGPONG`(1), `LOOP_BACKWARD`(2) — **[2026]** |
| Scroll direction | `SCROLL_UP`(1), `SCROLL_UP_RIGHT`(2), `SCROLL_RIGHT`(3), `SCROLL_DOWN_RIGHT`(4), `SCROLL_DOWN`(5), `SCROLL_DOWN_LEFT`(6), `SCROLL_LEFT`(7), `SCROLL_UP_LEFT`(8) — **[2026]** |
| Digi sound | `DIGI_FREQ_8_KHZ`(232)/`_4_KHZ`(206)/`_2_KHZ`(158), `DIGI_TYPE_1x4BIT`(0)/`_2x4BIT`(1) — **[2026]**, see Sound section |
| GameCard | `GAME_CARD_ID`="JOY+SN", `EXT_SLOT_COUNT`(4), `SLOT_0..3_BASE_ADDR` — **[2026]** |
| Key codes | ~90 `KEY_*` constants (letters, digits, punctuation, `KEY_SPACE`/`KEY_RET`/`KEY_ESC`/`KEY_CTRL`/`KEY_SHIFT`/`KEY_ALT`, Hungarian accented letters) for `GE::Pressed` — **[2026]** |
| Class sizes | `SPRITE_CLASS_SIZE`=39, `IMAGE_CLASS_SIZE`=11 — **[2026]**, useful if hand-computing memory budgets |

Key globals: `ScreenAddr` (currently active draw target, `$8000` live or `$C000`
back-screen), `MemAllocPtr`/`FreeMemSize`/`MemAllocPage` (the sprite-background bump
allocator's state), `SpriteListPtr`/`LastSpritePtr`/`SpriteCount` (the global sprite
registry used by every `*AllSprites` bulk op), `CharSetPtr`/`CharSetImgWidth`/
`CharWidth`/`CharHeight` (bitmap-font config — must point at an `incbin`-loaded font
image before calling `WriteText`).

## `Sprite` class

Software sprites — byte-rectangle images blitted onto the screen (or an off-screen
"back screen" in double-buffered mode) with background save/restore for flicker-free
movement. Not hardware objects; TVC has none.

**Fields** (39 bytes total, `SPRITE_CLASS_SIZE`): `Visible: boolean`, `SpriteType:
byte` (1=plain bitmap, 2=masked), `Data: pointer` (mask+image bytes), `Background:
pointer`, `Position`/`LastPosition: integer` (raw screen byte address), `VisibleState:
byte` (internal, deferred show/hide), `Width: byte` (bytes), `Height: byte` (pixel
rows), `Size: integer`, `X`/`Y: byte` (byte-grid coords), `LastX`/`LastY: byte`,
`ToNextRow: byte` (precomputed stride), `AnimSet: pointer`, `AnimType: byte`
(`LOOP_*`), `AnimPhaseCount`/`AnimPhaseNr: byte`, `WasAnimated: boolean` (set by
`Animation()`, caller must clear), `AnimDirection: byte` (internal ping-pong state),
`UseBackground: boolean`, `GroupNr: byte` (for `CollidedWith`), `AnimDelay`/
`AnimDelayCountdown: byte`, `LastAnimSprite: pointer` (cached, for `LOOP_BACKWARD`),
`Mirrored: boolean`, and 5 free-use scratch bytes: `State`, `Direction`, `Timer`,
`Counter`, `Delay`.

If you have code that pokes a `Sprite` by raw byte offset instead of field name (rare,
unsupported), note the field layout grew since 2023 — normal field-name access is
unaffected.

| Method | Description |
|---|---|
| `procedure Init(ImagePtr: pointer; X, Y: byte; GetBackgroundBuffer: boolean)` | Initializes from a resource blob (`[SpriteType][Width][Height][mask+image data...]`), computes size/stride, sets position, registers in the global sprite list, and (if `GetBackgroundBuffer`) allocates a background-save buffer. |
| `procedure FastDraw` | Fastest masked draw — uses the Z80 `SP` register as a data-streaming register (interrupts disabled during the blit); also saves the background. |
| `procedure Draw` | Masked draw (AND mask, OR image) without touching `SP`/interrupts — safer, slower than `FastDraw`; also saves background. |
| `procedure SmallPut` | Opaque draw like `Put`, but smaller code / slightly slower (`ldir` per row instead of unrolled `ldi`). |
| `procedure RestoreBackground` | Copies the saved background buffer back over the sprite's last position (erases the sprite). |
| `procedure SaveBackground` | Copies current screen content under the sprite into its background buffer; updates `LastPosition`/`LastX`/`LastY`. |
| `procedure Put` | Blits the sprite opaquely (no mask, no background save). |
| `procedure CopyToScreen` | With `UseBackScreen`: copies the minimal dirty rectangle spanning old+new position from back screen to live screen. |
| `procedure SetPosition()` | Recomputes `Position` from `X`/`Y`. |
| `procedure UpdateLastPos` | Manually syncs `LastPosition`/`LastX`/`LastY` (for custom copy workflows). |
| `procedure Render` | **[2026]** Convenience: if `Visible`, restores background (if used), draws (`Draw` or `Put` per `SpriteType`), re-saves background, updates last-position — everything `RenderAllSprites` does but for one sprite, for manual render ordering. |
| `procedure MoveLeft()` / `MoveRight()` | Shift 1 byte-column. |
| `procedure MoveLeftBy2()` / `MoveRightBy2()` | **[2026]** Shift 2 byte-columns. |
| `procedure MoveUp()` / `MoveDown()` | Shift 1 row. |
| `procedure MoveUpBy2()` / `MoveDownBy2()` | Shift 2 rows. |
| `procedure MoveUpBy4()` / `MoveDownBy4()` | Shift 4 rows (optimized: touches only the position high byte). |
| `procedure MoveUpBy8()` / `MoveDownBy8()` | **[2026]** Shift 8 rows. |
| `procedure Show` | **[2026]** Marks a hidden sprite to appear on the next `RenderAllSprites`/`RenderScrollSprites` pass (deferred, not immediate). No-op if already visible. |
| `procedure Hide` | **[2026]** Marks a visible sprite to disappear on the next render pass. No-op if already hidden. |
| `procedure SetBackground(BackgroundBuffer: pointer)` | **[2026]** Manually assigns/replaces the background-save buffer, bypassing `Init`'s allocator — e.g. to share one static buffer across several small sprites. |
| `function Collided(Sprite2: pointer): boolean` | **[2026]** AABB collision test against one specific sprite (uses `X`/`Y`/`Width`/`Height`). |
| `function CollidedWith(GroupNr: byte): integer` | **[2026]** Scans the global sprite list for a visible sprite whose `GroupNr` matches, AABB-testing each; returns a pointer to the first hit, or 0. Lets "did the player hit any enemy" skip maintaining a separate list. |
| `procedure InitAnimation(AnimPhaseCount, AnimDelay, AnimType: byte)` | Configures sprite-sheet animation (`Data` = first of `AnimPhaseCount` equal-sized frames). **3rd argument `AnimType` is new in 2026 — see Migration notes above.** For `LOOP_BACKWARD`, also precomputes/caches the last-frame address. |
| `procedure Animation()` | Advances the animation by `AnimDelay` calls per phase. Branches on `AnimType`: `LOOP_FORWARD` cycles 1→N→1...; `LOOP_BACKWARD` cycles N→1→N...; `LOOP_PINGPONG` bounces 1→N→1, reversing at each end. Sets `WasAnimated := True` on every phase change — **you must clear this yourself**, it's never reset automatically. |
| `procedure ResetAnimation(ImageSet: pointer)` | **[2026]** Re-points at a different frame-set (e.g. "walk" → "run") without redoing full `InitAnimation` bookkeeping. |
| Mirrored drawing: `FastDrawMirror`, `DrawMirror`, `PutMirrored` | **[2026]** Mirror equivalents of `FastDraw`/`Draw`/`Put`, reading through the 256-byte `MIRROR_TABLE`. Requires `GE::InitSpriteMirroring()` to have been called once at startup. |
| Scroll-aware drawing: `ScrollFastDraw`, `ScrollDraw`, `ScrollSaveBackground`, `ScrollRestoreBackground`, `ScrollPut`, `ScrollRender`, `ScrollFastRender` | **[2026]** Variants of the above draw/save/restore methods whose row-advance wraps within the scrolled VRAM window — use these instead of the plain versions right after `GE::Scroll`/`ScrollUp`/`ScrollDown`. `ScrollFastRender` is not safe alongside Digi Sound playback (both want the interrupt). |

## `Image` class

Simpler than `Sprite`: no mask, no background save/restore, no animation — a
positioned bitmap blit. Fields (11 bytes, `IMAGE_CLASS_SIZE`): `Bitmap: pointer`,
`Position: integer`, `Width`/`Height: byte`, `Size: integer`, `X`/`Y: byte`,
`ToNextRow: byte`.

| Method | Description |
|---|---|
| `procedure Init(ImagePtr: pointer; Width, Height: byte)` | Sets bitmap pointer/dimensions, precomputes size and row stride. |
| `procedure Put` | Blits the bitmap opaquely at `X`/`Y`. |
| `procedure FastPut` | **[2026]** Faster/larger-code variant of `Put` (unrolled `ldi` blit). |
| `procedure PutToPos` | **[2026]** Draws from the already-computed `Position` field, skipping the `X`/`Y` recompute — for repeated draws at a manually-tracked position. |
| `procedure PutRect(StartX, StartY, Width, Height: byte)` | **[2026]** Draws only a sub-rectangle of the bitmap — treats `Bitmap` as a sprite-sheet/atlas and blits one cell. |
| `procedure ScrollPut` / `ScrollPutToPos` | **[2026]** Scroll-aware variants handling the VRAM wraparound. |
| `procedure SetPosition()` | **[2026]** Recomputes `Position` from `X`/`Y`. |
| `procedure MoveLeft()` / `MoveRight()` | **[2026]** Shift 1 byte-column. |
| `procedure MoveUp()` / `MoveUpBy2()` / `MoveUpBy4()` | **[2026]** Shift up 1/2/4 rows. |
| `procedure MoveDown()` / `MoveDownBy2()` / `MoveDownBy4()` | **[2026]** Shift down 1/2/4 rows. |

2023's `Image` was a one-shot static blit only (`Init`/`Put`); the 2026 build brings it
to near-parity with `Sprite` for positioning/movement (still no background save/
restore, masking, or animation — use `Sprite` when you need those).

## `List` class — new in 2026

A small fixed-capacity (max **20 items**) pointer list, allocated from the 280-byte
pool at 6344-6623. Intended for building ad-hoc groups (e.g. an enemy roster or
waypoint list) — note `Sprite.CollidedWith` works off the *global* sprite list
filtered by `GroupNr`, not off a `List` instance; `List` is a general-purpose
container, not wired into the collision API.

Fields: `MemAddr: integer` (storage address: byte 0 = count, then up to 20×2-byte item
pointers), `NextItemAddr: integer` (internal write cursor).

| Method | Description |
|---|---|
| `procedure Init()` | Claims the next 41-byte slot from the `List` pool, zeroes the count. |
| `procedure Add(ItemAddr: integer)` | Appends a pointer. **No bounds check** — exceeding 20 items silently overwrites the next `List`'s storage. |
| `function Count: byte` | Current item count. |
| `function Get(Nr: byte): integer` | Returns the `Nr`-th item (0-based); if `Nr >= Count`, falls back to item 0 rather than erroring. |
| `procedure Clear()` | Resets count to 0 (no need to re-`Init`). |

## Sprite-list bulk operations (`GE::...`)

| Signature | Description |
|---|---|
| `procedure SetMemory(Mode: byte)` | Same memory-bank switch as `TVC::SetMemory`, GE-local constants. |
| `procedure Init(UseBackScreen: boolean)` | Initializes the engine: `DIRECT_TO_SCREEN` or `USE_BACK_SCREEN` (double-buffered, needs 64K). **As of 2026, also calls `DisableTVCITHandler` internally** — see below. |
| `function GetMemoryMapping(): byte` | **[2026]** Reads back the current memory-mapping byte (companion to `SetMemory`). |
| `procedure EnableTVCITHandler()` | **[2026]** Restores the original firmware interrupt handler. Call before using firmware services (e.g. file I/O) after `GE::Init` (or any `DisableTVCITHandler` call) has replaced it. |
| `procedure DisableTVCITHandler()` | **[2026]** Installs GE's minimal interrupt handler (acks and returns — skips firmware keyboard-scan/cursor-blink housekeeping, freeing CPU time). Called automatically by `GE::Init`. |
| `procedure ResetSpriteList()` | **[2026]** Clears the sprite list and frees all background-buffer allocations — for multi-scene programs re-`Init`ing a fresh sprite set per level. |
| `procedure InitSpriteMirroring()` | **[2026]** Builds the 256-byte mirror lookup table. Call once at startup (after setting graphics mode) before using any `*Mirror`/`PutMirrored`/`PutAllSpritesWithMirroring` call. |
| `procedure RenderAllSprites` | Standard per-frame call: restores every sprite's background, redraws all, re-saves backgrounds. **[2026]**: also processes deferred `Show`/`Hide`. |
| `procedure RenderScrollSprites` | **[2026]** Scroll-aware equivalent of `RenderAllSprites`, using the `Scroll*` sprite methods and handling VRAM-window wraparound. |
| `procedure CopyAllSpritesToScreen` | With back-screen mode: copies every sprite's dirty rectangle to the live screen. |
| `procedure DrawAllSprites` | Draws all sprites without restoring backgrounds first (no erase). |
| `procedure PutAllSprites` | `Put`s all sprites (opaque, no mask/background). |
| `procedure PutAllSpritesWithMirroring` | **[2026]** Bulk `Put`, using `PutMirrored` for sprites with `Mirrored = True`. Requires `InitSpriteMirroring()`; only meaningful for maskless (`SpriteType=1`) sprites. |
| `procedure PutScrollSprites` | **[2026]** Scroll-aware bulk `Put` (no background handling). |
| `procedure SaveAllSpritesBackground` / `RestoreAllSpritesBackground` | **[2026]** Bulk save/restore — e.g. capture backgrounds once after drawing a level, or blank all sprites off-screen at once. |
| `procedure CopyBackScreenToScreen` | Full-frame flip: copies the entire back screen to the live screen. |
| `procedure CopyBackScreenRectToScreen(X, Y, Width, Height: byte)` | Copies a specific byte-grid rectangle, back screen → live screen. |
| `procedure CopyBackScreenRectFromPosToScreen(Position: integer; Width, Height: byte)` | **[2026]** Same, but takes a precomputed raw `Position` instead of `X`/`Y`. |

## Screen / graphics / CRTC

| Signature | Description |
|---|---|
| `procedure SetGraphics(Mode: byte)` | Same as `TVC::SetGraphicsMode`. |
| `function GetGraphics(): byte` | Same as `TVC::GetGraphicsMode`. |
| `procedure SetPalette(Nr, Color: byte)` | Same as `TVC::SetPalette`. |
| `procedure SetBorder(Color: byte)` | Same as `TVC::SetBorder`. |
| `procedure WaitForSync()` | Same as `TVC::WaitForSync`. |
| `procedure SetRasterInterruptPos(Nr: byte)` | Same as `TVC::SetRasterInterruptPos`. |
| `procedure SetRasterInterruptPosEx(LineNr, CharNr: byte)` | **[2026]** Finer-grained: positions the raster/cursor interrupt at a specific character column within a line, not just line granularity. |
| `procedure SetGraphMode(Mode: byte)` | **[2026]** Sets graphics mode via a **direct port-6 write** — no firmware call, no screen clear. For switching resolution mid-frame (e.g. from a raster-interrupt handler) to get a split-screen effect. |
| `procedure SetScreenLines(ScreenLines: byte)` | **[2026]** Sets displayed scanline count via CRTC register 6 (must be a multiple of 4) — e.g. 200 for a letterboxed screen. |
| `procedure SetVerticalSyncPos(VertSyncPos: byte)` | **[2026]** Sets CRTC register 7 (default 66 for 240 lines) — pair with `SetScreenLines` to re-center a non-default-height display. |
| `procedure ClearScreen(Pattern: byte)` | Fills the active screen (live or back) with a byte pattern. |
| `procedure FillRect(X, Y, Width, Height, Pattern: byte)` | Byte-grid rectangle fill (direct memory write, no firmware). |
| `procedure FillRectAtPos(Position: integer; Width, Height, Pattern: byte)` | **[2026]** Same, but takes a raw `Position` instead of `X`/`Y`. |
| `procedure VBytesLine(Position: integer; Count, Pattern: byte)` | Vertical run of `Count` bytes of `Pattern` from a raw screen address. |
| `procedure HBytesLine(Position: integer; Count, Pattern: byte)` | Horizontal run of `Count` bytes of `Pattern` from a raw screen address. |
| `procedure PutByte(Position: integer; Pattern: byte)` | **[2026]** Writes one raw byte at a screen position. |
| `function GetMemByte(MemAddr: integer): byte` | **[2026]** Generic PEEK (not screen-specific). |
| `function GetMemInt(MemAddr: integer): integer` | **[2026]** Generic 2-byte read. |

### Scrolling

| Signature | Description |
|---|---|
| `procedure ScrollUp(UpdateSpritePos: boolean)` | Hardware-scrolls up 1 CRTC step (= 4 pixel rows) via the CRTC start-address register (direct-to-screen only); optionally shifts sprite Y positions to compensate. |
| `procedure ScrollDown(UpdateSpritePos: boolean)` | Same, scrolling down. |
| `procedure Scroll(ScrollDirection: byte; UpdateSpritePos: boolean)` | **[2026]** Generalizes the above to all 8 `SCROLL_*` directions (including diagonals). Updates the CRTC screen-start register, cursor/raster-interrupt position, `ScreenAddr`, and (if `UpdateSpritePos`) sprite positions. |
| `procedure ResetScroll()` | **[2026]** Resets the CRTC screen-start offset and `ScreenAddr` back to defaults, undoing accumulated scroll state. |

## Keyboard / joystick / GameCard

Requires an explicit scan call before reading press-state — unlike `TVC.tru`'s
keyboard functions, this works even after `GE::Init`/`DisableTVCITHandler` has
replaced the firmware interrupt handler.

| Signature | Description |
|---|---|
| `procedure GetKeyboard` | Scans the full 10-row matrix into `KEYBOARD_0..7`/`JOY1_STATE`/`JOY2_STATE`. Must precede `Pressed`/`KeyPressed`. |
| `function KeyPressed(): boolean` | Any key held, per the cached matrix. |
| `function Pressed(KeyCode: integer): boolean` | **[2026]** Generic per-key test, replacing the removed `SpacePressed`-family functions. Use a `KEY_*` constant. Requires a prior `GetKeyboard()`. |
| `procedure GetJoysticks` | Scans the 2 built-in joystick matrix rows (lighter than `GetKeyboard` if that's all you need). **[2026]**: if a GameCard was detected, also polls its 2 extra ports into `Joy3State`/`Joy4State`. |
| `function Joystick(Nr, JoyCode: byte): boolean` | Tests a bitmask against joystick `Nr`'s cached state. `Nr`=1/2 use `JOY_*` constants (built-in ports); `Nr`=3/4 **[2026]** use the differently-encoded `GAMECARD_JOY_*` constants — don't cross the two families. |

### GameCard — new in 2026

A joystick-expansion peripheral plugging into one of the 4 external expansion slots
(base ports `$40`/`$70`/`$A0`/`$D0`), giving 2 extra joystick ports (up to 4
simultaneous joysticks total — e.g. for 3-4 player games).

| Signature | Description |
|---|---|
| `procedure InitGameCard()` | Scans slots 0-3 for a card whose ID string matches `GAME_CARD_ID` ("JOY+SN"). If found, sets `GameCardFound := True` and computes `GameCardJoy3Port`/`GameCardJoy4Port`. **Call once at startup**, before using joystick numbers 3/4. |

## Sound

### Square-wave tone (identical to `TVC::Sound`/`Volume`/etc.)

| Signature | Description |
|---|---|
| `procedure Volume(SoundVolume: byte)` | Set volume, 0-15. |
| `procedure SoundOn()` / `SoundOff()` | Re-enable / silence. |
| `procedure Sound(Pitch: integer)` | Play continuous tone. |
| `procedure NoSound()` | Stop tone. |

### Digi Sound — new in 2026 (4-bit PCM/sample playback)

A completely separate playback path: instead of one continuous tone, streams a
pre-recorded 4-bit sample buffer through the same volume port on every tick of a
dedicated high-frequency sound interrupt. **Mutually timing-exclusive with the
raster/cursor interrupt** — `DigiSoundOn` takes over `$38` with its own handler and
disables the cursor interrupt; `DigiSoundOff` reverses this.

| Signature | Description |
|---|---|
| `procedure DigiSoundOn(Frequency, DigiSoundType: byte)` | Initializes playback. `Frequency`: `DIGI_FREQ_2_KHZ`/`4_KHZ`/`8_KHZ` (4KHz recommended — "good enough quality, less space than 8KHz"). `DigiSoundType`: `DIGI_TYPE_1x4BIT` (1 nibble/byte, full size, ~12.6% CPU at 4KHz) or `DIGI_TYPE_2x4BIT` (2 nibbles/byte, ~half size, ~20% CPU). |
| `procedure DigiSoundOff()` | Disables the sound interrupt, re-enables the cursor/raster interrupt, restores GE's (or firmware's, if `EnableTVCITHandler` was also called) normal handler. |
| `procedure PlayDigiSound(SoundEffect: pointer)` | Starts non-blocking playback of a prepared sample buffer (typically `incbin`-loaded). Poll `IsDigiSoundPlaying`/`Is2x4bitDigiSoundPlaying` for completion. Requires `DigiSoundOn` first. |
| `procedure WaitForDigiSoundSync()` | **Use this instead of `WaitForSync()` while digi-sound is active** — the cursor interrupt is disabled, so this counts sound-interrupt ticks to approximate a 50Hz frame sync instead. |
| `function IsDigiSoundPlaying: boolean` | Whether a `DIGI_TYPE_1x4BIT` sample is still playing. |
| `function Is2x4bitDigiSoundPlaying: boolean` | Same, for `DIGI_TYPE_2x4BIT` — **the two poll functions are not interchangeable**, each type uses a different end-marker convention. |

Samples are prepared externally: record/edit in Audacity → export 8-bit mono WAV →
convert with the author's "TVC digi" converter tool → 4-bit TVC sample format,
embedded via `incbin`.

## Text

| Signature | Description |
|---|---|
| `procedure InitCharSet(CharSetPtr: pointer; CharSetImgWidth: integer; CharWidth, CharHeight: byte)` | **[2026]** Convenience wrapper that sets the 4 font-config globals in one call (equivalent to assigning them directly, which still works too). Call before `WriteText`. |
| `procedure WriteText(X, Y: byte; Text: ^byte)` | Renders a 0-terminated string using a custom bitmap font (`CharSetPtr`), blitted directly to screen bytes — bypasses the firmware character generator for speed. **[2026]**: now accent-aware — codes 128-143 map to uppercase Hungarian accented letters (Á É Í Ó Ö Ő Ú Ü Ű), codes ≥144 to their lowercase forms; codes 32-127 behave as in 2023 (plain ASCII space through the base charset, which only covered 32-90). |

## Helpers / misc

| Signature | Description |
|---|---|
| `function In(Nr: byte): byte` | Raw port read. |
| `procedure Out(Nr, Value: byte)` | Raw port write. |
| `function Rnd(): byte` | Pseudo-random byte from the Z80 R register. |
| `procedure Delay(DelayTicks: integer)` | Busy-wait N raster syncs (~20ms/unit). |
| `procedure MicroDelay(Count: byte)` | **[2026]** Fine-grained busy-wait (tight `nop`/`djnz` loop), sub-raster-tick granularity. |
| `function Odd(Nr: byte): boolean` | Odd/even test. |
| `procedure IntToStr(IntNum: integer)` / `ByteToStr(Nr: byte)` | Decimal-string conversion into the shared `NumStr` buffer. |
| `procedure FillMem(MemAddr: integer; Size: integer; Pattern: byte)` | Generic memory fill (not screen-specific). |
| `procedure MemCopy(SourcePtr, DestPtr: pointer; Size: integer)` | Raw block copy. |
| `procedure CopyLines(SourcePtr, DestPtr: pointer; ScreenLines: byte)` | **[2026]** Copies `ScreenLines × 64`-byte rows — row-count-based sibling of `MemCopy` for blitting e.g. N rows of a title image. |
| `procedure ZX7Decompress(SourcePtr, DestPtr: pointer)` | Decompresses ZX7-compressed asset data (`incbin("...zx7")`) — used to keep compiled asset size down for images/sprites shipped compressed. |
