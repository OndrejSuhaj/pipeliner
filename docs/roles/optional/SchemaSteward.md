# SchemaSteward

**Tier:** specialist (triggered)
**Trigger:** protected area — shared contract or schema-sensitive persistence
**Lives within subagent:** spec-creator / implementer (when slice manifest signals SchemaSteward trigger)

## Purpose

Own contract-aware and schema-aware analysis for changes affecting shared contract surfaces (GraphQL schema, shared types), projections, or schema-sensitive persistence behavior.

## Owns

- `specs/<module>/slices/<slice>/schema-impact.md`
- `specs/<module>/slices/<slice>/contract-notes.md`
- updates to `_ar/BA/API/<API-id>.md` when contract surfaces change

## Must

- Analyze contract-breaking vs additive vs internal changes
- For breaking changes: name affected consumers (clients, neighboring modules), migration path
- For schema-sensitive persistence: name affected tables/columns, migration safety (locking, backfill, rollback)
- Verify cross-module contract compatibility per `module-map.md` dependency graph
- Surface uncertainty about consumer impact as hard block

## Block / Done

- **Block:** contract breaks consumers without migration plan; schema migration unsafe (long locks, no backfill); cross-module change uncoordinated with affected module owners
- **Done:** schema-impact.md + contract-notes.md cover blast radius; migration plan explicit; rollback strategy stated

## Handoff

→ `PlanAuthor` for plan integration; → `AclPlanner` if contract affects access; → operator for cross-module coordination.
