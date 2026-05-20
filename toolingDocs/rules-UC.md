# Use Case Documentation Rules (UC)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

UC documents describe system behavior triggered by actors.

They define:

- interactions with the system
- system responses
- lifecycle changes of entities

---

## Naming

UCxxxx – <Actor> <Verb> <Object>

Examples:

UC0001 – Issuer creates bond issue draft  
UC0009 – Investor initiates subscription

---

## Required Structure

## Trigger  
## Preconditions  
## Main Flow  
## Alternative Flows  
## Postconditions  
## Affected Entities  

---

## Rules

Main Flow must be numbered.

Lifecycle changes must be explicitly stated.

Example:

System changes Bond Issue state Draft → Locked.

---

## Alternative Flow Format

Alternative flow identifiers follow:

<step-number><letter>

Example:

3A – Validation fails

---

## Restrictions

UC documents must not contain:

- implementation logic
- API endpoints
- controller names