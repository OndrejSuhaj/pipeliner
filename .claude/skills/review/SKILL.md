---
name: review
description: Review code changes and produce review artifacts with verdict
disable-model-invocation: true
---

# /review — Governance-Aware Review

When the user invokes `/review`, follow this procedure exactly. This skill produces a review verdict for the current branch's implementation.

## Procedure

### 1. Load governance context

Read these files (stop if any are missing):
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/definition-of-done.md`
- `docs/governance/trigger-matrix.md`

### 2. Locate the current branch's spec

- Determine the current branch: `git rev-parse --abbrev-ref HEAD`
- Find `specs/<branch>/spec.md`. If it doesn't exist, verdict is **block** — cannot review without a spec.
- Also load `plan.md` and `tasks.md` if they exist.

### 3. Review checklist

Evaluate each dimension and assign a confidence level (`confirmed`, `partial`, `uncertain`, `blocked`):

#### Spec alignment
- Does the implementation match what `spec.md` describes?
- Are all acceptance criteria addressed?

#### Plan alignment
- If `plan.md` exists, does the implementation follow it?
- Any material deviations?

#### Scope discipline
- Does the implementation stay within the declared scope?
- Any undeclared additions, refactors, or cleanups?

#### Protected area safety
- For each protected area listed in the spec: is the implementation safe?
- Were required specialist artifacts produced (schema-impact.md, acl-notes.md, etc.)?

#### Runtime honesty
Use these terms precisely:
- **buildable** — code compiles / passes lint
- **runnable** — application starts without crash
- **locally verifiable** — feature can be tested locally
- **demoable** — feature can be shown to stakeholders

State explicitly what was verified and what remains unverified.
Note any missing credentials, infrastructure, manual seeding, or provider dependencies.

### 4. Produce `review.md`

Write `specs/<branch>/review.md` with:
- Branch name and date
- Checklist results with confidence levels
- Overall confidence: `confirmed` | `partial` | `uncertain` | `blocked`
- Blockers and limitations (if any)
- **Verdict: `accept` | `revise` | `block`**

Rules:
- Cannot `accept` with `uncertain` overall confidence.
- Cannot `accept` if any required specialist artifact is missing.
- `revise` means fixable issues found — list them.
- `block` means fundamental problems — list them.

### 5. Present the verdict

Show the verdict and key findings to the user. If `revise`, list the specific items to fix.
