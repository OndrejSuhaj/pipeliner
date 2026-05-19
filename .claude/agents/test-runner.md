---
name: test-runner
description: Run all available checks and tests after implementation (Biome, typecheck, builds, Vitest/Jest) and return a structured pass/fail report. Read-only — must never edit any file. Spawn before reviewers and before commit.
tools: Bash, Read, Grep, Glob
model: haiku
color: green
---

# Test Runner Subagent

## Purpose

Run all available checks and tests after implementation, returning a pass/fail report. Keeps test output out of the main session context.

## When to Use

Spawn after completing implementation work on any slice, before committing. The main session reviews the report and fixes any issues before proceeding.

## Invocation

Spawn with `model: "haiku"`. No worktree needed — this agent only reads and runs commands, it does not modify files.

**Model rule**: per `CLAUDE.md` § Subagent Policy → Model selection rule, haiku is reserved for read-only/run-only roles. The test-runner is haiku precisely because it cannot edit. Haiku must never be invoked for any subagent that edits files; all editing subagents are opus.

**Editing prohibition**: this agent must not modify any file under any circumstance. If a check fails, the agent reports the failure and stops. Fixing failed checks is the main session's responsibility (which delegates to an editing subagent — see `.claude/agents/spec-creator.md` and the per-lane implementer pattern in `CLAUDE.md` § Subagent Policy → Implementation lanes).

**Terminal display name**: Use `description: "Test Runner: {slice-id}"` (e.g., `"Test Runner: S4-08"`) so the terminal shows the agent's purpose clearly.

## Prompt Template

When spawning, provide a prompt based on this template. Replace `{placeholders}` with actual values.

```
You are running all available checks and tests for the project after implementing **{slice-id} — {slice-title}**.

## Instructions

Run the following checks in order. For each, report: pass/fail, and if fail, the relevant error output (trimmed to essential lines).

### 1. Biome check

Run `npx biome check .` from the repo root. Report any lint or format errors.

### 2. TypeScript typecheck

Run `pnpm typecheck` from the repo root. Report any type errors.

### 3. Next.js build

Run `cd apps/web && npx next build`. Report any build errors. Only show the last 20 lines unless there are errors earlier.

### 4. NestJS build

Run `cd apps/api && pnpm build`. Report any build errors.

### 5. API tests

Run `cd apps/api && pnpm test` if tests exist. Report failures. If no test script or no tests, note "no tests configured".

### 6. Summary

Produce a summary table:

| Check | Result | Notes |
|-------|--------|-------|
| Biome | pass/fail | ... |
| TypeScript | pass/fail | ... |
| Web build | pass/fail | ... |
| API build | pass/fail | ... |
| API tests | pass/fail/skipped | ... |

List any files with errors so the main session can fix them directly.

## Constraints

- Do NOT modify any files
- Do NOT fix errors — only report them
- Keep output concise — error messages only, not full build logs
- Timeout each command at 120 seconds
```

## Output

The agent returns a structured report. The main session:
1. Reviews the results
2. Fixes any failures
3. Re-runs the agent if needed
4. Proceeds to review only after all checks pass
