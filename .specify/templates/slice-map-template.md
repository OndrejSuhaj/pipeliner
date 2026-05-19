# Slice Map: [MODULE NAME]

**Module Slug**: `[module-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `M — Module Orchestration`
**Authored at**: Gate M3 — Module Architecture & Slice Map
**Depends on**: `module-brief.md`, `module-plan.md`

> **Authoritative source for Mode B Gate B0**: `SliceReadinessVerifier` reads this file to verify §17.3 slice-ready prerequisites before each Mode B run.

## Slice Inventory

Each slice is a bounded Mode B unit. The slice ID must match its eventual branch and spec folder: `[module-slug]/slices/phase{N}-{NN}-{slice-slug}`.

### `phase1-01-[slice-slug-1]`
- **Display name**: [Display name]
- **Impact class estimate**: `IC0 | IC1 | IC2 | IC3 | IC4 | IC5` (see `impact-classes.md` § 4)
- **Status**: `planned | slice-ready | in-progress | merged | deferred`
- **Acceptance criterion** (single, user-observable):
  - [One sentence stating what the user can do or observe when this slice is done]
- **Implementer lane(s)**: `api | web | mobile | combination`
- **Sequencing constraint**: [First in phase 1 — no internal dependencies in this module]

**Slice-readiness prerequisites** (per §17.3 constitution):

| Prerequisite | Source artifact | Status |
|---|---|---|
| Analytical inputs sufficient | `specs/<module>/analysis/EN/...`, `analysis/UC/...`, etc. | [ ] |
| UX inputs sufficient | `specs/<module>/ux/wireframes.md#screen-X` | [ ] |
| Technical dependencies resolved | [Named dependencies] | [ ] |
| Scope within sizing discipline | per `impact-classes.md` § 13.1 | [ ] |
| Single user-observable outcome | restated above | [ ] |
| Implementer lane(s) assigned | restated above | [ ] |

**Dependencies on other slices**:
- Same module: `none` or [list of slice IDs]
- Other modules: `none` or [list of `<other-module>/phase{N}-{NN}-{slug}`]

**Specialist routing expected**: `none | SchemaSteward | AclPlanner | QueryPlanner | JobPlanner | combination`

---

### `phase1-02-[slice-slug-2]`
- **Display name**: …
- **Impact class estimate**: `IC?`
- **Status**: `planned`
- **Acceptance criterion**: [one user-observable outcome]
- **Implementer lane(s)**: `[lane]`
- **Sequencing constraint**: [Depends on `phase1-01` for shared utility]

**Slice-readiness prerequisites**:
| Prerequisite | Source artifact | Status |
|---|---|---|
| Analytical inputs sufficient | … | [ ] |
| UX inputs sufficient | … | [ ] |
| Technical dependencies resolved | … | [ ] |
| Scope within sizing discipline | … | [ ] |
| Single user-observable outcome | … | [ ] |
| Implementer lane(s) assigned | … | [ ] |

**Dependencies**: …

**Specialist routing**: …

---

### `phase1-03-[slice-slug-3]`
…

## Sequencing Diagram

[Visual representation of slice dependencies within and across modules.]

```
phase1-01 ──► phase1-02 ──► phase1-04
       │
       └──► phase1-03 ──► phase2-01
```

## Phase Boundaries

[When does Phase 1 end and Phase 2 begin? Phase boundaries are typically defined by a meaningful milestone in `module-brief.md` § Delivery Sequence.]

- **Phase 1**: [Slices `phase1-01` through `phase1-XX`] — milestone: [What user-observable capability the phase delivers]
- **Phase 2**: [Slices `phase2-01` through `phase2-YY`] — milestone: …

## Cross-Module Dependencies

[Any slice in this module that depends on a slice in another module. Cross-reference the other module's slice-map.]

| This slice | Depends on | Type | Status of dependency |
|---|---|---|---|
| `phase1-02-[slug]` | `core/phase1-01-event-bus-bootstrap` | runtime contract | merged |
| `phase2-01-[slug]` | `[other-module]/phase1-03-[slug]` | shared type | planned |

## Parallel-Safe Sets

[Which slices can be developed in parallel — useful for assigning to different implementer lanes simultaneously.]

- Parallel set A: `phase1-01`, `phase1-03` (no shared files, no shared contract)
- Parallel set B: `phase2-01`, `phase2-02`

## Slice Statuses Summary

| Status | Count | Slices |
|---|---|---|
| `planned` | [n] | [list] |
| `slice-ready` | [n] | [list — Mode B Gate B0 may run] |
| `in-progress` | [n] | [list] |
| `merged` | [n] | [list] |
| `deferred` | [n] | [list — with deferral reason] |

## Deferred Slices

[Slices declared but deferred. Each needs a deferral reason; this prevents silent loss.]

- `phase1-04-[slug]` — deferred because: [reason]. Re-eligible when: [condition].

## Sizing Discipline Check

Per `impact-classes.md` § 13.1 and `CLAUDE.md` § Slice Sizing Discipline:

- [ ] No slice exceeds its impact-class file count cap
- [ ] No slice has more than one acceptance criterion
- [ ] No slice produces more than one user-observable outcome
- [ ] No IC4/IC5 slice is delivered as a single slice (decomposed into IC2/IC3)
- [ ] Split recommendations (if any) are followed (sub-slices `-a`, `-b`, etc.)

## Amendment History

| Date | Trigger | Summary of change |
|---|---|---|
| [DATE] | initial Gate M3 | initial slice inventory |
