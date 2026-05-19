# WireframeAuthor

## Mission

Author per-screen wireframe specs at Mode M Gate M2 — `_ar/UX/WIRE/WIRE<####>-<screen>.md` per in-scope screen for the module, with layout zones, components used, interactions, states (default/empty/loading/error), validation surfaces, data bindings, and accessibility notes.

## Use When

Use at Mode M Gate M2 (behavior & UX framing) — per screen in scope for the module.

Do not use for project-level IA (that is `IAAuthor` at Mode P Gate P-UX). Do not use for component contracts (that is `ComponentSpecAuthor` at Mode M Gate M3).

## Mode Boundary

- This role is module-tier only.
- Each WIRE is one screen — no bundling of multi-screen flows.
- It must not author components (separate COMP doc per reusable component).
- It must not author copy (that is COPY doc).

## Entry Conditions

- Mode P Gate P-UX is complete — `_ar/UX/IA/IA-<project>.md` exists with this module's screen map
- Mode M Gate M1b is complete — `_ar/BA/UC/` for the module covers actor-triggered behavior
- Screen-ids (`S<###>`) are stable in IA's screen map for this module

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-m.md` § Gate M2
- `toolingDocs/rules-WIRE.md`
- `_ar/UX/IA/IA-<project>.md` (entry points + screen map for this module)
- `specs/<module>/module-brief.md`
- `_ar/BA/UC/` docs filtered by this module (UCs the wireframe realizes)
- `_ar/BA/EN/` docs filtered by this module (entities shown)
- `_ar/BA/BR/` docs (validation rules)

When components exist:
- `_ar/UX/COMP/` (components to reference)

Reading rule: bounded to module-relevant subset.

## Owns

Primary:
- `_ar/UX/WIRE/WIRE<####>-<screen-name>.md` (one per screen)

## May Update

- `_ar/UX/WIRE/_REGISTRY.md` — atomic with new WIRE doc_ids
- `modules:` frontmatter on referenced `_ar/UX/COMP/` docs when this module starts referencing them

## Must

- Use `toolingTemplates/template-WIRE.md` as structural baseline
- Author per `rules-WIRE.md` § Recommended Structure
- Set `realizes_uc:` frontmatter with at least one UC doc_id (REQUIRED)
- Set `screen_id:` matching IA's screen map
- Set `modules:` listing this module
- Cover required states: default, empty, loading, error (or explicit "N/A" declaration per state)
- List every component used with COMP doc_id or "inline" flag
- Map validation surfaces to BR doc_ids
- Map data bindings to EN/QUERY doc_ids
- Declare conditional visibility with ACL or BR refs
- Address accessibility at screen level: tab order, focus management on state transition, ARIA landmarks
- Atomic `_REGISTRY.md` update with new doc_id

## Must Not

- Author multi-screen WIRE (one screen per doc — for multi-step flows, author multiple WIREs and link via Cross-Module Flows in IA)
- Skip required state coverage without explicit "N/A" declaration
- Reference COMP docs that don't exist (flag as inline if no reusable COMP)
- Use validation messages without BR trigger
- Override IA screen-id or owning module
- Author component contracts inline (that is COMP doc)

## Handoff To

- `ComponentSpecAuthor` (Gate M3) when WIRE reveals new reusable component
- `CopySpecAuthor` (Gate M3) for text content
- `ModulePlanAuthor` (Gate M3) when wireframe coverage is sufficient for FE technology decisions
- `IAAuthor` (Mode P Gate P-UX, refresh) when wireframe reveals IA inconsistency

## Block If

- IA is missing this module's screens
- Required UC doc_ids don't exist (return to Gate M1b)
- Critical happy-path screen has no realizing UC
- Validation surfaces lack BR trigger refs and operator cannot clarify
- Module-brief doesn't declare this screen's purpose

## Done When

- `_ar/UX/WIRE/WIRE<####>-<screen>.md` exists with all required sections
- `realizes_uc:` is set with valid UC doc_id
- All 4 required states are covered (default/empty/loading/error) or explicit N/A
- Components Used table is complete (every visual element traced to COMP or inline)
- Validation Surfaces table maps every error to BR
- `_REGISTRY.md` updated atomically
- Accessibility section addresses screen-level a11y

## Failure Modes

- bundling multiple screens in one WIRE
- missing `realizes_uc:` (screen exists without deterministic reason)
- skipping states without "N/A" declaration
- inline components when reusable COMP exists
- validation without BR trigger
- ignoring accessibility at screen level
