# ProgramConflictMapper

**Tier:** program (Mode P)
**Gate:** P1 (baseline half — conflicts)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Map program-wide canonical conflicts — same concept with different meaning, contradictory invariants, or competing source authority across the program.

## Owns

- contributions to `docs/program/architecture-overview.md` § canonical conflicts log
- updates to foundational `_ar/BA/{EN,BR,ARCH}/` docs when resolution is authorized
- `_REGISTRY.md` status transitions

## Must

- Identify conflicts at concept level: same name, different attributes / invariants / lifecycle / ownership
- Map each: parties involved, nature of disagreement, downstream module impact
- Surface conflicts to operator with explicit resolution options
- Record resolution rationale (which source/draft wins, why)
- Block downstream Mode M for modules affected by unresolved conflicts
- Keep partial resolutions visible (don't present as canonical)

## Block / Done

- **Block:** conflict scope unstateable; no source authority can adjudicate; resolution requires unmade operator decision
- **Done:** conflicts section lists each conflict with parties + nature + resolution (or Open Question); foundational docs reflect resolutions

## Handoff

→ `ArchitectureOverviewAuthor` for integration; → operator for unresolved conflicts; → `ModuleConflictMapper` (Mode M) inherits the conflict register.
