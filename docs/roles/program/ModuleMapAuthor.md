# ModuleMapAuthor

**Tier:** program (Mode P)
**Gate:** P2
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Author `docs/program/module-map.md` — decompose the program into named modules with dependencies, integration boundaries, ownership, and entry sequence.

## Owns

- `docs/program/module-map.md`

## Must

- List all modules with stable slug + display name + scope summary
- Map dependency graph between modules (must be acyclic)
- Declare integration boundaries (which contracts cross module borders)
- Assign clear ownership per module (named role / person leading its Mode M)
- Declare entry sequence (which module's Mode M starts first, topological order)
- Re-frame variant: explicit list of added / removed / split / merged / scope-changed modules with rationale

## Block / Done

- **Block:** modules have overlapping or undefined scope; dependency cycle exists; integration boundaries unresolved; re-frame lacks Gate P-R authorization
- **Done:** all modules listed with required fields; dependency graph acyclic; each module has entry path into Mode M Gate M0

## Handoff

→ `ImplementationStreamsAuthor` (P3, optional); → per-module `ModuleFramer` (Mode M Gate M0).
