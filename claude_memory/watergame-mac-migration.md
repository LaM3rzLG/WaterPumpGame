---
name: watergame-mac-migration
description: Second dev machine is a Mac (Apple Silicon); what is set up there, where the Mac knowledge lives (skills tvc-trse-mac, tvc-emu-mac), how memory/skills sync through git
metadata:
  type: project
---

Since 2026-10-23 the user also develops on a Mac (M4 MacBook Air); the Windows PC stays the build machine until the Mac can compile.

- 2026-10-28: Claude memory + skills moved INTO the repo so both machines share them: `claude_memory/` (Mac: symlink from `~/.claude/projects/-Users-lgabor-Documents-TVC-Projects-WaterPumpGame/memory`; Windows: junction, steps in `claude_memory/README.md`) and `.claude/skills/` (tvc-trse, tvc-utils shared; tvc-trse-mac, tvc-emu-mac Mac-only - user's explicit wish: Mac things in separate skills).
- Mac details are in the skills, not here: build/TRSE/scripts -> **tvc-trse-mac**; ep128emu (self-built, BASIC 1.2 + VT-DOS, macOS audio FIFO + OpenGL patch, user-confirmed working 2026-10-28) and TVC_CEmu -> **tvc-emu-mac**.
- Not in git: GE.tru/units (copy by hand after a change), manual PDFs (Mac: `~/Documents/TVC-TRSE-skill/sources/docs/pdf`), emulators.
- The claude.ai-synced `tvc-trse` personal skill on the Mac (`~/.claude/skills/synced/...`) was overwritten with the full skill on 2026-10-23; it duplicates the repo skill by name until the user replaces/removes it on claude.ai.

**Why:** the user switches between the machines and wants the knowledge on both.
**How to apply:** start of a session: `git pull`; end: commit + push (incl. `claude_memory/`). On the Mac load tvc-trse-mac with tvc-trse. Compiling on the Mac is still open (TRSE must be opened once in windowed mode). See [[watergame-status]].
