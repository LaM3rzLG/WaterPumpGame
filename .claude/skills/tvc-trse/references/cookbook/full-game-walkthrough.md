# A complete game: SpaceWar

This is the richest single reference in this skill for how a **complete TVC
game** is actually structured — not an isolated effect or a single technique,
but the whole shape of a shippable arcade game built on the `GE` (Berysoft
Game Engine) unit: title screen, control-info screen, a per-frame game loop,
entity records for lasers and enemies, an enemy state machine, AABB collision
detection, sprite-sheet explosion animation, interleaved procedural music and
sound-effect timing, level progression, and a game-over/restart flow. At 893
lines it is also the largest and most complete example bundled anywhere in
this skill. When a request is "help me build a TVC game" rather than "how do
I do X on TVC," this is the file to read end to end and crib from.

## ⚠️ Migration note

The original source, `sources/tutorials/tutorials_bertok/SpaceWar.ras`, was
written in April 2023 against the **2023 `GE.tru` API**
(`sources/tru-units/TVC/legacy/GE.2023-05-10.tru`) and **will not compile
unmodified** against this skill's canonical, bundled 2026 build
(`sources/tru-units/TVC/GE.tru`). This is exactly the breaking changes called
out in `references/api/ge-unit.md`'s "Migrating 2023 code to the 2026 build"
section, and `SpaceWar.ras` hits all three:

1. **`Sprite.InitAnimation` gained a required 3rd argument.** Original line
   201 (`InitGame`):
   ```pascal
   ExplosionSprite.InitAnimation(3, 1);
   ```
   2026 `InitAnimation(AnimPhaseCount, AnimDelay, AnimType: byte)` requires a
   3rd `AnimType` argument. Fixed to:
   ```pascal
   ExplosionSprite.InitAnimation(3, 1, GE::LOOP_FORWARD);
   ```
   `GE::LOOP_FORWARD` reproduces the 2023 engine's only animation behavior
   (cycle 1→N→1...), so this is a pure compatibility fix with no behavior
   change.

2. **`GE::SpacePressed` / `GE::SpacePressed()` no longer exist.** The 2026
   build removed the whole per-key convenience family
   (`SpacePressed`/`ReturnPressed`/`EscPressed`/`CtrlPressed`/`ShiftPressed`/
   `AltPressed`) in favor of one generic `GE::Pressed(KeyCode: integer):
   boolean`. `SpaceWar.ras` calls the removed function **7 times**, in both
   the parenthesized (`SpacePressed()`) and bare (`SpacePressed`, used
   directly as a boolean expression) forms — both need to become
   `GE::Pressed(GE::KEY_SPACE)`, which always takes the explicit argument:

   | Original line | Procedure | Original text |
   |---|---|---|
   | 168 | `TitleScreen` | `while ((not GE::SpacePressed) and (not GE::Joystick(1, GE::JOY_FIRE))) do` |
   | 233 | `GameInfo` | `while ((not GE::SpacePressed) and (not GE::Joystick(1, GE::JOY_FIRE))) do` |
   | 461 | `PlayerControl` | `if (GE::Joystick(1, GE::JOY_FIRE) or GE::SpacePressed()) then` |
   | 822 | `GameOver` (release-wait) | `while (GE::SpacePressed() or (GE::Joystick(1, GE::JOY_FIRE))) do` |
   | 828 | `GameOver` (press-wait) | `while ((not GE::SpacePressed) and (not GE::Joystick(1, GE::JOY_FIRE))) do` |
   | 853 | `NewLevel` (release-wait) | `while (GE::SpacePressed() or (GE::Joystick(1, GE::JOY_FIRE))) do` |
   | 859 | `NewLevel` (press-wait) | `while ((not GE::SpacePressed) and (not GE::Joystick(1, GE::JOY_FIRE))) do` |

   All 7 sites were found by grepping the file for `SpacePressed` and
   confirmed by reading every call site in context — there are no others.

3. **The `CharSetHeight` global was renamed to `CharHeight`.** Original line
   194 (`InitCharSet`-equivalent setup):
   ```pascal
   GE::CharSetHeight := 7;
   ```
   fixed to:
   ```pascal
   GE::CharHeight := 7;
   ```
   This one wasn't caught by the original research pass — it only surfaced
   when the patched `SpriteDemo_2026.ras` (see
   `references/cookbook/sprite-basics.md`) was actually compiled and failed
   with `Could not find variable 'GE_CharSetHeight'`. It's now documented as
   the 3rd breaking change in `references/api/ge-unit.md`.

