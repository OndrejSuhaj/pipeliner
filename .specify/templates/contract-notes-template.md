# Contract Notes: [FEATURE NAME]

**Feature Slug**: `[feature-slug]`  
**Date**: [DATE]  
**Related Spec**: `specs/[feature-slug]/spec.md`  
**Related Plan**: `specs/[feature-slug]/plan.md`  
**Related Schema Impact**: `specs/[feature-slug]/schema-impact.md`  
**Status**: `draft | confirmed | blocked`

## Purpose

Use this file when shared behavior meaning matters, including:
- response semantics,
- mutation semantics,
- field meaning,
- read-side expectations,
- visibility semantics,
- cross-client interpretation,
- or integration-facing contract behavior.

If shared behavior meaning does not change, write:
`No shared-contract interpretation change expected.`

## Contract Change Summary

[Short statement of what shared behavior is changing or being clarified.]

## Baseline Meaning

### Current Contract Behavior
- [Current behavior or meaning]
- [Current behavior or meaning]

### Current Consumer Expectations
- [Current expectation]
- [Current expectation]

## New / Clarified Meaning

### New Expected Behavior
- [New behavior]
- [New behavior]

### What a Consumer May Now Assume
- [Assumption]
- [Assumption]

### What a Consumer Must Not Assume
- [Disallowed assumption]
- [Disallowed assumption]

## Input / Output Semantics

### Inputs
- [Validation / optionality / required condition / visibility rule]
- [Validation / optionality / required condition / visibility rule]

### Outputs
- [Returned meaning / shape / ordering / inclusion / omission rule]
- [Returned meaning / shape / ordering / inclusion / omission rule]

### Error / Empty / Edge Semantics
- [Error meaning]
- [Empty-state meaning]
- [Boundary behavior]

## Visibility / Scope Semantics

### Permission-Sensitive Meaning
[State whether visibility, role, or ACL meaning is affected.]

### Tenant / Scope Semantics
[State whether tenant/company/context meaning is affected.]

If either area changes materially, this file is not sufficient on its own; add the relevant specialist note and mark it in plan/review.

## Read-Side / Derived Output Semantics

### Query / Filter / Grouping / Export Meaning
- [Semantic rule]
- [Semantic rule]
- [Or `none`]

### Ordering / Aggregation / Derivation Rules
- [Rule]
- [Rule]
- [Or `none`]

## Cross-Surface Interpretation

- **API**: [Impact or `none`]
- **Web**: [Impact or `none`]
- **Mobile**: [Impact or `none`]
- **Integrations**: [Impact or `none`]

## Backward Compatibility

**Compatibility**: `compatible | conditionally compatible | breaking | unknown`

### Breaking Risk
- [Risk]
- [Risk]
- [Or `none`]

### Consumer Action Needed
- [Required update]
- [Required update]
- [Or `none`]

## Explicit Non-Changes

- [What meaning is unchanged]
- [What meaning is unchanged]

## Open Ambiguities

- [Ambiguity]
- [Ambiguity]
- [Or `none`]

If ambiguity materially affects implementation or review confidence, also record it in `open-questions.md`.

## Required Downstream Actions

- [ ] Update `tasks.md` with contract-aware work
- [ ] Update QA checks for changed semantics
- [ ] Update runtime notes if verification needs changed fixtures or flows
- [ ] Trigger QUERY / ACL / JOB / mobile-aware follow-up if relevant
- [ ] Block confident completion if consumer impact remains unclear

## Decision

**Decision**: `no contract meaning change | bounded contract meaning change | breaking or unclear contract change | blocked`  
**Why**: [Short reason]  
**Next Required Step**: [Short next step]