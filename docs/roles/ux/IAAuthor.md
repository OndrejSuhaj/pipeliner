# IAAuthor

**Tier:** program (Mode P)
**Gate:** P-UX (optional, when user-facing)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Author project-level Information Architecture — single `_ar/UX/IA/IA-<project-slug>.md` covering top-level navigation, screen map across modules, entry points, cross-module flows, information hierarchy, module boundaries on UX layer.

## Owns

- `_ar/UX/IA/IA-<project-slug>.md` (one per project)
- `_ar/UX/IA/_REGISTRY.md` updates

## Must

- Use `toolingTemplates/template-IA.md` as structural baseline; follow `toolingDocs/rules-IA.md`
- Author at medium depth: top-nav + screen map + entry points + cross-module flows + info hierarchy + module boundaries + Open IA Questions
- Identify stable screen-ids (`S001`, `S010`, …) for downstream WIRE
- Map screens to owning module aligned with `module-map.md` draft
- Cross-reference foundational UC `doc_id`s for entry points
- Escalate module-boundary implications to `ModuleMapAuthor` before module-map finalizes

## Block / Done

- **Block:** architecture-overview vague enough that IA can't reason about boundaries; project surface scope undefined; IA implies modules not in `module-map.md` without operator authorization; foundational UCs missing
- **Done:** IA-<project>.md complete with all sections; `_REGISTRY.md` entry; Open IA Questions surface deferred decisions

## Handoff

→ `ModuleMapAuthor` for boundary adjustments; → `WireframeAuthor` (Mode M Gate M2) consumes the IA.
