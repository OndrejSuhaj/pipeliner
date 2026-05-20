# Query / Report Documentation Rules (QUERY)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

QUERY documents define read-side specifications.

They describe:

- why the read model exists
- what source entities it depends on
- what filters and grouping it supports
- what derived outputs it produces
- what the user or downstream consumer receives

QUERY documents do not define SQL or storage implementation.

---

## Naming

QUERYxxxx – <Specification Name>

Examples:

QUERY0001 – Invoice Listing
QUERY0002 – Revenue Dashboard Summary

---

## Required Frontmatter

---
doc_id: QUERYxxxx
title: <Specification Name>
canonical_layer: QUERY
spec_type: query-spec
status: draft | canonical
query_type: list | detail | summary | dashboard | export | search
---

Optional:

references:
  - UCxxxx
  - ENxxxx
  - FNxxxx
  - BR-<RuleName>

---

## Recommended Structure

## Purpose
## Consumers
## Source Entities
## Filters and Grouping
## Derived Outputs
## Result Shape
## References
## Open Items

---

## Restrictions

QUERY documents must not contain:

- SQL
- ORM query builders
- endpoint handler names
- UI component tree
- guessed formulas without support