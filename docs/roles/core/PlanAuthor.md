# PlanAuthor

**Tier:** slice (Mode B)
**Gate:** B-plan
**Lives within subagent:** `.claude/agents/spec-creator.md`

## Purpose

Translate the approved spec into a concrete, bounded, governance-safe implementation plan. Author `plan.md` with implementation lanes, file change matrix, lane-gate checks.

## Owns

- `specs/<module>/slices/<slice>/plan.md`

## Must

- Decompose work into implementation lanes (L1 / L2 codegen / L3 / L4 …) per impact class
- Author file change matrix (which files each lane edits)
- Declare lane-gate checks per lane (biome / typecheck / build / test)
- Declare out-of-scope guard explicitly (what this slice MUST NOT touch)
- Reference specialist analysis when protected-area is touched (SchemaSteward, AclPlanner, JobPlanner, QueryPlanner)
- Keep plan ≤ 150 lines

## Block / Done

- **Block:** protected-area touch lacks specialist analysis; plan would exceed 150 lines; lanes can't be made parallel-safe (sequential ordering becomes the plan); cross-module contract change not coordinated
- **Done:** plan.md has lanes + file matrix + lane-gates + out-of-scope guard; ready for TaskDecomposer

## Handoff

→ `TaskDecomposer` when plan is finalized.
