# CLAUDE.md

## Purpose

This file is the session-level operating contract for this repository.

It defines:
- what to read first,
- how to classify work,
- which workflow to follow,
- when to escalate or stop,
- what minimum artifacts must exist,
- how to use local authoring support safely,
- and how to speak about runtime state, confidence, and completion.

It does not replace the constitution, governance docs, or agent files.

---

## Authority

Follow this order:

1. `.specify/memory/constitution.md`
2. `docs/governance/guardrails.md`
3. `docs/governance/impact-classes.md`
4. `docs/governance/trigger-matrix.md`
5. `docs/governance/definition-of-done.md`
6. `docs/governance/mode-c.md` when Mode C is active
7. `docs/governance/mode-m.md` when Mode M is active
8. `docs/governance/mode-p.md` when Mode P is active
9. `docs/governance/local-tooling-contract.md` when local tooling is used
10. program-level artifacts (`docs/program/*`)
11. canonical authored documentation (`_ar/**`)
12. module-level orchestration (`specs/<module>/{module-brief,module-plan,slice-map,module-risks,…}.md`)
13. slice-level artifacts (`specs/<module>/slices/<slice>/*`)
14. `agents/**`

If artifacts conflict, the higher artifact wins.
Do not silently reinterpret or weaken a higher artifact.
If the conflict is material, stop and surface it.

---

## Operating Modes

### Mode P — Program Bootstrap

Use when a new project is being established within this framework, or when an existing program requires structural re-framing (new module, module split, scope rewrite).

Purpose:
- declare program scope and business purpose,
- establish program-level architectural assumptions and constraints,
- decompose the program into bounded implementation streams (modules),
- declare cross-module dependencies and integration boundaries.

Mode P runs once per project. Re-runs require Gate P-R authorization before any existing program artifact may be amended. Do not re-run Mode P for routine planning.

Mode P does not author module-level or slice-level artifacts.

### Mode A — Deprecated (v2.0.0)

Mode A is eliminated. Its responsibilities split into:
- **Program-wide baseline** (terminology, source authority, repo-wide canonical conflicts) → Mode P Gate P1
- **Module-scope baseline** (module-scope terminology, source authority, conflicts within a module) → Mode M Gate M1a

Pre-v2.0.0 artifacts authored under Mode A remain valid. No new Mode A invocations are permitted in v2.0.0+.

### Mode B — Feature Delivery (Default)

Use for normal work on features, change requests, module enhancements, and bounded implementation slices.

This is the standard delivery pipeline:
constitution check → specify → clarify → plan → tasks → implement → QA/runtime → independent review

Mode B owns normal feature delivery and implementation.
Do not bypass it with ad hoc shortcuts.

### Mode C — Comment Intake / Documentation Amendment / Slice Seeding

Use when the operator explicitly selects an issue/comment from the annotation layer or another structured review source and wants to convert it into controlled upstream follow-up.

Purpose:
- normalize the comment,
- classify what kind of change it actually implies,
- resolve the affected canonical documentation layer,
- amend or create the necessary upstream documentation first,
- and prepare a handoff package for future Mode B work when appropriate.

Mode C is a pre-delivery intake mode, not a replacement for Mode B.
Mode C does not implement product changes.
Mode C does not create branches, merge code, or claim delivery completion.

Typical Mode C outcomes:
- `closed_as_doc_fix`
- `recorded_as_open_question`
- `route_to_existing_slice`
- `promote_to_new_slice_candidate`
- `rejected`

If the desired work becomes a real feature, continue in Mode B.

### Mode M — Module Orchestration

Use when a new module declared in `module-map.md` is being established, when a module needs re-framing before further slice delivery, or when a module nears release and requires release-readiness verification.

Purpose:
- declare the module as a bounded delivery stream,
- establish module-scope baseline trust (terminology, source authority, module-scope conflicts) at Gate M1a — owned by `agents/modules/Module{Corpus,Terminology,Conflict}*` roles (absorbed from pre-v2.0.0 `agents/onboarding/*`),
- frame analytical, UX, and architectural inputs into a coherent module-level plan,
- author a slice map enabling safe parallel Mode B delivery,
- verify module-release readiness.

Mode M sits between Mode P and Mode B for each module. It does not implement product code. Each downstream slice continues through Mode B, entering through Gate B0 (slice-readiness check).

Mode M reads only the module-relevant subset of `_ar/**` (filtered by `modules:` frontmatter). Program-wide corpus reading is a Mode P Gate P1 activity.

