# Mode M — Module Orchestration

## Purpose

Mode M is a governed module-level orchestration mode.

It exists to:
- declare a module as a bounded delivery stream within an existing program scope,
- establish module-level baseline trust (terminology, source authority, conflict register within the module's scope),
- frame the module's analytical, UX, and architectural inputs into a coherent module-level plan,
- author a slice map enabling safe parallel Mode B delivery,
- and verify module-release readiness when the module nears completion.

Mode M is **not** a slice-level implementation mode (that is Mode B).
Mode M is **not** a replacement for Mode B.
Mode M is **not** a program bootstrap mode (that is Mode P).
Mode M is **not** a comment intake mode (that is Mode C).
Mode M is **not** a way to bypass slice-level governance.

Module-level baseline duties (terminology, source authority, conflicts within the module's scope) belong to Mode M Gate M1a. Program-wide baseline is handled by Mode P Gate P1.

---

## Position in the Overall Operating Model

The repository has four operating modes:

- **Mode P — Program Bootstrap**
- **Mode B — Feature Delivery** (default)
- **Mode C — Comment Intake / Documentation Amendment / Slice Seeding**
- **Mode M — Module Orchestration** (this document)

Mode M sits **between Mode P and Mode B** for each module. It is the natural carrier of multiple Mode B slices within a single module's lifecycle.

Typical flow:

`Mode P (program bootstrap + program-wide baseline) → Mode M (per module, incl. module-scope baseline) → Mode B (per slice, entering through Gate B0)`

Mode M is appropriate when:
- a new module declared in `module-map.md` is being established,
- multiple roles (analyst, UX, architect, BE, FE) will operate in parallel on the same module,
- a module nears release and requires release-readiness verification,
- existing module needs re-framing before further slice delivery.

Mode M is **not** appropriate when:
- the work is program-level — use Mode P,
- the work is a single bounded slice with module-level prerequisites already met — go straight to Mode B Gate B0,
- the work is a comment or issue intake — use Mode C.

---

## Core Principles

Mode M inherits the repository principles and adds the following local discipline:

1. **Module is a bounded delivery stream**
   Module scope is declared in `module-brief.md` and constrained by `module-map.md`. Mode M does not silently expand it.

2. **Module baseline before module framing**
   Gate M1a (terminology, source authority, conflict register) must complete before Gate M1b (module-brief, initial analysis). No silent skipping.

3. **Slice-readiness before Mode B**
   Every slice must have explicit `slice-ready` prerequisites recorded in `slice-map.md` (per §17.3 constitution) before Mode B Gate B0 may pass.

4. **Parallel work coordinated through slice map**
   Multiple slices may run in parallel through Mode B only when `slice-map.md` declares their dependencies as resolvable.

5. **No implementation in Mode M**
   Mode M never implements product code, never opens implementation lanes, and never claims slice completion.

6. **Module baseline scope is bounded**
   Mode M reads only the module-relevant subset of `_ar/**`. Program-wide baseline reading is a Mode P activity.

7. **Mode M may author module-scope `_ar/` content**
   Gate M1a authors module-scope canonical refinements; Gate M1b/M2/M3 author module-scope UC, FN, ES, WIRE, COMP, COPY in `_ar/`. Module-scope baseline roles live in `agents/modules/`.

---

## Typical Outcomes

Every Mode M run must end in exactly one explicit outcome:

- `module_declared` — Gate M0 completed
- `module_framed` — Gate M1 completed (baseline + framing)
- `slice_map_ready` — Gate M3 completed (module-plan + slice-map authored)
- `slice_handed_off_to_mode_b` — one or more slices verified `slice-ready`, handed to Mode B
- `module_release_ready` — Gate M4 completed (staging readiness verified)
- `blocked` — Mode M cannot proceed (missing inputs, unresolved conflict, unmet prerequisite)

---

## Non-Goals

Mode M must not become:
- a second implementation workflow,
- a hidden backlog factory,
- a free-form documentation rewrite mode,
- a program-level mode (it does not amend `docs/program/*`),
- a repository onboarding replacement,
- a way to bypass constitution, guardrails, or impact classification,
- a continuous re-planning loop after slice delivery starts.

---

## Entry Conditions

Mode M may start only when all of the following are true:
- `docs/program/module-map.md` exists and declares the target module,
- `docs/program/architecture-overview.md` exists with program-wide baseline complete (terminology, source authority, conflicts),
- foundational `_ar/BA/` content from Mode P exists (program-level EN/ARCH/BR seeds),
- the operator explicitly invokes Mode M for a named module (`Mode M for module:<name>`),
- the run can stay bounded to one module.

If these conditions are not met, stop and ask for clarification or route elsewhere (Mode P for missing module declaration or program-wide baseline).

---

## Inputs

Typical Mode M inputs:
- `docs/program/*` artifacts (program context, dependency graph),
- program-wide `_ar/BA/**` and `_ar/UX/IA/**` (foundational canonical content from Mode P),
- existing `specs/<module>/*` artifacts (if refresh, not initial),
- existing module-scope subset of `_ar/**` (filtered via `modules:` frontmatter field),
- operator intent (initial framing vs refresh vs slice-readiness check vs release readiness).

Optional supporting inputs:
- prior reviews of related modules,
- existing slice work in adjacent modules (for cross-module dependency context),
- comment intake outputs from Mode C that point to this module.

---

## Required Read Order in Mode M

Always read first:
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/trigger-matrix.md`
- `docs/governance/definition-of-done.md`
- this file

Read next only as needed:
- `docs/governance/impact-classes.md`
- `docs/governance/local-tooling-contract.md` when local tooling is used
- relevant `docs/program/*` artifacts
- program-wide `_ar/BA/**` foundational seeds (read selectively per module relevance)
- `_ar/UX/IA/IA-<project>.md` (project IA — required reading when module has user-facing surfaces)
- existing `specs/<module>/*` artifacts (when refreshing)
- module-scope subset of `_ar/**` (filter by `modules:` frontmatter)
- relevant role files in `agents/modules/**`, `agents/ux/**`, `agents/optional/**` (specialist routing)
- exact layer-specific rules/template files only after canonical layer resolution

Do not broad-scan the repository.
Do not broad-scan `_ar/**` (only module-relevant subset).
Do not broad-scan `toolingDocs/` or `toolingTemplates/`.

---

## Mode M Gate Sequence

### Gate M0 — Module Declaration

**Purpose:** Confirm the exact module being framed and its scope boundary against `module-map.md`.

**Owned by:** operator + `ModuleFramer` (in `agents/modules/`)

**Required result:** Stable module-id, scope boundary confirmed against `module-map.md`, dependencies on core and other modules explicitly named.

**Minimum output artifact:** `specs/<module>/module-brief.md` § Declaration section (1-pager: module-id, scope summary, dependencies)

**Required contents:**
- module-id (slug from `module-map.md`)
- one-paragraph scope summary
- declared dependencies on core and other modules
- declared integration boundaries
- entry confirmation from operator

**Stop if:**
- the module is not declared in `module-map.md`,
- `module-map.md` does not exist (run Mode P first),
- program-wide baseline (Mode P Gate P1) is missing or incomplete,
- scope overlaps with an existing module without explicit resolution,
- operator did not actually invoke for this specific module.

**Hands off to:** M1

---

### Gate M1 — Module Baseline & Framing

Gate M1 has two sub-gates that must complete sequentially: M1a (baseline) before M1b (framing). M1a establishes trust within the module's scope; M1b builds the module's framing on top of that trust.

#### Gate M1a — Module Baseline

**Purpose:** Establish module-scope baseline trust — module-scope terminology refinements (on top of program-wide glossary from Mode P), module-scope source authority verification, module-scope canonical conflicts.

**Owned by:** `ModuleCorpusCurator`, `ModuleTerminologyResolver`, `ModuleConflictMapper` (from `agents/modules/**`).

**Required result:** Module-scope baseline refinements exist on top of program-wide baseline; module-scope conflicts are surfaced; module terminology is stable enough for analytical authoring.

**Minimum output artifacts (module orchestration tier):**
- module-scope refinement notes embedded in `specs/<module>/module-brief.md` § Baseline section, OR
- `specs/<module>/module-brief.md` may delegate baseline summary to dedicated section, with conflicts surfaced as risk entries in `specs/<module>/module-risks.md`.

**Minimum output artifacts (canonical authored tier — `_ar/`):**
- module-scope EN/BR/ARCH refinements in `_ar/BA/{EN,BR,ARCH}/` with `modules:` frontmatter listing this module,
- module-scope conflict register entries in `_ar/BA/{EN,UC,BR}/<doc>.md` via `open_questions:` frontmatter or body sections,
- `_REGISTRY.md` updates in each touched canonical layer.

**Required reading:**
- relevant program-wide `_ar/BA/**` foundational docs (filtered by potential module relevance),
- `docs/program/architecture-overview.md` § program-wide terminology and source authority sections.

**Stop if:**
- program-wide baseline (Mode P Gate P1) is incomplete — return to Mode P,
- module-scope `_ar/` content cannot be safely authored,
- module-scope conflicts cannot be resolved (block until clarification),
- terminology refinements collide with program-wide canonical without resolution path.

**Hands off to:** M1b

#### Gate M1b — Module Framing

**Purpose:** Author the module-brief and initial analytical seeds (EN, BR, ES, ARCH) on top of the module baseline.

**Owned by:** `ModuleFramer` + analytical role calls (EN/BR/ES/ARCH authors from `agents/core/` and `agents/optional/`)

**Required result:** `module-brief.md` complete; central analytical entities and rules drafted in `_ar/BA/`; module architecture rámec aligned with `architecture-overview.md`.

**Minimum output artifacts:**
- `specs/<module>/module-brief.md` (full sections: purpose, scope, business value, key entities, key invariants, dependencies, non-goals)
- `_ar/BA/EN/<EN-id>-<name>.md` — central entities (with `modules:` frontmatter listing this module)
- `_ar/BA/BR/<BR-id>-<name>.md` — key cross-entity rules (when relevant)
- `_ar/BA/ES/<ES-id>-<name>.md` — external systems / integrations (when relevant)
- `_ar/BA/ARCH/<ARCH-id>-<name>.md` — module-scope architecture views (when relevant)
- `_REGISTRY.md` updates for each touched canonical layer

**Stop if:**
- module has no clear business purpose,
- central entities conflict with existing EN in `_ar/BA/EN/` (cross-module conflict) without resolution,
- ARCH rámec conflicts with `docs/program/architecture-overview.md`.

**Hands off to:** M2

---

### Gate M2 — Behavior & UX Framing

**Purpose:** Build the user-facing model of the module. Project-level IA (from Mode P Gate P-UX) is consumed and module-scope screens are detailed via wireframes. UC connects UI to deterministic behavior; QUERY/JOB cover read-side and background contracts.

**Owned by:** `WireframeAuthor` (from `agents/ux/`) + analytical role calls (UC, QUERY, JOB, CS authors)

**Required result:** Module-scope wireframes authored; UC coverage for every interactive screen; QUERY/JOB for every non-trivial read/background contract.

**Minimum output artifacts (canonical authored tier — `_ar/`):**
- `_ar/UX/WIRE/<WIRE-id>-<screen>.md` — per-screen wireframe specs (with `modules:` frontmatter and `realizes_uc:` cross-reference)
- `_ar/BA/UC/<UC-id>-<name>.md` — actor-triggered flows
- `_ar/BA/QUERY/<QUERY-id>-<name>.md` — read-side semantics (when relevant)
- `_ar/BA/JOB/<JOB-id>-<name>.md` — background contracts (when relevant)
- `_ar/BA/CS/<CS-id>-<name>.md` — FE-first scenarios (when relevant)
- `_REGISTRY.md` updates for `_ar/UX/WIRE/`, `_ar/BA/UC/`, `_ar/BA/QUERY/`, `_ar/BA/JOB/`, `_ar/BA/CS/`

**Required reading:**
- `_ar/UX/IA/IA-<project>.md` (project-level IA from Mode P — wireframes must align with IA screen map)

**Stop if:**
- IA from Mode P has no entry for screens being wireframed (return to Mode P Gate P-UX),
- WIRE shows element without data or function backing in `_ar/BA/` (UC, QUERY, EN coverage missing),
- critical happy path is missing.

**Hands off to:** M3

**Note:** Components and copy are authored in M3, not M2. M2 ends at wireframe + behavior framing.

---

### Gate M3 — Module Architecture & Slice Map

**Purpose:** Architect decides technical boundaries, technology choices, delivery sequencing. Slice map decomposes the module into bounded slices respecting slice sizing discipline. Components and copy are finalized at module-scope abstraction (per-slice details emerge in Mode B).

**Owned by:** architekt + `ModulePlanAuthor` + `SliceMapAuthor` + `ComponentSpecAuthor` + `CopySpecAuthor`

**Required result:** `module-plan.md` approved; `slice-map.md` has all slices declared with explicit prerequisites and dependencies; module-scope COMP and COPY exist in `_ar/UX/` when relevant.

**Minimum output artifacts (module orchestration tier):**
- `specs/<module>/module-plan.md` (architecture, technologies, delivery sequence, integration points)
- `specs/<module>/slice-map.md` (list of slices with impact-class estimate, dependencies, sequencing constraints, slice-readiness prerequisites)
- `specs/<module>/module-risks.md` (known risks, unresolved dependencies, mitigation plan)

**Minimum output artifacts (canonical authored tier — `_ar/`):**
- `_ar/UX/COMP/<COMP-id>-<name>.md` — module-scope reusable components (when module has reusable components; cross-module shared components may be authored here with `modules:` listing all consumers)
- `_ar/UX/COPY/<COPY-id>-<scope>.md` — module-scope copy (labels, validation, microcopy)
- `_ar/BA/API/<API-id>-<name>.md` — interface contracts (when relevant)
- `_ar/BA/ACL/<ACL-id>-<name>.md` — access model (when relevant)
- `_REGISTRY.md` updates for each touched layer

**Required contents (slice-map):**
- slice-id and slug per slice
- impact-class estimate (IC0–IC5)
- explicit prerequisites (analytical, UX, technical) per slice — references to `_ar/` `doc_id`s
- dependencies on other slices in the same module
- dependencies on other modules
- sequencing constraints (parallel-safe vs sequential)
- assigned implementer lane(s)

**Stop if:**
- slice map violates slice sizing discipline without split decomposition,
- `module-plan.md` decides on protected area without specialist analysis,
- known risks are neither mitigated nor explicitly accepted,
- dependency cycle exists in slice map.

**Hands off to:** Mode B (per slice, through Gate B0) + stored for M4

**Note:** M3 does not wait for all slices to run. Once `slice-map.md` is final, the module enters delivery phase and slices launch per dependency graph. M3 is a hand-off point, not a waiting point.

---

### Gate M4 — Module Release Readiness

**Purpose:** Before marking the module as release-ready, verify all slices are merged (or explicitly deferred), staging verification has happened, known gaps are visible, cross-module integration is verified.

**Owned by:** `ModuleStagingVerifier` + `ModuleRiskAuditor`

**Required result:** `module-staging-readiness.md` records staging evidence; all slices in `slice-map.md` have status `merged` or `deferred` (with reason); cross-module integration verified.

**Minimum output artifacts:**
- `specs/<module>/module-staging-readiness.md` (sections: deployed slices, staging URL, manual verification evidence, known gaps, cross-module integration status, release recommendation)
- updated `slice-map.md` with final slice statuses
- updated `module-risks.md` with remaining open risks

**Required contents (module-staging-readiness):**
- list of merged slices with merge commits
- list of deferred slices with deferral reasons
- staging environment URL and access details
- manual test evidence (per-slice or holistic)
- cross-module integration test evidence (when applicable)
- known gaps and limitations
- release recommendation: `release` | `defer` | `block`
- explicit operator confirmation requirement (release is a human decision)

**Stop if:**
- any slice is `in-progress` (M4 cannot run with open slice work),
- cross-module integration reveals contract conflict,
- staging verification is unreachable (missing staging env, missing credentials),
- protected-area changes lack release-time verification.

**Hands off to:** operator (release decision is human) or back to M3 (when release reveals need for new slices — triggers `slice-map.md` update and new slice cycles).

---

## Default Agent Set for `agents/modules/**`

Mode M uses a small, explicit set of module-level agents.

### Required

#### `ModuleFramer`
Owns Gate M0 and M1b. Drives module declaration and framing.

#### `ModuleCorpusCurator`
Owns Gate M1a corpus subset reading (module-scope).

#### `ModuleTerminologyResolver`
Owns Gate M1a module-scope terminology refinements on top of program-wide glossary.

#### `ModuleConflictMapper`
Owns Gate M1a module-scope canonical conflict mapping.

#### `ModulePlanAuthor`
Owns Gate M3 architecture component. Authors `module-plan.md`.

#### `SliceMapAuthor`
Owns Gate M3 slice map component. Authors `slice-map.md` with prerequisites.

#### `ModuleStagingVerifier`
Owns Gate M4. Verifies staging readiness.

#### `ModuleRiskAuditor`
Cross-cutting. Audits `module-risks.md` at M1, M3, M4.

---

## Default Agent Set for `agents/ux/**`

Mode M Gate M2 and M3 invoke UX canonical-layer roles.

### Required

#### `WireframeAuthor`
Owns wireframe authoring at Gate M2. Drafts `_ar/UX/WIRE/<WIRE-id>-<screen>.md` per screen.

### Conditional

#### `ComponentSpecAuthor`
Owns component spec authoring at Gate M3. Drafts `_ar/UX/COMP/<COMP-id>-<name>.md` per component.

#### `CopySpecAuthor`
Owns copy spec authoring at Gate M3. Drafts `_ar/UX/COPY/<COPY-id>-<scope>.md`.

**Note:** `IAAuthor` is owned by Mode P Gate P-UX (project-level IA). Mode M consumes the project IA but does not author it.

---

## Required Artifacts in Mode M

These artifacts are Mode M-specific and do not replace artifacts of other modes.

### Always when declaring module (module orchestration tier)
- `specs/<module>/module-brief.md`

### Always when M1 complete (canonical authored tier)
- module-scope EN/BR seeds in `_ar/BA/EN/`, `_ar/BA/BR/`
- module-scope refinements applied to relevant `_REGISTRY.md` files

### Always when framing complete (M3)
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md`
- `specs/<module>/module-risks.md`
- WIRE coverage in `_ar/UX/WIRE/` (when module has user-facing surfaces)

### When relevant
- `_ar/UX/COMP/<COMP-id>-<name>.md` (reusable components)
- `_ar/UX/COPY/<COPY-id>-<scope>.md` (non-trivial text content)
- `_ar/BA/UC/`, `_ar/BA/QUERY/`, `_ar/BA/JOB/`, `_ar/BA/ES/`, `_ar/BA/FN/`, `_ar/BA/API/`, `_ar/BA/ACL/`, `_ar/BA/MSG/`, `_ar/BA/CS/` (per analytical layer needed)

### Optional working drafts
- `specs/<module>/spec/` — module-level workshop notes, research, drafts (not authoritative)

### Before module release
- `specs/<module>/module-staging-readiness.md`

Mode M must not create:
- `spec.md`, `plan.md`, `tasks.md`, `qa-checklist.md`, `runtime-notes.md`, `review.md` (those are Mode B)
- `comment-intake.md`, `source-amendment.md`, `slice-seed.md` (those are Mode C)
- `project-brief.md`, `architecture-overview.md`, `module-map.md`, `_ar/UX/IA/IA-<project>.md` (those are Mode P)

---

## Routing and Impact Guidance

Mode M still follows repository routing discipline:
- classify by **effect**, not by wording,
- use **minimal sufficient routing**,
- **highest risk wins**,
- escalate uncertainty rather than guessing.

### Module-level impact classification

Module-level work has its own impact classification, parallel to slice-level IC0–IC5. The detailed definition lives in `docs/governance/impact-classes.md` (Batch 2 of the foundation amendment introduces it). At minimum:

- module touching a single protected area requires specialist routing,
- module touching multiple protected areas or cross-module contracts requires escalation,
- new modules with no existing precedent require explicit architecture-overview alignment.

If protected areas are implicated, Mode M may identify them but must not silently design the downstream slice solution. That belongs to Mode B per slice.

---

## Hard Stops in Mode M

Stop or block when:
- the target module is not declared in `module-map.md` (run Mode P),
- `docs/program/*` artifacts are missing or incomplete (run Mode P),
- program-wide baseline (Mode P Gate P1) is missing or incomplete,
- project-level IA (`_ar/UX/IA/IA-<project>.md`) is missing when module has user-facing surfaces (run Mode P Gate P-UX),
- module-scope baseline (Gate M1a) is being skipped or weakly executed,
- Gate M2 is being started before Gate M1 is complete,
- Gate M3 is being started before Gate M2 is complete (with declared scope of user-facing surfaces),
- Gate M4 is being attempted with any open slice work,
- slice map violates slice sizing discipline without split decomposition,
- cross-module dependency cycle is detected,
- protected-area implications exist but are being hand-waved,
- the work is actually program-level (escalate to Mode P) or slice-level (route to Mode B).

Blocked is a valid Mode M state.

---

## Handoff to Mode B (Gate B0)

A slice may enter Mode B Gate B0 only when:
- the slice is declared in `slice-map.md`,
- §17.3 slice-ready prerequisites are met:
  1. analytical inputs sufficient,
  2. UX inputs sufficient,
  3. technical dependencies explicit and resolved,
  4. scope within slice sizing discipline,
  5. acceptance criterion single and user-observable,
  6. implementer lane(s) clear,
- no upstream blocker is active in Mode M.

If Gate B0 fails, the slice returns to Mode M:
- missing analytical input → M1b refresh,
- missing UX input → M2 refresh,
- missing architectural decision → M3 refresh.

Mode M never creates a branch by itself.
Mode M never opens implementation lanes by itself.
Normal git gates remain a Mode B concern.

---

## Handoff back to Mode P

Mode M must hand back to Mode P when:
- module-level work reveals a program-level structural problem (cyclic dependency, scope conflict with another module, integration boundary mis-declaration),
- module scope no longer fits the program-level decomposition,
- a new module is implied that is not in `module-map.md`.

In all these cases, Mode M stops, surfaces the program-level issue, and waits for Mode P re-frame (through Gate P-R).

---

## Handoff back to Mode P (program-wide baseline refresh)

Mode M must hand back to Mode P when:
- module-scope baseline (M1a) reveals **program-wide** baseline problem (terminology unstable across multiple modules, source authority unclear across the program, foundational EN conflicts that affect multiple modules),
- program-wide `_ar/BA/**` is materially incomplete and refresh is needed.

In these cases, Mode M stops, surfaces the baseline problem, and waits for Mode P re-frame (through Gate P-R or P1 refresh).

---

## Relationship to Mode C

Mode C comment intake may land on module-level or program-level artifacts (not just slice-level / canonical doc).

When Mode C produces:
- `slice-seed` for a module → routed to that module's `slice-map.md` (Mode M Gate M3 refresh)
- `comment-intake` for a module-level artifact (`module-brief.md`, `module-plan.md`) → routed to Mode M for amendment
- `comment-intake` for a program-level artifact → routed to Mode P (through Gate P-R)

Cross-module comment routing detail is governed by `docs/governance/mode-c.md` (Batch 2 of the foundation amendment introduces module-aware routing).

---

## Relationship to Canonical Authored Documentation (`_ar/`)

`_ar/**` in v2.0.0 is canonical authored truth (flat per layer: BA/UX), not raw source corpus.

Mode M reads `_ar/**` only in a bounded way:
- Gate M1a reads program-wide foundational seeds (filtered by potential module relevance via `modules:` frontmatter),
- analytical authoring in M1b/M2/M3 reads only the docs cross-referenced from authored module content,
- broad corpus reading is a Mode P activity (program-wide baseline), not Mode M.

Mode M writes `_ar/**` for:
- module-scope EN/BR refinements (M1a/M1b),
- module-scope UC/QUERY/JOB/ES/FN/API/ACL/MSG/CS authoring (M2/M3),
- module-scope WIRE/COMP/COPY authoring (M2/M3),
- `_REGISTRY.md` updates atomically with each new `doc_id`.

Module-scope authoring must preserve:
- explicit `modules:` frontmatter listing the modules that reference this doc,
- cross-references to other `_ar/` docs via `doc_id` (no dangling references),
- inconsistencies and open questions (do not smooth them away),
- evidence boundaries (do not overclaim from partial sources).

---

## Quality Bar

A good Mode M result is:
- bounded to the declared module,
- baseline-first (M1a before M1b before M2),
- explicit about slice prerequisites and dependencies,
- honest about risks and gaps,
- traceable from `module-brief.md` through `slice-map.md` to each slice's prerequisites,
- easy to hand off to Mode B per slice.

A bad Mode M result is:
- silently expanding module scope,
- skipping M1a baseline,
- slice map without explicit prerequisites,
- module-plan that pre-decides slice-level implementation,
- protected-area implications hand-waved,
- release readiness claimed without staging evidence.

---

## Example Short Prompts

- `Mode M, declare module: payments`
- `Mode M, Gate M1a only for module:payments — establish baseline`
- `Mode M, Gate M2 only — IA and wireframes for module:onboarding`
- `Mode M, Gate M3 — author slice-map for module:reporting`
- `Mode M, Gate M4 — verify release readiness for module:billing`
- `Mode M, slice-readiness check for slice <slice-id> in module <module-name>`
- `Mode M, refresh slice-map after Mode C seed addition`
