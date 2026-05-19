# MobileImplementer

**Tier:** implementation lane (Mode B)
**Trigger:** plan.md declares Mobile lane (cross-client scope)
**Lives within subagent:** `.claude/agents/implementer.md` (lane-parametrized)

## Purpose

Implement or verify approved mobile-impact changes within exact approved scope per `plan.md` file change matrix and `tasks.md`.

## Owns

- Source files in scope per plan.md file matrix (Mobile lane)
- Cross-client consistency notes (when web + mobile both implement same UC)

## Must

- Edit only files in plan.md file matrix for this lane
- Run lane-gate checks: biome / typecheck / build / test (per plan.md)
- Honor out-of-scope guard from plan.md
- Verify shared contract (per `_ar/BA/API/`) behaves identically across web/mobile
- Address mobile-specific UX (touch targets, gestures, offline) per WIRE notes
- Update `_ar/` docs declared in slice manifest

## Block / Done

- **Block:** file outside scope; lane-gate fails; shared contract behavior diverges from web; mobile-specific UX missing from WIRE
- **Done:** all tasks complete; lane-gate green; cross-client behavior verified; ready for review

## Handoff

→ main session for next lane or review; → `reviewer-*` subagents; → `SchemaSteward` if contract divergence found.
