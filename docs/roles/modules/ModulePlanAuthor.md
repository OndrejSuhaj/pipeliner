# ModulePlanAuthor

**Tier:** module (Mode M)
**Gate:** M3 (architecture)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Author `module-plan.md` — module-level architecture, technology choices, delivery sequence, integration points, respecting program-level architectural constraints.

## Owns

- `specs/<module>/module-plan.md`
- `_ar/BA/API/<API-id>-<name>.md` when module exposes contract surfaces
- `_ar/BA/ACL/<ACL-id>-<name>.md` when access model is non-trivial
- `_REGISTRY.md` updates for touched layers

## Must

- Declare module-internal architecture (layering, sub-modules, tech stack)
- Declare technology choices with rationale
- Map module's contract surfaces (APIs exposed/consumed)
- Declare delivery sequence within the module
- Identify protected-area touches (auth, ACL, schema, jobs, integrations, infra, arch boundaries)
- Route specialist analysis (SchemaSteward, AclPlanner, JobPlanner, QueryPlanner) when applicable
- Reference `architecture-overview.md` ADRs that constrain decisions

## Block / Done

- **Block:** architecture-overview missing/vague; module dependencies unresolved; protected-area touch lacks specialist routing; tech choices contradict program constraints
- **Done:** module-plan.md declares architecture + tech + sequence + integration; protected-areas named with routing; ADRs traceable

## Handoff

→ `SliceMapAuthor` (Gate M3 slice-map) when module-plan finalized; → `agents/optional/*` for specialist analysis.
