---
name: specify
description: Create or refine specification artifacts for feature delivery
disable-model-invocation: true
---

# /specify — Governance-Aware Specification

When the user invokes `/specify`, follow this procedure exactly. Do not implement anything — this skill produces specification artifacts only.

## Inputs

The user provides a feature description or request. If no feature slug is given, derive one from the request.

## Procedure

### 1. Load governance context

Read these files (stop if any are missing):
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/impact-classes.md`
- `docs/governance/definition-of-done.md`
- `docs/governance/trigger-matrix.md`

### 2. Classify the request

- Confirm this is Mode B (feature delivery). If it looks like Mode C (comment intake), say so and stop.
- Determine the impact class using `docs/governance/impact-classes.md`.
- Identify the feature slug for the branch name: `phase{N}-{NN}-{feature-slug}`.

### 3. Check all nine protected area categories

For each category, state whether the feature touches it:
1. Authentication and identity
2. ACL / permissions
3. Tenancy / scoping
4. Shared contract
5. Data model / schema-sensitive behavior
6. Jobs / async / retry / idempotency
7. External integrations
8. Infrastructure-sensitive behavior
9. Architecture boundaries

If any protected area is touched, name it explicitly and note required downstream artifacts.

### 4. Resolve ambiguity

If ambiguity materially affects scope, acceptance, contract meaning, permissions, tenancy, runtime behavior, or cross-client behavior — stop and ask for clarification before proceeding.

### 5. Produce artifacts

Create directory `specs/<feature-slug>/` and write:

#### `spec.md`
- Feature name and branch name
- Goal (what and why)
- Impact class
- Protected areas touched (with explicit classification)
- Acceptance criteria (numbered)
- Out of scope (explicit)
- Open questions (if any)

#### `plan.md` (if non-trivial)
- Implementation approach
- File-level change plan
- Order of operations
- Risk notes
- Required specialist artifacts (schema-impact.md, acl-notes.md, etc.)

#### `tasks.md`
- Numbered task list derived from the plan
- Each task: description, files involved, acceptance check
- Tasks ordered by dependency

### 6. Summary

Present the artifacts to the user for review. Do not create a branch — that requires explicit user approval (Git Workflow gate 1).
