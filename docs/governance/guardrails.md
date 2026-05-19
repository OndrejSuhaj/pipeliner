# Guardrails

## 1. Purpose

This document translates the constitution into operational safety rules for day-to-day use.

It defines:

- what agents and lanes may do by default,
- what they must not do,
- when escalation is required,
- when work must stop,
- and what minimum evidence or artifacts must exist before work continues.

If the constitution defines the rules of the system, this document defines the practical safety rails for working inside those rules.

This is a governance document, not a feature artifact.

---

## 2. Authority and relationship to other artifacts

This document is subordinate only to `constitution.md`.

If this document conflicts with:

- `impact-classes.md`,
- `trigger-matrix.md`,
- `definition-of-done.md`,
- feature-level documents,
- or agent instructions,

this document wins unless the constitution says otherwise.

Priority order:

1. `constitution.md`
2. `guardrails.md`
3. `impact-classes.md`
4. `trigger-matrix.md`
5. feature artifacts
6. agent instructions

---

## 3. Core operational rule

No agent is allowed to treat a plausible next step as an authorized next step.

Authorization must come from:

- the constitution,
- this document,
- explicit impact classification,
- required upstream artifacts,
- or an explicit exception.

“Seems reasonable” is not a sufficient basis for changing protected behavior.

---

## 4. Default allowed actions

Unless a protected area is touched, the package may:

- translate requests into specs,
- identify ambiguities,
- write plans,
- decompose work into tasks,
- implement bounded feature work within approved scope,
- generate tests and QA checklists,
- prepare runtime notes,
- and perform review against spec and plan.

These actions remain subject to scope, artifact, and review guardrails below.

---

## 5. Global prohibitions

The following are globally prohibited unless explicitly allowed by upstream governance and artifacts:

### 5.1 No implementation without specification

No implementation may begin without an existing feature specification at the required fidelity.

### 5.2 No implementation without plan when plan is required

If the change is beyond the lowest safe class, no implementation may begin before a plan exists.

### 5.3 No silent protected-area changes

No protected-area change may be made implicitly, casually, or hidden inside another request.

### 5.4 No hidden scope expansion

Agents must not widen a feature beyond the approved scope.

### 5.5 No unrelated cleanup during delivery

Agents must not rewrite unrelated documentation, refactor neighboring modules, or improve adjacent architecture unless such work is explicitly in scope.

### 5.6 No false completion

Agents must not report completion merely because code was produced or a partial run succeeded.

### 5.7 No silent contract drift

No agent may alter shared behavior or contract assumptions without explicit contract awareness.

### 5.8 No fake certainty

Missing information must not be hidden behind confident language.

---

## 6. Artifact prerequisites

## 6.1 Minimum prerequisites for normal feature work

Before normal feature implementation begins, the package must have:

- an identified feature scope,
- an impact classification,
- a specification,
- a plan when required,
- tasks when implementation is non-trivial.

## 6.2 Additional prerequisites when triggered

The following artifacts become required when relevant:

- `open-questions.md` when ambiguity materially affects planning or implementation,
- `schema-impact.md` when contract or schema-sensitive behavior is involved,
- `contract-notes.md` when shared contract interpretation matters,
- ACL / QUERY / JOB planning notes when those domains are touched.

## 6.3 Stop rule

If the required artifact for a triggered risk area does not exist, the affected work must stop.

## 6.4 Spec folder naming convention

Every new spec folder must follow the format:

```
phase{P}-{NN}-{feature-slug}
```

Where:

- `{P}` is the current phase number (manually managed by the operator; default is `2` until changed),
- `{NN}` is a zero-padded two-digit sequential number starting from `01`,
- `{feature-slug}` is a kebab-case descriptor of the feature.

The sequential number `{NN}` must be one higher than the highest existing `{NN}` within the current phase prefix in `specs/`.

If no folder with the current phase prefix exists yet, numbering starts at `01`.

Existing spec folders created before this convention are not renamed.

Examples:

- First spec in phase2: `phase2-01-invoice-export-pdf`
- Second spec in phase2: `phase2-02-dashboard-widgets`

The phase number changes only when the operator explicitly declares a new phase.

---

## 7. Scope guardrails

## 7.1 Scope must remain bounded

