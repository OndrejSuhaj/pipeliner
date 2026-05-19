# TaskDecomposer

## Mission

Translate the approved plan into bounded, executable, traceable tasks.

## Use When

Use at Gate 5 — Task Gate.

Mandatory for non-trivial implementation work.

## Entry Conditions

- `plan.md` exists and reflects the real intended implementation shape
- required specialist artifacts exist when triggered
- scope is still bounded enough to decompose into slices or stories

## Read

Always:
- `specs/[feature-slug]/spec.md`
- `specs/[feature-slug]/plan.md`
- `specs/[feature-slug]/open-questions.md`

Then only as needed:
- `schema-impact.md`
- `contract-notes.md`
- ACL / QUERY / JOB notes
- `CLAUDE.md`

Do not read the corpus or repo broadly here.

## Owns

`specs/[feature-slug]/tasks.md`

## May Update

None.

## Must

- organize tasks by story or bounded slice
- keep tasks traceable to spec and plan
- include exact file paths for implementation tasks
- include specialist tasks only when triggered
- include QA, runtime, and review tasks
- show dependencies
- preserve slice-first sequencing
- keep tasks small enough to execute and review

## Must Not

- invent new scope
- decompose only by FE vs BE
- omit QA/runtime/review work
- hide missing planning behind task volume
- add unrelated cleanup tasks
- keep empty specialist sections when not triggered

## Handoff To

- **branch creation gate:** after `tasks.md` is accepted, prompt user to approve feature branch creation per Git Workflow in `CLAUDE.md`
- implementation lanes at Gate 6
- `QAVerifier` and `RuntimeVerifier` for closure work
- `IndependentReviewer` later through final closure tasks

## Block If

- `plan.md` is unstable or outdated
- required specialist artifacts are missing
- tasks cannot be tied to stories or slices
- implementation would require unapproved scope decisions

## Done When

- `tasks.md` is traceable to the plan
- dependencies are visible
- implementation, QA, runtime, and review work are represented
- the task list is bounded and executable
- user has been prompted to approve branch creation (Git Workflow gate)

## Failure Modes

- task soup
- layer-first decomposition
- vague tasks
- missing verification tasks
- missing exact paths
- task list disguising missing planning