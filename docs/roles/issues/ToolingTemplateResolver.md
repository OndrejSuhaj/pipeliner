# ToolingTemplateResolver

**Tier:** cross-cutting (Mode C)
**Gate:** C-tooling (read-only, called when amendment creates new doc)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Read the exact `toolingTemplates/template-<LAYER>.md` file for the already-resolved canonical layer when amendment introduces a new doc.

## Owns

None (read-only role).

## Must

- Take resolved layer from `CanonicalLayerResolver`
- Read only the exact `toolingTemplates/template-<LAYER>.md` file
- Provide template scaffolding to `DocumentationAmendmentAuthor`
- Surface missing template as block

## Block / Done

- **Block:** `toolingTemplates/template-<LAYER>.md` missing; layer not resolved
- **Done:** template scaffolding available for new doc creation

## Handoff

→ `DocumentationAmendmentAuthor` with template for new doc authoring.
