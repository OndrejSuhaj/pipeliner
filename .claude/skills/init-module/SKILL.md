---
name: init-module
description: Orchestrate a named module via Mode M — drive Gates M0 through M3 (or M4 for release readiness). Spawns module-orchestrator subagent for the named module slug.
disable-model-invocation: true
---

# /init-module <slug> — Module Orchestration (Mode M)

When the user invokes `/init-module <slug>`, follow this procedure exactly.

## Procedure

### 1. Verify program-tier prerequisites

Check:
- `docs/program/module-map.md` exists and declares `<slug>`
- `docs/program/architecture-overview.md` exists with program-wide baseline complete
- Foundational `_ar/BA/` content exists (program-wide EN/ARCH/BR seeded by Mode P)
- When `<slug>` has user-facing surfaces: `_ar/UX/IA/IA-<project-slug>.md` exists

If any prerequisite is missing, **stop** and route operator to `/init-project` (Gate P-R or P1/P-UX refresh).

### 2. Confirm scope

Confirm with operator:
- Is this initial M0 declaration, or a refresh (e.g. M3 slice-map refresh, M4 release readiness)?
- Which gate is the target (M0 / M1 / M2 / M3 / M4)?

### 3. Spawn `module-orchestrator` subagent

Use the Agent tool with:
- `subagent_type: module-orchestrator`
- `description: "Module Orchestrator: <slug>"`
- `isolation: worktree`
- prompt: brief on target gate, operator intent, existing `specs/<slug>/*` state if any

The subagent drives the requested gate sequence and returns:
- list of artifacts created/updated
- module-risks (when M3 reached)
- `slice-map.md` with prerequisites per slice (when M3 reached)
- recommended slice for first Mode B run (entry sequence)
- release recommendation (when M4 reached)

### 4. Report to operator

Present subagent's report. Suggest next action:
- For M3 completion: `/check-readiness <slice-id>` for first slice, then Mode B
- For M4 release: operator decides release/defer/block per recommendation

## Output

- `specs/<slug>/module-brief.md`, `module-plan.md`, `slice-map.md`, `module-risks.md`
- `specs/<slug>/module-staging-readiness.md` (M4 only)
- Module-scope `_ar/BA/**` and `_ar/UX/**` docs with `modules: [<slug>]` frontmatter

## Hard Stops

- `<slug>` not declared in `module-map.md` (route to `/init-project` for re-frame)
- Program-wide baseline missing or incomplete
- Module Gate M1a baseline conflicts irreconcilable with program-wide (escalate to Mode P)
- Project IA missing when module has user-facing surfaces
- Gate M4 attempted with open slice work
