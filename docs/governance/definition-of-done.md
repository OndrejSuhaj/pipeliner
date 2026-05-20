# Definition of Done

## 1. Purpose

This document defines the operational meaning of “done” for feature delivery in the AI delivery package.

It exists to prevent a weak interpretation of completion such as:

- “the code exists”,
- “the task list was checked off”,
- “it probably works locally”,
- or “the implementation looks plausible”.

This document turns the constitutional completion standard into a practical delivery checklist.

It is stricter than a coding completion rule and narrower than the constitution.

---

## 2. Relationship to other governance artifacts

This document depends on:

- `constitution.md`
- `guardrails.md`
- `impact-classes.md`
- `trigger-matrix.md`
- `mode-c.md` when Mode C is active
- `mode-m.md` when Mode M is active
- `mode-p.md` when Mode P is active

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
11. module-level artifacts (`specs/<module>/*`)
12. slice-level feature artifacts
13. agent instructions

This document may refine completion criteria operationally.
It may not weaken higher-level governance rules.

---

## 3. Core principle

A feature (slice) is done only when it is:

- specified,
- planned,
- implemented within scope,
- reviewable,
- and meaningfully verifiable.

"Done" is therefore a delivery state, not just a coding state.

This document defines four distinct levels of "done", each operating at its own tier:

- **slice-level done** — a single Mode B slice is complete (the primary subject of §§ 5–11)
- **slice-ready done** — a slice is ready to enter Mode B Gate B0 (§ 5b)
- **module-definition done** — a module is delivery-ready (§ 5c)
- **module-release readiness** — a module is release-ready (§ 5d)
- **program-definition done** — the program is bootstrap-ready (§ 5e)

These levels are not interchangeable. A module being "delivery-ready" does not mean its slices are done; it means slices may begin. A program being "bootstrap-ready" does not mean any module is framed; it means Mode M may begin.

---

## 4. Done at different levels

The package distinguishes several levels of completion.

## 4.1 Not started

The feature request exists, but no valid delivery artifact chain exists yet.

## 4.2 In analysis

The feature is being classified, specified, clarified, or planned.

Implementation is not yet eligible or not yet complete enough to claim progress toward done.

## 4.3 In implementation

Implementation work is active, but the feature is not done because one or more required areas remain incomplete.

## 4.4 Implemented but not done

Code exists, but one or more of the following is still missing:

- artifact consistency,
- specialist analysis,
- QA evidence,
- runtime notes,
- explicit review verdict,
- or visibility of known blockers.

This is a valid intermediate state.
It must not be reported as done.

## 4.5 Done with known limitations

The feature satisfies the required delivery criteria, but still has visible, accepted limitations.

Those limitations must be documented explicitly.

## 4.6 Done

The feature satisfies the required completion criteria for its impact level and routed path.

## 4.7 Blocked

The feature or a lane cannot safely proceed because a required condition for completion or continuation is missing.

Blocked is not done.
Blocked is not failure.
Blocked is a control state.

---

## 5. Mandatory completion criteria for normal feature delivery

A feature may be marked done only when all of the following are true.

### 5.1 Scope is explicit

The feature scope is described clearly enough that a reviewer can understand:

- what was intended,
- what was included,
- what was excluded.

Required artifact basis:
- `spec.md`

### 5.2 Impact was classified

The feature has an explicit impact classification or equivalent impact decision.

The classification must be plausible relative to actual work performed.

### 5.3 Ambiguity was resolved or recorded

Any ambiguity that materially affects:

- scope,
- acceptance criteria,
- contract interpretation,
- permissions,
- tenancy,
- or runtime behavior

must be either:

- resolved,
- explicitly recorded,
- or reflected in a limitation / blocker.

### 5.4 A valid plan exists when required

If the feature is not in the lowest safe handling path, a plan must exist and must reflect the real implementation shape.

### 5.5 Required specialist analysis exists

If routing triggered specialist roles, their required outputs must exist.

Examples:
- `schema-impact.md`
- `contract-notes.md`
- ACL notes
- query/report notes
- job/async notes

### 5.6 Tasks were decomposed clearly enough to trace execution

The implementation must be traceable to tasks or bounded execution units.

### 5.7 Implementation stayed within approved scope

No silent scope expansion occurred.

If adjacent work was discovered, it was recorded separately rather than silently absorbed.

### 5.8 Operational safety and configuration hygiene

If the feature touches local runtime, Docker orchestration, scripts, migrations, seeders, configuration loading, or other infrastructure-sensitive behavior, it may be considered done only when all of the following are true:

