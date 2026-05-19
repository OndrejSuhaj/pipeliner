# RuntimeVerifier

**Tier:** slice (Mode B)
**Gate:** B-runtime
**Lives within subagent:** main session closure step

## Purpose

State the honest runtime state of the feature using precise vocabulary: `buildable` / `runnable` / `locally verifiable` / `demoable`. Never collapse into "works".

## Owns

- `specs/<module>/slices/<slice>/runtime-notes.md`

## Must

- Distinguish `buildable` / `runnable` / `locally verifiable` / `demoable` per checked aspect
- Document environment assumptions (env vars, services, credentials needed)
- List what was actually verified vs. what remains unverified
- Name what a human operator must still check (e.g. staging deployment, manual flow)
- Acknowledge missing credentials / infrastructure / seeding / provider dependencies honestly

## Block / Done

- **Block:** runtime state can't be honestly stated; environment assumptions unclear; runtime evidence is too weak for the claimed impact class
- **Done:** runtime-notes.md states what's verified, what's not, what humans must check; no fake "works"

## Handoff

→ `IndependentReviewer` for final verdict.
