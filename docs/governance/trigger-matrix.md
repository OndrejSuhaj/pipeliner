# Trigger Matrix

## 1. Purpose

This document defines how the package routes work to modes, roles, gates, and specialist lanes.

Its purpose is to answer five practical questions:

1. which operating mode should be used,
2. which roles are always required,
3. which roles are triggered only under certain conditions,
4. when work must escalate into a stricter handling path,
5. and when work must stop instead of continuing optimistically.

This document is an operational routing layer.

It does not redefine the constitution, protected areas, impact classes, or definition of done. It consumes them.

---

## 2. Relationship to other governance artifacts

This matrix depends on:

- `constitution.md`
- `guardrails.md`
- `impact-classes.md`
- `definition-of-done.md`
- `mode-c.md` when Mode C is active
- `mode-m.md` when Mode M is active
- `mode-p.md` when Mode P is active
- `local-tooling-contract.md` when local tooling is used

Priority order remains:

1. `constitution.md`
2. `guardrails.md`
3. `impact-classes.md`
4. `trigger-matrix.md`
5. `definition-of-done.md`
6. `mode-c.md` when Mode C is active
7. `mode-m.md` when Mode M is active
8. `mode-p.md` when Mode P is active
9. `local-tooling-contract.md` when local tooling is used
10. program-level artifacts (`docs/program/*`)
11. module-level artifacts (`specs/<module>/{module-brief,module-plan,slice-map,…}.md`)
12. slice-level feature artifacts
13. agent instructions

If this matrix suggests a route that would weaken a higher-level rule, the higher-level rule wins.

---

## 3. Routing principles

### 3.1 Minimal sufficient routing

Only the roles and gates needed for safe work should be activated.

The package must avoid:

- always-running every specialist,
- routing by habit,
- triggering baseline roles (P1/M1a) for ordinary work,
- or turning comment intake into hidden delivery work.

### 3.2 Highest risk wins

If multiple triggers apply, the stricter route wins.

Example:
- work looks like a web-only change,
- but also changes shared contract,
- therefore shared-contract routing wins.

### 3.3 Trigger by effect, not wording

A request described as “small”, “UI-only”, “quick fix”, or “doc-only” must still be routed by actual effect.

### 3.4 Escalate on uncertainty

If routing depends on unresolved facts, prefer:

- clarification,
- specialist activation,
- stricter mode selection,
- or blocked state

over optimistic under-routing.

### 3.5 Comments are input, not authority

When the starting point is a selected issue/comment, route first by what the comment implies, not by the fact that the comment exists.

A comment may imply:
- documentation correction,
- open question,
- existing slice extension,
- new slice candidate,
- or rejection.

It must not automatically become a new feature slice.

---

## 4. Mode selection matrix

The repository distinguishes four operating modes (Mode A was eliminated in v2.0.0; its responsibilities are absorbed by Mode P Gate P1 at program scope and Mode M Gate M1a at module scope).

### 4.0 Mode P — Program Bootstrap

Use when:
- a new project is being established within this framework,
- program-level scope, architectural overview, or module decomposition must be declared,
- program-wide baseline trust (terminology, source authority, conflicts) needs establishment or repair,
- existing program requires structural re-framing (new module, split, scope rewrite).

Primary intent:
- declare program-level artifacts in `docs/program/`,
- establish program-wide baseline at Gate P1 (absorbed from pre-v2.0.0 Mode A),
- author project-level IA at Gate P-UX (when user-facing),
- decompose the program into bounded modules,
- enable downstream Mode M per module.

### 4.2 Mode B — Feature Delivery (default)

Use when:
- the work is a normal bounded feature,
- implementation may be needed,
- delivery artifacts must be produced,
- and the scope is ready for spec → plan → tasks → implement → QA/runtime → review.

Primary intent:
- deliver a bounded feature safely.

### 4.3 Mode C — Comment Intake / Documentation Amendment / Slice Seeding

Use when:
- the operator explicitly selects an issue/comment,
- the starting point is annotation/review feedback rather than a clean delivery request,
- upstream documentation may need amendment first,
- and the result may later seed Mode B work.

Primary intent:
- normalize a selected issue/comment,
- amend upstream documentation,
- prepare a future Mode B / Mode M handoff if justified.

### 4.4 Mode M — Module Orchestration

Use when:
- a new module declared in `module-map.md` is being established,
- a module needs re-framing before further slice delivery,
- multiple roles (analyst, UX, architect, BE, FE) will operate in parallel on the same module,
- a module nears release and requires release-readiness verification.

Primary intent:
- declare the module as a bounded delivery stream,
- establish module-scope baseline trust (Gate M1a — absorbed from pre-v2.0.0 Mode A module-level scope, now owned by `agents/modules/Module{Corpus,Terminology,Conflict}*` roles),
- coordinate analytical, UX, and architectural inputs into a coherent module-level plan,
- author module-scope canonical content in `_ar/`,
- author a slice map enabling parallel Mode B delivery,
- verify module-release readiness.

---

## 5. Mode routing rules

