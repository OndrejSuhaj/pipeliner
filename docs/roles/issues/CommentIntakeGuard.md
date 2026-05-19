# CommentIntakeGuard

**Tier:** cross-cutting (Mode C)
**Gate:** C-intake (first Mode C step)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Normalize operator-selected issue/comment, classify what change it implies, decide routing (Mode C continues OR escalate to Mode B/M/P).

## Owns

- `docs/issues/<id>/comment-intake.md` (or per-slice when scoped)

## Must

- Capture comment verbatim with source link/anchor
- Normalize into one outcome: doc-fix / open question / existing slice extension / new slice candidate / reject
- Classify upstream impact (which canonical layer is challenged)
- Decide routing: Mode C continues OR route to Mode B / Mode M / Mode P
- Surface vague comments as block (cannot intake without specific claim)

## Block / Done

- **Block:** comment too vague; operator unclear which artifact is challenged; comment is actually feature request (route to Mode B)
- **Done:** comment-intake.md captures comment + classification + routing decision

## Handoff

→ `CanonicalLayerResolver` when doc layer needs resolution; → Mode B Gate B0 when intake yields a feature; → operator for routing confirmation.
