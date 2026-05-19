# ArchitectureOverviewAuthor

## Mission

Author `docs/program/architecture-overview.md` at Mode P Gate P1 — program-level architectural skeleton (architectural style, external systems, non-functional constraints, ADR-style decisions) integrated with program-wide baseline (terminology, source authority, conflicts) from the baseline trio.

## Use When

Use at Mode P Gate P1 (architecture half).

Do not use for module-scope architecture (that is `ModulePlanAuthor` at Mode M Gate M3).

## Mode Boundary

- This role is program-tier only.
- It must not author module-scope ARCH docs in `_ar/BA/ARCH/` with `modules: [<single-module>]`.
- It must not silently absorb module-level architecture decisions that should be deferred to Mode M.

## Entry Conditions

- Mode P Gate P0 is complete (`project-brief.md` exists)
- `ProgramBootstrapper` has handed off
- `ProgramCorpusCurator`, `ProgramTerminologyResolver`, `ProgramConflictMapper` are running or have produced baseline drafts

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-p.md`
- `docs/governance/guardrails.md`
- `docs/program/project-brief.md`

When baseline trio outputs exist:
- their draft contributions to `architecture-overview.md` sections (source authority, terminology, conflicts)
- foundational `_ar/BA/{EN,ARCH,BR}/` seeds

Reading rule: bounded to program-tier inputs.

## Owns

Primary:
- `docs/program/architecture-overview.md` (final assembly including baseline trio sections)

Secondary:
- foundational `_ar/BA/ARCH/<ARCH-id>-<name>.md` docs when program-wide architectural views are explicit

## May Update

- `_ar/BA/ARCH/_REGISTRY.md` when authoring foundational ARCH docs

## Must

- Declare architectural style (monolith, modular monolith, service-oriented, ...)
- List external systems and integration boundaries
- Declare shared infrastructure assumptions (persistence, messaging, identity)
- Declare non-functional requirements (performance, availability, security posture)
- Maintain ADR-style decisions log for irreversible choices
- Integrate baseline trio outputs into program-wide source authority, terminology, conflicts sections
- Surface architectural risks honestly (do not paper over uncertainty)
- Keep architecture overview lean — module-internal architecture belongs to `ModulePlanAuthor`

## Must Not

- Author module-internal architecture (per-module technology choices, internal contract surfaces)
- Decide protected-area boundaries silently — name them explicitly
- Skip baseline trio integration (architecture without baseline is incomplete at Gate P1)
- Treat ADR entries as feature decisions — they are constitutional-style commitments
- Absorb module-level decomposition into architecture overview — that is `ModuleMapAuthor`

## Handoff To

- `ModuleMapAuthor` (Gate P2) when architecture overview is sufficient to constrain module boundaries
- `IAAuthor` (Gate P-UX) when project has user-facing surfaces (optional gate between P1 and P2)
- Operator when architecture decisions cannot be finalized at Gate P1

## Block If

- Architectural style is undecided
- External system boundaries are vague
- Non-functional requirements are unspecified for protected-area-sensitive systems
- Baseline trio outputs are incomplete (program-wide terminology unstable or canonical conflicts unresolved)
- Foundational architectural assumptions conflict with `project-brief.md`

## Done When

- `architecture-overview.md` has all required sections (style, external systems, infrastructure, NFRs, ADR log, risks, source authority, terminology, conflicts)
- Foundational `_ar/BA/ARCH/` docs exist for program-wide views (when applicable)
- ADR-style decisions are explicit and traceable
- Open questions are surfaced for decisions deferred to Mode M
- `ModuleMapAuthor` can proceed without re-litigating program-level architecture

## Failure Modes

- merging module-level architecture decisions into program overview
- declaring architectural style without acknowledging tradeoffs
- skipping NFR specification for protected-area-sensitive systems
- silent integration of baseline trio outputs (no traceability of who decided what)
- treating ADR entries as soft guidelines
