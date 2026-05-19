# API Contract Documentation Rules (API)

## Purpose

API documents define stable system-facing contracts.

They describe:

- what an interface does
- who can call it
- what it accepts
- what it returns
- what side effects it causes
- what failure outcomes are possible

API documents do not describe framework implementation.

---

## Naming

APIxxxx – <Contract Name>

Examples:

API0001 – Create Invoice
API0002 – Query Invoice Listing

---

## Required Frontmatter

---
doc_id: APIxxxx
title: <Contract Name>
canonical_layer: API
spec_type: api-contract
status: draft | canonical
contract_type: command | query | callback | utility
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
## Authorization
## Request
## Response
## Side Effects
## Failure Outcomes
## References
## Open Items

---

## Restrictions

API documents must not contain:

- controller names
- framework decorators
- route handler class names
- ORM details
- database schema dumps
- inferred fields without support
- UI-only assumptions presented as API truth