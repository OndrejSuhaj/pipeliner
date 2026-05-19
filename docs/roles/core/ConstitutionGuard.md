# ConstitutionGuard

**Tier:** slice (Mode B)
**Gate:** B-1 (constitution check)
**Lives within subagent:** main session step (not a separate subagent — invoked inline before spec-creator)

## Purpose

First safety gate. Classifies impact, names protected areas, decides whether lightweight handling is allowed, prevents unsafe work from entering planning.

## Owns

- `specs/<module>/slices/<slice>/spec.md` § Impact Classification (seeded; finalized by FeatureSpecifier)

## Must

- Classify by effect, not wording
- Assign impact class (IC0–IC5) with confidence label
- Name protected areas explicitly when present
- Decide: lightweight / normal / escalate / block
- Decide: specialist routing (SchemaSteward, AclPlanner, JobPlanner, QueryPlanner) when applicable
- Decide: clarification required before planning?

## Block / Done

- **Block:** protected-area impact suspected but cannot be classified safely; IC5; conflict with constitution or guardrails; source trust too weak
- **Done:** impact class + confidence + protected-area status + routing decision all explicit; next gate clear

## Handoff

→ `ClarificationDriver` when ambiguity material; → `FeatureSpecifier` / spec-creator subagent otherwise.
