# Information Architecture Rules (IA)

## Purpose

IA documents define the **project-level** information architecture:
top-level navigation, screen map across modules, entry points, cross-module
flows, information hierarchy, and module boundaries on the UX layer.

IA is authored once per project (Mode P Gate P-UX) and consumed by every
module (Mode M Gate M2 references it when authoring WIRE).

IA exists to:

- declare which screens the product has and where each lives,
- declare how users enter the product (anonymous, post-auth, deep links),
- declare cross-module user flows (onboarding, upgrade, recovery, ...),
- declare module boundaries on the UX surface (which screens belong to which module),
- surface open IA questions before module decomposition.

IA is **not** for screen-level layout detail — that is WIRE.

---

## Naming

`IA-<project-slug>` — one IA doc per project. No numeric ID.

Example: `IA-pipeliner.md`

Multiple IA docs per project are not allowed. If the project has many surfaces
(web, mobile, admin), each surface gets its own section within one IA doc.

---

## Required Frontmatter

```yaml
---
doc_id: IA-<project-slug>
title: Information Architecture — <Project Name>
canonical_layer: IA
scope: program
status: draft | canonical | deprecated
owners: [ux-lead, architect]
language: cs | en
references:
  - docs/program/architecture-overview.md
  - docs/program/module-map.md
  - <UC-ids that are entry points>
---
```

---

## Recommended Structure

1. Purpose
2. Top-Level Navigation
3. Screen Map (organized by module)
4. Entry Points
5. Cross-Module Flows
6. Information Hierarchy
7. Module Boundaries (UX layer)
8. Open IA Questions

---

## Section Meaning

**Purpose** — One paragraph: master IA for the entire product, single source of truth for navigation, screen map, entry points.

**Top-Level Navigation** — Bulleted list of top-level nav items (e.g. Dashboard, Pipelines, Settings, Account). Each item with one-line description.

**Screen Map** — Organized by module. Per-module subsection listing all screens with stable screen-id (`S001`, `S010`, ...). Each screen has one-line purpose. Example:
```
### 3.1 core
- S001 LoginScreen — anonymous entry
- S010 DashboardScreen — post-auth landing
- ...

### 3.2 payments
- S200 BillingOverview — billing summary
- ...
```

**Entry Points** — Table: `Entry | Trigger | First screen | Auth required`. Lists all ways users can enter the product (`/`, `/login`, deep links, etc.).

**Cross-Module Flows** — Multi-step user journeys that cross module boundaries. Each flow with name, step list (screen-id + module), purpose. Example: Onboarding flow: Signup (core) → Profile setup (core) → First pipeline create (pipelines) → Dashboard (core).

**Information Hierarchy** — Conceptual levels of information in the product: account-level, workspace-level, domain-level, item-level. Declares the hierarchy that screens fit into.

**Module Boundaries (UX layer)** — Table: `Module | Owns screens | Cross-module dependencies`. Declares which module owns which screens at the UX level (orthogonal to data ownership). Example: core owns S001–S013, uses payments S201 for upgrade CTAs.

**Open IA Questions** — Bullet list of unresolved IA decisions. Each question with context and impact. Example: "Where does Insights nav live until Insights module exists? Hidden? Stub?"

---

## Cross-Layer References

- **Recommended:** Entry points reference UC `doc_id`s (the use case each entry triggers).
- **Recommended:** Cross-module flows reference UC `doc_id`s per step.
- **Recommended:** Screen Map screens reference foundational EN entities visible on each screen.

Not strictly required at MVP — IA may exist with informal references during early project bootstrap. Module-level WIRE authoring later forces cross-references.

---

## Structure Depth

IA is **medium-depth**: top-nav + screen map + entry points + cross-module flows + info hierarchy + module boundaries.

IA does **not** contain:

- screen-level layout zones (that is WIRE)
- component-level interaction patterns (that is WIRE/COMP)
- copy / text content (that is COPY)
- data model details (that is EN)

---

## Quality Bar

A good IA doc is:

- project-level (one doc, not per-module fragments)
- complete (every UC entry actor has an entry point declared)
- traceable (every cross-module flow uses real screen-ids and module assignments)
- honest about gaps (open IA questions surfaced, not hidden)
- module-boundary-aware (screen assignments match module-map.md)

A bad IA doc:

- mixes module-scope screens with project-scope structure
- declares screens without owning module
- has cross-module flows that don't match module-map dependency graph
- silently absorbs decisions that should be Open IA Questions