| Situation | Route |
|---|---|
| New project being established within the framework | Mode P |
| Existing program requires structural re-framing | Mode P (through Gate P-R) |
| Program-wide baseline weak / unclear authority / terminology conflict across the program | Mode P Gate P1 (refresh) |
| New module being declared from `module-map.md` | Mode M |
| Module needs module-scope baseline trust | Mode M Gate M1a |
| Module nearing release / module re-framing | Mode M |
| Slice exists in `slice-map.md` and prerequisites are claimed met | Mode B (entering through Gate B0) |
| Normal bounded feature request | Mode B |
| Operator-selected issue/comment requiring controlled follow-up | Mode C |
| Comment already normalized into a bounded approved feature request | Mode B (through Gate B0) |
| Comment challenges module-level artifact | Mode C → Mode M |
| Comment challenges program-level artifact | Mode C → Mode P (through Gate P-R) |
| Comment reveals program-wide baseline collapse | Mode P Gate P1 (refresh) or block until clarified |
| Comment reveals module-scope baseline collapse | Mode M Gate M1a (refresh) or block until clarified |
| "Just update docs" but documentation layer is unclear | Mode C first |
| Slice-readiness check fails | back to Mode M (M1 / M2 / M3 depending on missing prerequisite) |

### 5.1 Mode override rules

- Do not use Mode B when the real starting point is a selected issue/comment that challenges upstream truth.
- Do not use Mode C to bypass normal feature delivery once the work has become a real feature.
- Do not invoke baseline gates (P1 / M1a) merely because "more context would be nice."
- Do not use Mode M when the work is genuinely program-level (escalate to Mode P).
- Do not use Mode P for routine planning — re-runs require Gate P-R structural rationale.
- Do not enter Mode B without Gate B0 pass — return to Mode M instead.

---

## 6. Role categories

This package distinguishes eight categories:

### 6.1 Mandatory default roles for Mode B
Used in normal feature delivery unless explicitly waived by valid lightweight handling.

### 6.2 Mode C issue roles
Used only in comment intake / documentation amendment / slice seeding work.

### 6.3 Triggered specialist roles
Activated only when specific impact conditions exist.

### 6.4 Implementation lanes
Activated when actual code work is in scope.

### 6.5 Baseline roles (formerly Mode A onboarding — deprecated in v2.0.0)
Pre-v2.0.0 framework had `agents/onboarding/*` for repository onboarding under Mode A. v2.0.0 retires Mode A and splits these duties:
- **Program-wide baseline** → `agents/program/Program{Corpus,Terminology,Conflict}*` (Mode P Gate P1)
- **Module-scope baseline** → `agents/modules/Module{Corpus,Terminology,Conflict}*` (Mode M Gate M1a)

### 6.6 Program-level roles (`agents/program/**`)
Used only in Mode P program bootstrap, re-frame, and program-wide baseline (Gate P1).

### 6.7 Module-level orchestration roles (`agents/modules/**`)
Used only in Mode M module declaration, framing, planning, module-scope baseline (Gate M1a), and release readiness.

### 6.8 UX canonical roles (`agents/ux/**`)
Used in Mode P Gate P-UX (IAAuthor) and Mode M Gate M2 / M3 (WireframeAuthor, ComponentSpecAuthor, CopySpecAuthor).

---

## 7. Mandatory default roles for Mode B

The following roles are the default core for normal feature delivery, starting with the new Gate B0 slice-readiness check:

- `SliceReadinessVerifier` (Gate B0, before constitution check — read-only, returns pass/fail per §17.3 constitution)
- `ConstitutionGuard`
- `FeatureSpecifier`
- `PlanAuthor`
- `TaskDecomposer`
- `QAVerifier`
- `RuntimeVerifier`
- `IndependentReviewer`

If Gate B0 fails, Mode B does not proceed. The slice returns to Mode M (M1 / M2 / M3 depending on missing prerequisite).

### 7.1 Conditionally default role

`ClarificationDriver` is default whenever ambiguity materially affects:
- scope,
- acceptance criteria,
- contract interpretation,
- permissions,
- tenancy,
- runtime expectations,
- or safe implementation.

It may be waived only when low-risk handling is justified explicitly.

---

## 8. Mode C issue roles (`agents/issues/**`)

The following roles belong to comment intake and documentation amendment work.

### 8.1 CommentIntakeGuard

Trigger when:
- the operator selected an issue/comment,
- a comment must be normalized,
- or a comment must be classified into controlled follow-up categories.

Primary outputs:
- `comment-intake.md`
- initial classification
- provisional impact seed

### 8.2 CanonicalLayerResolver

Trigger when:
- the issue/comment challenges or extends upstream documentation,
- the correct canonical documentation layer must be identified before writing.

Primary outputs:
- primary resolved layer
- secondary affected layers if any

### 8.3 DocumentationAmendmentAuthor

Trigger when:
- upstream documentation must be amended or created,
- and the correct layer has already been resolved.

Primary outputs:
- `source-amendment.md` or equivalent amendment artifact
- correction note / amendment draft / new draft document
- visible uncertainty when needed

### 8.4 SliceSeedAuthor

Trigger when:
- Mode C result should attach to an existing slice,
- or justify a new future slice candidate.

Primary outputs:
- `slice-seed.md`
- `mode-b-handoff.md`

### 8.5 Conditional issue roles

#### ToolingRuleResolver
Trigger when exact layer-specific authoring rules are needed from `toolingDocs/`.

#### ToolingTemplateResolver
Trigger when exact layer-specific authoring templates are needed from `toolingTemplates/`.

#### ClarificationSeeder
Trigger when ambiguity materially blocks safe intake or documentation amendment.

#### ConflictMapperLite
Trigger when current sources materially conflict and the conflict must be surfaced before safe amendment.

---

## 9. Triggered specialist roles

The following roles are activated only when the stated trigger conditions apply.

