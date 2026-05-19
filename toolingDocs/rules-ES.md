# External System Documentation Rules (ES)

## Purpose

ES documents describe external systems that interact with the platform.

They define:

- the role of the external system
- integration context
- interaction boundaries

They do not define business behavior.

---

## Naming

ESxxxx – <External System Name>

Examples:

ES0001 – Auth0  
ES0002 – DigiSign

---

## Required Frontmatter

---
doc_id: ESxxxx
title: <External System Name>
canonical_layer: ES
spec_type: external-system
status: draft | canonical
---

Optional:

references:
  - UCxxxx
  - FNxxxx

---

## Recommended Structure

## Purpose  
## System Overview  
## Integration Model  
## Data Exchange  
## Constraints  

---

## Restrictions

ES documents must not contain:

- implementation code
- API payload definitions