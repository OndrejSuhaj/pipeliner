# WireframeAuthor

**Tier:** module (Mode M)
**Gate:** M2
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Author per-screen wireframe specs — `_ar/UX/WIRE/WIRE<####>-<screen>.md` per in-scope screen for the module. One screen per doc.

## Owns

- `_ar/UX/WIRE/WIRE<####>-<screen-name>.md` (one per screen)
- `_ar/UX/WIRE/_REGISTRY.md` updates
- updates to `modules:` frontmatter on referenced COMP docs

## Must

- Use `toolingTemplates/template-WIRE.md` baseline; follow `toolingDocs/rules-WIRE.md`
- Set `realizes_uc:` frontmatter with at least one UC doc_id (REQUIRED)
- Set `screen_id:` matching IA screen map
- Cover required states: default, empty, loading, error (or explicit "N/A")
- List every component used with COMP doc_id or "inline" flag
- Map validation surfaces to BR doc_ids
- Map data bindings to EN/QUERY doc_ids
- Declare conditional visibility with ACL/BR refs
- Address screen-level accessibility (tab order, focus on state transition, ARIA landmarks)

## Block / Done

- **Block:** IA missing this module's screens; required UC doc_ids don't exist (return to M1b); critical screen lacks realizing UC; validation lacks BR trigger
- **Done:** WIRE doc with all sections; `realizes_uc` set; 4 states covered or N/A; components traced to COMP or inline; validation→BR; `_REGISTRY.md` atomic

## Handoff

→ `ComponentSpecAuthor` when WIRE reveals new reusable component; → `CopySpecAuthor` for text content; → `ModulePlanAuthor` when wireframe coverage sufficient.