### 9.1 SchemaSteward

Trigger when any of the following is true:
- GraphQL schema changes,
- shared types change,
- response or mutation shape changes,
- a feature needs new contract surface,
- a feature introduces new projection assumptions,
- a supposedly UI-only or doc-only request has unclear contract consequences.

Do not trigger only when:
- UI uses existing fields and behavior,
- no shared contract assumption changes,
- and the plan confirms no schema-sensitive impact.

### 9.2 AclPlanner

Trigger when any of the following is true:
- roles change,
- grants change,
- visibility rules change,
- permission semantics change,
- access scope changes,
- tenant or company context changes who can do what.

### 9.3 QueryPlanner

Trigger when any of the following is true:
- list/detail query semantics change,
- dashboard semantics change,
- filters or grouping change,
- derived outputs change,
- exports or reporting behavior change,
- a read-side feature is not fully covered by existing contract understanding.

### 9.4 JobPlanner

Trigger when any of the following is true:
- async jobs are added or changed,
- scheduler or queue behavior changes,
- retry or idempotency behavior changes,
- import/export flow is introduced or changed,
- background processing becomes part of feature correctness.

### 9.5 MobileImplementer

Trigger when any of the following is true:
- mobile is directly in scope,
- shared contract changes may affect mobile,
- cross-client consistency matters,
- plan or impact classification marks mobile as impacted.

---

## 10. Implementation lanes

Implementation lanes are not triggered merely because a role exists.
They are triggered only when approved tasks require code work in that lane.

### 10.1 ApiImplementer

Trigger when:
- backend/API work is explicitly in scope,
- resolvers, services, orchestration, validation, persistence, or serving are required,
- or the plan identifies backend delivery tasks.

### 10.2 WebImplementer

Trigger when:
- web UI behavior is in scope,
- components, pages, forms, interaction logic, or data consumption changes are required,
- or the plan identifies web delivery tasks.

### 10.3 MobileImplementer

Trigger when:
- mobile tasks exist,
- mobile consumes changed shared contract,
- or feature behavior must be implemented or verified in mobile.

### 10.4 Mode rule for implementation lanes

Implementation lanes belong to Mode B.
Mode C must not open implementation lanes.

---

## 11. Baseline roles (Mode P Gate P1 + Mode M Gate M1a)

Pre-v2.0.0 had `agents/onboarding/*` shared between Mode A (repo scope) and Mode M (module scope). In v2.0.0 Mode A is eliminated and these duties are split into two parallel role families:

**Program-wide baseline (`agents/program/**`)** — invoked by Mode P Gate P1:
- `ProgramCorpusCurator` (was `CorpusCurator` at repo scope)
- `ProgramTerminologyResolver` (was `TerminologyResolver` at repo scope)
- `ProgramConflictMapper` (was `ConflictMapper` at repo scope)
- `ArchitectureOverviewAuthor` (was `ArchitectureBaselineMapper`, refocused on program-level)

**Module-scope baseline (`agents/modules/**`)** — invoked by Mode M Gate M1a:
- `ModuleCorpusCurator`
- `ModuleTerminologyResolver`
- `ModuleConflictMapper`

Trigger program-wide baseline roles when:
- Mode P Gate P1 is being executed (initial program bootstrap),
- program-wide terminology, source authority, or canonical conflicts need re-establishment.

Trigger module-scope baseline roles when:
- Mode M Gate M1a is being executed (per-module),
- module-scope terminology refinements, source authority, or conflicts need resolution within a module.

They must not be activated for ordinary feature work just because more context would be nice to have.

## 11.5 Program-level roles (`agents/program/**`)

The following roles belong only to Mode P program bootstrap and re-frame work.

### `ProgramBootstrapper`

Trigger when:
- Gate P-R is being authorized (re-frame variant),
- Gate P0 is being executed (program declaration).

Primary outputs:
- `docs/program/re-frame-authorization.md` (when re-framing)
- `docs/program/project-brief.md`

### `ArchitectureOverviewAuthor`

Trigger when:
- Gate P1 is being executed (program-level architecture overview).

Primary outputs:
- `docs/program/architecture-overview.md`

### `ModuleMapAuthor`

Trigger when:
- Gate P2 is being executed (module decomposition).

Primary outputs:
- `docs/program/module-map.md`

### `ImplementationStreamsAuthor`

Trigger only when:
- Gate P3 is being executed (parallel delivery coordination model is non-trivial).

Primary outputs:
- `docs/program/implementation-streams.md`

## 11.6 Module-level orchestration roles (`agents/modules/**`)

The following roles belong only to Mode M module declaration, framing, planning, and release readiness work.

### `ModuleFramer`

Trigger when:
- Gate M0 is being executed (module declaration),
- Gate M1b is being executed (module framing — module-brief + initial analysis).

Primary outputs:
- `specs/<module>/module-brief.md`
- coordination of analytical role calls for EN/BR/ES/ARCH at module level

### `ModulePlanAuthor`

Trigger when:
- Gate M3 architecture component is being executed.

Primary outputs:
- `specs/<module>/module-plan.md`

### `SliceMapAuthor`

Trigger when:
- Gate M3 slice map component is being executed.

Primary outputs:
- `specs/<module>/slice-map.md` (with §17.3 slice-readiness prerequisites per slice)

### `ModuleStagingVerifier`

Trigger when:
- Gate M4 is being executed (module release readiness).

Primary outputs:
- `specs/<module>/module-staging-readiness.md`

