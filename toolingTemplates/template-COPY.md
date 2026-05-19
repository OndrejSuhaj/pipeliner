---
doc_id: COPY-<scope>
title: <Human-readable scope title>
canonical_layer: COPY
scope: module-<slug> | shared-<purpose>
modules: [<module-slug>]
language: cs | en | multi
status: draft
references: []
---

# COPY-<scope> – <Title>

## Purpose

<One paragraph: what scope this COPY covers, which modules consume it, what tone/voice rules apply.>

---

## Labels

| Key | Text | Usage (WIRE/COMP ref) |
|---|---|---|
| `<scope>.<screen-or-component>.<role>` | `<Label text>` | `WIRE<####>` / `COMP<####>` |

---

## Helper Texts

| Key | Text | Usage |
|---|---|---|
| `<scope>.<screen-or-component>.<role>-helper` | `<Helper text>` | `WIRE<####>` |

---

## Empty States

| Key | Text | Shown when |
|---|---|---|
| `<scope>.<screen>.empty-state` | `<Empty state text>` | `<condition>` |

---

## Loading Texts

| Key | Text | Shown during |
|---|---|---|
| `<scope>.<screen>.loading` | `<Loading text>` | `<async operation>` |

---

## Error / Validation Messages

| Key | Text | Trigger |
|---|---|---|
| `<scope>.<screen>.<field>.validation-error` | `<Error text>` | `BR<####>` / `EN<####>` |

---

## CTAs

| Key | Text | Action |
|---|---|---|
| `<scope>.<screen>.submit-cta` | `<CTA text>` | `UC<####>` |

---

## Microcopy Conventions

<Scope-specific writing rules: tone, person, tense, capitalization. Optional but recommended.>

- Tone: <formal | casual | neutral>
- Person: <1st | 2nd | 3rd>
- Capitalization: <sentence case | title case>
- Punctuation: <rules>