---

## Read Policy

Read the minimum needed.

Always read first:
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/trigger-matrix.md`
- `docs/governance/definition-of-done.md`

Read next only as needed:
- `docs/governance/impact-classes.md`
- `docs/governance/mode-c.md` when Mode C is active
- `docs/governance/mode-m.md` when Mode M is active
- `docs/governance/mode-p.md` when Mode P is active
- `docs/governance/local-tooling-contract.md` when local tooling is relevant
- relevant `docs/program/*` for program or module-level work
- relevant `_ar/BA/**` and `_ar/UX/**` canonical authored docs (filter by slice manifest `touches:` or module `modules:` frontmatter; never broad-scan)
- relevant `specs/<module>/module-brief.md`, `module-plan.md`, `slice-map.md`, `module-risks.md` for module / slice-level work
- relevant files in `specs/<module>/slices/<slice>/`
- relevant role files in `agents/**` (`agents/program/**`, `agents/modules/**`, `agents/ux/**`, plus existing `agents/core/**`, `agents/issues/**`, `agents/optional/**`)

Do not scan the repo broadly by default.
Do not replace missing knowledge with guesses.

After the spec-creator subagent has authored `spec.md` / `plan.md` / `tasks.md`, the main session must read only `specs/<feature>/handoff.md` for orchestration. The full `spec.md` / `plan.md` / `tasks.md` remain on disk for implementer and reviewer subagents to read in their own isolated context. The main session re-reads them only when a reviewer surfaces a finding that requires spec-level adjudication, and even then only the relevant section.

---

## Local Authoring Support

Two optional local-only root folders may exist:

- `toolingDocs/`
- `toolingTemplates/`

They are local authoring support only.
They are not source of truth.
They are lower authority than constitution, governance docs, canonical repository artifacts, and approved feature artifacts.

Use them only when all of the following are true:
- the current work needs layer-specific documentation rules or templates,
- the canonical documentation layer has already been resolved,
- the exact target file is known,
- the read is necessary for safe authoring.

Allowed usage pattern:
- resolve the target layer first,
- then read only the exact corresponding file,
- e.g. `toolingDocs/rules-EN.md` or `toolingTemplates/template-UC.md`.

Forbidden usage pattern:
- broad scanning of `toolingDocs/`
- broad scanning of `toolingTemplates/`
- treating local tooling as higher authority than repo governance
- using local tooling to silently override canonical repository expectations

If local tooling is needed but missing:
- use repository fallback artifacts if they exist,
- otherwise stop and surface the missing prerequisite.

---

## Routing Policy

Route by **effect**, not by wording.

Use **minimal sufficient routing**.
When multiple triggers apply, **highest risk wins**.

Do not trigger onboarding roles for ordinary feature work.
Do not route a request as local/UI-only if contract, permissions, tenancy, runtime, or cross-client impact may exist.

If ambiguity materially affects scope, acceptance, contract meaning, permissions, tenancy, runtime behavior, cross-client behavior, or safe documentation amendment, clarification is required before planning or implementation.

If the operator-selected input is a comment/issue rather than a delivery request, prefer Mode C first.

---

## Workflow

### Mode P — Program Bootstrap Workflow

Follow this sequence:

1. (when re-framing) Gate P-R — re-frame authorization with explicit rationale
2. Gate P0 — draft or amend `docs/program/project-brief.md`
3. Gate P1 — draft or amend `docs/program/architecture-overview.md`
4. Gate P2 — draft or amend `docs/program/module-map.md`
5. (optional) Gate P3 — draft `docs/program/implementation-streams.md` when parallel delivery is non-trivial

Mode P never authors module-level or slice-level artifacts.
Mode P never creates branches.
Re-runs require Gate P-R before any existing program artifact may be amended.

### Mode M — Module Orchestration Workflow

Follow this sequence:

1. Gate M0 — module declaration against `module-map.md`
2. Gate M1a — module-scope baseline (owned by `agents/modules/Module{Corpus,Terminology,Conflict}*` roles)
3. Gate M1b — module framing (`module-brief.md` + initial canonical seeds: EN, BR, ES, ARCH in `_ar/BA/`)
4. Gate M2 — behavior & UX framing (WIRE in `_ar/UX/WIRE/`, UC/QUERY/JOB/CS in `_ar/BA/`)
5. Gate M3 — module architecture and slice map (`module-plan.md`, `slice-map.md`, `module-risks.md`, plus COMP/COPY in `_ar/UX/`, API/ACL in `_ar/BA/` when relevant)
6. Gate M4 — module release readiness (`module-staging-readiness.md`) — only when all slices are merged or deferred

Mode M never implements product code.
Mode M never creates branches.
Each downstream slice continues through Mode B Gate B0.

### Mode B — Feature Delivery Workflow

Follow this sequence:

1. Gate B0 — slice-readiness check (verify §17.3 prerequisites from `slice-map.md`)
2. classify the request and confirm Mode B
3. run constitution check
4. create or refine `spec.md` (must include slice manifest `touches:` block in frontmatter listing all `_ar/` docs the slice creates, updates, or references)
5. resolve or record material ambiguity
6. create or refine `plan.md` when required
7. trigger specialist analysis when required
8. create or refine `tasks.md`
9. implement only approved scoped tasks (may author/amend `_ar/` docs declared in slice manifest; `_REGISTRY.md` updates atomic with new doc_ids)
10. create or refine `qa-checklist.md`
11. create or refine `runtime-notes.md`
12. produce `review.md` with explicit verdict (must address each declared `_ar/` change)

Gate B0 is a hard prerequisite. If slice-readiness fails, the slice returns to Mode M (M1 / M2 / M3 depending on missing prerequisite).
Implementation without specification is forbidden.
Implementation without plan is forbidden when plan is required.
Implementation without required specialist artifacts is forbidden.
`_ar/` changes outside slice manifest declaration are scope violations and must be blocked at review.

### Mode C — Comment Intake / Slice Seeding Workflow

Follow this sequence:

1. confirm operator intent and selected comment/issue
2. classify the comment and normalize the problem
3. resolve the affected canonical documentation layer
4. resolve exact local tooling files only if needed
5. create the upstream documentation amendment, then apply it to the canonical document using always English when the amendment targets an existing canonical document and no conflict/blocked state prevents application
(Mode C Gate C3 is not complete for correction or clarification amendments until the canonical document is updated, unless the run is explicitly blocked, conflict-noted, or producing a new draft artifact instead of patching an existing canonical file.)
6. decide outcome:
   - doc fix only
   - open question
   - existing slice extension
   - new slice candidate
   - reject / close
7. if promoted, prepare a Mode B handoff package

Mode C must not:
- implement feature code,
- create a feature branch,
- skip the documentation amendment step when upstream truth is affected,
- or jump directly into normal feature delivery without an explicit handoff.

---

## Canonical Authored Documentation (`_ar/**`)

`_ar/**` is the canonical authored documentation library for the project. It is the **single source of truth** for analytical and UX canonical content.

Structure:
- `_ar/BA/<layer>/` — business analysis canonical layer (EN, UC, BR, ARCH, FN, ES, JOB, QUERY, ACL, API, CS, MSG)
- `_ar/UX/<layer>/` — user experience canonical layer (IA, WIRE, COMP, COPY)
- each layer folder has `_REGISTRY.md` tracking reserved `doc_ids`, status (`reserved` | `draft` | `canonical` | `deprecated`), and owning mode

Each canonical doc has frontmatter declaring:
- `doc_id` (e.g. `EN0001`, `WIRE0014`)
- `canonical_layer` (e.g. `EN`, `WIRE`)
- `status`
- `modules:` (list of module slugs that reference this doc)
- `references:` (list of cross-layer `doc_id`s this doc points to)

Authority to author:
- **Mode P** (Gate P1): program-wide foundational docs (project-level IA in `_ar/UX/IA/`, foundational EN/ARCH/BR shared by all modules)
- **Mode M** (Gate M1a / M1b / M2 / M3): module-scope docs (UC, FN, ES, WIRE, COMP, COPY refinements for the module)
- **Mode B**: docs declared in slice manifest (`touches:` block in `spec.md`) — may create new `doc_ids` and amend existing docs, **may not** introduce the first doc in a canonical layer for a module
- **Mode C**: amendments via `source-amendment.md` artifact

Reading:
- Filter by slice manifest `touches:` or module `modules:` frontmatter
- Never broad-scan `_ar/**` outside Mode P Gate P1 (program-wide baseline)
- Cross-references between docs use `doc_id` (e.g. `references: [UC0001, EN0014]`) — must resolve to existing docs (no dangling refs)

`docs/baseline/` from pre-v2.0.0 is removed — `_ar/**` IS the canonical authored truth, no derived baseline layer is needed.

---

## Canonical Documentation Layer Rule

When work amends or creates upstream documentation, determine the canonical layer before writing.

Examples:
- entity meaning, lifecycle, invariants, relationships → `EN`
- actor-triggered behavior and numbered flow → `UC`
- cross-entity or system-wide deterministic rule → `BR`
- FE-first runtime evidence and reconstruction scenario → `CS`
- capability description → `FN`
- interface contract → `API`
- access model → `ACL`
- read-side semantics → `QUERY`
- background contract → `JOB`
- external system boundary → `ES`
- transactional message contract → `MSG`
- structural system view → `ARCH`
- information architecture: screen map, navigation, entry points → `IA`
- screen-level layout and interaction spec → `WIRE`
- component contract, variants, accessibility → `COMP`
- user-facing copy: labels, helpers, empty states, CTAs → `COPY`

Do not mix layers casually.
Do not write flows into BR.
Do not write implementation into EN, UC, ARCH, FN, API, ACL, QUERY, JOB, ES, MSG, IA, WIRE, COMP, or COPY documents when the layer rules forbid it.

Note: rules and templates for IA, WIRE, COMP, COPY layers are introduced by Batch 4 of the foundation amendment (`toolingDocs/rules-{IA,WIRE,COMP,COPY}.md` and `toolingTemplates/template-{IA,WIRE,COMP,COPY}.md`). Until Batch 4 lands, these layers are registered as canonical but their authoring rules are pending.

---

## Protected-Area Rule

Treat the following as protected by default:
- authentication and identity
- ACL / permissions
- tenancy / scoping
- shared contract
- data model / schema-sensitive behavior
- jobs / async / retry / idempotency
- external integrations
- infrastructure-sensitive behavior
- architecture boundaries

If a change may touch a protected area:
- name it explicitly,
- classify it explicitly,
- activate required downstream artifacts and specialist routing,
- keep uncertainty visible,
- block implementation until prerequisites exist.

Protected-area changes must never be hidden inside a “small”, “local”, “UI-only”, or “doc-only” request when the actual effect is broader.

---

## Scope Rule

All work must remain traceable to:
- the request,
- the selected mode,
- the approved spec and plan in Mode B,
- or the approved comment-intake and amendment path in Mode C,
- and the assigned tasks when tasks exist.

Do not widen scope silently.
Do not add unrelated cleanup, refactors, or documentation rewrite during delivery.
Do not absorb adjacent issues into the feature by default.

If adjacent work is discovered, record it as:
- follow-up,
- risk,
- debt,
- future feature candidate,
- or separate comment-intake outcome.

If the change no longer fits as one bounded unit, reclassify, split, seed a future slice, or block it.

---

## Lightweight Handling

Use lightweight handling only when all of the following are true:
- impact is clearly low,
- no protected area is touched,
- contract assumptions remain unchanged,
- runtime verification is straightforward,
- the lighter path is explicitly justified.

Lightweight handling may reduce clarification depth, planning depth, and review overhead.
It may not bypass:
- constitution check,
- scope discipline,
- uncertainty honesty,
- runtime note quality,
- canonical layer resolution when upstream docs are being amended.

---

## Slice Sizing Discipline

Every slice lives inside a module and must pass Mode B Gate B0 (slice-readiness check per §17.3 constitution) before entering the rest of the Mode B sequence. Slice prerequisites are recorded in the module's `slice-map.md`.

Every Mode B slice must be small enough to take from spec → implementation → review → merge in a single fresh Claude Code session, without context pressure forcing a hand-off.

Hard caps for normal feature slices:

- `spec.md` ≤ 120 lines
- `plan.md` ≤ 150 lines
- `tasks.md` ≤ 80 lines
- `handoff.md` ≤ 30 lines
- Implementation diff ≤ 12 source files (excluding generated/codegen output)
- Exactly one acceptance criterion tied to one user-observable outcome

If the slice as defined exceeds any cap, the spec-creator subagent must return a `split-recommendation.md` instead of authoring `spec.md`/`plan.md`/`tasks.md`. Splits become sequential sub-slices `{slice-id}-a`, `{slice-id}-b`, etc. Each sub-slice has its own folder, its own branch, its own commit, and merges to develop before the next sub-slice begins.

Per-class slice size targets: see `docs/governance/impact-classes.md` § 13.1.

Adjacent work discovered during implementation is recorded as follow-up, never absorbed.

---

## Hard Stops

Stop or block the affected lane when:
- protected-area impact is suspected but unresolved,
- a required artifact is missing,
- contract impact is unclear,
- spec, plan, tasks, or specialist notes materially disagree,
- comment classification is unclear but a documentation amendment is being attempted,
- canonical documentation layer cannot be resolved safely,
- required local tooling or fallback authoring guidance is missing,
- the current plan no longer matches the real work,
- runtime evidence is too weak for honest completion,
- the request is actually strategic or architecture-sensitive.

### Program-level hard stops

- Mode M cannot start without `docs/program/module-map.md` containing the target module
- Mode M cannot start without Mode P Gate P1 baseline complete (program-wide terminology, source authority, foundational `_ar/BA/` seeds)
- Mode P re-run cannot proceed without Gate P-R authorization when existing program artifacts will be amended

### Module-level hard stops

- Mode M Gate M1b cannot start without Gate M1a completion (module-scope baseline before framing)
- Mode M Gate M2 cannot start without Gate M1 completion
- Mode M Gate M2 cannot start without project-level IA (`_ar/UX/IA/IA-<project>.md`) when module has user-facing surfaces
- Mode M Gate M3 cannot start without Gate M2 completion (when module has user-facing surfaces)
- Mode M Gate M4 cannot start with any open slice work in `slice-map.md`
- Slice map violating slice sizing discipline without split decomposition

### Slice-level hard stops

- Mode B Gate 2 (constitution check) cannot start without Gate B0 pass
- Mode B implementation cannot proceed without slice manifest (`touches:` block in spec.md)
- `_ar/` change without declaration in slice manifest, module-plan, or source-amendment is a scope violation and must be blocked at review
- New `_ar/` `doc_id` without `_REGISTRY.md` update in same commit is malformed and blocks merge
- Dangling cross-references between `_ar/` docs (referenced `doc_id` does not exist) block slice DoD
- No branch may be created before the slice has passed Gate B0
- No commit may be made without the gate sequence preceding it

All hard stops use named missing artifacts in messaging. No polite warnings — name the missing prerequisite explicitly.

Blocked is a valid control state.
Do not continue through a blocked dependency as if it were resolved.

---

## Minimum Artifacts

### For program initialization (Mode P), keep visible:
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md` (includes program-wide baseline section — terminology, source authority, conflicts)
- `docs/program/module-map.md`
- `docs/program/implementation-streams.md` when parallel delivery is non-trivial
- `docs/program/re-frame-authorization.md` when Mode P is re-run
- `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/_REGISTRY.md` — registry skeletons (initialized empty)
- `_ar/UX/{IA,WIRE,COMP,COPY}/_REGISTRY.md` — registry skeletons (initialized empty)
- foundational `_ar/BA/EN/`, `_ar/BA/ARCH/`, `_ar/BA/BR/` content when program-wide entities/architecture/rules are identified
- `_ar/UX/IA/IA-<project>.md` when program has user-facing surfaces (Gate P-UX)
- `docs/program/spec/` — optional program-level working drafts (not authoritative)

### For module orchestration (Mode M), keep visible:
- `specs/<module>/module-brief.md`
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md`
- `specs/<module>/module-risks.md`
- `specs/<module>/module-staging-readiness.md` before module release
- `specs/<module>/spec/` — optional module-level working drafts (not authoritative)

Canonical authored content lives in `_ar/`, not `specs/<module>/`:
- module-scope `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/` with `modules:` frontmatter
- module-scope `_ar/UX/{WIRE,COMP,COPY}/` with `modules:` frontmatter

### For normal feature delivery (Mode B), keep visible:
- `spec.md` (must include slice manifest `touches:` block in frontmatter)
- `plan.md` when required
- `tasks.md`
- `handoff.md` — compact (≤ 30 lines) summary that the main session reads in place of the full spec/plan/tasks; authored by the spec-creator subagent (see § Subagent Policy → Spec creation)
- `qa-checklist.md`
- `runtime-notes.md`
- `review.md` (must address each `_ar/` change declared in slice manifest)
- `spec/` — optional per-slice working drafts subfolder (not authoritative)

Add when triggered:
- `open-questions.md`
- `schema-impact.md`
- `contract-notes.md`
- `acl-notes.md`
- `query-notes.md`
- `job-notes.md`

### For Mode C, keep visible:
- `comment-intake.md`
- `source-amendment.md` or equivalent upstream amendment artifact
- `slice-seed.md` when promoting future Mode B work
- `mode-b-handoff.md` when handoff is prepared
- `open-questions.md` when material ambiguity remains

A delivery summary may help, but it does not replace required artifacts.

---

## Runtime Vocabulary

Use these words precisely:
- `buildable`
- `runnable`
- `locally verifiable`
- `demoable`

Never collapse them into “works”.

State explicitly:
- what was built,
- what was run,
- what was actually verified,
- what environment assumptions apply,
- what remains unverified,
- what a human must still check.

Do not hide missing credentials, missing infrastructure, manual seeding, or provider dependency.

---

## Confidence Vocabulary

Use these labels when relevant:
- `confirmed`
- `partial`
- `uncertain`
- `blocked`

Do not hide uncertainty behind confident language.

Confidence labeling is required whenever:
- contract impact is inferred,
- runtime state is incomplete,
- protected-area knowledge is incomplete,
- review cannot honestly claim full confidence,
- canonical layer resolution is inferred rather than confirmed,
- FE evidence and prior analytical context do not fully align.

---

## Review and Done

Every review must end with exactly one verdict:
- `accept`
- `revise`
- `block`

Review must check:
- spec alignment,
- plan alignment,
- scope discipline,
- protected-area safety when relevant,
- contract consistency when relevant,
- runtime honesty,
- whether the claimed result is actually reviewable.

A feature is not done because:
- code exists,
- tasks were checked off,
- a branch exists,
- a local path looked plausible.

A feature is done only when:
- required artifacts exist,
- implementation stayed in scope,
- required specialist analysis exists,
- QA thinking is visible,
- runtime status is explicit,
- blockers and limitations are visible,
- final review verdict is `accept`.

Mode C does not produce “feature done”.
Mode C produces either:
- a closed documentation outcome,
- or a prepared handoff into future Mode B work.

Do not imply production readiness because code exists.

---

## Exceptions

Exceptions are allowed only explicitly.

Any exception record must state:
- the rule being relaxed,
- the reason,
- the scope,
- the duration,
- the extra review required.

Temporary exceptions must not silently become normal practice.

---

## Boundary of This File

Keep in `CLAUDE.md`:
- session-level behavior
- read order
- routing posture
- mode selection
- workflow
- stop rules
- artifact minimums
- safe use of local authoring support
- shared vocabulary

Keep in `agents/core/**`:
- core delivery roles for Mode B (cross-mode reusable)

Keep in `agents/program/**`:
- Mode P program bootstrap and Gate P1 program-wide baseline roles (ProgramBootstrapper, ArchitectureOverviewAuthor, ModuleMapAuthor, ImplementationStreamsAuthor, ProgramCorpusCurator, ProgramTerminologyResolver, ProgramConflictMapper)

Keep in `agents/modules/**`:
- Mode M module orchestration and Gate M1a module-scope baseline roles (ModuleFramer, ModulePlanAuthor, SliceMapAuthor, ModuleStagingVerifier, ModuleRiskAuditor, ModuleCorpusCurator, ModuleTerminologyResolver, ModuleConflictMapper)

Keep in `agents/ux/**`:
- UX canonical-layer roles (IAAuthor for Mode P Gate P-UX; WireframeAuthor, ComponentSpecAuthor, CopySpecAuthor for Mode M Gate M2/M3)

Keep in `agents/onboarding/**` (deprecated v2.0.0):
- legacy roles from pre-v2.0.0 Mode A; superseded by agents/program/ and agents/modules/ Module/Program-prefixed variants. Folder retained until Batch 5 cleanup.

Keep in `agents/issues/**`:
- Mode C roles for comment intake, canonical layer resolution, documentation amendment, and slice seeding

Keep in `agents/optional/**`:
- optional specialists or supporting roles not always active

Keep in governance docs:
- constitutional rules
- operational guardrails
- impact classes
- routing matrices
- definition of done
- Mode C governance details
- local tooling contract

Do not turn this file into a second constitution, a second trigger matrix, or a compressed agent catalog.

---

## Subagent Policy

Use subagents to isolate context-heavy preparatory work from the main session. The main session is an orchestrator; it does not author spec artifacts, edit production code during implementation lanes, or load full spec/plan/tasks into context after authoring.

### Model selection rule

- **opus**: every subagent that edits files. This includes `spec-creator`, per-lane `implementer`, all reviewers (Spec Alignment, Code Quality, Simplicity), and any closure-doc author (`qa-checklist.md`, `runtime-notes.md`, `review.md`).
- **haiku**: only the `test-runner` subagent and read-only verification subagents (e.g. pre-flight grep-and-report). Haiku must never be invoked for any subagent that edits files.
- **sonnet**: not used in this workflow.

Self-escalation across model tiers is not used. If a subagent fails a lane gate, the main session re-spawns the same agent type at the same model tier with corrected instructions, not a stronger model.

### Program bootstrap

Program-level artifacts must always be created by a worktree subagent, never inline in the main session.

When starting a new project (or re-framing through Gate P-R), spawn the `program-bootstrap` subagent (registered in `.claude/agents/program-bootstrap.md`, colour blue, model opus).

Use `description: "Program Bootstrap: {project-id}"`.

The program-bootstrap subagent reads `docs/governance/mode-p.md` from disk in its own isolated context and drives Gates P-R / P0 / P1 (program-wide baseline absorbed from pre-v2.0.0 Mode A) / P-UX (project-level IA) / P2 / P3.

### Module orchestration

Module-level artifacts must always be created by a worktree subagent, never inline in the main session.

When starting a new module or refreshing module framing, spawn the `module-orchestrator` subagent (registered in `.claude/agents/module-orchestrator.md`, colour magenta, model opus).

Use `description: "Module Orchestrator: {module-id}"`.

The module-orchestrator produces `module-brief.md`, `module-plan.md`, `slice-map.md`, `module-risks.md`, and authors module-scope canonical content in `_ar/BA/**` and `_ar/UX/**`. Gate M1a module-scope baseline uses `ModuleCorpusCurator`, `ModuleTerminologyResolver`, `ModuleConflictMapper` from `agents/modules/`. UX artifact authoring (wireframes, components, copy) uses dedicated UX subagents in `agents/ux/**` invoked separately. Project-level IA is consumed from `_ar/UX/IA/IA-<project>.md` (authored by Mode P Gate P-UX, not Mode M).

### Slice-readiness verification

Before each Mode B run, spawn the `slice-readiness-verifier` subagent (read-only, registered in `.claude/agents/slice-readiness-verifier.md`, colour green, model haiku).

Use `description: "Slice Readiness: {slice-id}"`.

Returns pass/fail for §17.3 slice-ready prerequisites. On fail, the main session routes back to Mode M (M1 / M2 / M3 depending on missing prerequisite) before retrying Mode B.

### Spec creation

Spec artifacts must always be created by a worktree subagent, never inline in the main session. This is mandatory — no exceptions for "small" or "trivial" slices.

When starting a new slice (Mode B), spawn a worktree subagent to create spec artifacts. This keeps governance doc reading and codebase scanning out of the main session context.

Follow the prompt template and workflow in `.claude/agents/spec-creator.md`.

Use `description: "Spec Creator: {slice-id}"` so the terminal shows a clear agent name.

Do not create `spec.md`, `plan.md`, `tasks.md`, or `handoff.md` directly from the main session.

The main-session prompt to the spec-creator must be ≤ 60 lines and reference authority files by path, not paste their content. The agent reads authority from disk in its own isolated context.

The spec-creator must produce `handoff.md` alongside `spec.md` / `plan.md` / `tasks.md`. If the planned scope exceeds the size caps in § Slice Sizing Discipline, the spec-creator must instead produce `split-recommendation.md` and stop.

### Implementation lanes

Implementation work runs in per-lane subagents, not inline in the main session.

Follow the prompt template in `.claude/agents/implementer.md` (registered subagent `implementer`, colour cyan, model opus).

Spawn one subagent per implementation lane (typically L1, L3, L4 per `plan.md`). Each subagent receives:
- `handoff.md` content (verbatim) plus the lane-specific tasks from `tasks.md` and the lane gate definition from `plan.md`.
- a clear list of files it is allowed to edit and the out-of-scope guard from `plan.md`.

Use `isolation: "worktree"` and `model: "opus"`. Use `description: "Implementer L{N}: {slice-id}"`.

The implementer subagent must run `npx biome check --write` on the files it touched plus the lane-gate checks (typecheck/build/test as defined in `plan.md`) before signing off, and return a structured pass/fail report. The main session triages the report and either advances to the next lane or re-spawns the failed lane with corrected instructions.

The codegen lane (typically L2) is the only exception: it runs as a single command from the main session because there is no editing decision involved.

The main session does not read the full source diff during implementation. It reads the implementer subagent's pass/fail report and the file change list. Full-diff inspection happens in the reviewer subagents.

### Post-implementation checks

After implementation is complete, run two subagents before committing:

Spawn all four agents in a single message (parallel tool calls):

**Test Runner** — runs all checks (Biome, typecheck, builds, tests). Returns a pass/fail report.

Follow the prompt template in `.claude/agents/test-runner.md`.

Use `model: "haiku"` and `description: "Test Runner: {slice-id}"`.

**Three Reviewers** — each focused on one area, each its own registered subagent with its own colour for visual distinction when running in parallel.

Each uses `isolation: "worktree"` and `model: "opus"`.

| Reviewer file | Subagent | Colour | Description | Focus |
|---|---|---|---|---|
| `.claude/agents/reviewer-spec-alignment.md` | `reviewer-spec-alignment` | yellow | `"Review Spec: {slice-id}"` | Acceptance criterion met/not met, scope creep, out-of-scope guards |
| `.claude/agents/reviewer-code-quality.md` | `reviewer-code-quality` | orange | `"Review Quality: {slice-id}"` | Patterns, imports, consistency, edge cases, accessibility |
| `.claude/agents/reviewer-simplicity.md` | `reviewer-simplicity` | purple | `"Review Simplicity: {slice-id}"` | Over-abstraction, unused code, unnecessary complexity |

**Handling output:**
- Collect all four reports, deduplicate findings.
- **fix-now** items: fix immediately, then re-run test runner only.
- **backlog** items: record in the spec folder or `docs/audit/progress.md`.
- Commit only when test runner passes and all three reviewer verdicts are `accept` or `accept-with-backlog`.
- If any reviewer verdict is `revise`, fix issues and re-run only the affected reviewer(s) + test runner.

Always run Biome (`npx biome check --write`) on changed files before spawning agents.

### Worktree cleanup

After any subagent that uses `isolation: "worktree"`, the main session must clean up:

```
git worktree remove --force <worktree-path>
git branch -D <worktree-branch>
```

Both values (`worktreePath`, `worktreeBranch`) are returned in the agent result. Clean up immediately after copying any needed files — do not leave stale worktrees or branches.

---

## Git Workflow

Each feature slice follows a branch lifecycle tied to the delivery workflow.

### Remote

Remote repository: `https://github.com/OndrejSuhaj/pipeliner.git`

Local and remote must stay 1:1. Push only when the user explicitly requests it.

### Branch naming

`{module}/phase{N}-{NN}-{feature-slug}` — derived from the slice map in `specs/<module>/slice-map.md`. The `{module}` prefix is the module slug (e.g. `core`, `payments`, …) as declared in `docs/program/module-map.md`.

Branch creation hard-stops:
- no branch may be created before the module is declared in `module-map.md`
- no branch may be created before the slice exists in `slice-map.md`
- no branch may be created before the slice has passed Mode B Gate B0 (slice-readiness)

### Commit convention

- Commit 1 (spec): `{branch-name}: specification and planning artifacts`
- Commit 2 (impl): `{branch-name}: {concise description of implementation}`

### Pre-commit progress update

Before every commit, update spec artifacts to reflect completed work:
- Mark completed items in `tasks.md`
- Update relevant progress-tracking documents (e.g. `docs/audit/progress.md`)

This ensures progress is captured in the commit itself and visible to all contributors in future sessions.

### Gates

All gates require explicit user approval:

1. **Spec → branch creation:** After spec artifacts are approved, user must explicitly request branch creation. Do not create a branch before user approval.
2. **Branch created → spec commit:** Immediately after branch creation, commit all spec artifacts as the first commit.
3. **Implementation complete → merge:** User must signal "done" before merging. On "done" signal: commit implementation, fast-forward merge branch to develop (`git merge --ff-only`). Never merge directly to main.

### Prohibited

- Creating a branch before spec approval
- Committing without user gate
- Force push
- Merging without explicit "done" signal
- Amending published commits

### After merge

After merging to develop, the feature branch is deleted, remote branch is deleted (`git push origin --delete {branch-name}`), and the working tree returns to develop.

Mode C must not create branches or commits unless and until work is explicitly promoted into a normal Mode B feature slice and the user opens the corresponding git gate.

---

## Default Session Stance

Prefer:
- narrower scope over accidental redesign,
- visible escalation over optimistic continuation,
- explicit blocker over fake certainty,
- disciplined honesty over artificial fluency,
- upstream documentation amendment before speculative feature delivery when comments/issues challenge current source truth.