### `ModuleRiskAuditor`

Trigger cross-cutting at M1, M3, M4.

Primary outputs:
- `specs/<module>/module-risks.md` (initial draft, refresh, final state)

## 11.7 UX canonical roles (`agents/ux/**`)

The following roles authorize content for IA, WIRE, COMP, COPY canonical layers introduced in Batch 1.

### `IAAuthor`

Trigger when:
- Gate M2 needs information-architecture authoring.

Primary outputs:
- `specs/<module>/ux/ia.md` (canonical IA layer)

### `WireframeAuthor`

Trigger when:
- Gate M2 needs screen-level layout and interaction spec.

Primary outputs:
- `specs/<module>/ux/wireframes.md` (canonical WIRE layer)

### `ComponentSpecAuthor`

Trigger only when:
- Gate M3 declares a module-level reusable component vocabulary.

Primary outputs:
- `specs/<module>/ux/components.md` (canonical COMP layer)

### `CopySpecAuthor`

Trigger only when:
- Gate M3 declares non-trivial module-level text content.

Primary outputs:
- `specs/<module>/ux/copy.md` (canonical COPY layer)

Note: rules and templates for IA, WIRE, COMP, COPY layers arrive in Batch 4 of the foundation amendment. Until then, the canonical layers are registered but their authoring rules are pending.

---

## 12. Gate routing matrix — Mode P Gate P1 (program-wide baseline)

Primary question:
- is the program-wide baseline trustworthy enough for downstream module work?

Trigger in:
- Mode P bootstrap (initial run),
- Mode P re-frame when program-wide terminology, source authority, or conflicts need re-establishment.

Typical roles:
- `ProgramCorpusCurator`
- `ProgramConflictMapper`
- `ProgramTerminologyResolver`
- `ArchitectureOverviewAuthor`

Output expectation:
- program-wide baseline trust decision,
- program-wide source authority map,
- program-wide conflict visibility,
- foundational `_ar/BA/{EN,ARCH,BR}/` seeds,
- `_REGISTRY.md` skeletons initialized.

(Pre-v2.0.0 frameworks had a separate Mode A Gate 0 for this. v2.0.0 absorbed it into Mode P Gate P1.)

---

## 13. Gate routing matrix — Mode B

## 13.0 Gate B0 — Slice Readiness Gate

Mandatory for every Mode B run. First step in the sequence, before the constitution check.

Primary role:
- `SliceReadinessVerifier` (read-only, model haiku)

Reads from:
- `specs/<module>/slice-map.md` (slice prerequisites recorded by Mode M Gate M3)
- `specs/<module>/module-brief.md` (for module context)
- relevant analytical and UX artifacts referenced by the slice prerequisites

Output expectation:
- pass/fail verdict against §17.3 slice-ready done criteria:
  1. analytical inputs are sufficient,
  2. UX inputs are sufficient,
  3. technical dependencies on core and other modules are explicit and resolved,
  4. scope fits within slice sizing discipline,
  5. acceptance criterion is single and user-observable,
  6. assigned implementer lane(s) are clear.

Stop if:
- the slice is not in `slice-map.md`,
- any of the six prerequisites fails (route back to Mode M).

## 13.1 Gate 1 — Constitution Gate

Mandatory for normal feature delivery.

Primary role:
- `ConstitutionGuard`

Output expectation:
- impact classification seed,
- protected-area visibility,
- escalation or lightweight handling decision.

## 13.2 Gate 2 — Specification Gate

Primary roles:
- `FeatureSpecifier`
- `ClarificationDriver` when ambiguity matters

Output expectation:
- feature scope,
- acceptance criteria,
- out-of-scope,
- open questions if needed.

## 13.3 Gate 3 — Planning Gate

Primary roles:
- `PlanAuthor`
- `ClarificationDriver` if plan is blocked by unresolved ambiguity

Output expectation:
- implementation shape,
- impacted lanes,
- risk notes,
- specialist triggers.

## 13.4 Gate 4 — Contract / Specialist Gate

Triggered only when required.

Possible roles:
- `SchemaSteward`
- `AclPlanner`
- `QueryPlanner`
- `JobPlanner`

Output expectation:
- specialist notes,
- explicit downstream consequences,
- blocker detection when needed.

## 13.5 Gate 5 — Task Gate

Primary role:
- `TaskDecomposer`

Output expectation:
- bounded tasks,
- visible dependencies,
- explicit QA/runtime/review tasks.

## 13.6 Gate 6 — Implementation Gate

Triggered lanes:
- `ApiImplementer`
- `WebImplementer`
- `MobileImplementer` when applicable

Output expectation:
- scoped implementation only.

## 13.7 Gate 7 — QA / Runtime Gate

Primary roles:
- `QAVerifier`
- `RuntimeVerifier`

Output expectation:
- QA checklist,
- runtime notes,
- known limits and blockers.

## 13.8 Gate 8 — Review Gate

Primary role:
- `IndependentReviewer`

Output expectation:
- explicit verdict: `accept`, `revise`, or `block`.

---

## 14. Gate routing matrix — Mode C

## 14.1 Gate C0 — Operator Selection

Primary question:
- what exact selected issue/comment is in scope?

Typical inputs:
- annotation/comment id,
- comment body,
- target type,
- route id,
- doc id,
- passage anchor,
- operator intent.

Output expectation:
- one bounded intake target,
- stable context,
- short problem statement.

