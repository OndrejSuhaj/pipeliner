# ArchitectureOverviewAuthor

**Tier:** program (Mode P)
**Gate:** P1 (architecture half)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Author `docs/program/architecture-overview.md` — program-level architectural skeleton (style, external systems, NFRs, ADR-style decisions) integrated with program-wide baseline outputs from the baseline trio.

## Owns

- `docs/program/architecture-overview.md`
- foundational `_ar/BA/ARCH/<ARCH-id>-<name>.md` when program-wide views are explicit
- `_ar/BA/ARCH/_REGISTRY.md` updates

## Must

- Declare architectural style (monolith / modular monolith / service-oriented / …)
- List external systems and integration boundaries
- Declare shared infrastructure assumptions (persistence, messaging, identity)
- Declare non-functional requirements (performance, availability, security)
- Maintain ADR-style decisions log for irreversible choices
- Integrate baseline trio outputs (terminology, source authority, conflicts sections)
- Keep module-internal architecture out (that is `ModulePlanAuthor`)

## Block / Done

- **Block:** architectural style undecided; external boundaries vague; NFRs unspecified for protected-area systems; baseline trio outputs incomplete
- **Done:** architecture-overview has all required sections; ADRs explicit; ready for ModuleMapAuthor or IAAuthor

## Handoff

→ `IAAuthor` (Gate P-UX, when user-facing); → `ModuleMapAuthor` (Gate P2).
