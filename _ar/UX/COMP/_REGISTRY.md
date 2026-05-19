# COMP Registry

`_ar/UX/COMP/_REGISTRY.md` — tracks reserved `doc_ids` for the **Component Spec** canonical layer.

## Registry

| ID | Title | Status | Module(s) | Owner mode | Created |
|---|---|---|---|---|---|
| <!-- empty — populated as docs are authored --> | | | | | |

## Status legend

- `reserved` — doc_id claimed but doc not yet drafted
- `draft` — initial draft authored, not yet canonical
- `canonical` — accepted as canonical authoritative content
- `deprecated` — superseded; do not reference from new content

## Authoring authority

- **Mode P** (Gate P-UX): project-level IA (one per project; goes into `_ar/UX/IA/IA-<project>.md`)
- **Mode M** (Gate M2 / M3): module-scope COMP docs (set `modules:` frontmatter)
- **Mode B**: COMP docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first COMP doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`

**Note:** Authoring rules for COMP layer details (sections, required fields, accessibility minimums, etc.) are introduced in Batch 4 of the foundation amendment (`toolingDocs/rules-COMP.md` and `toolingTemplates/template-COMP.md`). Until Batch 4 lands, this layer is registered but its authoring rules are pending.

## Naming convention

`COMP<####>-<kebab-case-name>.md` — e.g. `COMP0001-example.md`

For IA project-level doc, naming is `IA-<project-slug>.md` (no numeric ID).

## Required frontmatter on docs

```yaml
---
doc_id: COMP<####>
title: <Title>
canonical_layer: COMP
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