Stop if:
- no explicit selected issue/comment exists,
- context is too vague,
- or the run would process “all comments” as one undifferentiated input.

## 14.2 Gate C1 — Intake Classification

Primary role:
- `CommentIntakeGuard`

Output expectation:
- `comment-intake.md`
- normalized issue summary
- provisional classification:
  - doc fix only
  - open question
  - existing slice extension
  - new slice candidate
  - reject

## 14.3 Gate C2 — Canonical Layer Resolution

Primary role:
- `CanonicalLayerResolver`

Output expectation:
- primary canonical layer,
- secondary affected layers when relevant.

Stop if:
- no safe primary layer can be determined,
- or multiple layers conflict materially.

## 14.4 Gate C2.5 — Tooling Resolution

Triggered only when exact layer-specific authoring support is needed.

Possible roles:
- `ToolingRuleResolver`
- `ToolingTemplateResolver`

Allowed reads:
- exact-file lookup only after canonical layer resolution

Examples:
- `toolingDocs/rules-EN.md`
- `toolingTemplates/template-EN.md`

Forbidden:
- broad scanning of `toolingDocs/`
- broad scanning of `toolingTemplates/`
- using local tooling as authority
- reading multiple layer files “just in case”

Output expectation:
- exact rules/template support for the resolved layer
- or explicit fallback / blocked state

## 14.5 Gate C3 — Documentation Amendment

Primary role:
- `DocumentationAmendmentAuthor`

Output expectation:
- `source-amendment.md` or equivalent amendment artifact
- corrected or newly drafted upstream documentation
- visible open questions when needed
- correction-note / clarification-amendment → expected result is canonical document updated
- new-draft-artifact → expected result is new canonical draft created
conflict-note → expected result is no canonical update yet, conflict explicitly surfaced

Stop if:
- evidence is too weak,
- protected-area implications are being hand-waved,
- canonical target exists, amendment is actionable, but canonical file was not updated
- or amendment would require unsupported claims.

## 14.6 Gate C4 — Slice Seeding / Handoff

Triggered only when the Mode C result justifies future delivery work.

Primary role:
- `SliceSeedAuthor`

Output expectation:
- `slice-seed.md`
- `mode-b-handoff.md`
- explicit recommendation:
  - attach to existing slice
  - start Mode B Gate 1–3 only
  - start Mode B Gate 1–5 only
  - hold until ambiguity is resolved

---

## 14.5 Gate routing matrix — Mode M

### 14.5.0 Gate M0 — Module Declaration

Primary question:
- which module from `module-map.md` is being framed, and is its scope confirmed?

Primary role:
- `ModuleFramer`

Typical inputs:
- module slug from `docs/program/module-map.md`
- operator confirmation of module scope
- program-wide baseline from Mode P Gate P1 (foundational `_ar/BA/` seeds)

Output expectation:
- `specs/<module>/module-brief.md` § Declaration section
- module-id, scope summary, dependencies, integration boundaries

Stop if:
- the module is not in `module-map.md` (run Mode P first),
- `module-map.md` does not exist,
- program-wide baseline (Mode P Gate P1) is missing or incomplete.

### 14.5.1 Gate M1a — Module Baseline

Primary roles (module scope, from `agents/modules/**`):
- `ModuleCorpusCurator`
- `ModuleTerminologyResolver`
- `ModuleConflictMapper`

Output expectation:
- module-scope refinement notes embedded in `specs/<module>/module-brief.md` § Baseline section
- module-scope EN/BR seed authoring in `_ar/BA/{EN,BR}/` with `modules:` frontmatter
- module-scope conflicts surfaced as open questions in affected `_ar/` docs or as risk entries in `module-risks.md`
- `_REGISTRY.md` updates for each touched canonical layer

Stop if:
- module-scope `_ar/` content cannot be safely authored,
- module-scope conflicts cannot be resolved without program-wide refresh (escalate to Mode P).

### 14.5.2 Gate M1b — Module Framing

Primary role:
- `ModuleFramer` + analytical role calls (EN/BR/ES/ARCH authors from `agents/core/` and `agents/optional/`)

Output expectation:
- `specs/<module>/module-brief.md` (full sections)
- `specs/<module>/analysis/EN/*`, `analysis/BR/*`, `analysis/ES/*`, `analysis/ARCH/*` as relevant

Stop if:
- central entities conflict with existing EN in neighboring modules,
- ARCH rámec conflicts with `docs/program/architecture-overview.md`.

### 14.5.3 Gate M2 — Behavior & UX Framing

Primary roles:
- `IAAuthor` and `WireframeAuthor` (from `agents/ux/**`)
- analytical role calls (UC, QUERY, JOB, CS authors)

Output expectation:
- `specs/<module>/ux/ia.md` (canonical IA layer)
- `specs/<module>/ux/wireframes.md` (canonical WIRE layer)
- `specs/<module>/analysis/UC/*`, `analysis/QUERY/*`, `analysis/JOB/*`, `analysis/CS/*` as relevant

Stop if:
- IA has no link to UC,
- wireframe shows element without data or function backing in analysis.

### 14.5.4 Gate M3 — Module Architecture & Slice Map

Primary roles:
- `ModulePlanAuthor`
- `SliceMapAuthor`
- `ModuleRiskAuditor`
- `ComponentSpecAuthor` (when relevant)
- `CopySpecAuthor` (when relevant)

