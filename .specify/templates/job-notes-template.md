# Job Notes: [FEATURE NAME]

**Feature Slug**: `[feature-slug]`  
**Date**: [DATE]  
**Related Spec**: `specs/[feature-slug]/spec.md`  
**Related Plan**: `specs/[feature-slug]/plan.md`  
**Status**: `draft | confirmed | blocked`

## Purpose

Use this file only when the feature may affect:
- async jobs,
- queues,
- schedulers,
- retries,
- idempotency,
- import / export pipelines,
- background processing,
- or background correctness.

If no such impact exists, write:
`No async or job behavior change expected.`

## Background Change Classification

**Impact Class**: `IC2 | IC3 | IC4 | IC5`  
**Confidence**: `confirmed | partial | uncertain | blocked`  
**Protected Areas Affected**: `none | jobs | integrations | schema | acl | tenancy | infrastructure | architecture`  
**Why this file exists**: [Short reason]

## Baseline Background Behavior

### Current Flow
- [Existing job / trigger / queue / scheduler behavior]
- [Existing job / trigger / queue / scheduler behavior]

### Current Correctness Assumptions
- [Retry / idempotency / ordering / delivery assumption]
- [Retry / idempotency / ordering / delivery assumption]

### Current Failure Handling
- [Current failure or recovery behavior]
- [Current failure or recovery behavior]

## Proposed Background Behavior

### Summary
[Short description of the intended async/job change.]

### Trigger Conditions
- [When the job starts]
- [When it should not start]
- [Or `none`]

### Processing Behavior
- [Main processing rule]
- [Main processing rule]

### Retry / Idempotency Semantics
- [Rule]
- [Rule]
- [Or `none`]

### Failure / Recovery Semantics
- [Rule]
- [Rule]
- [Or `none`]

### Import / Export / Sync Consequences
- [Rule]
- [Rule]
- [Or `none`]

## Runtime and Verification Implications

### What Must Be Verifiable
- [Behavior]
- [Behavior]

### Environment / Infra Assumptions
- [Queue / scheduler / worker / provider dependency]
- [Seed / fixture / credential / timing dependency]

### What May Remain Hard to Verify Locally
- [Constraint]
- [Constraint]
- [Or `none`]

## Compatibility and Risk

### Compatibility
`compatible | conditionally compatible | breaking | unknown`

### Operational Risk
- [Risk]
- [Risk]
- [Or `none`]

### Data / Side-Effect Risk
- [Duplicate processing / missed processing / ordering / partial failure risk]
- [Integration or export side-effect risk]
- [Or `none`]

## Boundaries and Non-Changes

### Explicit Non-Changes
- [What async behavior is not changing]
- [What async behavior is not changing]

### Out of Scope
- [Excluded redesign]
- [Excluded cleanup]

## Open Ambiguities

- [Ambiguity]
- [Ambiguity]
- [Or `none`]

If ambiguity materially affects implementation, runtime honesty, or review confidence, also record it in `open-questions.md`.

## Required Downstream Actions

- [ ] Update `tasks.md` with job-aware work
- [ ] Update QA checks for async / retry / side-effect behavior
- [ ] Update runtime notes with real worker / queue / verification constraints
- [ ] Trigger contract / ACL / integration follow-up if background behavior crosses those boundaries
- [ ] Block implementation until async correctness is explicit when required

## Decision

**Decision**: `no async change | bounded async change | breaking or unclear async change | blocked`  
**Why**: [Short reason]  
**Next Required Step**: [Short next step]