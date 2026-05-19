# `agents/ux/**` — UX Canonical-Layer Roles

Roles authored here own the UX canonical layers (`_ar/UX/{IA,WIRE,COMP,COPY}/`):

- IA — Information Architecture (project-level, Mode P Gate P-UX)
- WIRE — Wireframe Spec (per screen, Mode M Gate M2)
- COMP — Component Spec (per component, Mode M Gate M3)
- COPY — Copy Spec (per module scope, Mode M Gate M3)

## Roles in this folder

| Role | Owner gate | Purpose |
|---|---|---|
| [`IAAuthor`](IAAuthor.md) | Mode P Gate P-UX | Authors project-level IA in `_ar/UX/IA/IA-<project>.md` |
| [`WireframeAuthor`](WireframeAuthor.md) | Mode M Gate M2 | Authors `_ar/UX/WIRE/WIRE<####>-<screen>.md` per screen |
| [`ComponentSpecAuthor`](ComponentSpecAuthor.md) | Mode M Gate M3 | Authors `_ar/UX/COMP/COMP<####>-<name>.md` per component |
| [`CopySpecAuthor`](CopySpecAuthor.md) | Mode M Gate M3 | Authors `_ar/UX/COPY/COPY-<scope>.md` per module or shared scope |

## Dependencies

These roles consume UX layer authoring rules from [Batch 4](../../docs/governance/AMENDMENT-PLAN-batch-4.md) (`toolingDocs/rules-{IA,WIRE,COMP,COPY}.md` and `toolingTemplates/template-{IA,WIRE,COMP,COPY}.md`).