Output expectation:
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md` (with §17.3 prerequisites per slice)
- `specs/<module>/module-risks.md`
- `specs/<module>/ux/components.md` (when module has reusable components)
- `specs/<module>/ux/copy.md` (when module has non-trivial text content)

Stop if:
- slice map violates slice sizing discipline without split decomposition,
- protected-area decisions are pre-empted without specialist analysis,
- dependency cycle exists in slice map.

### 14.5.5 Gate M4 — Module Release Readiness

Primary roles:
- `ModuleStagingVerifier`
- `ModuleRiskAuditor`

Output expectation:
- `specs/<module>/module-staging-readiness.md`
- updated `slice-map.md` with final slice statuses
- updated `module-risks.md` with remaining open risks
- explicit release recommendation: `release` | `defer` | `block`

Stop if:
- any slice is `in-progress`,
- cross-module integration reveals contract conflict,
- staging verification is unreachable.

## 14.6 Gate routing matrix — Mode P

### 14.6.0 Gate P-R — Re-frame Authorization

Triggered only when `docs/program/project-brief.md` already exists and Mode P is being re-invoked.

Primary role:
- `ProgramBootstrapper`

Output expectation:
- `docs/program/re-frame-authorization.md`
- explicit re-frame rationale, affected artifacts, downstream module impact, operator authorization

Stop if:
- operator did not explicitly confirm re-frame intent,
- re-frame would silently invalidate existing module work,
- rationale is vague ("update", "refresh", "cleanup" without specifics).

### 14.6.1 Gate P0 — Program Declaration

Primary role:
- `ProgramBootstrapper`

Output expectation:
- `docs/program/project-brief.md` (new) or amended (re-frame variant)
- program name, business purpose, scope, key constraints, success criteria, risks

Stop if:
- business purpose cannot be stated clearly,
- scope boundary is undefined.

### 14.6.2 Gate P1 — Architecture Overview

Primary role:
- `ArchitectureOverviewAuthor`

Output expectation:
- `docs/program/architecture-overview.md`
- architectural style, external systems, integration boundaries, non-functional constraints, ADR-style decisions

Stop if:
- architectural style is undecided,
- external system boundaries are vague,
- non-functional requirements are unspecified for protected-area-sensitive systems.

### 14.6.3 Gate P2 — Module Decomposition

Primary role:
- `ModuleMapAuthor`

Output expectation:
- `docs/program/module-map.md`
- list of modules with slugs, scope summaries, dependencies, integration boundaries, ownership, entry sequence
- (re-frame variant) explicit list of modules added/removed/split/merged/scope-changed

Stop if:
- modules have overlapping or undefined scope,
- dependency graph has cycles,
- integration boundaries are unresolved.

### 14.6.4 Gate P3 — Implementation Streams (optional)

Triggered only when parallel delivery is non-trivial.

Primary role:
- `ImplementationStreamsAuthor`

Output expectation:
- `docs/program/implementation-streams.md`
- stream identifiers, parallelism model, cross-stream integration, shared resource constraints

Stop if:
- parallelism model is incoherent with module dependency graph.

---

## 15. Routing by impact class

## 15.1 IC0 — Documentation / non-executable support change

Default route:
- `ConstitutionGuard` for Mode B doc work,
- or Mode C issue flow when starting from a selected issue/comment,
- lightweight documentation handling may apply

Usually not required:
- implementation lanes,
- specialist roles

Escalate if:
- runtime, contract, ACL, QUERY, JOB, schema, or architecture effect is discovered.

## 15.2 IC1 — Local presentation change

Default route:
- `ConstitutionGuard`
- `FeatureSpecifier`
- `PlanAuthor`
- `TaskDecomposer`
- `WebImplementer`
- `QAVerifier`
- `RuntimeVerifier`
- `IndependentReviewer`

Optional:
- `ClarificationDriver`

Escalate if:
- contract, permission, or tenant impact becomes visible.

## 15.3 IC2 — Bounded feature change without protected-area impact

Default route:
- `ConstitutionGuard`
- `FeatureSpecifier`
- `ClarificationDriver`
- `PlanAuthor`
- `TaskDecomposer`
- relevant implementation lanes
- `QAVerifier`
- `RuntimeVerifier`
- `IndependentReviewer`

Optional triggered specialists:
- `QueryPlanner`
- `JobPlanner`

Escalate if:
- feature turns out to affect shared contract or protected area.

## 15.4 IC3 — Contract or shared-behavior change

Default route:
- `ConstitutionGuard`
- `FeatureSpecifier`
- `ClarificationDriver`
- `PlanAuthor`
- `SchemaSteward`
- `TaskDecomposer`
- relevant implementation lanes
- `QAVerifier`
- `RuntimeVerifier`
- `IndependentReviewer`

Additional specialists when relevant:
- `QueryPlanner`
- `AclPlanner`
- `MobileImplementer`

Escalate if:
- protected-area implications become material.

## 15.5 IC4 — Protected-area or cross-boundary change

Default route:
- `ConstitutionGuard`
- `FeatureSpecifier`
- `ClarificationDriver`
- `PlanAuthor`
- all relevant specialist roles by affected area
- `TaskDecomposer`
- relevant implementation lanes only after required analysis exists
- `QAVerifier`
- `RuntimeVerifier`
- `IndependentReviewer`

Likely specialists:
- `SchemaSteward`
- `AclPlanner`
- `QueryPlanner`
- `JobPlanner`
- `MobileImplementer`

Additional expectation:
- visible escalation note,
- higher scrutiny,
- more frequent block outcomes if uncertainty remains.

## 15.6 IC5 — Strategic / architecture-sensitive change

Default route:
- `ConstitutionGuard`
- `FeatureSpecifier`
- `ClarificationDriver`
- `PlanAuthor`
- escalation to architecture/governance handling

Normal implementation lanes should not proceed until the change is decomposed into safer lower-impact work.

---

## 16. Routing by signal

The following signal-based routing rules supplement class-based routing.

| Signal | Route / Trigger |
|---|---|
| New project being established | Mode P + `ProgramBootstrapper` |
| Existing program needs structural change | Mode P Gate P-R + `ProgramBootstrapper` |
| New module declared in `module-map.md` | Mode M + `ModuleFramer` |
| Module needs baseline trust | Mode M Gate M1a + `Module{Corpus,Terminology,Conflict}*` roles |
| Project needs IA / screen map | Mode P Gate P-UX + `IAAuthor` |
| Module needs wireframe authoring | Mode M Gate M2 + `WireframeAuthor` |
| Module needs reusable component vocabulary | Mode M Gate M3 + `ComponentSpecAuthor` |
| Module needs UX copy authoring | Mode M Gate M3 + `CopySpecAuthor` |
| Module nearing release | Mode M Gate M4 + `ModuleStagingVerifier` |
| Slice prerequisites need verification | Mode B Gate B0 + `SliceReadinessVerifier` |
| Slice-readiness fails | back to Mode M (M1 / M2 / M3 depending on missing prerequisite) |
| Selected issue/comment requiring controlled follow-up | Mode C |
| Comment challenges upstream documentation truth | Mode C + `CanonicalLayerResolver` |
| Comment challenges module-level artifact | Mode C → Mode M |
| Comment challenges program-level artifact | Mode C → Mode P Gate P-R |
| Comment needs exact layer rules/template | Mode C + tooling resolvers |
| New or changed GraphQL field / type / mutation / query | `SchemaSteward` |
| New role, grant, visibility rule, or permission condition | `AclPlanner` |
| New list/detail/report semantics or export logic | `QueryPlanner` |
| New queue, retry rule, import/export, scheduler, background correctness | `JobPlanner` |
| Mobile scope or cross-client shared-contract consequence | `MobileImplementer` |
| Ambiguity that affects planning, safe execution, or safe amendment | clarification role |
| Baseline conflict or unclear source authority (program scope) | Mode P Gate P1 + `Program{Corpus,Terminology,Conflict}*` roles |
| Baseline conflict or unclear source authority (module scope) | Mode M Gate M1a + `Module{Corpus,Terminology,Conflict}*` roles |

---

## 17. Comment retrieval and intake routing

Operator-selected comments may come from:
- annotation layer UI,
- markdown viewer context,
- or direct retrieval from the application database (when the project ships an annotation feature with persisted comments).

Generic retrieval pattern (project-agnostic):
- the project's comment store exposes rows for operator selection,
- columns typically include:
  - identifier
  - target type / route / document anchor
  - body
  - status
  - author
  - timestamp
- the project's CLAUDE.md or `mode-c.md` overlay declares the exact retrieval command (e.g. SQL query, API call, or annotation export).

Routing rules:
- the retrieval mechanism is project-specific; routing into Mode C is framework-level,
- direct database retrieval still routes to Mode C when controlled follow-up is required,
- one Mode C run must bind itself to one explicit selected comment row or one explicitly bounded filtered set,
- do not process "all comments" as one backlog blob.

### 17.1 Module-aware comment routing

When the project has multiple modules (declared in `docs/program/module-map.md`):
- the comment must be attributable to one module (via the comment's anchor — route, doc-id, or explicit module reference),
- Mode C routes the resulting amendment to the correct module's `specs/<module>/` tree when applicable,
- if the comment challenges a program-level artifact (`docs/program/*`), Mode C escalates to Mode P Gate P-R,
- if the comment challenges a module-level artifact (`specs/<module>/module-brief.md`, `module-plan.md`, etc.), Mode C escalates to Mode M for amendment,
- if the comment seeds a new slice, the slice-seed lands in the target module's `slice-map.md` (Mode M Gate M3 refresh).

Important distinction:
- comment record status in the application is not the same as Mode C outcome classification.

Example:
- application comment status may be `open`, `resolved`, or `wontfix`
- Mode C outcome may still be `recorded_as_open_question` or `promote_to_new_slice_candidate`

Do not silently collapse one into the other.

---

## 18. Lightweight handling matrix

A lighter route is allowed only when all of the following are true:
- impact is clearly IC0 or IC1,
- no protected area is touched,
- no shared contract ambiguity exists,
- runtime verification is straightforward,
- and the lighter handling reason is written down.

In lightweight mode, the package may simplify:
- clarification,
- planning depth,
- review overhead,
- or documentation depth.

It may not bypass:
- constitution check,
- scope discipline,
- honesty about uncertainty,
- runtime note quality,
- or canonical layer resolution when upstream docs are being amended.

---

## 19. Escalation matrix

Escalate when any of the following occurs:

| Situation | Escalation consequence |
|---|---|
| Protected area touched | activate relevant specialist route |
| Missing critical artifact | stop affected work |
| Contract ambiguity | trigger `SchemaSteward` or block |
| Feature too large | reclassify or split |
| Cross-client risk | trigger mobile-aware route |
| Artifact contradiction | clarification or block |
| Runtime unverifiable | hold confident completion claim |
| Architecture drift signal | escalate from delivery to governance handling |
| Canonical documentation layer unresolved | clarification or block |
| Tooling support required but unavailable | fallback or block |
| Comment intake becoming hidden feature delivery | stop and hand off explicitly to Mode B |
| Slice-readiness check fails (Gate B0) | route back to Mode M (M1 / M2 / M3 depending on missing prerequisite) |
| Module work reveals program-level structural issue | escalate to Mode P Gate P-R |
| Module work reveals program-wide baseline collapse | escalate to Mode P Gate P1 (refresh) |
| Mode P re-run without explicit structural rationale | block until Gate P-R authorization |
| Module declared but not in `module-map.md` | block; run Mode P first |
| Cross-module dependency cycle detected | block; resolve at Mode P level |

---

## 20. Stop / block routing

The following conditions require block or stop behavior in the affected lane:

- specialist analysis required but absent,
- protected-area impact suspected but unresolved,
- current plan no longer matches actual work,
- requested change is really IC5,
- runtime state is too weak for honest completion,
- upstream contradiction makes routing unreliable,
- selected issue/comment is too vague for safe intake,
- canonical layer cannot be resolved safely,
- exact tooling file cannot be identified safely,
- required fallback authoring guidance is absent.

A blocked lane may produce:
- blocker note,
- escalation note,
- follow-up requirement,
- narrowed-scope proposal,
- or handoff recommendation.

It must not continue as if the blocker were already resolved.

---

## 21. Required outputs by routed path

## 21.1 Default feature route (Mode B)

Expected outputs:
- `spec.md`
- `plan.md`
- `tasks.md`
- `qa-checklist.md`
- `runtime-notes.md`
- `review.md`

## 21.2 Contract-aware route

Additional expected outputs:
- `schema-impact.md`
- `contract-notes.md`

## 21.3 Access-aware route

Additional expected outputs:
- `acl-notes.md` or access-impact section in plan/review artifacts

## 21.4 Query-aware route

Additional expected outputs:
- `query-notes.md` or read-model impact section

## 21.5 Job-aware route

Additional expected outputs:
- `job-notes.md`
- retry/idempotency notes when relevant

## 21.6 Baseline route (Mode P Gate P1 — program scope, Mode M Gate M1a — module scope)

Expected outputs (Mode P Gate P1 — program scope):
- program-wide source authority section in `architecture-overview.md`,
- program-wide glossary baseline section in `architecture-overview.md`,
- program-wide conflict register or resolved-decisions log,
- foundational `_ar/BA/{EN,ARCH,BR}/` seeds,
- `_REGISTRY.md` skeletons for all canonical layers.

Expected outputs (Mode M Gate M1a — module scope):
- module-scope baseline notes in `module-brief.md`,
- module-scope EN/BR seeds in `_ar/BA/` with `modules:` frontmatter,
- module-scope conflicts surfaced in affected `_ar/` docs or `module-risks.md`,
- `_REGISTRY.md` updates for touched layers.

(Pre-v2.0.0 frameworks had a separate Mode A onboarding route for this. v2.0.0 splits across Mode P and Mode M.)

## 21.7 Comment intake route (Mode C)

Expected outputs may include:
- `comment-intake.md`
- `source-amendment.md`
- `open-questions.md` when ambiguity remains
- `slice-seed.md` when promotion is justified
- `mode-b-handoff.md` when future Mode B work should start

Mode C must not produce normal delivery completion artifacts unless work is explicitly handed off and restarted in Mode B.

---

## 22. Common routing mistakes

### 22.1 Under-routing a UI request
A web change is routed only to `WebImplementer` even though contract semantics changed.

### 22.2 Skipping clarification too early
The package assumes ambiguity is harmless when it actually affects permissions, acceptance criteria, or documentation layer selection.

### 22.3 Treating shared schema as local scope
A field added for one screen is routed as if only one client mattered.

### 22.4 Triggering baseline roles for ordinary feature work
The package reopens program-wide or module-scope baseline analysis instead of using the established baseline already authored in `_ar/`.

### 22.5 Forgetting QA/runtime as real lanes
Implementation is treated as complete before testability and runtime evidence are visible.

### 22.6 Turning every comment into a feature slice
The package skips intake classification and creates feature work directly from annotation.

### 22.7 Browsing local tooling broadly
The package scans all rules/templates instead of resolving one canonical layer first.

### 22.8 Using Mode C as a delivery shortcut
The package starts writing implementation-shaped artifacts without finishing documentation amendment and explicit handoff.

---

## 23. Review rule for future changes

When updating this matrix:
- do not add roles casually,
- do not move constitutional rules into this file,
- do not weaken specialist triggers without evidence from pilot runs,
- do not force heavyweight routing on clearly low-risk work,
- do not let Mode C become a second hidden delivery pipeline,
- and keep the matrix useful for actual operational decisions.

---

## 24. Current recommended usage

Until real pilot runs suggest refinement:
- apply this matrix conservatively,
- prefer specialist activation over optimistic omission when contract or permissions are unclear,
- prefer Mode C when issue/comment intake is the real starting point,
- but do not trigger baseline-only roles (Mode P Gate P1 or Mode M Gate M1a) for ordinary feature delivery.

---

## 25. Final stance

This matrix exists so the package can route work with enough discipline to stay safe, but not so much ceremony that every small change becomes a committee process.

Its role is to keep routing:
- explicit,
- bounded,
- risk-aware,
- mode-correct,
- and understandable.
