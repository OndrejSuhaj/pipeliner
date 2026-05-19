# Mode P — Program Bootstrap

## Purpose

Mode P is a governed program-level bootstrap mode.

It exists to:
- declare the program scope and business purpose,
- establish program-level architectural assumptions and constraints,
- decompose the program into bounded implementation streams (modules),
- declare cross-module dependencies and integration boundaries,
- and produce the program-level artifacts that all subsequent modes depend on.

Mode P is **not** a repository onboarding mode (that is Mode A).
Mode P is **not** a module orchestration mode (that is Mode M).
Mode P is **not** an implementation mode.
Mode P is **not** a comment intake mode (that is Mode C).
Mode P is **not** a continuous re-planning mode.

---

## Position in the Overall Operating Model

The repository has five operating modes:

- **Mode P — Program Bootstrap** (this document)
- **Mode A — Repository Onboarding**
- **Mode B — Feature Delivery** (default)
- **Mode C — Comment Intake / Documentation Amendment / Slice Seeding**
- **Mode M — Module Orchestration**

Mode P sits **at the start of project lifecycle**, before any module-level or repository-level work begins.

Typical flow:

`new project request → Mode P bootstrap → Mode A repo onboarding → per-module Mode M → per-slice Mode B`

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
- an onboarding replacement (Mode A still owns repo baseline),
- a way to bypass canonical layer rules,
- a continuous re-planning loop,
- a place to author business rules, use cases, or entity definitions.

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
- relevant role files in `agents/program/**`

Do not broad-scan the repository.
Do not read `_ar/**` corpus (that belongs to Mode A and Mode M).

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

### Gate P1 — Architecture Overview

**Purpose:** Establish program-level architectural assumptions, external systems, integration boundaries, and non-functional constraints.

**Owned by:** architekt + `ArchitectureOverviewAuthor`

**Required result:** `architecture-overview.md` records the program-level architectural skeleton.

**Minimum output artifact:** `docs/program/architecture-overview.md`

**Required contents:**
- architectural style (monolith, modular monolith, service-oriented, …)
- external systems and integration boundaries
- shared infrastructure assumptions (persistence, messaging, identity, …)
- non-functional requirements (performance, availability, security posture)
- architectural decisions log (ADR-style entries for irreversible choices)
- known architectural risks

**Stop if:**
- architectural style is undecided,
- external system boundaries are vague,
- non-functional requirements are unspecified for protected-area-sensitive systems.

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

## Default Agent Set for `agents/program/**`

Mode P uses a small, explicit set of program-level agents.

### Required

#### `ProgramBootstrapper`
Owns Gate P-R and Gate P0. Drives the operator through program declaration.

#### `ArchitectureOverviewAuthor`
Owns Gate P1. Drafts the program-level architectural skeleton.

#### `ModuleMapAuthor`
Owns Gate P2. Drafts the module decomposition with dependencies and integration boundaries.

### Optional

#### `ImplementationStreamsAuthor`
Owns Gate P3. Used only when parallel delivery across modules is non-trivial.

---

## Required Artifacts in Mode P

These artifacts are Mode P-specific and do not replace artifacts of other modes.

### Always
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`
- `docs/program/module-map.md`

### When parallel delivery is non-trivial
- `docs/program/implementation-streams.md`

### When re-running on existing program
- `docs/program/re-frame-authorization.md`

Mode P must not create:
- `module-brief.md`, `module-plan.md`, `slice-map.md` (those are Mode M)
- `spec.md`, `plan.md`, `tasks.md` (those are Mode B)
- `source-amendment.md`, `comment-intake.md` (those are Mode C)

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

## Handoff to Mode A and Mode M

After successful Mode P bootstrap:

1. **Mode A — repository onboarding** runs once (if `_ar/**` exists and repo baseline trust is required).
2. **Mode M — per-module orchestration** runs once per module declared in `module-map.md`, in the sequence implied by the dependency graph or explicit `entry sequence` in `module-map.md`.

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
- easy to hand off to Mode A and Mode M.

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
