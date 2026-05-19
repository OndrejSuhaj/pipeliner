# ProgramCorpusCurator

**Tier:** program (Mode P)
**Gate:** P1 (baseline half — corpus)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Establish program-wide source authority classification — which sources are authoritative for which topics across the entire program.

## Owns

- contributions to `docs/program/architecture-overview.md` § source authority
- foundational `_ar/BA/{EN,ARCH,BR}/` seeds when program-wide content is identified
- `_REGISTRY.md` updates

## Must

- Map source material to topics (source-path → topic table)
- Distinguish authoritative sources from supporting material
- Flag conflicting sources for `ProgramConflictMapper`
- Flag terminology instability for `ProgramTerminologyResolver`
- Identify foundational entities, architectural patterns, business rules that are program-wide
- Make routing-friendly corpus navigation explicit (which subset is relevant for which module)

## Block / Done

- **Block:** source material wholly inaccessible; operator can't confirm authority of foundational sources; problem is actually module-scope (escalate to Mode M Gate M1a)
- **Done:** source authority section in architecture-overview distinguishes authoritative from supporting; foundational seeds exist where identified

## Handoff

→ `ProgramTerminologyResolver` for term instability; → `ProgramConflictMapper` for canonical conflicts; → `ArchitectureOverviewAuthor` for integration.
