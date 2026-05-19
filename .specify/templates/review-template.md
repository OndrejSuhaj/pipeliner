# Review: [FEATURE NAME]

**Feature Slug**: `[feature-slug]`  
**Reviewer**: [Name or role]  
**Date**: [DATE]  
**Status**: `draft | final`

## Inputs Reviewed

- `specs/[feature-slug]/spec.md`
- `specs/[feature-slug]/open-questions.md`
- `specs/[feature-slug]/plan.md`
- `specs/[feature-slug]/tasks.md`
- `specs/[feature-slug]/qa-checklist.md`
- `specs/[feature-slug]/runtime-notes.md`
- `specs/[feature-slug]/schema-impact.md` if present
- `specs/[feature-slug]/contract-notes.md` if present
- ACL / QUERY / JOB notes if present

## Review Scope

**Review Type**: `checkpoint | final`  
**Impact Class**: `IC0 | IC1 | IC2 | IC3 | IC4 | IC5`  
**Claim Reviewed**: `implemented | done with limitations | done | blocked`  
**Scope Covered**: [What this review actually covered]

## Artifact Closure Checks

### Scope and Classification
- [ ] Scope in `spec.md` is still explicit
- [ ] Impact classification still matches actual work
- [ ] Material ambiguities were resolved or recorded

### Planning and Traceability
- [ ] `plan.md` still reflects actual implementation shape
- [ ] Implementation is traceable to `tasks.md`
- [ ] No silent scope expansion is visible

### Required Specialist Artifacts
- [ ] Required specialist artifacts exist for the routed path
- [ ] Contract/schema impact is documented when relevant
- [ ] Access/query/job impact is documented when relevant

## Alignment Checks

### Spec Alignment
[Does delivered behavior match intended scope and acceptance?]

### Plan Alignment
[Does implementation still match approved plan?]

### Task Traceability
[Is work traceable to tasks or bounded execution units?]

### Scope Discipline
[Was unrelated cleanup, redesign, or adjacent work absorbed into scope?]

## Risk Checks

### Protected Areas
[Were protected areas untouched, or handled explicitly and correctly?]

### Contract / Schema
[Did shared contract behavior remain aligned, or was change documented and reviewed?]

### Access / ACL / Tenancy
[Was access or scoping impact handled explicitly?]

### Query / Reporting
[Were changed filters, grouping, derived outputs, or reporting semantics handled explicitly?]

### Jobs / Async / Idempotency
[Were background behavior and retry/idempotency implications handled explicitly?]

### Cross-Client / Mobile
[Was cross-surface consequence checked or explicitly ruled out?]

## QA and Runtime Review

### QA Visibility
[Is QA coverage visible and proportionate to risk?]

### Runtime Honesty
[Do runtime notes clearly state build / run / local verify status, environment assumptions, and remaining gaps?]

### Manual Verification Still Needed
- [Item]
- [Item]
- [`none`]

## Findings

### Must Fix
- [Item]
- [Item]
- [`none`]

### Should Fix
- [Item]
- [Item]
- [`none`]

### Notes
- [Observation]
- [Observation]
- [`none`]

## Accepted Limitations

- [Limitation]
- [Limitation]
- [`none`]

## Exceptions

- [Exception record reference]
- [`none`]

## Completion Assessment

**Can this be called done?**: `yes | no | done with limitations`  
**Why**: [Short reason]

## Final Verdict

**Verdict**: `accept | revise | block`  
**Confidence**: `confirmed | partial | uncertain | blocked`  
**Summary**: [Short final review statement]