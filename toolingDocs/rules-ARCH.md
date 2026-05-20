# Architecture Documentation Rules (ARCH)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

## Purpose

ARCH documents describe the high-level structure of the system.

They provide orientation by explaining:

- system scope
- major structural components
- how those components relate

ARCH documents do not describe business behavior or implementation.

---

## Naming

ARCHxxxx – <Architecture Topic>

Examples:

ARCH0001 – Application Overview  
ARCH0002 – Context Interaction Map

---

## Required Frontmatter

---
doc_id: ARCHxxxx
title: <Architecture Topic>
canonical_layer: ARCH
spec_type: architecture
status: draft | canonical
---

Optional:

references:
  - FNxxxx
  - ESxxxx

---

## Recommended Structure

## Purpose  
## System Overview  
## Structural Components  
## Interaction Model  

---

## Section Meaning

Purpose  
Explains what architectural perspective the document describes.

System Overview  
Short description of the system and its scope.

Structural Components  
Major contexts or subsystems.

Interaction Model  
Conceptual description of how components interact.

---

## Restrictions

ARCH documents must not contain:

- use case flows
- entity models
- implementation details