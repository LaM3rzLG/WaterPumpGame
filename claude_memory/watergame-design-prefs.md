---
name: watergame-design-prefs
description: User's design preferences learned 2026-10-02/03 for WaterPumpGame UI/controls - joystick-only, simple over clever, how to propose options
metadata:
  type: feedback
---

- **Joystick-only gameplay** in every mode ("nincs billentyűzet játék szempontból"); keyboard only for P (pause), ESC/Q (exit) and testing aids. New in-game actions must be reachable with joystick + fire.
- **Simple beats clever:** the exit-door icon in the icon menu was rejected as "bonyolult" -> replaced by a plain ESC/Q prompt. Offer the simplest workable version first.
- User specifies layouts precisely (byte/pixel nudges: "1 bájttal jobbra", "1 pixel sorral feljebb") and iterates fast; do exactly that nudge, rebuild, report briefly.
- When a request is ambiguous about layout/visuals, ask with 2-3 concrete options (ASCII previews work well) — e.g. the centred price block choice. But misreads happened (versus "20" numbering, Q as exit vs. bug report): if a sentence can be read two ways, state the reading in one line before implementing.
- Messages/screens: dark "pause" colour scheme liked for pause/exit/fail; LEVEL COMPLETED must stay normal colours + a delay so held fire doesn't skip it.
- User wants important knowledge written down before session end (CLAUDE.md + memory + skills) and parks big topics explicitly ("tallonba") -> record them as PARKED with next step.

**Why:** these came from direct corrections this session. **How to apply:** design UI for joystick first, keep it minimal, confirm ambiguous readings, keep notes current. Related: [[watergame-working-style]], [[watergame-status]].

UPDATE 2026-10-03 (afternoon): rejected ideas - red text via palette swap; blocking crawling border stripes ("zavaró"); level names on screen (data kept, not displayed). Liked: per-level switches in the editor for new mechanics; countdown displays; boxes with a thin frame; green highlight for codes. Meteor timing the user wants: 10..30 s random.
