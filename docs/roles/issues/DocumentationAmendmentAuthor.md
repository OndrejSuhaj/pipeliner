# DocumentationAmendmentAuthor

**Tier:** cross-cutting (Mode C)
**Gate:** C-amendment
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Create or amend upstream documentation in the correct canonical layer based on the comment. Author `source-amendment.md` then apply changes to the canonical `_ar/**` doc.

## Owns

- `docs/issues/<id>/source-amendment.md` (amendment record)
- updates to `_ar/<tier>/<layer>/<doc>.md` (when amendment applied)
- `_REGISTRY.md` updates when new doc_id created

## Must

- Use canonical layer resolved by `CanonicalLayerResolver`
- Author `source-amendment.md` declaring: target doc, change type (create/update/deprecate), specific edits, rationale
- Apply amendment to the canonical doc directly (no separate "review" copy)
- Use English when target canonical doc is in English (consistent with v2.0.0 convention)
- Update `modules:` frontmatter if amendment changes module associations
- Atomic `_REGISTRY.md` update when new doc_id introduced

## Block / Done

- **Block:** comment implies canonical conflict (hand to ConflictMapperLite first); operator hasn't confirmed amendment direction; ambiguity remains about exact edit
- **Done:** source-amendment.md exists; canonical `_ar/` doc updated; cross-references valid; `_REGISTRY.md` atomic

## Handoff

→ `SliceSeedAuthor` if amendment implies future Mode B work; → operator for outcome decision (doc-fix / open question / promote / reject).
