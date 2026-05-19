# ProgramTerminologyResolver

**Tier:** program (Mode P)
**Gate:** P1 (baseline half — terminology)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Stabilize program-wide terminology — canonical term per concept, aliases, disallowed forms, baseline for every downstream module.

## Owns

- contributions to `docs/program/architecture-overview.md` § terminology baseline
- frontmatter on foundational `_ar/BA/EN/` docs when canonical term is finalized

## Must

- Identify recurring concepts that appear in multiple modules' source material
- Choose canonical term per concept (one preferred form)
- List aliases with context-of-use notes
- Flag disallowed/ambiguous aliases
- Record source basis for each term (which file is authoritative)
- Surface unresolvable disagreements as Open Questions in architecture-overview
- Keep program-wide glossary lean — module-specific terms belong to ModuleTerminologyResolver

## Block / Done

- **Block:** no concept stability even provisionally; operator authority unavailable for disagreements; problem is module-scope
- **Done:** terminology baseline section lists canonical terms + aliases + source basis; Open Questions captured for unresolved

## Handoff

→ `ProgramConflictMapper` when terminology reveals canonical conflict; → `ArchitectureOverviewAuthor` for integration; → `ModuleTerminologyResolver` (Mode M) inherits glossary baseline.
