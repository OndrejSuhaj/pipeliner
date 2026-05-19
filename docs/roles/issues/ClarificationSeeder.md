# ClarificationSeeder

**Tier:** cross-cutting (Mode C)
**Gate:** C-clarify (when intake reveals ambiguity)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Surface and structure ambiguities revealed during comment intake. Convert unclear comments into focused questions for operator, or into open-questions.md entries when resolution deferred.

## Owns

- `docs/issues/<id>/open-questions.md`

## Must

- Identify ambiguities that materially affect intake routing (doc-fix vs feature vs reject)
- Group questions by impact (scope of amendment, contract impact, layer choice)
- Ask focused, decision-shaping questions
- Capture answers as decisions in `comment-intake.md`
- Convert remaining ambiguity into open-questions with named owners

## Block / Done

- **Block:** operator unavailable for clarification on routing-critical question; circular clarification with no resolution
- **Done:** comment-intake.md is unambiguous enough to route; open-questions.md captures remaining decisions

## Handoff

→ `CommentIntakeGuard` for routing decision (with cleared ambiguity); → `ConflictMapperLite` when clarification reveals canonical conflict.