All work must remain traceable to:

- the original request,
- the approved spec,
- the approved plan,
- and the assigned tasks.

## 7.2 Adjacent problems do not automatically join scope

If the system discovers:

- a nearby bug,
- a tempting refactor,
- inconsistent naming,
- or a broader architectural weakness,

that discovery must become one of:

- a follow-up note,
- a risk note,
- a debt item,
- or a future feature candidate.

It must not silently become part of the current implementation.

## 7.3 Epic inflation is prohibited

A bounded feature must not silently turn into:

- a broad redesign,
- a multi-epic transformation,
- or a cross-cutting cleanup campaign.

If that happens, the feature must be reclassified or blocked.

---

## 8. Protected-area guardrails

## 8.1 Authentication and identity

Without explicit protected-area handling, agents must not:

- change login assumptions,
- change organization/company switching logic,
- change session semantics,
- change identity-provider integration behavior,
- or bypass the existing auth boundary.

## 8.2 Authorization / ACL / permissions

Without explicit protected-area handling, agents must not:

- create or change role logic,
- alter grants,
- modify visibility rules,
- change permission checks,
- or reinterpret access scope.

## 8.3 Tenancy and scoping

Without explicit protected-area handling, agents must not:

- change company or tenant scoping semantics,
- alter ownership boundaries,
- introduce cross-tenant visibility,
- or move filtering responsibility between frontend and backend without authorization.

## 8.4 Shared contract layer

Without explicit contract-aware handling, agents must not:

- change GraphQL schema,
- alter shared types,
- alter cross-client contract shape,
- or introduce contract assumptions not present in approved artifacts.

## 8.5 Data model and schema-sensitive behavior

Without explicit schema-aware handling, agents must not:

- introduce migration-relevant changes,
- alter persistence ownership assumptions,
- change lifecycle-critical invariants,
- or make schema-sensitive behavior changes under a local-only label.

## 8.6 Background execution

Without explicit async/job-aware handling, agents must not:

- change retry semantics,
- change scheduler or queue assumptions,
- alter idempotency-sensitive flows,
- or introduce hidden job behavior.

## 8.7 External integration boundaries

Without explicit integration-aware handling, agents must not:

- change provider-facing payload assumptions,
- change callback behavior,
- change synchronization semantics,
- or introduce hidden integration coupling.

## 8.8 Infrastructure-sensitive behavior

Without explicit handling, agents must not:

- add new infrastructure dependencies,
- rely on provider-specific assumptions,
- hide environment-sensitive requirements,
- or treat non-local operational risk as irrelevant because the UI works.

## 8.9 Architecture boundaries

Without explicit escalation, agents must not:

- move module ownership boundaries,
- split or merge domain responsibilities,
- introduce redesign hidden as delivery work,
- or rewrite major interaction patterns.

---

## 9. Escalation rules

Escalation is required when any of the following occurs:

### 9.1 Protected-area touch
A protected area is directly or indirectly affected.

### 9.2 Missing critical knowledge
A required decision cannot be made safely from available artifacts.

### 9.3 Artifact contradiction
Spec, plan, tasks, or contract notes materially disagree.

### 9.4 Feature is larger than bounded delivery
The requested change no longer fits as one safe feature.

### 9.5 Contract ambiguity
It is unclear whether a change modifies shared contract expectations.

### 9.6 Cross-client consequence
A change appears local but may affect web, mobile, or other clients.

### 9.7 Runtime uncertainty is too high
The system cannot meaningfully claim the result is verifiable.

### 9.8 Architecture drift signal
The feature begins to push against baseline architectural boundaries.

---

## 10. Hard stop conditions

The affected work must stop when:

- a protected-area change is suspected but not analyzed,
- the required artifact for a triggered area is missing,
- the change conflicts with the constitution,
- the request is actually a strategic redesign,
- or the current plan no longer describes the real work being performed.

Stopping one affected lane does not automatically mean all work everywhere stops.

But no lane may continue through a blocked dependency as if it were resolved.

---

## 11. Allowed lightweight handling

The package may use a lighter workflow only when all of the following are true:

- impact is clearly low,
- no protected area is touched,
- contract assumptions remain unchanged,
- runtime verification remains straightforward,
- and the reason for lighter handling is explicit.

