# Mode P — Program Bootstrap

## Purpose

Mode P is a governed program-level bootstrap mode.

It exists to:
- declare the program scope and business purpose,
- establish program-level architectural assumptions and constraints,
- decompose the program into bounded implementation streams (modules),
- declare cross-module dependencies and integration boundaries,
- and produce the program-level artifacts that all subsequent modes depend on.

Mode P is **not** a module orchestration mode (that is Mode M).
Mode P is **not** an implementation mode.
Mode P is **not** a comment intake mode (that is Mode C).
Mode P is **not** a continuous re-planning mode.

---

## Position in the Overall Operating Model

The repository has four operating modes:

- **Mode P — Program Bootstrap** (this document)
- **Mode B — Feature Delivery** (default)
- **Mode C — Comment Intake / Documentation Amendment / Slice Seeding**
- **Mode M — Module Orchestration**

Mode P sits **at the start of project lifecycle**, before any module-level or slice-level work begins.

Typical flow:

`new project request → Mode P bootstrap (incl. program baseline + project IA) → per-module Mode M → per-slice Mode B`

Mode P is appropriate when:
- a new project is being established within this framework,
- an existing program requires structural re-framing (new module, module split, scope rewrite),
- program-level scope, architectural overview, or module decomposition must be declared or revised.

Mode P is **not** appropriate when:
- the work is at module level — use Mode M,
- the work is at slice level — use Mode B,
- the project already has `docs/program/*` and no structural change is required.

---

## Core Principles

Mode P inherits the repository principles and adds the following local discipline:

1. **Program-level decisions are structural**
   Mode P outputs constrain every subsequent module and slice. Decisions made here are not casually revised.

2. **Module decomposition is bounded and named**
   Every module declared in `module-map.md` must have a clear scope boundary and a unique slug.

3. **Re-runs are explicit structural events**
   Mode P is not a routine planning loop. Re-runs require Gate P-R authorization before any existing program artifact may be amended.

4. **Mode P does not author module substance**
   Mode P declares modules; it does not produce their `module-brief.md`, `module-plan.md`, or any other module-tier artifact.

5. **No silent overwrite on re-run**
   Existing `project-brief.md`, `architecture-overview.md`, and `module-map.md` may only be amended through Gate P-R, with named affected artifacts and explicit operator authorization.

---

## Typical Outcomes

Every Mode P run must end in exactly one explicit outcome:

- `program_bootstrapped` — new program established
- `program_re_framed` — existing program structurally amended through Gate P-R
- `blocked` — Mode P cannot proceed (missing inputs, unsafe rationale, unresolved structural conflict)

---

## Non-Goals

Mode P must not become:
- a module-level planning mode,
- a slice-level implementation mode,
- a way to bypass canonical layer rules,
- a continuous re-planning loop,
- a place to author module-scope business rules, use cases, or entity definitions (those are Mode M).

Mode P **may** author foundational program-wide canonical docs in `_ar/` (project-level IA, foundational EN/ARCH/BR shared across all modules). Module-scope canonical content remains Mode M territory.

---

## Entry Conditions

Mode P may start only when all of the following are true:
- the operator explicitly invokes program bootstrap (`Mode P`),
- there is enough product context to declare scope and purpose,
- (re-frame variant) the operator explicitly confirms structural change intent,
- the run can stay bounded to program-level artifacts.

If these conditions are not met, stop and ask for clarification.

---

## Inputs

