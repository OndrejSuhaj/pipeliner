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
Mode M is **not** a repository onboarding mode (that is Mode A).
Mode M is **not** a program bootstrap mode (that is Mode P).
Mode M is **not** a comment intake mode (that is Mode C).
Mode M is **not** a way to bypass slice-level governance.

---

## Position in the Overall Operating Model

The repository has five operating modes:

- **Mode P — Program Bootstrap**
- **Mode A — Repository Onboarding**
- **Mode B — Feature Delivery** (default)
- **Mode C — Comment Intake / Documentation Amendment / Slice Seeding**
- **Mode M — Module Orchestration** (this document)

Mode M sits **between Mode P and Mode B** for each module. It is the natural carrier of multiple Mode B slices within a single module's lifecycle.

Typical flow:

`Mode P (program bootstrap) → Mode A (repo baseline) → Mode M (per module) → Mode B (per slice, entering through Gate B0)`

Mode M is appropriate when:
- a new module declared in `module-map.md` is being established,
- multiple roles (analyst, UX, architect, BE, FE) will operate in parallel on the same module,
- a module nears release and requires release-readiness verification,
- existing module needs re-framing before further slice delivery.

Mode M is **not** appropriate when:
- the work is program-level — use Mode P,
- the work is repository-level baseline — use Mode A,
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
   Mode M reads only the module-relevant subset of `_ar/**`. Full corpus reading is a Mode A activity.

7. **Reuse, not duplicate, onboarding roles**
   Gate M1a invokes existing `agents/onboarding/*` roles with module scope. No `agents/modules/Module*Onboarding` duplication.

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
- the operator explicitly invokes Mode M for a named module (`Mode M for module:<name>`),
- (when applicable) `docs/baseline/*` from Mode A exists for the repository,
- the run can stay bounded to one module.

If these conditions are not met, stop and ask for clarification or route elsewhere (Mode P for missing module declaration, Mode A for missing repo baseline).

---

## Inputs

Typical Mode M inputs:
- `docs/program/*` artifacts (program context, dependency graph),
- existing `specs/<module>/*` artifacts (if refresh, not initial),
- corpus subset `_ar/<module>/**` (if such organization exists),
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
- existing `specs/<module>/*` artifacts (when refreshing)
- relevant role files in `agents/modules/**`, `agents/ux/**`, `agents/onboarding/**` (M1a only), `agents/optional/**` (specialist routing)
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
- module-level Mode A baseline is required but missing (`docs/baseline/*`),
- scope overlaps with an existing module without explicit resolution,
- operator did not actually invoke for this specific module.

**Hands off to:** M1

---

### Gate M1 — Module Baseline & Framing

Gate M1 has two sub-gates that must complete sequentially: M1a (baseline) before M1b (framing). M1a establishes trust within the module's scope; M1b builds the module's framing on top of that trust.

#### Gate M1a — Module Baseline

**Purpose:** Establish module-level baseline trust — bounded corpus reading, module terminology, source authority within the module, module-scope conflicts.

**Owned by:** invoked `agents/onboarding/*` roles with **module scope** (CorpusCurator, TerminologyResolver, ConflictMapper, ArchitectureBaselineMapper). No duplication into `agents/modules/Module*Onboarding`.

**Required result:** Module baseline artifacts exist; module terminology is stable enough for analytical authoring; module-scope conflicts are surfaced.

**Minimum output artifacts:**
- `specs/<module>/baseline/authority-map.md` (which `_ar/<module>/**` sources are authoritative for which topic)
- `specs/<module>/glossary/module-glossary.md` (module-scope terminology — entities, processes, key terms)
- `specs/<module>/baseline/conflict-register.md` (only when module-scope conflicts exist)

**Required contents (authority-map):**
- source-path → topic mapping
- conflicting sources flagged
- authority resolution rationale

**Required contents (module-glossary):**
- canonical term per concept
- aliases (with disallowed/ambiguous flags)
- source basis (which `_ar/<module>/**` file)

