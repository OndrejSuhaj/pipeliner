# QA Checklist: [SLICE NAME]

**Module Slug**: `[module-slug]`
**Slice Slug**: `phase{N}-{NN}-[slice-slug]`
**Date**: [DATE]
**Spec**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/spec.md`
**Plan**: `specs/[module-slug]/slices/phase{N}-{NN}-[slice-slug]/plan.md`
**Impact Class**: `IC0 | IC1 | IC2 | IC3 | IC4 | IC5`

## Status Legend

- `[ ]` not checked
- `[x]` checked
- `[!]` issue found
- `[-]` not applicable

## Scope and Acceptance

- [ ] QA-001 Scope in `spec.md` matches what is being tested
- [ ] QA-002 In-scope / out-of-scope remains clear
- [ ] QA-003 Acceptance scenarios for P1 slice were checked
- [ ] QA-004 Acceptance scenarios for P2 slice were checked
- [ ] QA-005 Acceptance scenarios for P3 slice were checked

## Core User Flows

- [ ] QA-101 Primary happy path works
- [ ] QA-102 Expected validation behavior is correct
- [ ] QA-103 Empty state / no-data path is correct
- [ ] QA-104 Error path is understandable and controlled
- [ ] QA-105 State transitions are consistent

## Edge Cases

- [ ] QA-201 Boundary condition handled correctly
- [ ] QA-202 Invalid input handled correctly
- [ ] QA-203 Retry / duplicate action does not create unintended behavior
- [ ] QA-204 Regression-sensitive existing path still works

## Protected-Area Checks

- [ ] QA-301 No hidden contract drift
- [ ] QA-302 No hidden permission or visibility drift
- [ ] QA-303 No hidden tenancy / scoping drift
- [ ] QA-304 No hidden query/report semantic drift
- [ ] QA-305 No hidden async/job side effect

## Cross-Surface Checks

- [ ] QA-401 API and UI expectations stay aligned
- [ ] QA-402 Cross-client impact checked or explicitly ruled out
- [ ] QA-403 Existing consumers are not silently broken

## Manual Verification Needed

- [ ] QA-501 Manual check list is explicit
- [ ] QA-502 Required test data / seed data is known
- [ ] QA-503 Required credentials / environment dependencies are known

## Findings

### Issue 1
- **ID**: [QA-ISSUE-001]
- **Severity**: `low | medium | high`
- **Summary**: [Finding]
- **Impact**: [Why it matters]
- **Status**: `open | accepted limitation | resolved`

### Issue 2
- **ID**: [QA-ISSUE-002]
- **Severity**: `low | medium | high`
- **Summary**: [Finding]
- **Impact**: [Why it matters]
- **Status**: `open | accepted limitation | resolved`

## QA Conclusion

**QA Confidence**: `confirmed | partial | uncertain | blocked`  
**QA Summary**: [Short conclusion]  
**Still Needs Human Check**: [List or `none`]