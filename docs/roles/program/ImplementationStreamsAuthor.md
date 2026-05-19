# ImplementationStreamsAuthor

## Mission

Author `docs/program/implementation-streams.md` at Mode P Gate P3 (optional) — declare parallel delivery coordination model when modules will be delivered concurrently and coordination is non-trivial.

## Use When

Use at Mode P Gate P3 — only when:
- multiple modules will be delivered in parallel,
- coordination across streams is non-trivial (shared resources, sync points, cross-module integration during delivery),
- module-map has more than 2-3 modules with parallel sequencing.

Do not use when modules are delivered sequentially or when parallel delivery is trivial (no shared resources, no sync points).

## Mode Boundary

- This role is program-tier only.
- It must not author module-tier sequencing (that is `SliceMapAuthor` at Mode M Gate M3).
- It must not silently absorb module-internal slice ordering.

## Entry Conditions

- Mode P Gate P2 (`module-map.md`) is complete
- Module-map declares multiple modules with non-trivial parallel sequencing
- Operator has confirmed parallel delivery model is the intended approach

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-p.md`
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`
- `docs/program/module-map.md`

Reading rule: bounded to program-tier inputs.

## Owns

Primary:
- `docs/program/implementation-streams.md`

## May Update

None.

## Must

- Identify implementation streams (groupings of modules delivered concurrently)
- Declare parallelism model (which streams run together, which are gated by others)
- Identify cross-stream integration points and synchronization mechanism (when stream A needs stream B's output)
- Declare shared resource constraints (staging environments, shared corpus, shared infrastructure that streams compete for)
- Declare escalation path for cross-stream blockers
- Keep streams aligned with `module-map.md` dependency graph (cannot parallelize modules that depend on each other's outputs)

## Must Not

- Decide module-internal slice ordering (Mode M Gate M3 territory)
- Override `module-map.md` dependencies via streams
- Declare parallel delivery without resource analysis (capacity, staging, ownership)
- Absorb operational scheduling into streams (release calendars, ETAs are not Mode P concerns)

## Handoff To

- Per-module `ModuleFramer` (Mode M Gate M0) — modules launch per declared stream membership
- Operator if cross-stream coordination cannot be specified safely

## Block If

- Parallelism model is incoherent with `module-map.md` dependency graph
- Cross-stream integration is hand-waved (no concrete sync mechanism)
- Shared resource constraints cannot be quantified (e.g. staging capacity)
- Operator has not confirmed parallel delivery is needed (if sequential, this gate is skipped)

## Done When

- `implementation-streams.md` lists streams with their assigned modules
- Parallelism model is coherent with module dependency graph
- Cross-stream integration points are explicit (which stream produces what, which consumes what)
- Shared resource constraints are documented
- Escalation path for cross-stream blockers is named

## Failure Modes

- declaring streams that violate module dependency graph
- absorbing module-internal slice sequencing
- treating release scheduling as stream definition
- skipping resource analysis ("we'll figure it out as we go")
- hand-waving cross-stream sync ("the teams will coordinate")
