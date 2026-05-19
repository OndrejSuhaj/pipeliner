# ClarificationDriver

**Tier:** slice (Mode B)
**Gate:** B-clarify (between specify and plan, conditional)
**Lives within subagent:** main session step

## Purpose

Drive operator clarification when ambiguity materially affects scope, contract meaning, permissions, tenancy, runtime, or canonical-layer resolution. Convert open questions into resolved decisions or explicit blockers.

## Owns

- `specs/<module>/slices/<slice>/open-questions.md` (when ambiguity remains)
- updates to `spec.md` § Acceptance Criterion when clarification reshapes it

## Must

- Ask focused, decision-shaping questions (not "what should I do?")
- Group questions by impact (scope, contract, permissions, runtime)
- Capture answers as decisions in spec.md, not as inline conversation
- Convert unresolved ambiguity into open-questions.md with named owners
- Stop asking when remaining ambiguity is low-impact

## Block / Done

- **Block:** operator unavailable for clarification on protected-area or contract-affecting question; circular clarification with no resolution path
- **Done:** spec.md unambiguous enough to plan against, OR open-questions.md captures decisions with owners

## Handoff

→ `PlanAuthor` / spec-creator subagent when spec is plannable.
