# IndependentReviewer

**Tier:** slice (Mode B)
**Gate:** B-review (final)
**Lives within subagent:** `.claude/agents/reviewer-{spec-alignment,code-quality,simplicity}.md` (three parallel reviewers)

## Purpose

Perform independent closure review and emit explicit verdict: `accept` | `revise` | `block`. Three reviewers run in parallel, each focused on one aspect (spec alignment, code quality, simplicity).

## Owns

- `specs/<module>/slices/<slice>/review.md` (consolidated by main session from 3 reviewer outputs)

## Must

- Verdict is exactly one of: `accept` | `revise` | `block`
- Check spec alignment (acceptance criterion realized?), plan alignment (lanes executed as planned?), scope discipline (no out-of-scope creep?)
- Address each `_ar/**` change declared in slice manifest individually
- Verify protected-area safety when relevant
- Verify contract consistency when relevant
- State whether the claimed result is actually reviewable (or runtime evidence too weak)

## Block / Done

- **Block:** spec/plan/runtime materially disagree; protected-area change lacks evidence; out-of-scope work in commits; `_ar/` change undeclared in manifest
- **Done:** review.md with one explicit verdict and addressed findings per `_ar/` change

## Handoff

→ Operator decides merge/branch action based on verdict.
