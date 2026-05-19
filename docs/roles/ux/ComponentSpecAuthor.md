# ComponentSpecAuthor

**Tier:** module (Mode M, may be cross-module)
**Gate:** M3
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Author component contract docs — `_ar/UX/COMP/COMP<####>-<name>.md` per reusable component. Cross-module sharing declared via `modules:` frontmatter (flat folder, no `_shared/`).

## Owns

- `_ar/UX/COMP/COMP<####>-<component-name>.md`
- `_ar/UX/COMP/_REGISTRY.md` updates
- updates to existing COMP `modules:` frontmatter when new module consumes

## Must

- Use `toolingTemplates/template-COMP.md` baseline; follow `toolingDocs/rules-COMP.md`
- Document all props/inputs with type, required, default, description
- Declare variants with axes and values
- Cover required states: idle, hover, focused, disabled, loading, error (or N/A)
- Document events/emissions to parent
- Address accessibility minimum: ARIA, keyboard navigation, focus management, screen reader
- Declare usage constraints, dependencies, composition
- Optional: `design_source:` URL (Figma / Storybook)

## Block / Done

- **Block:** consumer WIRE doesn't exist; design inconsistent across consumers without resolution; ARIA/keyboard semantics can't be declared; cross-module sharing implies unauthorized contract changes
- **Done:** COMP doc with all required sections; 6 states covered or N/A; props table matches consumers; `modules:` reflects all consumers; `_REGISTRY.md` atomic

## Handoff

→ `WireframeAuthor` for WIRE update to reference new COMP; → `CopySpecAuthor` for component-level copy; → `ModulePlanAuthor` when contract reveals tech decision.
