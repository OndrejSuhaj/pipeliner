# SliceMapAuthor

**Tier:** module (Mode M)
**Gate:** M3 (slice map)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Author `slice-map.md` — decompose module into bounded slices with explicit prerequisites (analytical, UX, technical), dependencies, sequencing, implementer lane assignments.

## Owns

- `specs/<module>/slice-map.md`
- updates when Mode C seeds new slices

## Must

- Decompose module into slices each tied to one user-observable acceptance criterion
- Assign stable slice-id and slug per slice (`<module>/phase{N}-{NN}-<slug>`)
- Estimate impact class (IC0–IC5) per slice
- Declare prerequisites per slice with `_ar/` doc_id references:
  - analytical inputs (EN/UC/BR/QUERY/JOB as relevant)
  - UX inputs (WIRE/COMP/COPY as relevant)
  - technical dependencies (cross-module, infrastructure, schema)
- Declare cross-slice and cross-module dependencies
- Declare sequencing (parallel-safe vs sequential)
- Assign implementer lane(s) per slice (ApiImplementer, WebImplementer, MobileImplementer)
- Respect slice sizing discipline — split slices exceeding caps

## Block / Done

- **Block:** module-plan insufficient; any slice exceeds sizing without split; cycle in slice dependencies; required `_ar/` docs don't exist; protected-area slice lacks specialist routing
- **Done:** all slices listed with id + impact class + prerequisites (doc_ids) + dependencies + sequencing + lanes; Mode B Gate B0 can verify

## Handoff

→ Mode B per slice via Gate B0; → `ModulePlanAuthor` if plan needs refinement.
