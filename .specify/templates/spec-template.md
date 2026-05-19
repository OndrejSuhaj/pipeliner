# Slice Specification: [SLICE NAME]

**Module Slug**: `[module-slug]` (from `docs/program/module-map.md`)
**Slice Slug**: `phase{N}-{NN}-[slice-slug]`
**Spec Folder**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Input**: [Original user request or linked source]

> **Naming**: Determine `{N}` from the module's current phase (default `1` for new modules), `{NN}` by finding the highest existing sequential number in `specs/[module-slug]/slices/phase{N}-*` and adding 1 (zero-padded, starting `01`). See `guardrails.md § 6.4`.

> **Slice-readiness**: Before entering Mode B, this slice must pass Gate B0 (slice-readiness check). The §17.3 prerequisites are recorded in `specs/[module-slug]/slice-map.md`. See `mode-b` workflow.

## Outcome

[State the intended user or business outcome in plain language.]

## Scope

### In Scope
- [Item]
- [Item]

### Out of Scope
- [Item]
- [Item]

## Impact Classification

**Impact Class**: `IC0 | IC1 | IC2 | IC3 | IC4 | IC5`  
**Classification Confidence**: `confirmed | partial | uncertain`  
**Protected Areas Affected**: `none | auth | acl | tenancy | shared-contract | schema | jobs | integrations | infrastructure | architecture`  
**Why this class**: [Short justification]

## Relevant Source Context

- [Relevant `_ar/**` document or other source]
- [Relevant existing spec / module / baseline artifact]

## User Stories

### User Story 1 — [Title] (Priority: P1)

[Describe the story as a business-capable slice.]

**Why this priority**: [Why this is first]  
**Independent Test**: [How this story can be checked on its own]

**Acceptance Scenarios**
1. **Given** [state], **When** [action], **Then** [outcome]
2. **Given** [state], **When** [action], **Then** [outcome]

---

### User Story 2 — [Title] (Priority: P2)

[Describe the story.]

**Why this priority**: [Reason]  
**Independent Test**: [How this story can be checked on its own]

**Acceptance Scenarios**
1. **Given** [state], **When** [action], **Then** [outcome]

---

### User Story 3 — [Title] (Priority: P3)

[Describe the story.]

**Why this priority**: [Reason]  
**Independent Test**: [How this story can be checked on its own]

**Acceptance Scenarios**
1. **Given** [state], **When** [action], **Then** [outcome]

## Edge Cases

- [Boundary condition]
- [Error path]
- [Permission / tenancy / empty-state / concurrency / cross-client case]
- [Fallback or degradation case]

## Requirements

### Functional Requirements
- **FR-001**: System MUST [capability]
- **FR-002**: System MUST [capability]
- **FR-003**: System MUST [behavior]
- **FR-004**: System MUST [validation / state / visibility rule]
- **FR-005**: System MUST [persistence / orchestration / output behavior]

### Non-Functional / Operational Requirements
- **NFR-001**: [Performance / reliability / auditability / UX / accessibility / runtime requirement]
- **NFR-002**: [Constraint]
- **NFR-003**: [Verification or observability requirement]

## Key Entities

### [Entity Name]
[What it represents in business terms.]

### [Entity Name]
[What it represents in business terms.]

## Success Criteria

- **SC-001**: [Measurable outcome]
- **SC-002**: [Measurable outcome]
- **SC-003**: [Measurable outcome]

## Open Points Moved Out

If ambiguity remains, record it in `open-questions.md` instead of hiding it here.