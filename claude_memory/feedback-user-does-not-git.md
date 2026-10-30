---
name: feedback-user-does-not-git
description: The user does not run git at all - Claude must pull/commit/push itself on both machines and sync the other machine; never hand the user git commands
metadata:
  type: feedback
---

The user does not use git ("Én nem Git-elek pullolok", 2026-10-30). Claude does every pull/commit/push itself, on the Mac
and on Windows, and keeps both machines in sync.

**Why:** the user got git commands to run on Windows several times and pushed back; they cannot even copy commands
between the machines.
**How to apply:** session start -> pull project + `TVC_Kozos/skills` + `TVC_Kozos/tools` (or rely on the SessionStart hook
`TVC_Kozos/skills/sync/sync_pull.*` where installed); after changes -> commit + push; if the other machine is reachable over
Remote Control (`ListAgents`) -> `SendMessage` it to pull. If something must happen on the other machine and it is not
reachable, leave a TEENDO/pointer in git (see [[tvc-general-knowledge-in-skill]]) instead of git instructions for the user.