**`references/cookbook/assets/SpaceWar_2026.ras`** is a patched copy of the
original with all three fixes applied at all 9 call sites (1 `InitAnimation`
+ 7 `SpacePressed` + 1 `CharSetHeight`) and nothing else changed — it should
be functionally identical to the original. All line numbers and code
references below point at this patched file, not the original. (The original
2023-targeting source remains at
`sources/tutorials/tutorials_bertok/SpaceWar.ras` for provenance/history
only — don't copy code from it directly without re-applying these fixes.)

**Compile-verification status — read before trusting this "compiles"
claim.** Unlike `SpriteDemo_2026.ras` (verified via a clean compile),
`SpaceWar_2026.ras` currently does **not** successfully build with the `trse`
binary available at patch-writing time, and — importantly — **neither does
the original, completely unmodified 2023 `SpaceWar.ras`** against its own
matching 2023 `GE.tru`, when compiled fresh with this toolchain. The two
attempts fail with two *different* assembler-level errors (`Symbol
'(GE_Joy3State)' undefined` against the 2026 engine; `constant '' already
defined` at a line simply reading `= X` against the 2023 engine), neither of
which is related to the API migration above — the migration patch itself was
verified correct by careful manual diff against the documented API, not by a
successful compile. This looks like a pre-existing sensitivity in the
currently-installed `trse` build to `SpaceWar`'s scale/complexity (it's by
far the largest file in this skill), possibly a toolchain-version mismatch
against whatever produced the bundled, working `SpaceWar.bin`/`.cas`
artifacts — not a defect introduced by this patch, and not something this
skill-authoring pass could resolve without a different `trse` build to test
against. Treat the architecture and patterns below as reliable (they're
unchanged from a real, previously-shipped, working game); treat "this exact
file compiles right now, here" as unverified.

## What this uses

- **`GE::ZX7Decompress`** — the title screen image (`SpaceWarTitle.zx7`) is
  shipped ZX7-compressed and unpacked straight into VRAM at startup; see
  `references/api/ge-unit.md`'s Helpers/misc table and compare with the
  simpler `Compression::Decompress` pattern in
  `references/cookbook/display-image.md`.
- **A custom bitmap font** — `GE::CharSetPtr`/`CharSetImgWidth`/
  `CharHeight` are pointed at an `incbin`-loaded glyph image
  (`CharSetGr4.bin`, ASCII 32-90) before any `GE::WriteText` call; see the
  Text section of `references/api/ge-unit.md`.
- **Record types as lightweight game entities** — `LaserRec` and `EnemyRec`
  (plain Pascal `record`s, not classes) model per-instance game state; see
  "Entity records" below.
- **A multi-enemy state machine** — each `EnemyRec.State` drives a `case`
  dispatch (`SIDE_MOVE`/`ATTACK`/`FLY_BACK`/`EXPLOSION`/`DESTROYED`); see
  "The enemy state machine" below.
- **Laser pooling with direct VRAM writes** — lasers are drawn and erased
  with `GE::VBytesLine` against a hand-tracked raw screen address
  (`LaserRec.Pos`/`PrevPos`), not via `GE::Sprite`; see
  `references/api/ge-unit.md`'s Screen/graphics table and "Laser pooling"
  below.
- **AABB collision detection**, hand-rolled with plain byte-range
  comparisons (not `GE::Sprite.Collided`/`CollidedWith`, which are 2026-only
  additions the original 2023 code predates) — see "Collision detection"
  below.
- **Explosion sprite animation** via `GE::Sprite.InitAnimation`/`.Animation`
  — one shared `ExplosionSprite` instance is repositioned and re-triggered
  for every enemy/player death; see `references/api/ge-unit.md`'s `Sprite`
  class table.
- **Procedural music and sound-effect timing interleaved with the game
  loop** — `PlayMusic` advances one note per call and is invoked from the
  title/info wait-loops; laser and explosion sounds use manually decaying
  pitch/volume, all via `GE::Sound`/`GE::Volume`. See the Sound section of
  `references/api/ge-unit.md`.
- **Level progression** via `InitNewLevel`/`NewLevel`, scaling enemy
  aggressiveness (`EnemyAttackDelay`, `EnemyMinLaserDelay`) with `Level`.