**Stop if:**
- module-scope `_ar/<module>/**` content cannot be safely read,
- module-scope conflicts cannot be resolved (block until clarification),
- terminology is unstable across module sources without resolution path.

**Hands off to:** M1b

#### Gate M1b — Module Framing

**Purpose:** Author the module-brief and initial analytical seeds (EN, BR, ES, ARCH) on top of the module baseline.

**Owned by:** `ModuleFramer` + analytical role calls (EN/BR/ES/ARCH authors from `agents/core/` and `agents/optional/`)

**Required result:** `module-brief.md` complete; central analytical entities and rules drafted; module architecture rámec aligned with `architecture-overview.md`.

**Minimum output artifacts:**
- `specs/<module>/module-brief.md` (full sections: purpose, scope, business value, key entities, key invariants, dependencies, non-goals)
- `specs/<module>/analysis/EN/*` — central entities
- `specs/<module>/analysis/BR/*` — key cross-entity rules (when relevant)
- `specs/<module>/analysis/ES/*` — external systems / integrations (when relevant)
- `specs/<module>/analysis/ARCH/*` — initial architecture rámec (when relevant)

**Stop if:**
- module has no clear business purpose,
- central entities conflict with existing EN in neighboring modules without resolution,
- ARCH rámec conflicts with `docs/program/architecture-overview.md`.

**Hands off to:** M2

---

### Gate M2 — Behavior & UX Framing

**Purpose:** Build the user-facing model of the module. IA provides skeleton screen map, wireframes show layout, UC connects UI to deterministic behavior, QUERY/JOB cover read-side and background contracts.

**Owned by:** `IAAuthor`, `WireframeAuthor` (from `agents/ux/`) + analytical role calls (UC, QUERY, JOB, CS authors)

**Required result:** IA final version; first wireframe pass for key screens; UC coverage for every interactive screen; QUERY/JOB for every non-trivial read/background contract.

**Minimum output artifacts:**
- `specs/<module>/ux/ia.md` (canonical IA layer)
- `specs/<module>/ux/wireframes.md` (canonical WIRE layer, screen-level)
- `specs/<module>/analysis/UC/*` — actor-triggered flows
- `specs/<module>/analysis/QUERY/*` — read-side semantics (when relevant)
- `specs/<module>/analysis/JOB/*` — background contracts (when relevant)
- `specs/<module>/analysis/CS/*` — FE-first scenarios (when relevant)

**Stop if:**
- IA has no link to UC (a screen exists without interaction coverage in UC),
- wireframe shows element without data or function backing in `analysis/`,
- critical happy path is missing.

**Hands off to:** M3

**Note:** Components and copy (`components.md`, `copy.md`) are authored in M3, not M2. M2 ends at wireframe + behavior framing.

---

### Gate M3 — Module Architecture & Slice Map

**Purpose:** Architect decides technical boundaries, technology choices, delivery sequencing. Slice map decomposes the module into bounded slices respecting slice sizing discipline. Components and copy are finalized at module-level abstraction (per-slice details emerge in Mode B).

**Owned by:** architekt + `ModulePlanAuthor` + `SliceMapAuthor` + `ComponentSpecAuthor` + `CopySpecAuthor`

**Required result:** `module-plan.md` approved; `slice-map.md` has all slices declared with explicit prerequisites and dependencies; `components.md` and `copy.md` exist when relevant.

**Minimum output artifacts:**
- `specs/<module>/module-plan.md` (architecture, technologies, delivery sequence, integration points)
- `specs/<module>/slice-map.md` (list of slices with impact-class estimate, dependencies, sequencing constraints, slice-readiness prerequisites)
- `specs/<module>/module-risks.md` (known risks, unresolved dependencies, mitigation plan)
- `specs/<module>/ux/components.md` (canonical COMP layer — when module has reusable components)
- `specs/<module>/ux/copy.md` (canonical COPY layer — when module has non-trivial text content)

**Required contents (slice-map):**
- slice-id and slug per slice
- impact-class estimate (IC0–IC5)
- explicit prerequisites (analytical, UX, technical) per slice
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