- no new hardcoded secrets were introduced in repository-tracked files
- configuration handling remains explicit and consistent across app code and supporting scripts
- internal services are not exposed more broadly than the approved scope requires
- fatal failures are not surfaced through naive raw string response bodies
- Docker-related delivery changes include reasonable hygiene for the supported workflow (for example `.dockerignore`, sane build context, and restart expectations when relevant)
- any intentionally demo-only or local-only weakness is documented explicitly in runtime notes or limitation records

If these conditions are not met, the feature may still be:
- implemented but not done
- done with known limitations
- or blocked

It must not be reported as fully done.

### 5.9 QA thinking exists

A feature must have explicit QA coverage in proportion to its risk.

Minimum expectation:
- `qa-checklist.md`

### 5.10 Runtime notes exist

The feature must have explicit runtime or local verification notes.

Minimum expectation:
- `runtime-notes.md`

### 5.11 Review produced an explicit verdict

Review must end in one explicit state:

- `accept`
- `revise`
- `block`

A feature cannot be done if the final review verdict is absent, unresolved, or still `revise` / `block`.

### 5.12 Known blockers and limitations are visible

If the feature is considered done with limitations, those limitations must be written explicitly.

Nothing important may remain hidden behind optimistic wording.

### 5.13 Slice atomicity

A slice is atomic when:

- it has exactly one acceptance criterion,
- it produces exactly one user-observable outcome,
- and its size fits the per-class caps in `impact-classes.md` § 13.1 and the global caps in `CLAUDE.md` § Slice Sizing Discipline.

If "done" requires more than one acceptance criterion or more than one user-observable outcome, the slice was misclassified or under-decomposed. Reclassify and split before continuing toward done.

A slice that has been split into sub-slices is not done until every sub-slice is independently `accept`-verdicted and merged. Sub-slices are not interchangeable with the parent slice's done state — each sub-slice carries its own acceptance criterion, its own review verdict, and its own merge.

A slice that exceeds its size caps may not be reported as done even if all other criteria are met. Size cap violations are scope/structure failures, not quality failures, and resolve through splitting.

---

## 5b. Slice-ready done (Mode B Gate B0)

A slice is **ready to enter Mode B Gate B0** when its prerequisites recorded in `slice-map.md` are satisfied. This is a precondition for Mode B, not the same as slice delivery done.

Per constitution § 17.3, all six criteria must hold:

### 5b.1 Analytical inputs are sufficient
EN, UC, BR, QUERY, JOB analytical artifacts required by the slice exist in `_ar/BA/` (with `modules:` frontmatter listing the slice's module) and cover the slice's behavior.

### 5b.2 UX inputs are sufficient
Wireframes covering the slice's screens exist in `_ar/UX/WIRE/`. Project-level IA in `_ar/UX/IA/IA-<project>.md` references the relevant screens. Relevant component and copy coverage exists in `_ar/UX/COMP/` and `_ar/UX/COPY/` when applicable.

### 5b.3 Technical dependencies are explicit and resolved
Dependencies on core and other modules are named in `slice-map.md`. Each is either resolved (target exists) or explicitly accepted as risk.

### 5b.4 Scope fits within slice sizing discipline
The planned slice fits the per-class cap from `impact-classes.md` § 13.1 and CLAUDE.md § Slice Sizing Discipline.

### 5b.5 Acceptance criterion is single and user-observable
The slice has exactly one acceptance criterion tied to one user-observable outcome.

### 5b.6 Assigned implementer lane(s) are clear
The slice declares which implementer lane(s) (ApiImplementer, WebImplementer, MobileImplementer) will execute it.

A failed slice-ready check returns the slice to Mode M:
- missing analytical input → M1b refresh,
- missing UX input → M2 refresh,
- missing architectural decision → M3 refresh.

Slice-ready done is verified by `SliceReadinessVerifier` (read-only subagent) at Mode B Gate B0.

---

## 5c. Module-definition done (Mode M)

A module is **delivery-ready** when slices in its slice map may safely begin entering Mode B Gate B0. This is a precondition for slice work, not the same as module release.

Per constitution § 17.2, all criteria must hold:

### 5c.1 Module-brief defines scope and boundaries
`specs/<module>/module-brief.md` declares scope, dependencies on core and other modules, integration boundaries, non-goals.

### 5c.2 Module-scope baseline exists (Gate M1a)
Module-scope refinements on top of program-wide baseline (terminology, source authority, conflicts) are complete. Module-scope notes are embedded in `module-brief.md` § Baseline section; conflicts surface as open questions in affected `_ar/` docs or as risk entries in `module-risks.md`.

### 5c.3 Initial analytical minimum exists in `_ar/BA/`
EN, BR, UC analytical inputs sufficient for the module's central capability exist in `_ar/BA/EN/`, `_ar/BA/BR/`, `_ar/BA/UC/` with `modules:` frontmatter listing this module. ES and ARCH are present when relevant.

### 5c.4 IA and wireframes exist when user-facing
Project-level IA (`_ar/UX/IA/IA-<project>.md`) authored by Mode P Gate P-UX is consumed and references this module's screens. WIRE coverage for in-scope module screens exists in `_ar/UX/WIRE/`.

### 5c.5 Module-plan and slice-map exist
`specs/<module>/module-plan.md` records architecture, technologies, delivery sequence. `specs/<module>/slice-map.md` lists all slices with prerequisites per §5b (referencing required `_ar/` `doc_id`s).

### 5c.6 Module-risks records known risks
`specs/<module>/module-risks.md` exists and records risks, unresolved dependencies, and mitigation plan.

### 5c.7 Slice-readiness prerequisites are explicit per slice
Each slice in `slice-map.md` has its §5b prerequisites recorded, so Mode B Gate B0 can verify them.

### 5c.8 `_REGISTRY.md` files are current
For each canonical layer touched during module framing, `_REGISTRY.md` reflects the new `doc_id`s and their statuses (`reserved` | `draft` | `canonical`).

Module-definition done is the precondition for **any** slice entering Mode B. It is not a release decision.

---

## 5d. Module-release readiness (Mode M Gate M4)

A module is **release-ready** when all delivery work for the module is complete and staging verification confirms it.

Per constitution § 17.4, all five criteria must hold:

### 5d.1 All slices are merged or explicitly deferred
Every slice in `slice-map.md` has status `merged` or `deferred` (with deferral reason).

### 5d.2 Staging verification evidence exists
`specs/<module>/module-staging-readiness.md` records deployed slice list, staging URL, manual verification evidence.

### 5d.3 Open risks and gaps are visible
`specs/<module>/module-risks.md` is updated with remaining open risks and known gaps.

### 5d.4 Cross-module integration is verified
When the module exposes contract to other modules or external clients, cross-module integration tests or manual verification evidence exists.

### 5d.5 Release recommendation is explicit
The module-staging-readiness records an explicit recommendation: `release` | `defer` | `block`. Release is a human decision; this document records the framework's recommendation.

Module-release readiness is not the same as program completion. A program contains multiple modules, each going through its own release cycle.

---

## 5e. Program-definition done (Mode P)

A program is **bootstrap-ready** when downstream per-module Mode M may safely begin.

Per constitution § 17.1, all criteria must hold:

### 5e.1 Project-brief exists
`docs/program/project-brief.md` declares scope, business purpose, key constraints, success criteria.

### 5e.2 Architecture-overview exists with program-wide baseline
`docs/program/architecture-overview.md` records architectural assumptions, external systems, integration boundaries, non-functional constraints, ADR-style decisions, plus program-wide source authority + terminology baseline + canonical conflict resolutions.

### 5e.3 Foundational `_ar/BA/{ARCH,EN,BR}/` seeds exist
Program-wide concepts identified at Gate P1 have foundational docs in `_ar/BA/ARCH/`, `_ar/BA/EN/`, `_ar/BA/BR/` with valid frontmatter and `_REGISTRY.md` entries. Concepts not stable enough to seed are recorded as Open Questions in `architecture-overview.md`.

This is a hard prerequisite for Gate P-UX (project IA) — IA must reference foundational seeds via `doc_id` rather than restating their content. See `toolingDocs/cross-layer-discipline.md`.

### 5e.4 Project-level IA exists when user-facing
When the program has user-facing surfaces, `_ar/UX/IA/IA-<project-slug>.md` exists with:
- all sections per `toolingDocs/rules-IA.md` (Sources, Entry Points, Top-Level Nav, Screen Map, Cross-Module Flows, Information Hierarchy, Module Boundaries, Open IA Questions, NOT-COVER)
- all `references:` resolve in target `_REGISTRY.md` files
- no inline cross-layer content (no API contracts, no provider names, no enumerated config values, no restated entity attributes)
- Open IA Questions section captures every unresolved behavior with named decider

### 5e.5 Module-map exists
`docs/program/module-map.md` declares all modules with their slugs, scope summaries, dependencies, integration boundaries, ownership, and entry sequence.

### 5e.6 Implementation-streams exists when parallel delivery is non-trivial
`docs/program/implementation-streams.md` exists when modules will be delivered in parallel and coordination is non-trivial.

### 5e.7 All declared modules have a clear owner and entry path
Each module in `module-map.md` has a named owner (the role / person leading its Mode M) and a declared entry sequence (which module's Mode M starts first).

Program-definition done is a precondition for **any** module entering Mode M. It is not a delivery completion claim.

When Mode P is re-run for structural change (Gate P-R), the re-frame authorization (`docs/program/re-frame-authorization.md`) must accompany the amended artifacts.

---

## 6. Completion criteria by impact class

## 6.1 IC0 — Documentation / non-executable support change

Done when:

- scope is clear,
- the documentation or support artifact is updated consistently,
- no hidden runtime effect exists,
- and review is sufficient for the intended scope.

Usually not required:
- runtime verification,
- implementation lanes,
- specialist routing.

## 6.2 IC1 — Local presentation change

Done when:

- scope is explicit,
- the UI or local presentation change is implemented,
- contract assumptions remain unchanged,
- QA checks exist,
- runtime notes exist,
- review confirms no hidden protected-area impact.

## 6.3 IC2 — Bounded feature change without protected-area impact

Done when:

- normal feature criteria are met,
- implementation is traceable to tasks,
- QA and runtime checks exist,
- and no hidden contract/protected-area drift remains.

## 6.4 IC3 — Contract or shared-behavior change

Done when:

- normal feature criteria are met,
- required schema/contract analysis exists,
- shared behavior change is visible and reviewed,
- cross-surface implications are acknowledged,
- and review confirms contract consistency.

## 6.5 IC4 — Protected-area or cross-boundary change

Done when:

- all normal criteria are met,
- all required specialist routes were completed,
- protected-area impact is visible in artifacts,
- unresolved risk is either closed or explicitly accepted,
- runtime and review evidence are strong enough to justify delivery confidence.

IC4 should be harder to call done than IC1–IC3.

## 6.6 IC5 — Strategic / architecture-sensitive change

IC5 is generally not considered done as a normal feature.

It is first considered done only when it has been:

- decomposed,
- governance-reviewed,
- and translated into smaller deliverable work.

Implementation-level done should apply to the resulting lower-impact slices, not to IC5 as a raw request.

---

## 7. Completion criteria by routed path

## 7.1 Default feature route

Required:
- `spec.md`
- `plan.md` when required
- `tasks.md`
- `qa-checklist.md`
- `runtime-notes.md`
- `review.md`

## 7.2 Contract-aware route

Additional required evidence:
- `schema-impact.md`
- `contract-notes.md`

The change is not done if contract implications were real but undocumented.

## 7.3 Access-aware route

Additional required evidence:
- visible access-impact notes,
- explicit review of permission semantics.

The change is not done if role or visibility impact exists only implicitly in code.

## 7.4 Query-aware route

Additional required evidence:
- visible read-side or reporting notes,
- explicit statement of changed filters, grouping, derived outputs, or result semantics.

## 7.5 Job-aware route

Additional required evidence:
- background behavior notes,
- retry or idempotency implications when relevant,
- runtime notes that acknowledge async limits.

## 7.6 Baseline route (Mode P Gate P1 / Mode M Gate M1a)

Baseline is done when the program-wide or module-scope baseline is trustworthy enough for downstream work.

Typical required outputs (Mode P Gate P1 — program scope):
- program-wide source authority section in `architecture-overview.md`,
- program-wide terminology baseline section in `architecture-overview.md`,
- program-wide conflict register (or resolved-decisions log),
- foundational `_ar/BA/{EN,ARCH,BR}/` seeds,
- `_REGISTRY.md` skeletons initialized for all canonical layers,
- program-level baseline risk acknowledgments.

Typical required outputs (Mode M Gate M1a — module scope):
- module-scope baseline notes in `module-brief.md`,
- module-scope EN/BR refinements in `_ar/BA/` with `modules:` frontmatter,
- module-scope conflicts surfaced (either resolved or recorded in `module-risks.md`),
- `_REGISTRY.md` updates for touched layers.


---

## 8. Minimum evidence rules

A feature is not done if any of the following applies:

- code changed but spec does not reflect intent,
- plan exists but no longer describes the actual work,
- specialist-triggered areas have no corresponding artifact,
- runtime notes do not state what was actually verified,
- review does not provide a clear verdict,
- or a significant limitation is known but undocumented.

---

## 9. QA completion rules

QA is sufficient when it is proportionate to the routed risk.

### Minimum QA expectation

Every normal feature should have:
- acceptance-oriented checks,
- smoke-level verification thinking,
- and explicit mention of what still requires manual confirmation.

### Higher-risk expectation

Features involving:
- shared contracts,
- permissions,
- tenancy,
- async processing,
- or cross-client behavior

require more explicit QA attention.

A high-risk feature is not done if QA remains purely implied.

---

## 10. Runtime completion rules

Runtime evidence is sufficient only when it states clearly:

- whether the feature builds,
- whether it runs,
- whether it is locally verifiable,
- what environment assumptions apply,
- what was actually exercised,
- and what remains unverified.

A vague statement such as “should work locally” is insufficient.

---

## 11. Review completion rules

Review is complete only when:

- it checks more than formatting,
- it considers spec and plan alignment,
- it checks scope discipline,
- it checks contract/protected-area safety when relevant,
- and it ends with one explicit verdict.

No feature is done if the final review verdict is still:
- `revise`
- or `block`.

---

## 12. Done with limitations

A feature may be called done with limitations only when:

- the limitations are visible,
- the limitations do not invalidate the feature’s main intended outcome,
- and the review accepts that state explicitly.

Typical examples:
- local verification is partial because an external provider is unavailable,
- a manual QA step remains required,
- a low-severity follow-up remains open but not blocking.

This state must never be used to hide:
- protected-area uncertainty,
- broken contract assumptions,
- or unreviewed scope drift.

---

## 13. What does not qualify as done

The following do **not** qualify as done on their own:

- code exists,
- branch exists,
- tests were generated,
- tasks were checked off,
- the feature compiles,
- a reviewer left comments but no verdict,
- or the implementation "probably" works.

---

## 14. Completion checklist templates

Use these templates as standard completion checks at each tier.

### 14.1 Slice-level (Mode B) completion check

```md
# Slice Completion Check

## Slice-readiness (Gate B0)
- [ ] Slice is declared in `slice-map.md`
- [ ] All six §5b prerequisites verified by `SliceReadinessVerifier`

## Scope
- [ ] Scope is explicit in `spec.md`
- [ ] In-scope / out-of-scope is clear

## Classification
- [ ] Impact classification exists
- [ ] Classification still matches actual work performed

## Clarification
- [ ] Material ambiguities were resolved or recorded

## Plan
- [ ] Required plan exists
- [ ] Plan still reflects actual implementation shape

## Specialist Artifacts
- [ ] Required specialist analysis exists
- [ ] Contract / schema / ACL / QUERY / JOB impact is documented when relevant

## Tasks
- [ ] Implementation is traceable to tasks or bounded execution units
- [ ] No silent scope expansion occurred

## QA
- [ ] QA checklist exists
- [ ] Manual verification needs are visible

## Runtime
- [ ] Runtime notes exist
- [ ] Build / run / verify status is explicit
- [ ] Known environment blockers are visible

## Review
- [ ] Review exists
- [ ] Final verdict is `accept`

## Visibility
- [ ] Known blockers or limitations are visible
- [ ] Confidence is communicated honestly
```

### 14.2 Slice-ready (pre-Mode B) check

```md
# Slice-Ready Check (Mode B Gate B0)

## Analytical inputs
- [ ] EN / UC / BR / QUERY / JOB inputs sufficient for slice behavior
- [ ] Inputs live in `_ar/BA/` with `modules:` frontmatter listing this module

## UX inputs
- [ ] Wireframes in `_ar/UX/WIRE/` cover the slice's screens
- [ ] Project IA in `_ar/UX/IA/IA-<project>.md` references the relevant screens
- [ ] Relevant components / copy coverage in `_ar/UX/COMP/` and `_ar/UX/COPY/` exists when applicable

## Technical dependencies
- [ ] Cross-module dependencies named in `slice-map.md`
- [ ] Each dependency is resolved or explicitly accepted as risk

## Sizing
- [ ] Planned scope fits per-class slice size cap
- [ ] No split required (or split-recommendation exists)

## Acceptance criterion
- [ ] Single criterion declared
- [ ] Single user-observable outcome

## Implementer lane
- [ ] Lane(s) assigned in `slice-map.md`

## Verdict
- [ ] pass / fail recorded by `SliceReadinessVerifier`
```

### 14.3 Module-definition (Mode M) check

```md
# Module-Definition Check

## Declaration
- [ ] Module is declared in `module-map.md`
- [ ] Module-brief defines scope, boundaries, dependencies, non-goals

## Baseline (Gate M1a)
- [ ] `authority-map.md` exists
- [ ] `module-glossary.md` exists
- [ ] `conflict-register.md` exists (when conflicts surfaced)

## Framing (Gate M1b)
- [ ] EN / BR / UC inputs sufficient for module's central capability
- [ ] ES inputs exist when relevant
- [ ] ARCH inputs align with `architecture-overview.md`

## UX (Gate M2, when user-facing)
- [ ] `ia.md` exists
- [ ] `wireframes.md` exists
- [ ] IA aligned with UC coverage

## Plan (Gate M3)
- [ ] `module-plan.md` exists
- [ ] `slice-map.md` lists all slices with prerequisites
- [ ] `module-risks.md` records known risks
- [ ] `components.md` and `copy.md` exist when relevant

## Slice prerequisites
- [ ] Each slice has §5b prerequisites recorded
- [ ] Slice sizing discipline respected
- [ ] No dependency cycles
```

### 14.4 Module-release readiness (Mode M Gate M4) check

```md
# Module-Release Readiness Check

## Slice closure
- [ ] All slices in `slice-map.md` are `merged` or `deferred`
- [ ] Deferred slices have explicit deferral reason

## Staging
- [ ] `module-staging-readiness.md` records deployed slices
- [ ] Staging URL captured
- [ ] Manual verification evidence present

## Risks
- [ ] `module-risks.md` updated with open risks
- [ ] Known gaps visible

## Integration
- [ ] Cross-module integration verified (when applicable)
- [ ] Contract consistency checked across module boundary

## Recommendation
- [ ] Release recommendation explicit: `release` | `defer` | `block`
- [ ] Operator authorization required if `release`
```

### 14.5 Program-definition (Mode P) check

```md
# Program-Definition Check

## Brief
- [ ] `project-brief.md` declares scope, purpose, constraints, success criteria
- [ ] Risks and assumptions visible

## Architecture
- [ ] `architecture-overview.md` records style, external systems, integration boundaries
- [ ] Non-functional constraints captured
- [ ] ADR-style decisions recorded

## Module map
- [ ] `module-map.md` declares all modules with slugs, scope, dependencies
- [ ] Integration boundaries explicit
- [ ] No dependency cycles
- [ ] Entry sequence declared

## Implementation streams (optional)
- [ ] `implementation-streams.md` exists if parallel delivery non-trivial
- [ ] Cross-stream coordination model declared

## Ownership
- [ ] Each module has named owner
- [ ] Entry path into Mode M is clear

## Re-frame (when applicable)
- [ ] `re-frame-authorization.md` records explicit rationale
- [ ] Affected artifacts named
- [ ] Downstream module impact acknowledged
```

---

## 15. Completion outputs

A feature marked done should have, at minimum, these visible completion outputs:

- a final `review.md` with explicit verdict,
- `runtime-notes.md`,
- `qa-checklist.md`,
- and all triggered specialist artifacts.

A delivery summary may also exist, but it does not replace the required artifacts.

---

## 16. Common false-done patterns

### 16.1 Code-complete but artifact-incomplete
Implementation exists, but the feature has no valid runtime or review closure.

### 16.2 Review without decision
Comments exist, but no final verdict was given.

### 16.3 QA implied but not visible
The team assumes the change was tested, but nothing makes that testability legible.

### 16.4 Contract change hidden in implementation
The system behaves differently, but no contract-aware artifact was created.

### 16.5 Limitation hidden as optimism
The feature is called done even though verification or behavior gaps are known and undocumented.

---

## 17. Rules for future refinement

When refining this document:

- do not turn done into bureaucracy for trivial changes,
- do not weaken protected-area completion requirements,
- do not define done purely as coding completion,
- and do not duplicate the constitution unnecessarily.

Keep this document operational, practical, and auditable.

---

## 18. Current recommended usage

Until pilot runs provide enough evidence to refine thresholds:

- apply this DoD conservatively,
- prefer visible incompleteness over premature done status,
- and require stronger closure for IC3 and IC4 changes than for IC0 and IC1 changes.

---

## 19. Final stance

This Definition of Done exists to make completion real.

Its job is not to slow delivery down for ceremony.
Its job is to ensure that when the package says “done”, that claim means something reviewable, testable, and honest.
