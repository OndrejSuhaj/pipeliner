# Component Spec Documentation Rules (COMP)

## Purpose

COMP documents define **reusable component contracts**: props/inputs, variants,
states, events, accessibility expectations, usage constraints, dependencies,
and composition rules.

One COMP doc per component. Authored at Mode M Gate M3.

COMP exists to:

- declare the component's purpose and intended usage,
- declare its props/inputs and their types,
- declare its variants (size, style, tone) and states (idle, hover, focused, disabled, loading, error),
- declare its events / emissions to parent,
- declare accessibility expectations (ARIA, keyboard, focus),
- declare usage constraints (when to use, when not to use),
- declare dependencies on other COMPs (composition) or data (EN, QUERY),
- declare optional external design source (Figma / Storybook URL).

COMP is **not** for:

- screen-level layout (that is WIRE)
- text content (that is COPY)
- backend behavior (that is API / FN / UC)

---

## Naming

`COMP<####>-<kebab-case-name>` — e.g. `COMP0001-Button`, `COMP0014-PipelineCard`.

Numbers reserved in `_ar/UX/COMP/_REGISTRY.md`. Numbers are sequential across the
project, not per-module.

Cross-module shared components live in the same flat folder; the `modules:`
frontmatter declares which modules consume the component.

---

## Required Frontmatter

```yaml
---
doc_id: COMP<####>
title: <Component Name>
canonical_layer: COMP
modules: [<module-slug>, ...]    # all modules that use the component
status: draft | canonical | deprecated
design_source: <Figma / Storybook URL>  # optional
references:
  - <COMP-ids> (sub-components used in composition)
  - <EN-ids> (entity data displayed)
  - <ACL-ids> (when component visibility depends on role)
---
```

`design_source:` is optional. When present, it links to the canonical visual
spec (Figma frame, Storybook story). The component itself does not need a
separate design system layer.

---

## Recommended Structure

1. Purpose
2. Props / Inputs
3. Variants
4. States
5. Events
6. Accessibility
7. Usage Constraints
8. Dependencies
9. Composition
10. Examples

---

## Section Meaning

**Purpose** — One paragraph: what the component represents, intended usage, what problem it solves. State explicitly whether the component is module-scoped or shared cross-module.

**Props / Inputs** — Table: `Name | Type | Required | Default | Description`. Lists all input props the component accepts. For complex types (objects, enums), reference relevant `EN` doc_ids.

**Variants** — Bullet list of variant axes (size, style, tone, intent) and values per axis. Example: `size: small | medium | large`. Each variant value with one-line description.

**States** — Required state coverage: `idle`, `hover`, `focused`, `disabled`, `loading`, `error`. For each, describe visual and behavioral changes. State not applicable: declare explicitly (e.g. "Loading: N/A — component is purely presentational").

**Events** — Table: `Event | Payload | Trigger | Notes`. Lists every event the component emits to parent (onClick, onChange, onFocus, onError, ...). Components without events: explicit "No events emitted".

**Accessibility** — REQUIRED MINIMUM:
- ARIA role(s) — what semantic role the component fulfills
- Keyboard navigation — which keys interact (Tab, Enter, Space, Escape, arrow keys, ...)
- Focus management — when does focus enter/exit the component, where it goes on activation
- Screen reader — what is announced; label/description sources

Components that wrap native HTML elements (e.g. `<button>`) may inherit native a11y; declare that explicitly.

**Usage Constraints** — Bullet list: when to use, when not to use, cardinality (one per screen / multiple OK), placement (must be inside form / standalone OK).

**Dependencies** — Bullet list of external dependencies: other COMPs (composition), data entities (EN), conditional visibility rules (ACL), external libraries (rare — flag for review).

**Composition** — If the component is composed of other COMPs, describe the composition pattern. Example: `PipelineCard composes Button (action), Avatar (owner), StatusBadge (state)`. Reference sub-COMP doc_ids.

**Examples** — Optional but recommended: 1-3 usage examples showing typical props + variant combinations. Pseudo-code or framework-agnostic syntax.

---

## Cross-Layer References

**Required:**
- `modules:` frontmatter — list of consuming modules
- Composition section — sub-COMP `doc_id`s when component composes others

**Recommended:**
- Props/Inputs — `EN` `doc_id` for entity-typed props
- Conditional Visibility — `ACL` `doc_id` when role-gated
- `design_source:` URL when design system exists

---

## Accessibility Minimum

Every COMP must explicitly address:

- **ARIA roles / properties** — REQUIRED unless component wraps native semantic HTML
- **Keyboard navigation** — REQUIRED for interactive components
- **Focus management** — REQUIRED for components that change focus on interaction
- **Screen reader announcements** — REQUIRED for stateful components (loading/error/success)

Purely presentational components (e.g. `Divider`, `Spacer`) may declare "N/A — no interaction" but must still note semantic role (decorative vs. structural).

---

## Quality Bar

A good COMP doc is:

- one component per doc
- complete props table (no undocumented inputs)
- variant-explicit (every variant axis declared with values)
- state-complete (all 6 states covered or explicitly N/A)
- event-traceable (every emit declared with payload)
- a11y-aware (ARIA, keyboard, focus, screen reader minimum)
- composition-explicit (sub-COMPs referenced when used)

A bad COMP doc:

- mixes multiple components in one doc
- has undeclared props (real component accepts more than doc shows)
- skips states without "N/A" declaration
- ignores accessibility minimum
- uses inline sub-components when reusable COMP exists
- has dangling `references:` (referenced COMP/EN doesn't exist)
