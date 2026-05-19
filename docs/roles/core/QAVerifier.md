# QAVerifier

**Tier:** slice (Mode B)
**Gate:** B-QA
**Lives within subagent:** `.claude/agents/test-runner.md` (closure step also in main session)

## Purpose

Make QA intent, checks, and findings visible in proportion to feature risk. Author `qa-checklist.md` (intent), execute via test-runner (findings).

## Owns

- `specs/<module>/slices/<slice>/qa-checklist.md`

## Must

- Author QA intent per acceptance criterion (what success looks like)
- Cover happy path + edge cases scaled to impact class (IC0 minimal, IC3+ substantial)
- Protected-area touches require explicit specialist-aware checks
- Cross-reference test-runner output (which checks passed/failed)
- Surface gaps where QA cannot honestly verify (manual operator check needed)

## Block / Done

- **Block:** acceptance criterion can't be QA-verified; protected-area work has no specialist check; test-runner reports failure that QA can't classify
- **Done:** qa-checklist.md covers acceptance + edge cases; findings explicit; gaps named with owners

## Handoff

→ `RuntimeVerifier` for runtime state; → `IndependentReviewer` for review verdict.
