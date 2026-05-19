# Module Plan: [MODULE NAME]

**Module Slug**: `[module-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `M — Module Orchestration`
**Authored at**: Gate M3 — Module Architecture & Slice Map
**Depends on**: `module-brief.md`, M1 analysis artifacts, M2 UX artifacts

## Summary

[Short description of the module's intended implementation shape — its internal architecture, key technology choices, and delivery sequence.]

## Module Architecture

### Internal architectural style

[Describe how this module is internally organized. Must align with `architecture-overview.md` program-level style.]

[Examples: layered (controller / service / repository), hexagonal, event-driven, CRUD over a single aggregate, etc.]

### Module-internal components

[List the internal logical components and their responsibilities.]

| Component | Responsibility | Notes |
|---|---|---|
| [Component A] | [What it does] | [Tech choice, constraint] |
| [Component B] | [What it does] | [Tech choice, constraint] |

### Internal data flow

[Describe how data moves within the module — request → processing → persistence → response. ASCII diagram or list form.]

```
[Diagram or flow description]
```

## Technology Choices

### Confirmed choices
| Concern | Choice | Reason | Constraint |
|---|---|---|---|
| [Persistence] | [PostgreSQL / Redis / …] | [why] | [from architecture-overview] |
| [API surface] | [GraphQL / REST / gRPC] | [why] | [constraint] |
| [Async / background] | [BullMQ / Sidekiq / Lambda / none] | [why] | [constraint] |
| [Cache] | [Redis / in-memory / none] | [why] | [constraint] |

### Decisions deferred to slice level

[List concerns intentionally left to be decided per slice rather than at module level.]

- [Decision deferred to slice]
- [Decision deferred to slice]

## Contract Surfaces

### Exposed to other modules

[Each contract surface this module exposes. Cross-reference `module-brief.md` § Declared Integration Boundaries.]

| Surface | Type | Consumer modules | Versioning policy |
|---|---|---|---|
| [Surface name] | [GraphQL type / REST endpoint / message / shared type] | [list] | [SemVer / Additive-only / breaking-change requires Mode P] |

### Consumed from other modules

| Surface | Type | Owner module | Failure mode |
|---|---|---|---|
| [Surface name] | [type] | `[owner-module]` | [graceful degradation / hard failure / retry policy] |

### Exposed externally

[Public-facing contract surfaces — to other systems, not to other modules.]

| Surface | Consumer | Documentation | Versioning policy |
|---|---|---|---|
| [API endpoint] | [external system / public client] | [link to API doc] | [policy] |

## Delivery Sequence

[High-level sequencing of work within the module. Detailed slice breakdown lives in `slice-map.md`.]

### Phase 1 — [Phase name]
- [Bounded delivery goal]
- [Bounded delivery goal]

### Phase 2 — [Phase name]
- [Bounded delivery goal]

### Phase 3 — [Phase name]
- [Bounded delivery goal]

## Cross-Cutting Concerns

### Observability
[How this module integrates with program-level logging, metrics, tracing. Specific log namespaces, metric prefixes, trace span naming.]

### Security
[Authentication model used, authorization model, sensitive data handling, audit requirements.]

### Performance
[Performance targets specific to this module — beyond program-level NFRs.]

### Error handling
[Module-wide error taxonomy, retry policies, user-facing error mapping.]

## Specialist Routing Triggers

[Which specialist roles will likely be triggered by slices in this module.]

- `SchemaSteward`: [yes / no / when] — [reason]
- `AclPlanner`: [yes / no / when] — [reason]
- `QueryPlanner`: [yes / no / when] — [reason]
- `JobPlanner`: [yes / no / when] — [reason]

## Out-of-Scope Enforcement

[Architectural decisions explicitly NOT made in this module. Helps later reviewers detect scope drift.]

- This module does **not** own [capability that lives in another module]
- This module does **not** decide [concern deferred to program level]
- This module does **not** modify [protected area without explicit specialist routing]

## Risks Reference

See `specs/<module>/module-risks.md` for the full risk register.

## Amendment History

| Date | Trigger | Summary of change |
|---|---|---|
| [DATE] | initial Gate M3 | initial plan |
