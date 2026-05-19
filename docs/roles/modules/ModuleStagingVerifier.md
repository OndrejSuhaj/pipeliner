# ModuleStagingVerifier

**Tier:** module (Mode M)
**Gate:** M4 (release readiness)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Verify module-release readiness — confirm all slices are merged or deferred, staging verification exists, cross-module integration verified. Emit explicit release recommendation: `release` | `defer` | `block`.

## Owns

- `specs/<module>/module-staging-readiness.md`
- updates to `slice-map.md` final statuses
- updates to `module-risks.md` remaining open risks

## Must

- List merged slices with merge commits and review verdicts
- List deferred slices with deferral reasons
- Record staging URL and access details
- Record manual verification evidence (per-slice or holistic)
- Record cross-module integration verification when module exposes contracts
- List known gaps and limitations at release time
- Emit explicit recommendation: `release` | `defer` | `block`
- State that final release decision is operator's (this role recommends)

## Block / Done

- **Block:** any slice in-progress; cross-module integration conflict; staging unreachable; protected-area runtime evidence too weak; module contract lacks verification
- **Done:** module-staging-readiness.md records all required evidence + recommendation; operator has info to decide

## Handoff

→ Operator (release decision is human); → Mode M Gate M3 refresh when release reveals need for new slices.
