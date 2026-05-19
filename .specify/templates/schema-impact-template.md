# Schema Impact: [SLICE NAME]

**Module Slug**: `[module-slug]`
**Slice Slug**: `phase{N}-{NN}-[slice-slug]`
**Date**: [DATE]
**Related Spec**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/spec.md`
**Related Plan**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/plan.md`
**Status**: `draft | confirmed | blocked`

## Purpose

Use this file only when the feature may affect:
- GraphQL schema,
- shared types,
- response or mutation shape,
- projections,
- or schema-sensitive persistence behavior.

If no such impact exists, write:
`No schema or shared-contract change expected.`

## Change Classification

**Impact Class**: `IC3 | IC4 | IC5`  
**Confidence**: `confirmed | partial | uncertain | blocked`  
**Protected Areas Affected**: `none | shared-contract | schema | tenancy | acl | jobs | integrations | architecture`  
**Why this file exists**: [Short reason]

## Baseline

### Current Contract / Schema Surface
- [Relevant type / query / mutation / shared type]
- [Relevant existing projection / field / payload]

### Current Consumers
- [API consumer / web flow / mobile flow / integration / export]
- [API consumer / web flow / mobile flow / integration / export]

## Proposed Schema Change

### Summary
[Short description of the proposed schema or shared-type delta.]

### Added
- [Field / type / enum / projection / payload element]
- [Field / type / enum / projection / payload element]

### Changed
- [Existing field / type / behavior]
- [Existing field / type / behavior]

### Removed
- [Removed item or `none`]

## Compatibility Analysis

### Backward Compatibility
`compatible | conditionally compatible | breaking | unknown`

[Short explanation.]

### Consumer Impact
- **Web**: [Impact or `none`]
- **Mobile**: [Impact or `none`]
- **Other Clients**: [Impact or `none`]
- **Integrations / Exports**: [Impact or `none`]

### Projection / Query Assumptions
- [New assumption]
- [Changed assumption]
- [Or `none`]

## Persistence / Invariant Impact

### Data Model / Persistence Impact
[State whether the change is schema-only, projection-only, or persistence-relevant.]

### Invariants at Risk
- [Invariant]
- [Invariant]
- [Or `none`]

### Migration-Relevant?
`yes | no | unclear`

If `yes` or `unclear`, explain:
- [Why]
- [What must be checked before implementation continues]

## Boundaries and Non-Changes

### Explicit Non-Changes
- [What is not changing]
- [What is not changing]

### Out of Scope
- [Excluded redesign]
- [Excluded cleanup]

## Risks

- [Risk]
- [Risk]
- [Or `none`]

## Required Downstream Actions

- [ ] Update `contract-notes.md` if shared behavior meaning changes
- [ ] Update `tasks.md` with schema-aware work
- [ ] Trigger mobile-aware review if cross-client impact exists
- [ ] Trigger ACL / QUERY / JOB note if impact crosses those boundaries
- [ ] Block implementation until ambiguity is resolved when required

## Decision

**Decision**: `no schema change | safe bounded schema change | schema change needs more analysis | blocked`  
**Why**: [Short reason]  
**Next Required Step**: [Short next step]