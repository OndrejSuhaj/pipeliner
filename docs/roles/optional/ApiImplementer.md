# ApiImplementer

**Tier:** implementation lane (Mode B)
**Trigger:** plan.md declares API/BE lane
**Lives within subagent:** `.claude/agents/implementer.md` (lane-parametrized)

## Purpose

Implement approved backend/API changes within exact approved scope per `plan.md` file change matrix and `tasks.md`.

## Owns

- Source files in scope per plan.md file matrix (API/BE lane)
- Updates to `_ar/BA/API/` declared in slice manifest

## Must

- Edit only files in plan.md file matrix for this lane
- Run lane-gate checks: biome / typecheck / build / test (per plan.md)
- Honor out-of-scope guard from plan.md
- Update `_ar/BA/API/` and `_REGISTRY.md` atomically when slice manifest declares contract change
- Report lane-gate pass/fail back to main session

## Block / Done

- **Block:** file outside scope needs editing (escalate to plan refresh); lane-gate fails (do not commit); cross-lane dependency unresolved
- **Done:** all tasks in lane complete; lane-gate passes (biome / typecheck / build / test green); ready for review

## Handoff

→ main session for next lane or review; → `reviewer-*` subagents for review.
