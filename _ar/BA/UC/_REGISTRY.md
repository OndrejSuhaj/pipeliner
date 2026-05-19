# UC Registry

`_ar/BA/UC/_REGISTRY.md` — tracks reserved `doc_ids` for the **Use Case** canonical layer.

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

- **Mode P** (Gate P1): foundational UC docs shared by all modules (program-wide)
- **Mode M** (Gate M1a / M1b / M2 / M3): module-scope UC docs (set `modules:` frontmatter)
- **Mode B**: UC docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first UC doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`

## Naming convention

`UC<####>-<kebab-case-name>.md` — e.g. `UC0001-example-name.md`

## Required frontmatter on docs

```yaml
---
doc_id: UC<####>
title: <Title>
canonical_layer: UC
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