- **Joystick + spacebar input**, both accepted interchangeably everywhere
  via `GE::Joystick(1, GE::JOY_FIRE)` and `GE::Pressed(GE::KEY_SPACE)` (see
  the Migration note above) — see `references/api/ge-unit.md`'s
  Keyboard/joystick section and `references/hardware.md`'s Keyboard and
  joystick section for the underlying matrix.

## Architecture

The file is too long to reproduce here in full (893 lines) — read
`references/cookbook/assets/SpaceWar_2026.ras` directly for the complete,
compilable implementation. What follows is a map of its structure so you can
navigate straight to the piece you need.

### Game states and flow

There's no explicit "game state" enum for the outer flow — it's expressed as
a straight-line sequence of blocking procedure calls, each of which loops
internally until an input event lets it fall through:

```text
TitleScreen()   -- title image + wait for SPACE/FIRE (line 176)
InitGame()      -- one-time engine/sprite setup (line 192)
GameInfo()      -- controls screen + wait for SPACE/FIRE (line 228)
InitNewLevel()  -- populate Enemies[] for level 1 (line 260)
loop forever:
    loop while not IsGameEnd:
        -- per-frame game loop (line 892) --
    if PlayerLive: NewLevel()   -- congrats screen, advance Level (line 852)
    else:          GameOver()   -- game-over screen, InitNewGame() (line 826)
```

