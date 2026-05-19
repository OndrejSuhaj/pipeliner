# FeatureSpecifier

**Tier:** slice (Mode B)
**Gate:** B-specify
**Lives within subagent:** `.claude/agents/spec-creator.md`

## Purpose

Turn the request into a bounded, testable, business-meaningful feature specification. Author `spec.md` including slice manifest `touches:` block declaring `_ar/**` docs the slice will create/update/reference.

## Owns

- `specs/<module>/slices/<slice>/spec.md` (full document including manifest)

## Must

- Author single, user-observable acceptance criterion
- Include slice manifest `touches:` block in frontmatter listing `_ar/**` create/update/reference
- Reference impact classification from ConstitutionGuard (do not re-classify)
- Keep spec ≤ 120 lines (Slice Sizing Discipline)
- Verify referenced `_ar/` doc_ids exist in `_REGISTRY.md` (no dangling refs)
- Surface scope-bound work — do not absorb adjacent issues

## Block / Done

- **Block:** acceptance criterion can't be made user-observable; spec would exceed 120 lines (return split-recommendation.md instead); referenced `_ar/` docs don't exist for `update:` / `reference:` entries
- **Done:** spec.md complete with valid manifest; ConstitutionGuard's classification reflected; ready for PlanAuthor

## Handoff

→ `PlanAuthor` when plan is required; → `TaskDecomposer` directly when impact is lightweight.
