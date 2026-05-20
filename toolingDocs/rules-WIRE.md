# Wireframe Spec Documentation Rules (WIRE)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

WIRE documents define **screen-level** layout, interaction, and state coverage
for a single screen. They are the canonical handoff artifact between UX and FE.

One WIRE doc per screen. Authored at Mode M Gate M2 (per module).

WIRE exists to:

- declare layout zones and visual structure of the screen,
- declare which components are used on the screen and where,
- declare interactions (entry, primary action, secondary actions, exit),
- declare every state the screen can be in (default, empty, loading, error),
- declare validation surfaces (where validation errors appear),
- declare data bindings (which entities/queries feed the screen),
- declare accessibility expectations,
- realize one or more UCs (use cases) at the UI level.

WIRE is **not** for:

- screen map / navigation (that is IA)
- reusable component contracts (that is COMP)
- text content (that is COPY)
- backend logic (that is UC / API / FN)

---

## Naming

`WIRE<####>-<kebab-case-name>` — e.g. `WIRE0001-LoginScreen`, `WIRE0014-CheckoutFlow`.

Numbers reserved in `_ar/UX/WIRE/_REGISTRY.md`. Numbers are sequential across the
project, not per-module.

---

## Required Frontmatter

```yaml
---
doc_id: WIRE<####>
title: <Screen Name>
canonical_layer: WIRE
modules: [<module-slug>]
screen_id: S<###>           # from IA Screen Map
realizes_uc: [UC<####>, ...]  # REQUIRED — at least one UC
status: draft | canonical | deprecated
references:
  - <UC-ids>
  - <COMP-ids> (components used)
  - <EN-ids> (entities shown)
  - <QUERY-ids> (data feeds)
  - <BR-ids> (validation rules)
  - <CS-ids> (FE-first scenarios, when relevant)
---
```

**`realizes_uc:` is mandatory.** A screen without a use case has no deterministic
reason to exist. If unsure which UC the screen realizes, return to Mode M Gate
M1b or Mode P to clarify.

---

## Recommended Structure

1. Purpose
2. Layout Zones
3. Components Used
4. Interactions
5. States
6. Validation Surfaces
7. Data Bindings
8. Conditional Visibility
9. Accessibility Notes

---

## Section Meaning

**Purpose** — One paragraph: what this screen accomplishes, which UC it realizes, who uses it (actor), entry context.

**Layout Zones** — Bullet list of layout regions (header, sidebar, main content, footer, modal overlay, ...). Each zone with one-line content description. ASCII layout sketch optional but recommended.

**Components Used** — Table: `Zone | COMP-id | Variant/Props | Notes`. Lists every COMP instance on the screen with its position and configuration. Components without a COMP doc must be flagged as "to-be-extracted" or "inline".

**Interactions** — Numbered list of all interactions. Required categories:
- **Entry** — how user arrives (route, deep link, redirect)
- **Primary action** — main thing the user does (e.g. submit form, confirm)
- **Secondary actions** — supporting interactions (cancel, edit, navigate away)
- **Exit** — how user leaves (success route, cancel route)

Each interaction with: trigger → effect → next state/screen. UC `doc_id` reference.

**States** — Required state coverage:
- `default` — normal usable state
- `empty` — no data to show (lists, tables, dashboards)
- `loading` — async operation in progress
- `error` — operation failed or runtime error

Each state with: appearance description, components shown/hidden, CTAs available, recovery path.

**Validation Surfaces** — Where validation errors are shown. Table: `Field/Zone | Trigger (BR-id) | Surface (inline / toast / modal)`. Every validation message references a BR.

**Data Bindings** — Which entities/queries feed each zone. Table: `Zone | EN-id | QUERY-id | Notes`. Declares the read-side dependencies.

**Conditional Visibility** — Components or zones shown/hidden based on conditions (role, feature flag, data state). Table: `Component/Zone | Condition (ACL or BR ref) | Behavior when hidden`.

**Accessibility Notes** — Screen-level a11y: tab order, focus management on state transition, screen reader landmarks, keyboard shortcuts unique to this screen. Component-level a11y belongs in COMP docs.

---

## Cross-Layer References

**Required:**
- `realizes_uc:` frontmatter — at least one UC `doc_id`
- Components Used — every entry must be a real COMP `doc_id` or flagged inline
- Validation Surfaces — every entry must reference a BR `doc_id`

**Recommended:**
- Data Bindings — entities and queries by `doc_id`
- Conditional Visibility — ACL or BR `doc_id` per condition
- Cross-references to IA `doc_id` if screen is part of a cross-module flow

---

## Required State Coverage

Every WIRE must explicitly address:

- `default` — REQUIRED
- `empty` — REQUIRED if screen shows lists, tables, dashboards, or any conditional content
- `loading` — REQUIRED if screen has async data dependencies
- `error` — REQUIRED for any screen that performs operations (network, validation, action)

If a state is not applicable, state that explicitly (e.g. "Loading: N/A — screen is static, no async data").

Skipping a state without explicit declaration is a quality bar violation.

---

## Quality Bar

A good WIRE doc is:

- one screen per doc (don't bundle multi-screen flows)
- UC-anchored (every screen has at least one `realizes_uc`)
- state-complete (default / empty / loading / error covered)
- component-traceable (every visual element either references a COMP or is inline-flagged)
- validation-traceable (every error message references a BR)
- a11y-aware (tab order, focus, landmarks at screen level)

A bad WIRE doc:

- mixes multiple screens in one doc
- has no `realizes_uc:` (screen exists without deterministic reason)
- skips states without explicit "N/A" declaration
- uses inline components when reusable COMP exists
- has validation messages without BR trigger
- ignores accessibility at screen level
