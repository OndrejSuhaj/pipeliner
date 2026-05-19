# WIRE Registry

`_ar/UX/WIRE/_REGISTRY.md` — tracks reserved `doc_ids` for the **Wireframe Spec** canonical layer.

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
- **Mode M** (Gate M2 / M3): module-scope WIRE docs (set `modules:` frontmatter)
- **Mode B**: WIRE docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first WIRE doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`


## Naming convention

`WIRE<####>-<kebab-case-name>.md` — e.g. `WIRE0001-example.md`

For IA project-level doc, naming is `IA-<project-slug>.md` (no numeric ID).

## Required frontmatter on docs

```yaml
---
doc_id: WIRE<####>
title: <Title>
canonical_layer: WIRE
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
