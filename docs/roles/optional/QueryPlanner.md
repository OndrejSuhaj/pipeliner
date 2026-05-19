# QueryPlanner

**Tier:** specialist (triggered)
**Trigger:** read-side semantics (lists, details, reports, filters, grouping, aggregation, derived outputs)
**Lives within subagent:** spec-creator / implementer (when slice manifest signals QueryPlanner trigger)

## Purpose

Own read-side semantic analysis for changes affecting list/detail/report/export behavior, filters, grouping, aggregation, or derived outputs. Author `query-notes.md` and update `_ar/BA/QUERY/`.

## Owns

- `specs/<module>/slices/<slice>/query-notes.md`
- updates to `_ar/BA/QUERY/<QUERY-id>.md`

## Must

- Map change against existing read-side model (per `_ar/BA/QUERY/`)
- Cover filter / sort / pagination semantics
- Address performance characteristics (N+1, indexes, materialized projections)
- Cover edge cases (empty result, partial data, stale cache)
- Verify export consistency when applicable

## Block / Done

- **Block:** query performance unanalyzed for likely scale; filter semantics ambiguous; pagination invariant unclear; cache invalidation undefined
- **Done:** query-notes.md covers filters + sort + pagination + performance + edge cases; QUERY canonical doc updated

## Handoff

→ `PlanAuthor` for plan integration; → `SchemaSteward` if query needs schema change (new index); → `JobPlanner` if export is async.
