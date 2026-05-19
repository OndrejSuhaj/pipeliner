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
- triggering onboarding for ordinary work,
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

The repository distinguishes five operating modes.

### 4.0 Mode P — Program Bootstrap

Use when:
- a new project is being established within this framework,
- program-level scope, architectural overview, or module decomposition must be declared,
- existing program requires structural re-framing (new module, split, scope rewrite).

Primary intent:
- declare program-level artifacts in `docs/program/`,
- decompose the program into bounded modules,
- enable downstream Mode A / Mode M.

### 4.1 Mode A — Repository Onboarding

Use when:
- baseline trust is weak,
- source authority is unclear,
- terminology is unstable,
- corpus conflict blocks safe work,
- or baseline repair is required.

Primary intent:
- establish trustworthy baseline knowledge.

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
- establish module-level baseline trust (reuse `agents/onboarding/*` with module scope),
- coordinate analytical, UX, and architectural inputs into a coherent module-level plan,
- author a slice map enabling parallel Mode B delivery,
- verify module-release readiness.

---

## 5. Mode routing rules

| Situation | Route |
|---|---|
| New project being established within the framework | Mode P |
| Existing program requires structural re-framing | Mode P (through Gate P-R) |
| New repository / weak baseline / unclear authority / terminology conflict | Mode A |
| New module being declared from `module-map.md` | Mode M |
| Module nearing release / module re-framing | Mode M |
| Slice exists in `slice-map.md` and prerequisites are claimed met | Mode B (entering through Gate B0) |
| Normal bounded feature request | Mode B |
| Operator-selected issue/comment requiring controlled follow-up | Mode C |
| Comment already normalized into a bounded approved feature request | Mode B (through Gate B0) |
| Comment challenges module-level artifact | Mode C → Mode M |
| Comment challenges program-level artifact | Mode C → Mode P (through Gate P-R) |
| Comment reveals baseline collapse or major source-authority conflict | Mode A or block until clarified |
| "Just update docs" but documentation layer is unclear | Mode C first |
| Slice-readiness check fails | back to Mode M (M1 / M2 / M3 depending on missing prerequisite) |

### 5.1 Mode override rules

- Do not use Mode B when the real starting point is a selected issue/comment that challenges upstream truth.
- Do not use Mode C to bypass normal feature delivery once the work has become a real feature.
- Do not use Mode A merely because "more context would be nice."
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

### 6.5 Onboarding-only roles
Used in repository onboarding (Mode A) or invoked with module scope from Mode M Gate M1a.

### 6.6 Program-level roles (`agents/program/**`)
Used only in Mode P program bootstrap and re-frame.

### 6.7 Module-level orchestration roles (`agents/modules/**`)
Used only in Mode M module declaration, framing, planning, and release readiness.

### 6.8 UX canonical roles (`agents/ux/**`)
Used in Mode M Gate M2 and M3 for IA, wireframe, component, and copy authoring.

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

## 11. Onboarding-only roles

The following roles belong only to repository onboarding or baseline repair:

- `CorpusCurator`
- `ConflictMapper`
- `TerminologyResolver`
- `ArchitectureBaselineMapper`

Trigger these roles only when:
- the project is being onboarded,
- baseline trust is weak,
- artifact authority is unclear,
- terminology is unstable,
- or a major documentation conflict blocks normal feature delivery.

They must not be activated for ordinary feature work just because more context would be nice to have.

---

## 12. Gate routing matrix — Mode A

## 12.1 Gate 0 — Intake Gate

Primary question:
- do we trust the baseline enough for normal work?

Trigger in:
- onboarding mode,
- baseline repair,
- major corpus conflict situations.

Typical roles:
- `CorpusCurator`
- `ConflictMapper`
- `TerminologyResolver`
- `ArchitectureBaselineMapper`

Output expectation:
- baseline trust decision,
- source authority map,
- conflict visibility,
- onboarding artifacts.

---

## 13. Gate routing matrix — Mode B

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
| Selected issue/comment requiring controlled follow-up | Mode C |
| Comment challenges upstream documentation truth | Mode C + `CanonicalLayerResolver` |
| Comment needs exact layer rules/template | Mode C + tooling resolvers |
| New or changed GraphQL field / type / mutation / query | `SchemaSteward` |
| New role, grant, visibility rule, or permission condition | `AclPlanner` |
| New list/detail/report semantics or export logic | `QueryPlanner` |
| New queue, retry rule, import/export, scheduler, background correctness | `JobPlanner` |
| Mobile scope or cross-client shared-contract consequence | `MobileImplementer` |
| Ambiguity that affects planning, safe execution, or safe amendment | clarification role |
| Baseline conflict or unclear source authority | Mode A onboarding roles |

---

## 17. Comment retrieval and intake routing

Operator-selected comments may come from:
- annotation layer UI,
- markdown viewer context,
- or direct retrieval from the application database.

Repository-specific operational example:
- retrieve rows from `page_comments`
- columns may include:
  - `id`
  - `target_type`
  - `route_id`
  - `doc_id`
  - `passage_anchor`
  - `body`
  - `status`
  - `author_name`
  - `created_at`

Routing rules:
- direct database retrieval still routes to Mode C when controlled follow-up is required,
- one Mode C run must bind itself to one explicit selected comment row or one explicitly bounded filtered set,
- do not process “all comments” as one backlog blob.

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

## 21.6 Onboarding route (Mode A)

Expected outputs may include:
- source index,
- authority map,
- conflict register,
- glossary baseline,
- architecture baseline,
- onboarding risk report.

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

### 22.4 Triggering onboarding roles for ordinary feature work
The package reopens corpus analysis instead of using the established baseline.

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
- but do not trigger onboarding-only roles for ordinary feature delivery.

---

## 25. Final stance

This matrix exists so the package can route work with enough discipline to stay safe, but not so much ceremony that every small change becomes a committee process.

Its role is to keep routing:
- explicit,
- bounded,
- risk-aware,
- mode-correct,
- and understandable.