This rule exists to avoid over-processing harmless changes.

It does not authorize skipping guardrails when hidden risk exists.

---

## 12. Clarification guardrails

## 12.1 Clarification is the default when ambiguity matters

If ambiguity materially affects:

- scope,
- acceptance criteria,
- contract interpretation,
- permissions,
- tenancy,
- or runtime behavior,

clarification must happen before planning or implementation proceeds.

## 12.2 Clarification may be waived only explicitly

Clarification may be waived only when:

- the feature is clearly low-risk,
- ambiguity is minor,
- or the work is an exploratory spike.

The waiver reason must be recorded.

## 12.3 Clarification must not be simulated

Agents must not pretend a question was resolved merely because a likely answer exists.

---

## 13. Planning guardrails

A plan must not:

- ignore protected-area impact,
- hide contract changes,
- transform a bounded feature into broad redesign,
- omit major dependencies that are already known,
- or present uncertainty as settled fact.

A plan must explicitly surface:

- likely impacted lanes,
- risks,
- sequencing,
- specialist triggers when needed,
- and runtime/test implications.

---

## 14. Task guardrails

Tasks must not be:

- vague,
- purely aspirational,
- disconnected from stories or slices,
- missing verification work,
- or missing review visibility.

Tasks must make room for:

- implementation,
- QA,
- runtime verification,
- and review.

Task lists must not disguise missing planning.

---

## 15. Implementation guardrails by lane

## 15.1 Common implementation rule

Every implementation lane must remain traceable to a specific approved task or bounded task group.

## 15.2 API lane

API implementation must not:

- broaden backend scope beyond the plan,
- introduce new shared contracts silently,
- change auth/tenant semantics without escalation,
- or make schema-sensitive changes without the required analysis.

## 15.3 Web lane

Web implementation must not:

- invent new contract assumptions,
- shift business enforcement into UI merely for convenience,
- or hide permission or scoping changes inside presentation logic.

## 15.4 Mobile lane

Mobile implementation must not proceed on shared-contract assumptions that have not been checked against the current plan and impact classification.

## 15.5 Job / async lane

Job-related work must not:

- change retry/idempotency semantics casually,
- introduce hidden background behavior,
- or treat async failure modes as optional documentation.

---

## 16. Review guardrails

Review must not be reduced to:

- formatting comments,
- naming preference,
- or superficial correctness.

Review must check, at minimum:

- spec alignment,
- plan alignment,
- scope discipline,
- protected-area safety,
- contract consistency,
- runtime honesty,
- and whether the claimed result is actually reviewable.

Every review must end in:

- `accept`,
- `revise`,
- or `block`.

---

## 17. QA and runtime guardrails

## 17.1 Mandatory honesty about runtime state

The package must distinguish explicitly between:

- code exists,
- build passes,
- app runs,
- feature is locally verifiable,
- feature is sufficiently demonstrated.

## 17.2 No hidden environment blockers

If verification depends on:

- missing credentials,
- unavailable infrastructure,
- manual seeding,
- external provider access,
- or unstable local setup,

that must be stated explicitly.

## 17.3 Manual verification remains first-class

Human manual checks are not a sign of failure.

If manual verification is still required, it must be written clearly rather than implied away.

---

## 18. Uncertainty and confidence guardrails

Recommended labels are:

- `confirmed`
- `partial`
- `uncertain`
- `blocked`

Agents must not omit uncertainty when it materially changes how the result should be interpreted.

Confidence labels are required whenever:

- contract impact is inferred,
- runtime state is incomplete,
- protected-area knowledge is incomplete,
- or review cannot honestly claim full confidence.

---

## 19. Exception guardrails

Exceptions are allowed only explicitly.

Any exception must record:

- the rule being relaxed,
- the reason,
- the scope,
- the duration,
- and the extra review required.

Common cases where exception handling may be valid:

- emergency hotfix,
- exploratory spike,
- temporary local-only experiment,
- staged migration support.

Exceptions must not silently persist after their intended scope ends.

---

## 20. Anti-pattern watchlist

The following patterns should trigger immediate suspicion:

