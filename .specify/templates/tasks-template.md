# Tasks: [FEATURE NAME]

**Feature Slug**: `[feature-slug]`  
**Input**: `specs/[feature-slug]/spec.md`, `specs/[feature-slug]/plan.md`  
**Prerequisites**: spec complete, plan complete when required, triggered specialist artifacts available when required

## Task Rules

- Organize tasks by user story or bounded slice.
- Use exact file paths in every implementation task.
- Keep tasks traceable to spec and plan.
- Include QA, runtime, and review work.
- Do not add unrelated cleanup tasks.
- Add specialist tasks only when triggered.

## Format

`[ID] [P?] [Story/Slice] [Area] Description`

### Tags
- `[P]` = can run in parallel
- `[Story/Slice]` = `US1`, `US2`, `US3`, or `SLICE1`, `SLICE2`
- `[Area]` = `SPEC`, `PLAN`, `SCHEMA`, `ACL`, `QUERY`, `JOB`, `API`, `WEB`, `MOBILE`, `QA`, `RUNTIME`, `REVIEW`

## Phase 0 — Preconditions

- [ ] T001 [SPEC] Confirm `spec.md` reflects current scope
- [ ] T002 [PLAN] Confirm `plan.md` reflects current implementation shape
- [ ] T003 [PLAN] Confirm all required specialist artifacts exist or mark lane blocked

## User Story 1 — [Title] (Priority: P1)

**Goal**: [What this slice delivers]  
**Independent Check**: [How this slice is verified on its own]

### Analysis / Specialist Tasks
- [ ] T010 [US1] [SCHEMA] [Describe only if contract/schema work is required]
- [ ] T011 [US1] [ACL] [Describe only if access work is required]
- [ ] T012 [US1] [QUERY] [Describe only if read-side semantics change]
- [ ] T013 [US1] [JOB] [Describe only if async/job behavior changes]

### Implementation Tasks
- [ ] T014 [P] [US1] [API] Update `[exact/path]`
- [ ] T015 [P] [US1] [WEB] Update `[exact/path]`
- [ ] T016 [US1] [API] Add validation / orchestration in `[exact/path]`
- [ ] T017 [US1] [WEB] Wire behavior in `[exact/path]`
- [ ] T018 [US1] [MOBILE] Update `[exact/path]` if mobile is impacted

### Verification Tasks
- [ ] T019 [US1] [QA] Add or update acceptance checks in `specs/[feature-slug]/qa-checklist.md`
- [ ] T020 [US1] [RUNTIME] Add runtime verification notes in `specs/[feature-slug]/runtime-notes.md`

### Review Tasks
- [ ] T021 [US1] [REVIEW] Confirm implementation stays within approved scope

## User Story 2 — [Title] (Priority: P2)

**Goal**: [What this slice delivers]  
**Independent Check**: [How this slice is verified on its own]

### Tasks
- [ ] T030 [P] [US2] [API] Update `[exact/path]`
- [ ] T031 [P] [US2] [WEB] Update `[exact/path]`
- [ ] T032 [US2] [QA] Extend `qa-checklist.md`
- [ ] T033 [US2] [RUNTIME] Extend `runtime-notes.md`
- [ ] T034 [US2] [REVIEW] Review slice-level drift and side effects

## User Story 3 — [Title] (Priority: P3)

**Goal**: [What this slice delivers]  
**Independent Check**: [How this slice is verified on its own]

### Tasks
- [ ] T040 [P] [US3] [API] Update `[exact/path]`
- [ ] T041 [P] [US3] [WEB] Update `[exact/path]`
- [ ] T042 [US3] [QA] Extend `qa-checklist.md`
- [ ] T043 [US3] [RUNTIME] Extend `runtime-notes.md`
- [ ] T044 [US3] [REVIEW] Review slice-level drift and side effects

## Final Closure

- [ ] T090 [QA] Finalize `qa-checklist.md`
- [ ] T091 [RUNTIME] Finalize `runtime-notes.md`
- [ ] T092 [REVIEW] Finalize `review.md` with explicit verdict
- [ ] T093 [SUMMARY] Finalize `delivery-summary.md` if used

## Notes

- Remove unused placeholder tasks.
- Do not keep empty specialist sections if not triggered.
- Prefer smaller bounded tasks over broad vague items.