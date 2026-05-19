# FN Registry

`_ar/BA/FN/_REGISTRY.md` — tracks reserved `doc_ids` for the **Functional Capability** canonical layer.

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

- **Mode P** (Gate P1): foundational FN docs shared by all modules (program-wide)
- **Mode M** (Gate M1a / M1b / M2 / M3): module-scope FN docs (set `modules:` frontmatter)
- **Mode B**: FN docs declared in slice manifest (`touches:` block in `spec.md`); **may not** introduce the first FN doc for a module — that is Mode M
- **Mode C**: amendments via `source-amendment.md`

## Naming convention

`FN<####>-<kebab-case-name>.md` — e.g. `FN0001-example-name.md`

## Required frontmatter on docs

```yaml
---
doc_id: FN<####>
title: <Title>
canonical_layer: FN
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, …]
references: [<other-doc-id>, …]
---
```
