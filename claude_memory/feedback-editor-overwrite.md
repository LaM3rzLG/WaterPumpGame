---
name: feedback-editor-overwrite
description: "The user edits WaterPumpGame.ras in VS Code while Claude edits it on disk; an Overwrite discarded Claude's changes once - check the disk file before editing and after \"Failed to save\""
metadata: 
  node_type: memory
  type: feedback
  originSessionId: 32e78541-ed71-4542-ba61-950c34fb6f78
  modified: 2026-09-20T21:20:49.465Z
---

On 2026-09-20 VS Code showed "content of the file is newer" and the user chose Overwrite with the editor copy; the disk file silently lost several Claude changes (main menu/legend). Claude had to restore from a `.bak_` file and re-apply the user's own values (INDULO_PALYA, Keret_Mozog_Utem).

**Why:** the editor buffer had unsaved older content. **How to apply:** before each edit, read the current disk state (grep for the last feature added); if the user reports a save conflict, first copy the disk file to a `.bak_...`, tell them which side to keep, and diff afterwards; also compare against the newest `.bak_` after any user-side save to detect reverted work. Keep making a `.bak_<name>` before every larger change and log it in CLAUDE.md. Related: [[watergame-working-style]].
