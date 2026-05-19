# Implementation Streams: [PROJECT NAME]

**Project Slug**: `[project-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `P — Program Bootstrap`
**Authored at**: Gate P3 — Implementation Streams (optional)
**Depends on**: `module-map.md`

> **When to use this file**: Only when parallel delivery across modules is non-trivial. Single-stream or fully sequential programs do not need this file.

## Stream Definitions

A stream is a coordinated set of modules whose Mode M and Mode B work runs concurrently with other streams.

### Stream 1 — [Stream name]
- **Assigned modules**: `core`, `[module-slug-1]`
- **Owner**: [Stream lead]
- **Parallelism**: [Internal sequential / internal parallel]
- **Notes**: [Stream-specific constraints, capacity, technology focus]

### Stream 2 — [Stream name]
- **Assigned modules**: `[module-slug-2]`, `[module-slug-3]`
- **Owner**: [Stream lead]
- **Parallelism**: [Internal sequential / internal parallel]
- **Notes**: [notes]

## Parallelism Model

[Describe which streams run concurrently and which must wait. Verify alignment with `module-map.md` dependency graph.]

```
Stream 1: core ─────► [module-slug-1] ─────► ...
                          │
                          │ contract dependency
                          ▼
Stream 2:        [module-slug-2] ────► [module-slug-3] ────► ...
```

Or in tabular form:

| Stream | Phase 1 | Phase 2 | Phase 3 |
|---|---|---|---|
| Stream 1 | `core` | `[module-slug-1]` | release |
| Stream 2 | `[module-slug-2]` | `[module-slug-3]` | release |

## Cross-Stream Integration Points

| Integration | Source stream | Consumer stream | Synchronization mechanism | Risk if mis-synchronized |
|---|---|---|---|---|
| [Contract / event / shared type] | Stream 1 | Stream 2 | [contract freeze, mock-first delivery, scheduled sync meeting] | [what breaks] |
| [Integration 2] | [stream] | [stream] | [mechanism] | [risk] |

## Shared Resource Constraints

Where streams compete for shared resources, name them and declare the contention model.

- **Staging environment**: [shared / per-stream / per-module] — [conflict resolution rule]
- **Source corpus `_ar/**`**: [single shared / per-stream branches] — [synchronization rule]
- **Build infrastructure**: [shared CI / per-stream CI] — [queue policy]
- **Shared team members**: [List of roles that span streams and their capacity allocation]

## Cross-Stream Escalation Path

When a blocker affects multiple streams or requires program-level decision:

1. [First-level escalation: stream lead pair meeting]
2. [Second-level escalation: program lead]
3. [Third-level escalation: Mode P re-frame through Gate P-R]

A blocker that triggers Mode P re-frame produces `re-frame-authorization.md`.

## Stream Synchronization Rituals

[Optional. Document if streams have explicit recurring synchronization mechanisms.]

- [Daily / weekly / per-phase sync meeting]
- [Shared progress dashboard]
- [Per-stream demo cadence]

## Amendment History

| Date | Trigger | Re-frame authorization | Summary of change |
|---|---|---|---|
| [DATE] | initial bootstrap | n/a | initial draft |
