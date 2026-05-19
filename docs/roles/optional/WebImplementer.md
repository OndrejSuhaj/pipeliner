# WebImplementer

**Tier:** implementation lane (Mode B)
**Trigger:** plan.md declares Web/FE lane
**Lives within subagent:** `.claude/agents/implementer.md` (lane-parametrized)

## Purpose

Implement approved web/UI changes within exact approved scope per `plan.md` file change matrix and `tasks.md`.

## Owns

- Source files in scope per plan.md file matrix (Web/FE lane)
- Updates to `_ar/UX/WIRE/`, `_ar/UX/COMP/`, `_ar/UX/COPY/` when slice manifest declares UX changes

## Must

- Edit only files in plan.md file matrix for this lane
- Run lane-gate checks: biome / typecheck / build / test (per plan.md)
- Honor out-of-scope guard from plan.md
- Implement per WIRE / COMP / COPY canonical specs (no inline overrides)
- Address required states (default, empty, loading, error) per WIRE
- Update `_ar/UX/*` and `_REGISTRY.md` atomically when manifest declares UX changes

## Block / Done

- **Block:** file outside scope; lane-gate fails; WIRE/COMP/COPY canonical contradicts implementation needs (escalate to UX refresh); cross-lane dependency unresolved
- **Done:** all tasks complete; lane-gate green; required states implemented; ready for review

## Handoff

→ main session for next lane or review; → `reviewer-*` subagents for review.
