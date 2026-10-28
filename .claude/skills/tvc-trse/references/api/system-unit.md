# `System` unit reference

Source: `sources/tru-units/TVC/system.tru` (191 lines). Full raw catalog:
`sources/notes/notes_tru_units.md` §4.

**What it's for**: taking direct control of the machine away from (or back to) the
stock firmware — interrupt-handler management, ROM banking, register push/pop helpers
for interrupt code. Used when a program needs the CPU without firmware interference —
typically alongside `music.tru`'s custom IRQ, `GE::DigiSoundOn`, or a game writing its
own interrupt handler.

`@use "system"` to import. All calls use `System::ProcName(...)` syntax. Imports the
`memory` unit internally.

**Cross-reference**: `music.tru`'s `Play` and `GE`'s `DisableTVCITHandler`/
`DigiSoundOn` all hijack the interrupt vector the same way this unit's
`DisableFirmware` does, and all of them leave the machine in a state where firmware
services (keyboard auto-scan, cursor blink, cassette I/O) won't work until control is
handed back. Don't strand the machine — always pair a disable with its corresponding
enable/stop call before your program needs firmware services again (or exits).

| Signature | Description |
|---|---|
| `procedure SaveFirmware()` | Saves the current interrupt-vector target (at `$38`) into `firmware` so it can be restored later. |
| `procedure DisableFirmware()` | Replaces the `$38` interrupt handler with a bare `EI:RET`, neutering firmware's per-tick housekeeping (keyboard scan, cursor blink, etc.) while still allowing interrupts to occur. |
| `procedure EnableFirmware()` | Restores the handler saved by `SaveFirmware`. No-op if already enabled. |
| `procedure RequireFirmware()` | Ensures firmware interrupt handling is on, remembering prior state (in `firmware_oldstate`) for later restoration via `RestoreFirmwareState`. |
| `procedure RestoreFirmwareState()` | Restores whichever state (enabled/disabled) was in effect before the last `RequireFirmware()` call — pairs with it for a "temporarily need firmware, then put it back how it was" pattern. |
| `procedure PushAll() inline` | Pushes both register sets (AF/BC/DE/HL/IX/IY, primary and shadow via `exx`) — use at the top of a custom interrupt handler. |
| `procedure PopAll() inline` | Inverse of `PushAll` — use at the end of a custom interrupt handler, before `reti`/`ei;ret`. |
| `procedure EnableInterrupts() inline` | `ei`. |
| `procedure DisableInterrupts() inline` | `di`. |
| `procedure EnableRom()` | Maps both lower (`$0000`-`$3FFF`) and upper (`$C000`-`$FFFF`) ROM banks in. |
| `procedure DisableRom()` | Unmaps both ROM banks. |
| `procedure EnableLRom()` | Maps only the lower ROM bank in. |
| `procedure DisableLRom()` | Unmaps the lower ROM bank. |
| `procedure VSync()` | Waits for one vertical sync using an `ei;nop;halt;di` interrupt-window pattern — distinct from `TVC::WaitForSync`'s plain `halt`. |

Also declares `firmware: integer` (the saved vector), `firmware_enabled`/
`firmware_oldstate: byte` (state flags), and generic scratch vars `src`, `dst:
pointer`, `len: integer`.

## Typical pattern: custom interrupt handler

```pascal
@use "system"

interrupt MyHandler();
begin
    System::PushAll();
    // ... your interrupt-time work ...
    System::PopAll();
end;

begin
    System::SaveFirmware();
    System::DisableFirmware();
    // install MyHandler at $38 (see `interrupt` keyword in references/language/keywords.md)
    // ... program body ...
    System::EnableFirmware(); // hand control back before exiting
end.
```
