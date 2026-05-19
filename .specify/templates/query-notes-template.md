# Query Notes: [SLICE NAME]

**Module Slug**: `[module-slug]`
**Slice Slug**: `phase{N}-{NN}-[slice-slug]`
**Date**: [DATE]
**Related Spec**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/spec.md`
**Related Plan**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/plan.md`
**Status**: `draft | confirmed | blocked`

## Purpose

Use this file only when the feature may affect:
- list or detail semantics,
- dashboard semantics,
- filters,
- grouping,
- ordering,
- aggregation,
- derived outputs,
- exports,
- or reporting behavior.

If no such impact exists, write:
`No query or reporting semantic change expected.`

## Read-Side Change Classification

**Impact Class**: `IC2 | IC3 | IC4 | IC5`  
**Confidence**: `confirmed | partial | uncertain | blocked`  
**Protected Areas Affected**: `none | query | shared-contract | acl | tenancy | jobs | architecture`  
**Why this file exists**: [Short reason]

## Baseline Read-Side Behavior

### Current Consumer Surface
- [List / detail / report / export surface]
- [List / detail / report / export surface]

### Current Semantic Rules
- [Current filter / grouping / ordering / aggregation / omission meaning]
- [Current filter / grouping / ordering / aggregation / omission meaning]

### Current Consumers
- [Web / mobile / export / integration / internal consumer]
- [Web / mobile / export / integration / internal consumer]

## Proposed Query / Reporting Semantics

### Summary
[Short description of the intended read-side change.]

### Filters
- [Rule]
- [Rule]
- [Or `none`]

### Grouping / Aggregation
- [Rule]
- [Rule]
- [Or `none`]

### Ordering / Ranking
- [Rule]
- [Rule]
- [Or `none`]

### Derived Outputs / Computed Meaning
- [Rule]
- [Rule]
- [Or `none`]

### Empty / Partial / Omitted Results
- [Rule]
- [Rule]
- [Or `none`]

### Export / Reporting Consequences
- [Rule]
- [Rule]
- [Or `none`]

## Cross-Surface Interpretation

- **API**: [Impact or `none`]
- **Web**: [Impact or `none`]
- **Mobile**: [Impact or `none`]
- **Exports / Integrations**: [Impact or `none`]

## Compatibility and Risk

### Compatibility
`compatible | conditionally compatible | breaking | unknown`

### Consumer Assumptions at Risk
- [Assumption]
- [Assumption]
- [Or `none`]

### Performance / Data Volume Sensitivity
- [Relevant assumption or `none`]
- [Relevant assumption or `none`]

## Boundaries and Non-Changes

### Explicit Non-Changes
- [Semantic rule that remains unchanged]
- [Semantic rule that remains unchanged]

### Out of Scope
- [Excluded redesign]
- [Excluded cleanup]

## Open Ambiguities

- [Ambiguity]
- [Ambiguity]
- [Or `none`]

If ambiguity materially affects implementation or review confidence, also record it in `open-questions.md`.

## Required Downstream Actions

- [ ] Update `tasks.md` with query-aware work
- [ ] Update QA checks for filters / grouping / result semantics
- [ ] Update contract notes if read-side meaning changes consumer expectations
- [ ] Update runtime notes if verification depends on specific data shape or volume
- [ ] Block confident completion if read-side meaning remains unclear

## Decision

**Decision**: `no query semantic change | bounded query semantic change | breaking or unclear query semantic change | blocked`  
**Why**: [Short reason]  
**Next Required Step**: [Short next step]