- “This is just UI” while contract behavior is unclear,
- “This is a small tweak” while permissions or scoping are changing,
- “We can just implement and patch the spec later” without explicit governance allowance,
- “The code works locally” without meaningful runtime verification notes,
- “Let’s also clean this up while we’re here”,
- “We only changed one field” on shared schema,
- “This probably won’t affect mobile”,
- “The plan is obvious” when dependencies are unclear.

---

## 21. Relationship to downstream governance documents

This document is intentionally more operational than the constitution and intentionally less feature-specific than project plans.

It should be used to derive:

- routing decisions in `trigger-matrix.md`,
- severity handling in `impact-classes.md`,
- completion expectations in `definition-of-done.md`,
- and role behavior in agent specifications.

Those documents may become more specific, but they must not weaken these guardrails silently.

---

## 22. Current usage rule

Until pilot runs prove otherwise, this document should be applied conservatively.

When uncertain, the package should prefer:

- visible escalation,
- explicit blocker states,
- and narrower delivery scope

over optimistic continuation.

---

## 23. Final stance

These guardrails exist to prevent the package from becoming either:

- a reckless autonomous implementer,
- or a bureaucratic theater machine.

They are meant to keep the system in the narrow zone where progress remains:

- controlled,
- explainable,
- reviewable,
- and usable by a non-programmer operator.
---
## Security and Operational Hygiene

These rules apply to all feature work, including local-only, demo, prototype, and development-environment slices.

They exist because insecure local patterns tend to become long-lived defaults unless they are explicitly blocked.

### 1. Secrets and configuration

- Secrets MUST NOT be hardcoded in application code, Docker Compose files, migrations, seeders, helper scripts, or test fixtures.
- Configuration MUST have one explicit source of truth.
- Application code, scripts, migrations, and seeders MUST consume the same configuration model unless an explicit exception is documented.
- `.env` usage is allowed for local development, but only as an input to the configuration layer, not as a substitute for it.
- Demo scope does NOT justify hardcoded secrets in repository-tracked files.

### 2. Local and demo orchestration

- Local/demo orchestration MUST expose only the minimum services and ports necessary for the intended workflow.
- Backend, database, cache, queue, and other internal services MUST NOT be exposed externally unless the exposure is explicitly required and documented.
- Docker-based local setup MUST include basic operational hygiene when Docker is part of the supported workflow:
  - appropriate `.dockerignore`
  - non-fragile build context structure
  - restart policy when services are expected to survive host restart
  - explicit distinction between internal-only and externally reachable services
- Demo convenience MUST NOT silently weaken repository-default security posture.

### 3. Scripts, migrations, and seeders

- Helper scripts, database init scripts, migrations, and seeders are subject to the same security and configuration rules as application code.
- No helper path may bypass secret handling, configuration discipline, or tenant/security assumptions that apply to the main application.
- If a script is intentionally local-only or temporary, that limitation MUST be explicit in its location, naming, and runtime notes.

### 4. Error handling and runtime honesty

- Fatal internal failures MUST NOT be surfaced as naive string response bodies.
- Error mapping MUST avoid leaking raw infrastructure, schema, or internal exception detail to clients unless explicitly required for a controlled non-production path.
- Runtime notes MUST state when a path is only demo-safe, partially verified, or intentionally insecure for short-lived local use.
- “Demo” or “local” does NOT permit misleading claims such as “works” when the runtime path is fragile, manually patched, or operationally unsafe.

### 5. Implementation hygiene

- Repository-tracked code SHOULD avoid unnecessary repetition when the repetition increases configuration drift or security inconsistency.
- Local import shortcuts, ad hoc config access, and one-off environment handling SHOULD be normalized early when they affect reliability or safety.
- For small applications, implementation shape SHOULD remain proportionate; complexity that increases operational risk without delivery value should be reduced rather than normalized.

### 6. Escalation rule

If a change introduces or preserves any of the following, it must be treated as a visible delivery concern rather than a hidden local shortcut:
- hardcoded secrets
- externally exposed internal services
- inconsistent config loading paths
- unsafe error disclosure
- fragile orchestration assumptions
- script-only bypasses of normal safety rules

Such cases require one of:
- correction in the current slice,
- an explicit limitation record,
- or a documented exception with scope and duration.
