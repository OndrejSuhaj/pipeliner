# `agents/ux/**` — UX Canonical-Layer Roles

Roles authored here own the UX canonical layers (`_ar/UX/{IA,WIRE,COMP,COPY}/`):

- IA — Information Architecture (project-level, Mode P Gate P-UX)
- WIRE — Wireframe Spec (per screen, Mode M Gate M2)
- COMP — Component Spec (per component, Mode M Gate M3)
- COPY — Copy Spec (per module scope, Mode M Gate M3)

## Planned roles (authored in Batch 5; UX layer rules in Batch 4)

| Role | Owner gate | Purpose |
|---|---|---|
| `IAAuthor` | Mode P Gate P-UX | Authors project-level IA in `_ar/UX/IA/IA-<project>.md` |
| `WireframeAuthor` | Mode M Gate M2 | Authors `_ar/UX/WIRE/<WIRE-id>-<screen>.md` per screen |
| `ComponentSpecAuthor` | Mode M Gate M3 | Authors `_ar/UX/COMP/<COMP-id>-<name>.md` per component |
| `CopySpecAuthor` | Mode M Gate M3 | Authors `_ar/UX/COPY/<COPY-id>-<scope>.md` per module / scope |

## Dependencies

- Batch 4 (UX rules + templates in `toolingDocs/` and `toolingTemplates/`) lands BEFORE Batch 5 (these roles).
- Batch 4 plan currently outdated — pending rewrite after Batch 2 lands (paths change from `specs/<module>/ux/` to `_ar/UX/`).

Folder is currently a placeholder. Role bodies are authored in Batch 5.
