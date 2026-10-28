---
name: todo-tvc-known-bugs
description: OPEN TODO - remind the user at the start of every new session that the TVC known-bugs skill page is not done yet
metadata:
  type: project
---

2026-10-25: the user asked to be REMINDED at the start of each new session (until done) that `references/language/known-bugs-tvc.md` in the TVC-TRSE skill does not exist yet.

Plan agreed: triage the 82 bugs of the SANE known-bugs list (`sources/sane-trse-docs/known-bugs.md`, site https://v8id-mmo.github.io/SANE/known-bugs/) into "lives on TVC - tested", "not on TVC - tested", "C64 only". "Fixed" there means fixed in the SANE C64 fork, NOT in our TRSE. Test the ~30 generic/Z80-plausible ones with tiny programs compiled by the nightly (`C:\TVC\TRSE_Nightly\trse.exe`) and read the Z80 output, like `references/language/builtins.md`. Do not touch the game while doing it.

**How to apply:** first message of a new session: one line reminder. Delete this memory when the page exists.
