# `Music` unit reference

Source: `sources/tru-units/TVC/music.tru` (666 lines). Full raw catalog:
`sources/notes/notes_tru_units.md` §6. Working example:
`sources/tutorials/tutorials/music.ras`.

**What it's for**: a complete, self-contained interrupt-driven **3-channel** music
playback engine ("Fast&Force" player, 2024) — chiptune-style background music, e.g.
converted from SID dumps. TVC's hardware has only one square-wave channel (see
`references/hardware.md`'s Sound section); this unit synthesizes 3 channels entirely
in software by installing its own high-frequency timer interrupt (~8491Hz or ~5008Hz)
that mixes 3 phase-accumulator oscillators into the single hardware volume port on
every tick, and — every 6th tick — parses one "frame" of a custom binary music format
to update per-channel frequency/volume/ADSR-release state. Much heavier and more
specialized than `TVC::Sound`/`SoundEx`'s single continuous tone.

`@use "music"` to import. All calls use `Music::ProcName(...)` syntax.

**This unit takes over the interrupt vector**, the same way `System::DisableFirmware`
or `GE::DisableTVCITHandler` do — see `references/api/system-unit.md`'s
cross-reference note. `Stop()` must be called once playback finishes (or to abort
early) to hand control back cleanly.

## Public API

| Signature | Description |
|---|---|
| `procedure Init(interrupt_freq: byte)` | Prepares the frequency lookup table for the chosen tick rate. Accepts only `INTERRUPT_FREQ_8491` (`$E9`) or `INTERRUPT_FREQ_5008` (`$D9`). Does **not** itself start playback or install the interrupt. |
| `procedure Play(data_pointer: pointer; bpm: integer; graphics_mode: byte)` | Installs the custom interrupt handler at `$38` (replacing firmware), disables the CRTC cursor interrupt, and starts streaming/mixing the music data at `data_pointer`. `bpm`: 60-6000. `graphics_mode`: pass whatever `TVC::SetGraphicsMode`/`GE::SetGraphics` last set — the volume port's usable bit-width depends on it. Uses shadow registers, `IX`, `IY`, and briefly the stack pointer inside the ISR — don't rely on those registers across playback. |
| `procedure Stop()` | Restores the CRTC cursor interrupt and a stock-ish interrupt entry, silences the sound port, sets the "finished" flag. **Must be called** once playback naturally finishes or to abort early — the custom interrupt otherwise stays installed even after the track ends. |
| `function IsMusicFinished(): byte` | `0` while playing, `255` once the data stream hits its `FINISH` marker. Sound is muted at that point but the custom interrupt is **still installed** — you still need to call `Stop()`. |

## Constants

| Group | Values |
|---|---|
| Tick rates | `INTERRUPT_FREQ_8491`=`$E9`, `INTERRUPT_FREQ_5008`=`$D9`; matching tempo bases `BPM_SID_8491`=500, `BPM_SID_5008`=884 |
| Graphics-mode passthrough | `GRAPHICS_MODE_2`/`4`/`16` (0/1/2) — pass the same value to `Play` that you last set the actual mode to |
| Ports | `SOUND_LO_PORT`(4), `SOUND_HI_PORT`(5), `SOUND_VOLUME_PORT`(6), `IT_ACK_PORT`(7), `CRTC_REG_PORT`(`$70`), `CRTC_DATA_PORT`(`$71`) |
| Volume | `MAX_VOLUME`=20 — **note this is a different scale than `TVC.tru`'s 0-15**, don't reuse a `TVC::Volume` value here |
| Timing | `DURATION_IRQ_CONST`=6 (ticks per music frame), `BPM_DIVIDER`=14153 (converts a 60-6000 BPM value into the internal per-frame tick divisor) |
| Data-stream control bytes | `MUTE`(86) silences this channel; `FINISH`(253) ends the track; `SKIP`(254) holds the previous note; `LOOP`(255) restarts the track; `FRQINC00`-`FRQINC0F`(87-102) / `FRQDEC00`-`FRQDEC0F`(103-118) relative pitch bend up/down in 16 steps; `ADSR00`-`ADSR0F`(119-134) 16 preset volume-release rates (~7ms to ~24000ms) |

## Music data format

A flat byte stream: one control byte per channel, 3 bytes per "row" (channel 1,
channel 2, channel 3), interpreted every 6th interrupt tick. Each byte is either a
note index (looked up in the relocated frequency table for a 16-bit phase-accumulator
increment) or one of the control codes above. This is a compact, ad-hoc tracker
format, not a standard file format — there's no in-skill authoring tool for it; the
comments in `sources/tutorials/tutorials/music.ras` document the actual pipeline:
convert a `.sid` tune to TVC format with `SidDumpTVCGUI` (a Windows tool), then
`incbin` the resulting `.bin`. See that file for links to GoatTracker/HVSC/deepsid as
SID source-material archives.

## Typical pattern

```pascal
@use "music"

var
    tune: incbin("mytune_tvc.bin");

begin
    Music::Init(Music::INTERRUPT_FREQ_5008);
    Music::Play(#tune, Music::BPM_SID_5008, TVC::GRAPHICS4);
    // ... main loop ...
    while (Music::IsMusicFinished() = 0) do
    begin
        // game logic, sprite updates, etc.
    end;
    Music::Stop();
end.
```
