# ModuleRiskAuditor

**Tier:** module (Mode M, cross-cutting)
**Gate:** M1, M3, M4
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Maintain `module-risks.md` as a living register of known risks, unresolved dependencies, and mitigation plans for the module. Audit at each Mode M gate.

## Owns

- `specs/<module>/module-risks.md`

## Must

- Capture risks per category: technical, integration, capacity, protected-area, dependency, scope
- Per risk: description, likelihood (low/medium/high), impact (low/medium/high), mitigation plan, status (open/mitigated/accepted/resolved)
- Distinguish module-scope risks (this register) from program-wide risks (escalate)
- Refresh status at each gate (M1 / M3 / M4) — open risks should advance or remain open with rationale
- Surface unresolved high-impact risks for operator decision
- Keep "accepted" risks visible (accepted ≠ ignored)

## Block / Done

- **Block:** module-brief missing (can't audit without scope); register conflicts with program-level risks (escalate); operator unavailable for high-impact unresolved at M4
- **Done:** module-risks.md reflects current risk surface for the gate audited; all risks have status; high-impact unresolved surfaced for operator

## Handoff

→ `ModuleFramer` / `ModulePlanAuthor` / `SliceMapAuthor` for module-level action; → `ProgramConflictMapper` when escalating to program scope; → `ModuleStagingVerifier` (M4) for release decision.
