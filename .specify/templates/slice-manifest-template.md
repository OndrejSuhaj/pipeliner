# Slice Manifest Template

This template documents the **`touches:` block** that every slice `spec.md` must include in its frontmatter. The manifest declares every canonical authored doc (`_ar/**`) that the slice will create, update, or merely reference.

Mode B Gate B0 (slice-readiness) and the review subagents verify that:
- declared `create` docs do not yet exist,
- declared `update` docs exist,
- declared `reference` docs exist,
- each declared change is addressed in `review.md`.

Undeclared `_ar/` changes are scope violations and must be blocked at review.

## `spec.md` frontmatter schema

```yaml
---
slice_id: <module>/<phase>-<NN>-<slug>
module: <module-slug>
acceptance_criterion: <single user-observable outcome>
impact_class: IC0 | IC1 | IC2 | IC3 | IC4 | IC5

touches:
  create:
    - _ar/BA/<LAYER>/<DOCID>-<name>.md  # new doc
    - _ar/UX/<LAYER>/<DOCID>-<name>.md
  update:
    - _ar/BA/<LAYER>/<DOCID>-<name>.md  # comment: what changes
  reference:
    - _ar/BA/<LAYER>/<DOCID>-<name>.md  # read-only dependency
    - _ar/UX/IA/IA-<project>.md

depends_on_slices:
  - <other-slice-id>
---
```

## Worked example

```yaml
---
slice_id: core/phase0-01-auth-foundation
module: core
acceptance_criterion: User can log in with email + password and is redirected to /dashboard
impact_class: IC3

touches:
  create:
    - _ar/BA/EN/EN0014-Session.md
    - _ar/UX/WIRE/WIRE0001-LoginScreen.md
  update:
    - _ar/BA/EN/EN0001-User.md           # add `email_verified` attribute
    - _ar/BA/UC/UC0001-Login.md          # add email verification step
  reference:
    - _ar/BA/BR/BR0003-PasswordPolicy.md
    - _ar/UX/IA/IA-pipeliner.md

depends_on_slices: []
---
```

## Rules

1. **Atomicity with `_REGISTRY.md`.** Every entry in `create:` must be accompanied by a `_REGISTRY.md` update in the same commit (new row with status `draft` or `canonical`).
2. **No dangling references.** Every `doc_id` in `update:` and `reference:` must resolve to an existing doc. Verified at slice DoD.
3. **No undeclared changes.** Any `_ar/` modification not listed here is a scope violation at review.
4. **No first-layer-doc creation.** Mode B may add new docs to existing layers but may not introduce the **first** doc in a canonical layer for a module. That is Mode M Gate M1a territory.
5. **Review addresses each entry.** `review.md` must explicitly comment on each `create` and `update` entry — what was added/changed and why.
6. **`modules:` frontmatter on touched docs.** When a slice in module X starts referencing a doc that doesn't list X in `modules:`, the slice's manifest must update `modules:` as part of the touch.

## Verification

`SliceReadinessVerifier` (Mode B Gate B0, read-only haiku subagent) reads this manifest and verifies:
- creates don't conflict with existing docs,
- updates and references resolve,
- impact class matches `slice-map.md` declaration,
- depends_on_slices have status `merged` or `deferred-acceptable`.

The reviewers (spec-alignment, code-quality, simplicity) read this manifest alongside `review.md` to verify that each declared change is reviewed.
