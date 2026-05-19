# ConflictMapperLite

**Tier:** cross-cutting (Mode C)
**Gate:** C-conflict (when amendment would create canonical conflict)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Surface canonical conflicts revealed during amendment authoring — when the proposed amendment contradicts existing `_ar/**` content or another module's canonical. Lighter than Mode P `ProgramConflictMapper` (single comment scope).

## Owns

- contributions to `docs/issues/<id>/source-amendment.md` § Conflicts section
- escalation note to `ProgramConflictMapper` (Mode P) when conflict is program-wide

## Must

- Identify the contradiction: amendment intent vs. existing canonical attributes / invariants
- Determine scope: single-doc conflict / cross-module conflict / program-wide conflict
- For single-doc: propose resolution options for operator
- For cross-module: route to module owner via SliceSeedAuthor
- For program-wide: escalate to Mode P (block amendment until P-R or P1 refresh)

## Block / Done

- **Block:** conflict scope unstateable; operator unable to authorize resolution; cross-module conflict needs neighbor module owner
- **Done:** conflicts section in source-amendment lists conflict + scope + resolution (or escalation path)

## Handoff

→ `DocumentationAmendmentAuthor` when conflict is resolved single-doc; → `ProgramConflictMapper` when program-wide; → operator for unresolvable.
