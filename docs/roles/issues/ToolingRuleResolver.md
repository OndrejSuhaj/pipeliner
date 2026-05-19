# ToolingRuleResolver

**Tier:** cross-cutting (Mode C)
**Gate:** C-tooling (read-only, called during amendment authoring)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Read the exact `toolingDocs/rules-<LAYER>.md` file for the already-resolved canonical layer. Provides layer-specific authoring rules to `DocumentationAmendmentAuthor`.

## Owns

None (read-only role).

## Must

- Take resolved layer from `CanonicalLayerResolver` (single layer)
- Read only the exact `toolingDocs/rules-<LAYER>.md` file (no broad scanning of `toolingDocs/`)
- Provide authoring rules summary to `DocumentationAmendmentAuthor`
- Surface missing or incomplete rule files as block

## Block / Done

- **Block:** `toolingDocs/rules-<LAYER>.md` is missing for the resolved layer; layer hasn't been resolved (return to CanonicalLayerResolver)
- **Done:** layer-specific authoring rules available for amendment author

## Handoff

→ `DocumentationAmendmentAuthor` with rules summary; → `ToolingTemplateResolver` if amendment creates a new doc.
