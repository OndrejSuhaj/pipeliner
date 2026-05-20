# Business Rule Documentation Rules (BR)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

BR documents define rules that constrain system behavior across entities or use cases.

Typical uses:

- domain policies
- system governance rules
- cross-entity constraints

BR documents do not describe process flow.

---

## Naming

BR-<RuleName>

---

## Required Frontmatter

---
doc_id: BR-<RuleName>
title: <Rule Title>
canonical_layer: BR
spec_type: business-rule
status: draft | canonical
affects:
  - ENxxxx
  - UCxxxx
  - SYSTEM
---

Optional:

references:
  - ENxxxx
  - UCxxxx

---

## Document Structure

## Purpose  
## <Rule Section>

Additional rule sections may follow.

Optional:

## Non-Goals

---

## Rule Sections

Each section defines one group of constraints.

Normative language may be used:

- SHALL
- MUST
- SHALL NOT

Rules should be deterministic.

---

## Restrictions

BR documents must not contain:

- step-by-step flows
- implementation details