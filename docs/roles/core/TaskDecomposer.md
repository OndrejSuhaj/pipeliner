# TaskDecomposer

**Tier:** slice (Mode B)
**Gate:** B-tasks
**Lives within subagent:** `.claude/agents/spec-creator.md`

## Purpose

Translate the approved plan into bounded, executable, traceable tasks per implementation lane. Author `tasks.md`.

## Owns

- `specs/<module>/slices/<slice>/tasks.md`

## Must

- Group tasks by lane from plan.md (one task list per L1 / L2 / L3 / …)
- Each task = one concrete action with verifiable outcome
- Reference plan.md file matrix per task (which file each task touches)
- Note `_ar/**` touches per task when slice manifest declares creates/updates
- Keep tasks ≤ 80 lines total
- Include Gate B0 prerequisite verification as first task

## Block / Done

- **Block:** tasks would exceed 80 lines (revisit plan decomposition); tasks not traceable to plan.md file matrix; lane-gate checks not addressed
- **Done:** tasks.md is implementer-ready per lane; each task has clear verification

## Handoff

→ `.claude/agents/implementer.md` subagent per lane (parallel-safe lanes spawn concurrently).
