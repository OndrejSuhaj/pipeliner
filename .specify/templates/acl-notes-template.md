# ACL Notes: [SLICE NAME]

**Module Slug**: `[module-slug]`
**Slice Slug**: `phase{N}-{NN}-[slice-slug]`
**Date**: [DATE]
**Related Spec**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/spec.md`
**Related Plan**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/plan.md`
**Status**: `draft | confirmed | blocked`

## Purpose

Use this file only when the feature may affect:
- roles,
- grants,
- visibility rules,
- permission semantics,
- access scope,
- or tenant / company / context-sensitive access behavior.

If no such impact exists, write:
`No access or ACL change expected.`

## Access Change Classification

**Impact Class**: `IC3 | IC4 | IC5`  
**Confidence**: `confirmed | partial | uncertain | blocked`  
**Protected Areas Affected**: `none | acl | tenancy | shared-contract | architecture`  
**Why this file exists**: [Short reason]

## Baseline Access Model

### Current Actors / Roles
- [Role / actor]
- [Role / actor]

### Current Relevant Permissions
- [Permission / capability]
- [Permission / capability]

### Current Visibility / Scope Rules
- [Visibility or scoping rule]
- [Visibility or scoping rule]

### Current Enforcement Points
- [Backend / API / resolver / service / query / UI hint]
- [Backend / API / resolver / service / query / UI hint]

## Proposed Access Semantics

### Summary
[Short description of the intended access or visibility change.]

### Changed Access Rules
- [Changed rule]
- [Changed rule]

### Unchanged Access Rules
- [Explicit non-change]
- [Explicit non-change]

### Affected Actors / Contexts
- [Affected role / actor / company context / tenant context]
- [Affected role / actor / company context / tenant context]

## Scope and Enforcement

### Permission-Sensitive Meaning
[State what is newly allowed, newly denied, newly visible, or newly hidden.]

### Tenant / Company / Context Scope
[State how tenant, company, session, or context scoping is affected.]

### Enforcement Boundary
- **Backend / API**: [What must be enforced here or `none`]
- **Web / UI**: [What may be reflected here or `none`]
- **Mobile**: [Impact or `none`]
- **Jobs / Async**: [Impact or `none`]

Do not use UI-only behavior as the sole enforcement point when real authorization meaning changes.

## Compatibility and Risk

### Compatibility
`compatible | conditionally compatible | breaking | unknown`

### Rollout / Regression Risk
- [Risk]
- [Risk]
- [Or `none`]

### Hidden Drift Risks to Watch
- [Risk of implicit visibility change]
- [Risk of tenant leakage]
- [Risk of inconsistent enforcement]
- [Or `none`]

## Boundaries and Non-Changes

### Explicit Non-Changes
- [What access behavior is not changing]
- [What access behavior is not changing]

### Out of Scope
- [Excluded redesign]
- [Excluded cleanup]

## Open Ambiguities

- [Ambiguity]
- [Ambiguity]
- [Or `none`]

If ambiguity materially affects safe implementation or review confidence, also record it in `open-questions.md`.

## Required Downstream Actions

- [ ] Update `tasks.md` with ACL-aware work
- [ ] Update QA checks for permission / visibility behavior
- [ ] Update runtime notes if verification depends on role/context setup
- [ ] Trigger contract/query/mobile follow-up if access semantics affect those areas
- [ ] Block implementation until unresolved access ambiguity is handled when required

## Decision

**Decision**: `no access change | bounded access change | breaking or unclear access change | blocked`  
**Why**: [Short reason]  
**Next Required Step**: [Short next step]