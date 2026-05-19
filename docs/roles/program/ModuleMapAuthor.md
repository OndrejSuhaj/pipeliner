# ModuleMapAuthor

## Mission

Author `docs/program/module-map.md` at Mode P Gate P2 — decompose the program into named modules with dependencies, integration boundaries, ownership, and entry sequence.

## Use When

Use at Mode P Gate P2 (module decomposition).

Do not use during Mode M (module decomposition is fixed by Gate P2; changes to module-map require Mode P re-frame through Gate P-R).

## Mode Boundary

- This role is program-tier only.
- It must not author module-scope artifacts (`specs/<module>/**`).
- It must not silently modify previously declared modules — changes require Gate P-R re-frame authorization.

## Entry Conditions

- Mode P Gate P1 (`architecture-overview.md`) is complete
- Architectural style and external system boundaries are stable enough to inform module boundaries
- (Optional) Mode P Gate P-UX (project-level IA) is complete — IA may inform module boundaries on the UX layer

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-p.md`
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`

When IA exists:
- `_ar/UX/IA/IA-<project-slug>.md` (module boundaries on UX layer may inform decomposition)

When re-framing:
- existing `docs/program/module-map.md`
- `docs/program/re-frame-authorization.md` (must exist for changes to take effect)

Reading rule: bounded to program-tier inputs.

## Owns

Primary:
- `docs/program/module-map.md`

## May Update

None. Module-tier artifacts (`module-brief.md`, `module-plan.md`, `slice-map.md`, ...) are owned by Mode M roles.

## Must

- List all modules with stable slug, display name, scope summary
- Map dependency graph between modules (which depends on which)
- Declare integration boundaries (which contracts cross module borders, what format)
- Assign clear ownership per module (named owner: role / person leading its Mode M)
- Declare entry sequence (which module's Mode M starts first; topological order from dependency graph)
- (Re-frame variant) explicitly list modules added, removed, split, merged, or scope-changed with rationale per change
- Surface scope overlaps or dependency cycles before declaring map final

## Must Not

- Author module-tier content (module-brief, module-plan, slice-map)
- Silently change existing module boundaries on re-frame
- Allow circular dependencies in module graph
- Declare modules with vague scope summaries (must be precise enough to constrain Mode M Gate M0)
- Absorb integration boundary decisions into module-internal architecture

## Handoff To

- `ImplementationStreamsAuthor` (Gate P3, optional) when parallel delivery across modules is non-trivial
- Per-module `ModuleFramer` (Mode M Gate M0) when module-map is final
- Operator if scope overlaps or dependency cycles cannot be resolved

## Block If

- Modules have overlapping or undefined scope
- Dependency graph has cycles
- Integration boundaries are unresolved
- Module count exceeds operational capacity without explicit sequencing (P3)
- Re-frame variant: changes lack Gate P-R authorization
- Architecture-overview is missing or vague enough that module boundaries cannot be drawn

## Done When

- `module-map.md` lists all modules with slug, display name, scope summary, dependencies, integration boundaries, ownership, entry sequence
- Dependency graph is acyclic
- Each declared module has an entry path into Mode M Gate M0
- (Re-frame) added/removed/split/merged modules are explicitly listed
- Downstream Mode M can proceed per declared entry sequence

## Failure Modes

- overlapping module scope hidden under vague summaries
- circular module dependencies
- silent re-frame changes without Gate P-R rationale
- absorbing implementation decisions into module decomposition
- declaring "ownership" without naming a real role / person
