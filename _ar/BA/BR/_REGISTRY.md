# BR Registry

`_ar/BA/BR/_REGISTRY.md` — tracks reserved `doc_ids` for the **Business Rule** canonical layer.

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

- **Mode P** (Gate P1): foundational BR docs shared by all modules (program-wide)
- **Mode M** (Gate M1a / M1b / M2 / M3): module-scope BR docs (set `modules:` frontmatter)
- **Mode B**: BR docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first BR doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`

## Naming convention

`BR<####>-<kebab-case-name>.md` — e.g. `BR0001-example-name.md`

## Required frontmatter on docs

```yaml
---
doc_id: BR<####>
title: <Title>
canonical_layer: BR
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