#### `IAAuthor`
Owns IA authoring at Gate M2. Drafts `ia.md`.

#### `WireframeAuthor`
Owns wireframe authoring at Gate M2. Drafts `wireframes.md`.

### Conditional

#### `ComponentSpecAuthor`
Owns component spec authoring at Gate M3. Drafts `components.md` when module has reusable components.

#### `CopySpecAuthor`
Owns copy spec authoring at Gate M3. Drafts `copy.md` when module has non-trivial text content.

---

## Reuse of `agents/onboarding/**` in Gate M1a

Gate M1a does **not** introduce duplicate "module onboarding" roles. Instead, it invokes existing onboarding roles with **module scope**:

- `CorpusCurator` reads only `_ar/<module>/**` subset
- `TerminologyResolver` produces `module-glossary.md` (module-scope, not repo-scope)
- `ConflictMapper` produces module-scope `conflict-register.md`
- `ArchitectureBaselineMapper` (optional) when module ARCH framing benefits from baseline scan

Invocation pattern: `ModuleFramer` delegates to onboarding roles with explicit `scope: module:<name>` parameter. The roles themselves remain shared between Mode A (repo scope) and Mode M (module scope).

This avoids agent catalog duplication and keeps onboarding logic in one place.

---

## Required Artifacts in Mode M

These artifacts are Mode M-specific and do not replace artifacts of other modes.

### Always when declaring module
- `specs/<module>/module-brief.md`
- `specs/<module>/baseline/authority-map.md`
- `specs/<module>/glossary/module-glossary.md`

### Always when framing complete
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md`
- `specs/<module>/module-risks.md`
- `specs/<module>/ux/ia.md` (when module has user-facing surfaces)
- `specs/<module>/ux/wireframes.md` (when module has user-facing surfaces)

### When relevant
- `specs/<module>/ux/components.md`
- `specs/<module>/ux/copy.md`
- `specs/<module>/baseline/conflict-register.md` (when conflicts exist)
- `specs/<module>/analysis/*` (per analytical layer needed)

### Before module release
- `specs/<module>/module-staging-readiness.md`

Mode M must not create:
- `spec.md`, `plan.md`, `tasks.md`, `qa-checklist.md`, `runtime-notes.md`, `review.md` (those are Mode B)
- `comment-intake.md`, `source-amendment.md`, `slice-seed.md` (those are Mode C)
- `project-brief.md`, `architecture-overview.md`, `module-map.md` (those are Mode P)

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

## Handoff back to Mode A

Mode M must hand back to Mode A when:
- module-level baseline (M1a) reveals repo-wide baseline problem (terminology unstable across multiple modules, source authority unclear across the corpus),
- `_ar/**` corpus is materially incomplete for the module and repo-scope refresh is needed.

In these cases, Mode M stops, surfaces the baseline problem, and waits for Mode A repo refresh.

---

## Relationship to Mode C

Mode C comment intake may land on module-level or program-level artifacts (not just slice-level / canonical doc).

When Mode C produces:
- `slice-seed` for a module → routed to that module's `slice-map.md` (Mode M Gate M3 refresh)
- `comment-intake` for a module-level artifact (`module-brief.md`, `module-plan.md`) → routed to Mode M for amendment
- `comment-intake` for a program-level artifact → routed to Mode P (through Gate P-R)

Cross-module comment routing detail is governed by `docs/governance/mode-c.md` (Batch 2 of the foundation amendment introduces module-aware routing).

---

## Relationship to Source Corpus

Mode M reads `_ar/**` only in a bounded way:
- Gate M1a reads only the module-relevant subset (`_ar/<module>/**` if organized that way, or filtered subset),
- analytical authoring in M1b and M2 reads only the subset needed for each analytical artifact,
- broad corpus reading is a Mode A activity, not Mode M.

Module-scope corpus reading must preserve:
- inconsistencies and open questions (do not smooth them away),
- evidence boundaries (do not overclaim from partial sources),
- module-specific terminology (do not import repo-wide terms without alignment).

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
