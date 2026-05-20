# Functional Capability Documentation Rules (FN)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

FN documents describe internal system capabilities that support use cases.

Examples:

- payment matching
- authorization model
- event infrastructure
- email delivery

FN documents describe system capabilities, not workflows.

---

## Naming

FNxxxx – <Capability Name>

---

## Required Frontmatter

---
doc_id: FNxxxx
title: <Capability Name>
canonical_layer: FN
spec_type: functional-capability
status: draft | canonical
---

Optional:

references:
  - UCxxxx
  - ENxxxx
  - ESxxxx

---

## Recommended Structure

## Purpose  
## Responsibilities  
## Related Use Cases  
## Related Entities  
## Integrations  
## Constraints  

---

## Restrictions

FN documents must not contain:

- implementation code
- framework configuration