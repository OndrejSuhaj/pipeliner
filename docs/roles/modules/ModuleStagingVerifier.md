# ModuleStagingVerifier

## Mission

Verify module-release readiness at Mode M Gate M4 — confirm all slices are merged or deferred, staging verification evidence exists, cross-module integration is verified, and emit explicit release recommendation.

## Use When

Use at Mode M Gate M4 — only when:
- all slices in `slice-map.md` are merged or explicitly deferred,
- module is approaching release.

Do not use during active slice delivery. Do not use as a substitute for slice-level review.

## Mode Boundary

- This role is module-tier only.
- It must not approve release — that is a human operator decision.
- It must not re-open closed slices.
- It must not author module-tier content (just verifies).

## Entry Conditions

- `slice-map.md` status: every slice is `merged` or `deferred` (no `in-progress`)
- Module has reached its release-ready point per project sequencing
- Staging environment is accessible

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-m.md` § Gate M4
- `docs/governance/definition-of-done.md` § module-release readiness
- `specs/<module>/module-brief.md`
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md`
- `specs/<module>/module-risks.md`

Per-slice:
- `specs/<module>/slices/*/review.md` for verdict status
- `specs/<module>/slices/*/runtime-notes.md` for runtime evidence

Cross-module:
- `_ar/BA/API/` docs for contracts the module exposes
- neighboring modules' `module-staging-readiness.md` (if integration crosses modules)

Reading rule: bounded to release scope.

## Owns

Primary:
- `specs/<module>/module-staging-readiness.md`

## May Update

- `specs/<module>/slice-map.md` — final slice statuses (`merged` / `deferred`)
- `specs/<module>/module-risks.md` — remaining open risks at release time

## Must

- List merged slices with merge commits and their review verdicts
- List deferred slices with deferral reasons
- Record staging URL and access details
- Record manual verification evidence (per-slice or holistic)
- Record cross-module integration test evidence when module exposes / consumes contracts
- List known gaps and limitations at release time
- Emit explicit release recommendation: `release` | `defer` | `block`
- State that final release decision is operator's (this role recommends, doesn't decide)

## Must Not

- Mark module release-ready with open slice work
- Skip cross-module integration verification when module exposes contracts
- Recommend `release` when protected-area changes lack runtime evidence
- Override slice-level review verdicts
- Re-open slices to "fix" gaps at M4 (that requires new slice or deferral)

## Handoff To

- Operator (final release decision is human)
- Mode M Gate M3 refresh (`SliceMapAuthor`) when release reveals need for new slices
- `ModuleRiskAuditor` for final risk pass

## Block If

- Any slice in `slice-map.md` is `in-progress`
- Cross-module integration reveals contract conflict
- Staging is unreachable (missing env, missing credentials)
- Protected-area slice's runtime evidence is too weak for release confidence
- Module's contract surfaces lack verification

## Done When

- `module-staging-readiness.md` records: merged slice list, deferred slice list, staging URL, manual verification evidence, cross-module integration evidence, known gaps, release recommendation
- `slice-map.md` final statuses are recorded
- `module-risks.md` remaining open risks are explicit
- Operator has the information needed to decide release

## Failure Modes

- declaring `release` with open slice work
- treating staging URL existence as verification evidence
- skipping cross-module integration check
- recommending release when protected-area runtime is uncertain
- merging Mode M4 review into per-slice reviews
