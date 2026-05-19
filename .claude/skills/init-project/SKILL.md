---
name: init-project
description: Bootstrap a new project via Mode P — drive operator through program declaration, architecture overview, program-wide baseline, optional project IA, module decomposition. Spawns program-bootstrap subagent.
disable-model-invocation: true
---

# /init-project — Program Bootstrap (Mode P)

When the user invokes `/init-project`, follow this procedure exactly.

## Procedure

### 1. Confirm intent

Ask operator:
- Is this a new project (first Mode P run) or a re-frame (existing program structural change)?
- For re-frame: name the trigger event and which artifacts will be affected.

If re-frame, the operator must explicitly authorize Gate P-R before any existing program artifact is amended.

### 2. Verify prerequisites

Check repository state:
- `docs/program/project-brief.md` exists? (new vs. re-frame distinction)
- `_ar/{BA,UX}/` registry skeletons exist? (if not, the `program-bootstrap` subagent will create them at Gate P1)

If prerequisites are unclear, stop and ask operator to confirm.

### 3. Spawn `program-bootstrap` subagent

Use the Agent tool with:
- `subagent_type: program-bootstrap`
- `description: "Program Bootstrap: <project-id>"`
- `isolation: worktree`
- prompt: brief the subagent on operator intent (bootstrap vs. re-frame), product context, preliminary module breakdown if known

The subagent drives Gates P-R / P0 / P1 / P-UX / P2 / P3 and returns:
- list of artifacts created
- declared modules with owner + entry sequence
- Open Questions
- recommendation for first Mode M target

### 4. Report to operator

Present subagent's report. Confirm next action:
- Run `/init-module <slug>` for the recommended first module
- Or address Open Questions before proceeding

## Output

- `docs/program/project-brief.md`, `architecture-overview.md`, `module-map.md` (plus `implementation-streams.md`, `re-frame-authorization.md` when applicable)
- Foundational `_ar/BA/{EN,ARCH,BR}/` content + `_ar/UX/IA/IA-<project>.md` when user-facing
- All `_REGISTRY.md` skeletons initialized

## Hard Stops

- Operator unable to state business purpose clearly
- Re-frame attempted without Gate P-R authorization
- Module decomposition has cycles
- Program-wide terminology has unresolved conflicts that would block module work
