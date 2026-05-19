# CanonicalLayerResolver

**Tier:** cross-cutting (Mode C)
**Gate:** C-layer-resolution
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Determine which canonical documentation layer (EN/UC/BR/ARCH/FN/ES/JOB/QUERY/ACL/API/CS/MSG/IA/WIRE/COMP/COPY) is actually affected by the selected issue/comment.

## Owns

- contributions to `comment-intake.md` § Affected Layer
- (when conflict found) input to `ConflictMapperLite`

## Must

- Read the comment against canonical layer rules in `toolingDocs/rules-*.md`
- Identify which layer the comment claims to challenge (single primary layer)
- Identify secondary layers if comment crosses concerns
- Verify the relevant `_ar/<tier>/<layer>/<doc>` exists; if it doesn't, flag as new-doc candidate
- Surface ambiguity when comment doesn't clearly fit any layer

## Block / Done

- **Block:** layer cannot be resolved safely (operator clarification needed); comment crosses many layers without primary focus
- **Done:** comment-intake.md identifies primary layer (and secondary when relevant); affected `_ar/` doc paths listed

## Handoff

→ `ToolingRuleResolver` for layer-specific authoring rules; → `DocumentationAmendmentAuthor` for amendment authoring; → `ConflictMapperLite` when amendment would create canonical conflict.
