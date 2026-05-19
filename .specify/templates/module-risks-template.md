# Module Risks: [MODULE NAME]

**Module Slug**: `[module-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `M — Module Orchestration`
**Authored at**: Gate M1 (initial), refreshed at Gate M3 and Gate M4
**Owner**: `ModuleRiskAuditor`

## Risk Scale

- `low` — manageable through normal delivery discipline
- `medium` — requires explicit mitigation or risk acceptance
- `high` — may block slices; requires specialist routing or governance escalation
- `critical` — blocks module release; requires Mode P escalation or `block` verdict

## Open Risks

### MR-001 — [Risk title]
- **Severity**: `low | medium | high | critical`
- **Category**: `protected-area | contract | dependency | technology | external | regulatory | operational | unknown`
- **Source**: `module-brief | module-plan | slice-map | M1a baseline | external trigger`
- **Description**: [What the risk is, concretely]
- **Likelihood**: `low | medium | high`
- **Blast radius**: [What is affected if the risk materializes — slice(s), module-wide, cross-module, program-level]
- **Mitigation plan**: [What is being done to reduce probability or impact]
- **Owner**: [Role / name responsible for monitoring this risk]
- **Status**: `open | mitigated | accepted | resolved | escalated`
- **First identified**: [DATE]
- **Last reviewed**: [DATE]

### MR-002 — [Risk title]
- **Severity**: `[level]`
- **Category**: `[category]`
- **Source**: `[source]`
- **Description**: …
- **Likelihood**: `[level]`
- **Blast radius**: …
- **Mitigation plan**: …
- **Owner**: [name]
- **Status**: `open`
- **First identified**: [DATE]
- **Last reviewed**: [DATE]

### MR-003 — [Risk title]
…

## Accepted Risks

Risks the module owner has explicitly accepted (not mitigated). Each must have explicit rationale and visibility in `module-staging-readiness.md` at Gate M4.

### MR-XXX — [Risk title]
- **Severity**: `[level]`
- **Acceptance rationale**: [Why this risk is accepted rather than mitigated]
- **Accepted by**: [Owner name]
- **Acceptance date**: [DATE]
- **Conditions of acceptance**: [What changes if the conditions change — e.g. "Accepted only while user base is below 10k. Re-evaluate at 5k."]

## Resolved Risks

[Move risks here when fully resolved. Keep them for traceability.]

### MR-YYY — [Risk title]
- **Severity (was)**: `[level]`
- **Resolution**: [How it was resolved]
- **Resolved date**: [DATE]
- **Resolved through**: [Slice ID / cross-module work / external event]

## Cross-Module Risk Dependencies

[Risks that originate in or affect other modules. Coordinate with that module's owner.]

| Risk ID | Originating module | Affected modules | Coordination owner |
|---|---|---|---|
| MR-XXX | `[other-module]` | this module + 2 others | [name] |

## Open Dependencies

Unresolved external dependencies that may become risks:

- **Dep-001**: [Dependency description — what is being waited on]
  - **Source**: [External team / vendor / library / regulation]
  - **Expected resolution**: [DATE / condition]
  - **What blocks if unresolved**: [Slices, capabilities, release readiness]

- **Dep-002**: …

## Risk Review Cadence

This register is reviewed at:
- Gate M1 (initial seed)
- Gate M3 (refresh with slice-map sequencing implications)
- Gate M4 (final review before module release)
- Per-slice ad hoc when a slice surfaces a new risk

## Escalation Triggers

A risk is escalated to program level (Mode P Gate P-R) when:
- it becomes `critical` AND blast radius is cross-module
- mitigation requires module-map or architecture-overview amendment
- it reveals a program-level assumption was wrong

A risk is escalated to repo-baseline (Mode A) when:
- it reveals corpus-wide terminology or source authority instability
- multiple modules surface the same risk independently

## Amendment History

| Date | Trigger | Summary of change |
|---|---|---|
| [DATE] | initial Gate M1 | initial risk seed |
