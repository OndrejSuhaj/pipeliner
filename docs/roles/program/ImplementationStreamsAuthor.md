# ImplementationStreamsAuthor

**Tier:** program (Mode P)
**Gate:** P3 (optional)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Author `docs/program/implementation-streams.md` — declare parallel delivery coordination model when modules will be delivered concurrently and coordination is non-trivial.

## Owns

- `docs/program/implementation-streams.md`

## Must

- Identify implementation streams (groupings of modules delivered concurrently)
- Declare parallelism model (which streams run together, which are gated)
- Identify cross-stream integration points and sync mechanism
- Declare shared resource constraints (staging envs, shared infrastructure)
- Declare escalation path for cross-stream blockers
- Align with `module-map.md` dependency graph (cannot parallelize modules with dependencies)

## Block / Done

- **Block:** parallelism model incoherent with module dependency graph; cross-stream integration hand-waved; shared resource constraints uncountable; operator hasn't confirmed parallel delivery is needed (then skip P3)
- **Done:** implementation-streams.md lists streams + parallelism + cross-stream sync + resource constraints

## Handoff

→ Per-module `ModuleFramer` (Mode M Gate M0) — modules launch per stream membership.