Typical Mode P inputs:
- product brief (operator-provided — what the project is, business purpose),
- architectural assumptions (external systems, integration boundaries, non-functional requirements),
- preliminary module breakdown (operator's tentative naming and scope per stream),
- (re-frame variant) the structural change rationale,
- (re-frame variant) existing `docs/program/*` artifacts.

Optional supporting inputs:
- prior architecture review notes,
- existing modules' status (for re-frame impact assessment),
- external constraints (deadlines, regulatory, integration).

---

## Required Read Order in Mode P

Always read first:
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/trigger-matrix.md`
- `docs/governance/definition-of-done.md`
- this file

Read next only as needed:
- `docs/governance/impact-classes.md`
- (re-frame variant) existing `docs/program/*` artifacts
- (re-frame variant) existing `specs/<module>/module-brief.md` for each affected module
- (re-frame variant) existing program-wide `_ar/BA/**` and `_ar/UX/IA/**` (foundational docs may need amendment)
- relevant role files in `docs/roles/program/**`

Do not broad-scan the repository.
Mode P writes program-wide foundational docs into `_ar/` (P1 baseline, P-UX project IA). Module-scope `_ar/` content is Mode M territory — do not author it from Mode P.

---

## Mode P Gate Sequence

### Gate P-R — Re-frame Authorization

**Trigger:** `docs/program/project-brief.md` already exists. Only runs when Mode P is being re-invoked on an existing program.

**Purpose:** Block silent overwrites of existing program artifacts. Make structural change explicit, named, and operator-authorized.

**Owned by:** operator + `ProgramBootstrapper`

**Required result:** Explicit re-frame rationale recorded; affected program-level artifacts named; downstream impact on existing modules acknowledged.

**Minimum output artifact:** `docs/program/re-frame-authorization.md`

**Required contents:**
- trigger event (what changed in the world that requires re-frame)
- affected program-level artifacts (which files will be amended)
- downstream module impact (which modules in `module-map.md` are affected — added, removed, split, merged, scope-changed)
- operator authorization (explicit confirmation, named operator, date)

**Stop if:**
- operator did not explicitly confirm re-frame intent,
- re-frame would silently invalidate existing module work without acknowledgment,
- rationale is vague ("update", "refresh", "cleanup" without specifics).

**Hands off to:** P0 (with re-frame flag active).

---

### Gate P0 — Program Declaration

**Purpose:** Declare the program scope, business purpose, and key constraints.

**Owned by:** operator + `ProgramBootstrapper`

**Required result:** `project-brief.md` exists (new) or is amended (re-frame variant).

**Minimum output artifact:** `docs/program/project-brief.md`

**Required contents:**
- program name and identifier
- business purpose (one-paragraph statement)
- target scope (in / out)
- key constraints (technical, regulatory, operational)
- success criteria at program level
- known risks and assumptions

**Re-frame variant:** Must preserve historical record. Either append change-log section or maintain a versioned amendment trail. No silent overwrite.

**Stop if:**
- business purpose cannot be stated clearly,
- scope boundary is undefined,
- key constraints are too vague to constrain downstream decisions.

**Hands off to:** P1

---

### Gate P1 — Architecture Overview & Program-Wide Baseline

**Purpose:** Establish program-level architectural assumptions, external systems, integration boundaries, non-functional constraints — **and** program-wide baseline (terminology, source authority, foundational canonical seeds).

**Owned by:** architekt + `ArchitectureOverviewAuthor` + `ProgramCorpusCurator` + `ProgramTerminologyResolver` + `ProgramConflictMapper`

**Required result:** `architecture-overview.md` records the program-level architectural skeleton, and foundational program-wide canonical docs exist in `_ar/`.

**Minimum output artifacts:**
- `docs/program/architecture-overview.md`
- `_ar/BA/EN/` — foundational entities shared by all modules (e.g. User, Organization, if applicable)
- `_ar/BA/ARCH/` — program-wide ARCH docs (system view, deployment topology)
- `_ar/BA/BR/` — program-wide business rules shared by all modules
- `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/_REGISTRY.md` — registry skeletons initialized
- `_ar/UX/{IA,WIRE,COMP,COPY}/_REGISTRY.md` — registry skeletons initialized

**Required contents (architecture-overview.md):**
- architectural style (monolith, modular monolith, service-oriented, …)
- external systems and integration boundaries
- shared infrastructure assumptions (persistence, messaging, identity, …)
- non-functional requirements (performance, availability, security posture)
- architectural decisions log (ADR-style entries for irreversible choices)
- known architectural risks
- program-wide source authority classification (where authoritative knowledge lives — code, docs, external systems)
- program-wide terminology baseline (canonical glossary seed, conflicts that must be resolved before modules begin)

**Stop if:**
- architectural style is undecided,
- external system boundaries are vague,
- non-functional requirements are unspecified for protected-area-sensitive systems,
- program-wide terminology has unresolved conflicts that would invalidate downstream module baselines,
- foundational EN entities have unresolved authority disputes.

**Hands off to:** P-UX (if program has user-facing surfaces) or P2 (otherwise).

---

### Gate P-UX — Project-Level Information Architecture (optional)

**Purpose:** Author project-level Information Architecture before module decomposition. IA may influence module boundaries, so it precedes P2.

**Trigger:** Program has user-facing surfaces. Skip when project is headless / API-only.

**Owned by:** UX lead + `IAAuthor` (from `docs/roles/ux/**`)

**Required result:** Project-level IA exists in `_ar/UX/IA/`.

**Minimum output artifact:** `_ar/UX/IA/IA-<project-slug>.md`

**Required contents:**
- top-level navigation across the entire product
- screen map (high-level — module-scope screen detail comes in Mode M)
- entry points (anonymous, post-auth, deep links)
- cross-module flows (onboarding, upgrade, recovery)
- information hierarchy (account / workspace / domain levels)
- preliminary module boundaries on the UX layer (which screens likely belong to which module)
- open IA questions

**Stop if:**
- project IA cannot be authored without first deciding more architecture (return to P1),
- IA implies module boundaries materially different from preliminary breakdown (escalate to P2 with adjusted decomposition).

**Hands off to:** P2

---

### Gate P2 — Module Decomposition

**Purpose:** Decompose the program into named modules with explicit dependencies and integration boundaries.

**Owned by:** architekt + analytik + `ModuleMapAuthor`

**Required result:** `module-map.md` declares all modules with their slug, scope summary, and dependencies.

**Minimum output artifact:** `docs/program/module-map.md`

**Required contents:**
- list of modules (slug + display name + scope summary)
- dependency graph between modules
- integration boundaries (which contracts cross module borders)
- ownership (lead owner per module)
- entry sequence (which module's Mode M starts first)
- (re-frame variant) explicit list of modules added, removed, split, merged, scope-changed

**Stop if:**
- modules have overlapping or undefined scope,
- dependency graph has cycles,
- integration boundaries are unresolved,
- module count exceeds operational capacity without explicit sequencing.

**Hands off to:** P3 (if needed) or out (program bootstrap complete).

---

### Gate P3 — Implementation Streams (optional)

**Purpose:** When parallel delivery across modules is non-trivial, declare coordination model — which streams run in parallel, which sequentially, how cross-stream integration is handled.

**Owned by:** projektový lead + `ImplementationStreamsAuthor`

**Required result:** `implementation-streams.md` exists when parallel coordination is non-trivial.

**Minimum output artifact:** `docs/program/implementation-streams.md`

**Required contents:**
- stream identifiers and their assigned modules
- parallelism model (which streams run concurrently)
- cross-stream integration points and synchronization mechanism
- shared resource constraints (staging environments, shared corpus, …)
- escalation path for cross-stream blockers

**Stop if:**
- parallelism model is incoherent with module dependency graph,
- cross-stream integration is hand-waved.

**Hands off to:** out (program bootstrap complete).

---

## Default Agent Set for `docs/roles/program/**`

Mode P uses a small, explicit set of program-level agents.

### Required

#### `ProgramBootstrapper`
Owns Gate P-R and Gate P0. Drives the operator through program declaration.

#### `ArchitectureOverviewAuthor`
Owns Gate P1 architecture half. Drafts the program-level architectural skeleton.

#### `ProgramCorpusCurator`
Owns Gate P1 baseline half — source authority classification, corpus shape verification.

#### `ProgramTerminologyResolver`
Owns Gate P1 baseline half — program-wide terminology stabilization.

#### `ProgramConflictMapper`
Owns Gate P1 baseline half — program-wide canonical conflict mapping.

#### `ModuleMapAuthor`
Owns Gate P2. Drafts the module decomposition with dependencies and integration boundaries.

### Optional

#### `IAAuthor` (from `docs/roles/ux/**`)
Owns Gate P-UX. Used when the project has user-facing surfaces.

#### `ImplementationStreamsAuthor`
Owns Gate P3. Used only when parallel delivery across modules is non-trivial.

---

## Required Artifacts in Mode P

These artifacts are Mode P-specific and do not replace artifacts of other modes.

### Always
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`
- `docs/program/module-map.md`
- `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/_REGISTRY.md` — 12 registry skeletons (initialized empty)
- `_ar/UX/{IA,WIRE,COMP,COPY}/_REGISTRY.md` — 4 registry skeletons (initialized empty)

### When program-wide foundational canonical content is identified
- `_ar/BA/EN/<EN-id>-<name>.md` — foundational entities (e.g. EN0001-User if User is program-wide)
- `_ar/BA/ARCH/<ARCH-id>-<name>.md` — program-wide architecture views
- `_ar/BA/BR/<BR-id>-<name>.md` — program-wide business rules

### When program has user-facing surfaces (Gate P-UX)
- `_ar/UX/IA/IA-<project-slug>.md`

### When parallel delivery is non-trivial
- `docs/program/implementation-streams.md`

### When re-running on existing program
- `docs/program/re-frame-authorization.md`

### Optional working drafts
- `docs/program/spec/` — program-level workshop notes, research, drafts (not authoritative)

Mode P must not create:
- `module-brief.md`, `module-plan.md`, `slice-map.md` (those are Mode M)
- `spec.md`, `plan.md`, `tasks.md` (those are Mode B)
- `source-amendment.md`, `comment-intake.md` (those are Mode C)
- module-scope `_ar/` content (UC, FN, ES, WIRE, COMP, COPY refinements for individual modules — those are Mode M)

---

## Hard Stops in Mode P

Stop or block when:
- operator intent for program bootstrap (or re-frame) is unclear,
- product context is too vague for a meaningful `project-brief.md`,
- architectural style cannot be decided,
- module decomposition has unresolvable scope overlap,
- re-frame is attempted without explicit operator authorization,
- the run is trying to author module-level or slice-level content,
- protected-area assumptions are silently embedded without acknowledgment.

Blocked is a valid Mode P state.

---

## Handoff to Mode M

After successful Mode P bootstrap:

**Mode M — per-module orchestration** runs once per module declared in `module-map.md`, in the sequence implied by the dependency graph or explicit `entry sequence` in `module-map.md`.

Mode M Gate M1a handles module-scope baseline (terminology refinements, source authority verification, module-scope conflicts) — building on the program-wide baseline that Mode P Gate P1 already established.

Mode P never creates branches.
Mode P never opens implementation lanes.
Normal git gates remain a Mode B concern.

---

## Re-run Conditions

Mode P re-run is legitimate when:
- a new module must be added to the program,
- an existing module must be split into two,
- two existing modules must be merged,
- program scope must be materially rewritten,
- architectural style requires program-level change (rare).

Mode P re-run is **not** legitimate when:
- the change is module-internal (use Mode M re-framing instead),
- the change is slice-level (use Mode B),
- the change is a documentation correction (use Mode C),
- the operator merely wants to update wording without structural change.

Every re-run goes through Gate P-R first.

---

## Quality Bar

A good Mode P result is:
- bounded to program-level decisions,
- explicit about module scope and dependencies,
- honest about architectural risks and constraints,
- traceable through Gate P-R for any re-frame,
- easy to hand off to per-module Mode M.

A bad Mode P result is:
- vague program scope,
- silent module-level decisions hidden in program brief,
- silent re-frame overwriting existing artifacts,
- architectural assumptions without acknowledgment of risk,
- module decomposition with cyclic dependencies.

---

## Example Short Prompts

- `Mode P, bootstrap new project: <project-name>`
- `Mode P, Gate P0 only — draft project-brief from input`
- `Mode P, re-frame — add new module <module-name> to existing program`
- `Mode P, Gate P2 only — revise module-map with split of <module-name>`
