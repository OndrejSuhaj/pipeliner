# Module Brief: [MODULE NAME]

**Module Slug**: `[module-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `M — Module Orchestration`
**Authored at**: Gate M0 (Declaration section) + Gate M1b (rest of file)
**Depends on**: `docs/program/module-map.md`, `docs/program/architecture-overview.md`

## Declaration (Gate M0)

> **Filled at Gate M0**. Subsequent sections are filled at Gate M1b after baseline (M1a) is complete.

- **Module ID**: `[module-slug]` (must match entry in `module-map.md`)
- **Display name**: [Display Name]
- **Module impact class**: `M0 | M1 | M2 | M3` (see `impact-classes.md` § 14)
- **Owner**: [Name / role]
- **Operator confirmation**: [Operator name + date]

### Declared Dependencies

[Copy from `module-map.md`. Restating here makes the brief self-contained.]

- Depends on: `[module-slug-x]`, `[module-slug-y]`
- Is depended on by: `[module-slug-z]`
- External system dependencies: [List or `none`]

### Declared Integration Boundaries

[Which contract surfaces this module exposes to other modules or external systems.]

- Exposes to `[other-module]`: [contract surface — e.g. GraphQL types, REST endpoints, message contracts]
- Exposes to external system `[name]`: [contract surface]
- `none`

## Purpose

[One paragraph describing what this module exists to do — the business outcome it owns, not its technical shape.]

## Scope

### In Scope
- [Capability or area]
- [Capability or area]

### Out of Scope
- [Explicitly excluded — important to record because adjacent capabilities will be tempting absorbed]
- [Explicitly excluded]

### Non-Goals
- [Capability the module is explicitly not pursuing — different from out-of-scope; non-goals are anti-features]

## Business Value

[Why this module is worth delivering. Connect to `project-brief.md` § Business Purpose.]

## Key Entities

[Central business entities this module owns. Each entity should be declared as an EN in `specs/<module>/analysis/EN/`.]

### [Entity name]
[Business meaning, lifecycle, key invariants. Brief — full EN doc lives in analysis/.]

### [Entity name]
[Business meaning, lifecycle, key invariants.]

## Key Invariants

System-wide rules that this module guarantees. Each should map to a BR in `specs/<module>/analysis/BR/` when relevant.

- **INV-001**: [Invariant statement — e.g. "An order in state `SHIPPED` cannot transition back to `PENDING`."]
- **INV-002**: [Invariant]
- **INV-003**: [Invariant]

## External Systems and Integrations

[For each external system this module interacts with, declare it. Each significant integration becomes an ES doc in `specs/<module>/analysis/ES/`.]

| External system | Direction | Contract | Notes |
|---|---|---|---|
| [System name] | inbound / outbound / both | [protocol / surface] | [SLA, rate limit, auth model, fallback policy] |

## Module Baseline Reference

[Pointer to module-scope baseline artifacts from Gate M1a.]

- Module glossary: `specs/<module>/glossary/module-glossary.md`
- Source authority map: `specs/<module>/baseline/authority-map.md`
- Conflict register (if applicable): `specs/<module>/baseline/conflict-register.md`

## Module Risks Reference

[Initial risk seed; full register lives in `specs/<module>/module-risks.md`.]

- See `specs/<module>/module-risks.md` for current open risks.

## Re-framing Trigger Conditions

[When would this module's brief need re-framing through Mode M Gate M1b refresh? Examples:
- "If `payments` module assumes a 3rd-party provider that gets discontinued."
- "If `core` module gains a new shared utility surface that this module must consume."]

## Amendment History

| Date | Trigger | Summary of change |
|---|---|---|
| [DATE] | initial declaration | initial draft after Gate M0/M1b |
