# `_REGISTRY.md` Format

Every canonical layer folder in `_ar/BA/` and `_ar/UX/` has a `_REGISTRY.md` file that tracks reserved `doc_id`s, status, owning mode, and module association.

## Schema

Each `_REGISTRY.md` is a markdown file with:

1. **Header** — 1-line layer identifier
2. **Registry table** — one row per `doc_id` reserved or authored

## Table columns

| Column | Type | Purpose |
|---|---|---|
| `ID` | `<LAYER><####>` | Doc identifier (e.g. `EN0001`, `WIRE0014`). Sequential within layer. |
| `Title` | string | Human-readable doc title |
| `Status` | enum | `reserved` \| `draft` \| `canonical` \| `deprecated` |
| `Module(s)` | list | Modules referencing this doc (matches `modules:` frontmatter on the doc). Empty `[]` or `[all]` for program-wide. |
| `Owner mode` | enum | `Mode P` \| `Mode M (<module>)` \| `Mode B (<slice-id>)` \| `Mode C` — which mode authored or last amended |
| `Created` | date | YYYY-MM-DD when ID was first reserved |

## Status lifecycle

```
reserved  →  draft  →  canonical  →  deprecated
                              ↘  deprecated (skip canonical when never finalized)
```

- **reserved** — doc_id claimed in registry, doc file not yet authored
- **draft** — initial doc file authored, not yet accepted as authoritative
- **canonical** — accepted as canonical authoritative content
- **deprecated** — superseded or removed; do not reference from new content

## Authoring authority

Authority to write to `_REGISTRY.md` (and to author/amend docs in that layer):

| Layer family | Mode P (Gate P1 / P-UX) | Mode M (Gate M1a / M1b / M2 / M3) | Mode B (slice manifest) | Mode C (source-amendment) |
|---|---|---|---|---|
| `_ar/BA/*` | foundational program-wide docs (`modules: [] / [all]`) | module-scope docs (`modules: [<this-module>]`) | docs declared in `touches:` block | amendments via `source-amendment.md` |
| `_ar/UX/IA/` | project-level IA (one per project) | (consumes only) | (consumes only) | amendments via `source-amendment.md` |
| `_ar/UX/{WIRE,COMP,COPY}/` | (typically none) | per-screen / per-component / per-scope docs | docs declared in `touches:` block | amendments via `source-amendment.md` |

**Mode B authority limit:** Mode B may add new `doc_id`s to existing layers but may NOT introduce the first doc in a canonical layer for a module — that is Mode M Gate M1a territory.

## Atomicity rule

A new `doc_id` in any canonical layer requires:
- new row in `_REGISTRY.md` for that layer,
- the corresponding doc file authored or stubbed,
- both in the same commit.

A `doc_id` without registry entry, or a registry entry without doc file, is malformed and blocks merge.

## Cross-references

Docs reference each other via `doc_id` in `references:` frontmatter list. Referenced `doc_id`s must resolve to existing entries in their respective `_REGISTRY.md` files. Dangling references block slice DoD and module DoD.

## Naming convention for doc files

`<LAYER><####>-<kebab-case-name>.md` — e.g. `EN0001-user.md`, `WIRE0014-checkout-screen.md`.

For project-level IA (one per project), naming is `IA-<project-slug>.md` (no numeric ID).

## Required frontmatter on docs

```yaml
---
doc_id: <LAYER><####>
title: <Title>
canonical_layer: <LAYER>
status: reserved | draft | canonical | deprecated
modules: [<module-slug>, ...]
references: [<other-doc-id>, ...]
---
```

UX layer docs may add layer-specific fields:
- `IA`: `scope: program`, `owners: [ux-lead, architect]`, `language: cs | en`
- `WIRE`: `screen_id: S<###>`, `realizes_uc: [UC<####>]` (REQUIRED)
- `COMP`: `design_source: <Figma / Storybook URL>` (optional)
- `COPY`: `scope: module-<slug> | shared-<purpose>`, `language: cs | en | multi`

See `toolingDocs/rules-<LAYER>.md` for per-layer authoring rules.
