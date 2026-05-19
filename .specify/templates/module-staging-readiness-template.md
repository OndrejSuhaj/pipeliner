# Module Staging Readiness: [MODULE NAME]

**Module Slug**: `[module-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft → Verified → Recommendation Recorded
**Mode**: `M — Module Orchestration`
**Authored at**: Gate M4 — Module Release Readiness
**Owner**: `ModuleStagingVerifier`
**Depends on**: `slice-map.md`, `module-risks.md`, `module-plan.md`

> **Purpose**: Records evidence that the module is ready for release. Release itself is a human decision. This file records the framework's recommendation.

## Release Recommendation

**Recommendation**: `release | defer | block`

**Rationale**: [Why this recommendation, given the evidence below]

**Operator authorization required if `release`**: [Name] — [Date / Pending]

## Slice Closure Summary

All slices in `slice-map.md` must be `merged` or `deferred` (with reason). No slice may be `in-progress` at Gate M4.

### Merged slices

| Slice ID | Merge commit | Acceptance verified | Review verdict |
|---|---|---|---|
| `phase1-01-[slug]` | `[commit-sha]` | [yes / partial] | `accept` |
| `phase1-02-[slug]` | `[commit-sha]` | [yes / partial] | `accept` |
| … | … | … | … |

### Deferred slices

| Slice ID | Deferral reason | Re-eligibility condition |
|---|---|---|
| `phase2-03-[slug]` | [reason — e.g. "vendor API not yet available"] | [condition for un-deferral] |
| … | … | … |

### Slice count

- Total in `slice-map.md`: [n]
- Merged: [n]
- Deferred: [n]
- In-progress: **must be 0**
- Planned but not yet slice-ready: **must be 0**

## Staging Environment

- **Staging URL**: [https://...]
- **Access details**: [How to reach staging — credentials reference, VPN, internal-only, etc.]
- **Deployed commit**: [commit-sha or release tag]
- **Deployed timestamp**: [DATE + TIME]
- **Compose / deployment configuration**: [Reference to docker-compose, k8s manifest, etc.]

## Manual Verification Evidence

For each acceptance criterion declared in slice specs, record evidence of manual verification.

### Slice `phase1-01-[slug]` — [acceptance criterion]
- **Verification action**: [What was done to verify]
- **Result**: [Observable outcome confirming criterion]
- **Verified by**: [Name]
- **Date**: [DATE]
- **Limitations**: [Anything that was not fully verified manually]

### Slice `phase1-02-[slug]` — [acceptance criterion]
…

## Cross-Module Integration Verification

For each contract surface this module exposes (per `module-plan.md` § Contract Surfaces), verify that consuming modules / external systems can interact with this module on staging.

| Contract surface | Consumer | Verification action | Result |
|---|---|---|---|
| [GraphQL type X] | `[other-module]` | [end-to-end test through consumer] | `pass | fail | partial` |
| [REST endpoint Y] | external system Z | [scripted integration check] | `pass | fail | partial` |

## Known Gaps and Limitations

Be honest. Anything that was not fully verified, anything intentionally deferred, anything that depends on conditions not yet met.

- [Gap 1: Description, why it remains, acceptable for `release` recommendation? yes/no]
- [Gap 2: …]
- [Limitation: …]

## Open Risks at Release

[Reference `module-risks.md` open risks. State which are accepted for release, which remain blockers.]

| Risk ID | Severity | Status at release | Notes |
|---|---|---|---|
| MR-001 | high | accepted | [why acceptance is OK now] |
| MR-002 | medium | mitigated | [reference to mitigation work] |
| MR-003 | critical | **blocker** | [why this blocks release] |

If any risk is `blocker`, the recommendation cannot be `release`.

## Performance & Operational Checks

[Per `module-plan.md` § Cross-Cutting Concerns, verify operational expectations.]

- **Performance targets met**: [yes / no / partial] — [evidence]
- **Observability wiring functional**: [yes / no] — [log/metric/trace evidence]
- **Backup / restore tested**: [yes / no / n/a] — [evidence]
- **Security posture verified**: [yes / no] — [audit / scan evidence]

## Deferred-Slice Impact

If any slice is deferred, declare its impact on module-level completeness:

- [Deferred slice X means feature Y is not available at module release. Mitigation: …]

## Release-Time Decisions Required From Operator

[List explicit decisions the operator must make before `release` becomes authorized. Do not pre-decide.]

- [ ] Operator authorizes accepted risks
- [ ] Operator authorizes deferred slice impact
- [ ] Operator authorizes any limitation that affects user-observable behavior
- [ ] Operator confirms cross-module consumers are informed of release

## Post-Release Monitoring Plan

[What is monitored after release, for what duration, and what triggers a rollback or `block` of further releases.]

- Monitor [metric / log / user-facing indicator] for [duration]
- Rollback trigger: [condition]
- Re-evaluation point: [DATE]

## Amendment History

| Date | Trigger | Summary of change |
|---|---|---|
| [DATE] | initial Gate M4 | initial readiness draft |
