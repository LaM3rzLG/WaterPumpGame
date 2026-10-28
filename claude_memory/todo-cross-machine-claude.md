---
name: todo-cross-machine-claude
description: Open topic (2026-10-28) - letting the Mac and Windows Claude Code sessions talk to each other over the home network; user postponed it
metadata:
  type: project
---

2026-10-28 the user asked whether the two Claude Code sessions (Mac + Windows, both in VS Code) can communicate over the home network; postponed ("later").
Options given: (1) built-in peer messaging (ListAgents/SendMessage) across machines via Remote Control on the same claude.ai account - recommended, setup steps not yet checked; (2) git (already used for memory/skills); (3) OpenSSH server on Windows so the Mac session can run Windows-only tools (System.Drawing scripts, WinTVC).

**Why:** the user works on both machines.
**How to apply:** when the user brings it up, start from option 1 and look up the exact Remote Control setup first. See [[watergame-mac-migration]].
