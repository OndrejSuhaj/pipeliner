# Copy Documentation Rules (COPY)

## Purpose

COPY documents define user-facing text content: labels, helper texts, empty states, loading texts, error/validation messages, CTAs, and microcopy conventions.

They define:

- canonical text for labels and CTAs
- copy key naming scheme (i18n-friendly, kolize-safe)
- vazby na obrazovky (WIRE) a komponenty (COMP), které text používají
- vazby na validation triggers (BR / EN invariants)

---

## Naming

`COPY-<scope>` — kebab-case scope.

Scope conventions:

- `COPY-module-<module-slug>` for module-specific copy (e.g. `COPY-module-core`, `COPY-module-payments`)
- `COPY-shared-<purpose>` for cross-module copy (e.g. `COPY-shared-validation`, `COPY-shared-cta`, `COPY-shared-empty-states`)

One COPY doc may cover multiple WIRE/COMP within its scope.

---

## Required Frontmatter

```yaml
---
doc_id: COPY-<scope>
title: <Human-readable scope title>
canonical_layer: COPY
scope: module-<slug> | shared-<purpose>
modules: [<module-slug>, ...]   # for shared scopes, list all consuming modules
language: cs | en | multi
status: draft | canonical | deprecated
references: [<WIRE-id>, <COMP-id>, <BR-id>, ...]
---
```

---

## Recommended Structure

1. Purpose
2. Labels
3. Helper Texts
4. Empty States
5. Loading Texts
6. Error / Validation Messages
7. CTAs
8. Microcopy Conventions (scope-specific)

---

## Section Meaning

**Purpose** — One paragraph: what scope this COPY covers, which modules consume it, what tone/voice rules apply.

**Labels** — Table of static labels (field names, button text, headings) used in this scope. Format: `key | text | usage (WIRE/COMP ref)`.

**Helper Texts** — Inline hints, tooltips, secondary descriptions. Table same format.

**Empty States** — Text shown when a list, table, or section has no data. Table format with `key | text | shown when (condition)`.

**Loading Texts** — Text shown during async operations. Often optional; include only when text differs from default spinner.

**Error / Validation Messages** — Text shown when validation fails or runtime error occurs. Required format: `key | text | trigger (BR-id or EN-id reference)`. Every validation message must link to a business rule or entity invariant.

**CTAs** — Call-to-action button text. Table format with `key | text | action (UC-id reference)`.

**Microcopy Conventions** — Scope-specific writing rules: tone (formal/casual), person (1st/2nd), tense, capitalization. Optional but recommended for cross-module consistency.

---

## Key Naming Convention

Keys follow `<scope>.<screen-or-component>.<role>` pattern:

- `core.login.submit-cta` — submit button on login screen (core module)
- `core.dashboard.empty-state` — empty state on dashboard
- `shared-validation.password-min-length` — shared password validation message
- `payments.checkout.confirm-cta` — confirm button on checkout

Rationale: i18n-friendly (each key becomes a translation key), kolize-safe (scope prefix prevents cross-module collisions), grep-able.

---

## Cross-Layer References

- **Required:** Each validation message must reference a `BR` or `EN` doc_id (the rule or invariant that triggers it).
- **Required:** Each CTA must reference a `UC` doc_id (the use case the action realizes).
- **Recommended:** Labels and helper texts reference `WIRE` or `COMP` doc_ids where they appear.

---

## Quality Bar

A good COPY doc is:

- scope-bounded (one module or one shared purpose, not mixed)
- key-consistent (all keys follow naming convention)
- traceable (every key has WIRE/COMP usage reference, every validation has BR/EN trigger, every CTA has UC reference)
- i18n-ready (keys parseable as translation keys; no inline HTML or template logic)
- microcopy-aware (scope-specific tone rules stated)

A bad COPY doc:

- mixes module-specific and shared content in one doc
- has keys without usage references (orphan text)
- has validation messages without BR/EN trigger
- uses inline copy that could be reused (should be `shared-` scope)
