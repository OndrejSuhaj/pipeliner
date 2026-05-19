# ModuleFramer

**Tier:** module (Mode M)
**Gate:** M0, M1b
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Drive module declaration (M0) and framing (M1b). Author `module-brief.md` and seed initial analytical entities for the module.

## Owns

- `specs/<module>/module-brief.md`
- `_ar/BA/{EN,BR,ES,ARCH}/<doc-id>-<name>.md` with `modules: [<this-module>]` (M1b seeds)
- `_REGISTRY.md` updates for touched layers

## Must

- M0: Confirm module slug against `module-map.md`; capture module-id, scope summary, dependencies, integration boundaries in Declaration section
- M1b: Author full module-brief (Purpose, Scope, Business Value, Key Entities, Key Invariants, Dependencies, Non-Goals)
- Seed central EN/BR/ES/ARCH in `_ar/BA/` with `modules:` frontmatter
- Align module ARCH with `architecture-overview.md`
- Surface conflicts with neighboring modules' EN to `ModuleConflictMapper` or escalate to Mode P

## Block / Done

- **Block:** module not in `module-map.md` (escalate to Mode P); Gate M1a incomplete; no clear business purpose; ARCH conflicts with `architecture-overview.md`
- **Done:** M0 declaration complete; M1b full brief + seeds; ready for Gate M2

## Handoff

→ `WireframeAuthor` (Gate M2, when user-facing); → `ModulePlanAuthor` (Gate M3).
