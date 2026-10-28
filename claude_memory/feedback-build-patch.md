---
name: feedback-build-patch
description: After EVERY WaterPumpGame compile run the U3 boot patch - use resources\build.ps1 (compile + u3_boot_patch + dsk)
metadata:
  type: feedback
---

Always build WaterPumpGame with `powershell -NoProfile -File resourcesbuild.ps1` (nightly compile -> `u3_boot_patch.ps1`: boot jump patch + split into a small .cas and U3KOD.BIN -> `.dsk` incl. U3KOD.BIN), never a bare trse.exe call.

**Why:** since 2026-10-26 part of the code + the main block is compiled to U3 (`org $C000` in `U3_Hatar`); without the patch the `$1A03` jump goes into ROM and the game does not start. The user explicitly asked: "Minden fordítás után futtasd le!"

**How to apply:** every build in this project goes through build.ps1; if a raw compile is unavoidable, run `resources\u3_boot_patch.ps1` right after it. Related: [[watergame-working-style]].
