# QUERY Registry

`_ar/BA/QUERY/_REGISTRY.md` — tracks reserved `doc_ids` for the **Query / Read-side** canonical layer.

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

- **Mode P** (Gate P1): foundational QUERY docs shared by all modules (program-wide)
- **Mode M** (Gate M1a / M1b / M2 / M3): module-scope QUERY docs (set `modules:` frontmatter)
- **Mode B**: QUERY docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first QUERY doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`

## Naming convention

`QUERY<####>-<kebab-case-name>.md` — e.g. `QUERY0001-example-name.md`

## Required frontmatter on docs

```yaml
---
doc_id: QUERY<####>
title: <Title>
canonical_layer: QUERY
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
