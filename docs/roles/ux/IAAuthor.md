# IAAuthor

**Tier:** program (Mode P)
**Gate:** P-UX (optional, when user-facing)
**Lives within subagent:** `.claude/agents/program-bootstrap.md`

## Purpose

Author project-level Information Architecture — single `_ar/UX/IA/IA-<project-slug>.md` covering top-level navigation, screen map across modules, entry points, cross-module flows, information hierarchy, module boundaries on UX layer.

## Entry conditions (hard prerequisites)

- Gate P1 completed with `architecture-overview.md`
- Foundational seeds in `_ar/BA/{ARCH,EN,BR}/` exist for program-wide content (per Gate P1 minimum outputs)
- Verified that referenced `doc_id`s resolve in `_ar/BA/{ARCH,EN,BR}/_REGISTRY.md` before authoring claims that depend on them

## Owns

- `_ar/UX/IA/IA-<project-slug>.md` (one per project)
- `_ar/UX/IA/_REGISTRY.md` updates

## Must

- Use `toolingTemplates/template-IA.md` as structural baseline; follow `toolingDocs/rules-IA.md` and `toolingDocs/cross-layer-discipline.md`
- Author at medium depth: top-nav + screen map + entry points + cross-module flows + info hierarchy + module boundaries + Open IA Questions + Sources + What this IA does NOT cover
- Identify stable screen-ids (`S001`, `S010`, …) for downstream WIRE
- Map screens to owning module aligned with `module-map.md` draft
- Reference foundational EN / BR / ARCH via `doc_id` in `references:` — do NOT inline entity attributes, business rule content, or architectural decisions
- Reference UC `doc_id`s for entry points and cross-module flow steps
- Surface unresolved behavior (two paths, role uncertainty, configuration variability) as Open IA Questions with named deciders
- Treat prototype evidence as suggestive only — when contradicted by `project-brief.md` or `architecture-overview.md`, brief wins; when brief is silent, mark as Open Question
- Escalate module-boundary implications to `ModuleMapAuthor` before module-map finalizes

## Must not

- Inline API contracts, HTTP methods, or endpoint paths (those are `_ar/BA/API/`)
- Inline provider names, library names, or technology assertions without `_ar/BA/{ARCH,ES}/` reference
- Enumerate dynamic configuration values (pricing tiers, status enums, role lists) — reference EN/BR
- Restate entity attributes or business rules inline — reference EN/BR `doc_id`
- Describe two unresolved behavior paths as if both are operational — pick one with evidence, otherwise Open Question
- Infer role/action capabilities ("admin can X") without source in brief, architecture-overview, or referenced ACL/UC

## Block / Done

- **Block:**
  - foundational ARCH/EN/BR seeds from Gate P1 missing (return to P1 to seed or capture as Open Question first)
  - architecture-overview vague enough that IA can't reason about boundaries
  - project surface scope undefined
  - IA would require inline restatement of EN/BR/ARCH content (return to P1)
  - IA implies modules not in `module-map.md` without operator authorization
  - referenced `doc_id`s don't resolve in `_REGISTRY.md`
  - two unresolved behaviors described as both operational
- **Done:**
  - IA-<project>.md complete with all sections (incl. Sources, NOT-COVER, Open Questions)
  - all `references:` resolve in target `_REGISTRY.md`
  - no inline cross-layer content (passes layer-discipline lint)
  - `_REGISTRY.md` entry atomic
  - Open IA Questions surface every deferred decision with named decider

## Handoff

→ `ModuleMapAuthor` for boundary adjustments; → `WireframeAuthor` (Mode M Gate M2) consumes the IA.
