# Implementation Plan: [FEATURE NAME]

**Feature Slug**: `[feature-slug]`  
**Date**: [DATE]  
**Spec**: `specs/[feature-slug]/spec.md`  
**Related Questions**: `specs/[feature-slug]/open-questions.md`  

## Summary

[Short description of the intended implementation shape.]

## Delivery Context

**Impact Class**: `IC0 | IC1 | IC2 | IC3 | IC4 | IC5`  
**Classification Confidence**: `confirmed | partial | uncertain`  
**Protected Areas Affected**: `none | auth | acl | tenancy | shared-contract | schema | jobs | integrations | infrastructure | architecture`  
**Impacted Lanes**: `api | web | mobile | qa | runtime | review`  
**Required Specialist Artifacts**: `none | schema-impact.md | contract-notes.md | ACL notes | QUERY notes | JOB notes`  

## Technical Context

**Relevant Modules / Areas**: [List]  
**Relevant Paths**: [Exact repo paths]  
**Primary Dependencies**: [Key libraries / services / packages]  
**Storage / Persistence**: [DB / files / none / unknown]  
**Interfaces Touched**: [API / GraphQL / UI / jobs / integrations / mobile / none]  
**Constraints**: [Performance / permissions / data quality / compatibility / rollout / migration / runtime constraints]

## Baseline and Existing Behavior

[Describe the current known state that this feature builds on.]

## Proposed Change Shape

### Slice Strategy
[How the feature is decomposed into bounded slices.]

### Main Change
[Main implementation shape.]

### What Will Not Change
- [Explicitly preserved behavior]
- [Explicitly preserved module or contract]
- [Explicitly preserved protected area assumption]

## Impact Analysis

### Contract / Schema
[Write `No contract change expected.` if not applicable.]

### Access / ACL / Tenancy
[Write `No access or tenancy change expected.` if not applicable.]

### Query / Reporting
[Write `No query or reporting semantic change expected.` if not applicable.]

### Jobs / Async / Idempotency
[Write `No async or job impact expected.` if not applicable.]

### Cross-Client / Mobile
[Write `No mobile or cross-client impact expected.` if not applicable.]

## Risks and Dependencies

### Key Risks
- [Risk]
- [Risk]

### Dependencies
- [Dependency]
- [Dependency]

### Blockers
- [Blocker or `none`]

## Verification Strategy

### QA Focus
- [What must be checked]
- [Regression-sensitive path]
- [Manual verification need]

### Runtime Focus
- [What should build]
- [What should run]
- [What can be locally verified]
- [What may remain environment-dependent]

## Sequencing

1. [First bounded step]
2. [Second bounded step]
3. [Third bounded step]

## Out-of-Scope Enforcement

- [Explicitly excluded cleanup]
- [Explicitly excluded redesign]
- [Explicitly excluded adjacent issue]

## Exceptions

[Record only if an explicit exception exists. Otherwise write `None`.]