This whole outer shape lives in the `begin...end.` block at lines 878-902.
`IsGameEnd` (set in `MoveEnemies` when the last enemy dies, or in
`CheckingIfALaserHitThePlayer` once the player's explosion finishes) is what
breaks the inner per-frame loop and routes to either the "you won this level"
or "you died" branch.

### Entity records

Two record types (not classes) model the two things that need many
simultaneous, independent instances:

```pascal
LaserRec = record
    IsActive : boolean;
    XPos, YPos : byte;      // byte-grid position (for collision tests)
    Pos, PrevPos : integer; // raw VRAM byte address, current & previous frame
end;

EnemyRec = record
    State : byte;           // DESTROYED/EXPLOSION/SIDE_MOVE/ATTACK/FLY_BACK
    BaseXPos, BaseYPos : byte;    // patrol/return-to position
    XPos, YPos : byte;            // current position
    BaseDirection, Direction : byte;
    MoveStep : byte;               // countdown driving direction reversal
    IsMoved : boolean;             // dirty flag: needs redraw this frame
    LaserCountdown : byte;         // per-enemy shot cooldown
    ExplosionCount, ExplosionPhase, ExplosionDelay : byte;
end;
```

`PlayerLasers`/`EnemyLasers` are each `array[LASER_NO]` (10) of `LaserRec`;
`Enemies` is `array[ENEMY_NO]` (7) of `EnemyRec`. Fixed-size arrays of
records, scanned linearly every frame, is the whole "entity system" — no
dynamic allocation, no linked structures. This is the idiomatic scale-down of
an OOP entity-component pattern for an 8-bit budget: cheap to reason about,
cheap to iterate, and the array size is a compile-time constant so bounds are
never in question.

### The enemy state machine

`Enemies[i].State` takes 5 values (`DESTROYED`=0, `EXPLOSION`=1,
`SIDE_MOVE`=2, `ATTACK`=3, `FLY_BACK`=4) and both `PutEnemies` (drawing) and
`MoveEnemies` (logic, lines 562-716) branch on it. The movement `case` in
`MoveEnemies` (lines 570-636) is the core AI: each enemy patrols
side-to-side (`SIDE_MOVE`) until picked by the attack-selection logic at the
bottom of `MoveEnemies` (lines 686-705, a round-robin pick of the next
`SIDE_MOVE` ship going backwards from `EnemyAttackShip`), dives at the
player's X position (`ATTACK`), fires once it reaches Y=140, then climbs back
to its patrol base (`FLY_BACK`) and resumes patrolling. One representative
branch — the dive-and-track-the-player logic:

```pascal
ATTACK: begin
    Enemies[i].IsMoved := True;
    Enemies[i].Direction := MOVE_DOWN;
    if (Enemies[i].YPos < 140) then
        Enemies[i].YPos := Enemies[i].YPos + 4
    else
    begin
        Enemies[i].State := FLY_BACK;
        EnemyShoot();
    end;
    if (Enemies[i].XPos < PlayerSprite.X) then
    begin
        Inc (Enemies[i].XPos);
        Enemies[i].Direction := MOVE_RIGHT;
    end
    else
    begin
        if (Enemies[i].XPos > PlayerSprite.X) then
        begin
            Dec (Enemies[i].XPos);
            Enemies[i].Direction := MOVE_LEFT;
        end;
    end;
end;
```

Note the X-tracking and Y-diving are two independent `if` chains updating the
same `Direction` field — `Direction` ends up reflecting whichever axis moved
last, which is also what `PutEnemies` (lines 475-534) reads to decide which
edge of the sprite's old position needs clearing. `EXPLOSION` and
`DESTROYED` are handled in the `else` branch of `MoveEnemies`'s outer `if
(Enemies[i].State > EXPLOSION)` (lines 651-671): count down
`ExplosionCount`, and once it hits 0, flip to `DESTROYED`, blank the sprite's
screen rectangle, and decrement the level's remaining-enemy counter. Only 3
enemies are advanced per frame (`EnemyMoveNr`/`last := EnemyMoveNr+3`, lines
564-565) — logic is round-robined across frames rather than updating all 7
every tick, a cheap way to spread CPU cost.

### Laser pooling

Both `PlayerLasers` and `EnemyLasers` are fixed pools scanned for the first
inactive slot rather than any dynamic list. `PlayerFire` (lines 370-388):

```pascal
procedure PlayerFire();
begin
    if (LaserCountdown = 0) then
    begin
        i := 0;
        while ((i < LASER_NO-1) and PlayerLasers[i].IsActive) do
            inc (i);
        if (not PlayerLasers[i].IsActive) then
        begin
            PlayerLasers[i].IsActive := True;
            PlayerLasers[i].XPos := PlayerSprite.X + 2;
            PlayerLasers[i].YPos := PLAYER_YPOS - LASER_LENGTH + 1;
            PlayerLasers[i].Pos  := GE::SCREEN_ADDR + (PlayerLasers[i].YPos * 64) + PlayerLasers[i].XPos;
            PlayerLasers[i].PrevPos := PlayerLasers[i].Pos + 320;
            LaserCountdown := LASER_DELAY;
            StartLaserSound()
        end;
    end;
end; /* PlayerFire */
```

`Pos` is computed once as a raw VRAM byte address (`GE::SCREEN_ADDR + Y*64 +
X`, since `SCREEN_WIDTH` is 64 bytes/row per `references/api/ge-unit.md`'s
Constants table); after that, `PutLasers` (lines 391-436) never recomputes
`X`/`Y` into an address again — it just adds/subtracts 320 (`= 64 bytes ×
5-line stride`, i.e. `LASER_LENGTH`) to `Pos` each frame and writes/erases
with `GE::VBytesLine`, which is a direct-address vertical byte-run write, not
a sprite-based draw at all:

```pascal
if (PlayerLasers[i].YPos >= 12) then
begin
    GE::VBytesLine(PlayerLasers[i].Pos, LASER_LENGTH, RED_LASER_BYTE);
    // clear from previous position
    GE::VBytesLine(PlayerLasers[i].PrevPos, LASER_LENGTH, 0);
    PlayerLasers[i].YPos -= LASER_LENGTH;
    PlayerLasers[i].PrevPos := PlayerLasers[i].Pos;
    PlayerLasers[i].Pos -= 320;
end
```

This is meaningfully cheaper than `GE::Sprite` for a laser bolt: no
background-save/restore machinery, no mask, just "paint a color byte, then
paint zero where it used to be" — appropriate for a shape that's a solid
color block, not real art.

### Collision detection

Two collision checks, both hand-rolled AABB (axis-aligned bounding box) tests
over byte-grid coordinates — no `GE::Sprite.Collided`/`CollidedWith` (those
are 2026-only additions the original 2023 code predates, so this tutorial
doesn't demonstrate them; see `references/api/ge-unit.md` if you want the
built-in version for new code). `CheckingIfALaserHitAnEnemy` (lines 782-817)
is the player-laser-vs-enemy direction:

```pascal
while (nr < ENEMY_NO) do
begin
    if (Enemies[nr].State > EXPLOSION) then
    begin
        if (PlayerLasers[i].YPos < Enemies[nr].YPos + ENEMY_HEIGHT and (PlayerLasers[i].YPos >= Enemies[nr].YPos)) then
        begin
            if (PlayerLasers[i].XPos >= Enemies[nr].XPos and (PlayerLasers[i].XPos < Enemies[nr].XPos + ENEMY_WIDTH)) then
            begin
                // remove laser
                PlayerLasers[i].IsActive := False;
                GE::VBytesLine(PlayerLasers[i].PrevPos, 5, 0);
                // Player's laser hit an Enemy
                Enemies[nr].State := EXPLOSION;
                Enemies[nr].ExplosionCount := 12;
                Enemies[nr].ExplosionPhase := 0;
                Enemies[nr].ExplosionDelay := 1;
                GE::FillRect(Enemies[nr].XPos, Enemies[nr].YPos, ENEMY_WIDTH, ENEMY_HEIGHT, 0);
                break;
            end;
        end;
    end;
    Inc(nr);
end; /* while enemy */
```

The Y-range check first, X-range check nested inside — a hit requires both,
which is exactly AABB overlap. `Enemies[nr].State > EXPLOSION` filters out
enemies that are already exploding or destroyed so a laser can't
double-trigger a kill. The mirror-image check,
`CheckingIfALaserHitThePlayer` (lines 719-771), does the same Y-then-X test
for every active enemy laser against the player sprite's fixed-size box
(`PLAYER_WIDTH`/`PLAYER_HEIGHT`), and on a hit kicks off the player's own
death-explosion sequence (`PlayerLive := False`, `PlayerExplosionLevel :=
EXP_DURATION*3*5`) rather than an immediate game-over — the explosion has to
finish playing out first, which is what lets `IsGameEnd` only flip once
`PlayerExplosionLevel` counts down to 0 in that same procedure's `else`
branch.

### Explosion animation

A single shared `ExplosionSprite` (line ~110) is repositioned and
re-triggered for every death — enemy or player — rather than one sprite
instance per entity. `InitGame` configures it once
(`ExplosionSprite.InitAnimation(3, 1, GE::LOOP_FORWARD)`, patched line 207 —
see the Migration note above); `PutEnemies` and
`CheckingIfALaserHitThePlayer` both independently drive it through the same
pattern on their own explosion-phase countdowns: reposition
(`ExplosionSprite.X`/`.Y`, `.SetPosition`), draw (`.Put`), advance the frame
(`.Animation`), and play one of 3 pitches keyed to `ExplosionPhase` (150 /
200 / 100) for a crude 3-beat explosion sound. Because it's one shared
instance, only one explosion can visually animate at a time per call site —
fine here since enemy deaths and the player's death never need to composite
on screen simultaneously in a way that matters.

## How it works

The per-frame game loop (lines 886-896) is the template worth internalizing
for any TVC action game:

```pascal
while (not IsGameEnd) do
begin
    GE::WaitForSync();               // pace to 50Hz, avoid tearing
    PutLasers();                     // 1. advance/draw/erase projectiles
    PutEnemies();                    // 2. draw/erase enemies + explosions
    PutPlayer();                     // 3. draw/erase player
    CheckingIfALaserHitThePlayer();  // 4. collision: enemy fire -> player
    CheckingIfALaserHitAnEnemy();    // 5. collision: player fire -> enemies
    PlayerControl();                 // 6. read input, move/fire player
    MoveEnemies();                   // 7. advance enemy AI/state machine
end;
```

The ordering matters: draw/erase happens *before* input and AI update, so
every frame draws the *previous* frame's decisions and then computes the
*next* frame's state — a standard render-then-simulate split that keeps
movement smooth under `GE::WaitForSync()`'s fixed 50Hz cadence. Collision
checks are sandwiched between draw and input specifically so a hit detected
this frame is reflected before the player's next input is even read.

Outside the per-frame loop, the outer `while (true) do` (line 889) is the
whole game's lifetime: it never exits, only ever restarts via `InitNewGame`
(called from `GameOver`) or advances via `InitNewLevel`/`NewLevel`. Both
`GameOver` (lines 820-844) and `NewLevel` (lines 846-876) share a
release-then-press double wait-loop for their SPACE/FIRE prompt — first
spin while the button is *still* held (so a single button press that ended
the level doesn't immediately re-trigger the next screen), then spin until
it's pressed again. This two-phase wait is a reusable pattern any time a
screen transition is gated on the same button that caused it.

Music and sound share one channel (`GE::Sound`/`GE::Volume`) with the game's
sound effects, so they're never played concurrently with gameplay sound —
`PlayMusic()` only runs from the blocking title/info wait-loops
(`TitleScreen`, `GameInfo`), and once gameplay starts, laser/explosion sounds
(`StartLaserSound`, `StartEnemyLaserSound`, the explosion-phase `GE::Sound`
calls in `PutEnemies`/`CheckingIfALaserHitThePlayer`) take over the same
channel with their own manually-decaying pitch/volume envelopes driven by a
per-effect countdown byte (e.g. `LaserSoundDuration`), advanced once per
frame from `PutLasers`. This single-channel-multiplexed-by-game-state
approach is the practical answer to "how do I do music and SFX on hardware
with one square-wave channel."

## Common mistakes

- **Forgetting `GE::GetKeyboard()` before `GE::Pressed`/`GE::Joystick`.**
  Both require a prior scan into the cached matrix; `PlayerControl` (calls
  `GetKeyboard()` at line 464, tests `GE::Pressed(GE::KEY_SPACE)` at line
  475) and every wait-loop in `TitleScreen`/`GameInfo`/`GameOver`/
  `NewLevel` call `GE::GetKeyboard()` once per iteration before testing
  input — skip it and you'll read stale/zeroed state.
- **Copying `SpacePressed`-style calls into new 2026 code.** They don't
  exist anymore; always `GE::Pressed(GE::KEY_SPACE)` (or the matching
  `KEY_*` constant) — see the Migration note above.
- **Passing only 2 arguments to `InitAnimation`.** The 2026 signature is
  `(AnimPhaseCount, AnimDelay, AnimType)` — omit `AnimType` and the code
  won't compile at all (not a silent behavior change).
- **Reusing a shared explosion/effect sprite across multiple simultaneous
  triggers.** `ExplosionSprite` here works because deaths are effectively
  serialized in this particular game's pacing; a busier game (more
  simultaneous kills) would need either multiple sprite instances or a small
  pool, same idea as the laser pools.
- **Recomputing screen addresses every frame instead of caching them.** The
  laser-pooling pattern (`Pos`/`PrevPos` computed once, then adjusted by a
  fixed byte-stride per frame) is significantly cheaper than recalculating
  `GE::SCREEN_ADDR + Y*64 + X` every tick — worth copying for any
  fast-moving, simply-shaped game object.

## Adapting this template

- **Swap art and constants first.** `PLAYER_WIDTH`/`HEIGHT`, `ENEMY_WIDTH`/
  `HEIGHT`, `LASER_LENGTH`, and the `incbin` resource paths are the surface
  area for reskinning this into a different shoot-em-up without touching
  logic.
- **Scale entity counts via the `const ..._NO` values** (`LASER_NO`=10,
  `ENEMY_NO`=7) — both are array bounds baked into `array[N] of Rec`
  declarations, so raising them is a one-line change per array plus whatever
  RAM budget `references/api/ge-unit.md`'s memory-map section allows.
  Remember `GE::Sprite`'s 39-byte-per-instance cost and the shared
  255-2815 background-buffer pool when scaling up sprite-backed entities
  (lasers here deliberately avoid that cost by not being sprites at all).
- **The state-machine shape generalizes past enemies.** Any entity that
  needs more than "alive/dead" — a boss with phases, a collectible with a
  spawn/idle/collected/despawn cycle — fits the same `State: byte` +
  `case...offpage` dispatch used for `EnemyRec.State`.
- **If you don't need explosion animation or masked sprites, skip
  `GE::Sprite` entirely for that entity** and use the laser-pooling
  `VBytesLine`/`FillRect`-direct-write pattern instead — it's the cheaper
  choice whenever the object is simple, solid-colored geometry rather than
  detailed art.
- **For new code (not migrating this tutorial), prefer 2026-only
  additions** this file doesn't use since it predates them: `GE::Sprite.
  Collided`/`CollidedWith` for collision instead of hand-rolled AABB checks,
  `GE::Sprite.Show`/`Hide` + `RenderAllSprites`' deferred-render handling
  instead of manual draw/erase bookkeeping, and `List` for ad-hoc entity
  groups. See `references/api/ge-unit.md` for all of these.
