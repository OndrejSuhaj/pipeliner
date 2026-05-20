# Information Architecture Rules (IA)

**See also:** [cross-layer-discipline.md](cross-layer-discipline.md) — shared discipline for all `_ar/**` canonical docs.

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

---

## What IA is NOT for (layer leakage rules)

IA must reference these via `doc_id` and never restate inline:

- **API contracts** (HTTP methods, endpoint paths, request/response shape) — those are `_ar/BA/API/`
- **External system integration specifics** (provider names, webhooks, payloads) — those are `_ar/BA/ES/`
- **Technology stack** (library names, framework versions, UI kits) — those are `docs/program/architecture-overview.md` or `_ar/BA/ARCH/`
- **Entity attributes / invariants / lifecycle** — those are `_ar/BA/EN/`
- **Business rules / configuration values** (status enums, pricing tiers, role lists) — those are `_ar/BA/BR/`
- **Access control rules** ("admin can X", "role Y sees Z") — those are `_ar/BA/ACL/`
- **Use case flows in detail** — those are `_ar/BA/UC/`
- **Screen-level layout, components, copy** — those are `_ar/UX/{WIRE,COMP,COPY}/`
- **Module ownership decisions** beyond UX surface assignment — those are `docs/program/module-map.md`

Inline content from any of the above blocks Gate P-UX completion.

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
  - <ARCH-ids that back architectural assertions>
  - <EN-ids referenced in information hierarchy>
  - <BR-ids referenced in flows / validation>
  - <UC-ids that are entry points>
  - <ACL-ids that gate roles in nav>
---
```

All `doc_id`s in `references:` MUST resolve to existing entries in their respective `_REGISTRY.md` files.

---

## Recommended Structure

1. Sources / Authority
2. Top-Level Navigation
3. Screen Map (organized by module)
4. Entry Points
5. Cross-Module Flows
6. Information Hierarchy
7. Module Boundaries (UX layer)
8. Open IA Questions
9. What this IA does NOT cover

---

## Section Meaning

**Sources / Authority** — Lists what this IA's authority derives from (project-brief, architecture-overview, referenced canonical docs) and what is suggestive-only (prototype, operator preliminary breakdown). See `cross-layer-discipline.md` § 4 and § 7.

**Top-Level Navigation** — Bulleted list of top-level nav items. Each item with one-line description + ACL `doc_id` reference when role-gated.

**Screen Map** — Organized by module. Per-module subsection listing all screens with stable screen-id (`S001`, `S010`, ...). Each screen has one-line purpose. EN `doc_id` reference when screen displays a foundational entity.

**Entry Points** — Table: `Entry | Trigger | First screen | UC ref | Auth required`. UC `doc_id` reference is required — entry without a UC is an Open Question.

**Cross-Module Flows** — Multi-step user journeys crossing module boundaries. Each step references its UC `doc_id`. No inline restatement of UC content.

**Information Hierarchy** — Conceptual levels of information (account / workspace / domain / item). Each level references its EN `doc_id`s. Do NOT enumerate entity attributes; do NOT enumerate configuration values (use EN/BR references).

**Module Boundaries (UX layer)** — Table: `Module | Owns screens | Cross-module dependencies`. When this section implies module-map.md changes, surface as Open Question and escalate to Gate P2 (do not silently override).

**Open IA Questions** — Mandatory section. Captures every unresolved behavior with named decider. See `## Open Questions discipline` below.

**What this IA does NOT cover** — Explicit boundary statement (copy template from `template-IA.md`). Reminds reader of layer separation.

---

## Open Questions discipline

Open IA Questions section is **mandatory** (not optional). Use it whenever:

1. **Two unresolved interpretations of behavior exist.** Do NOT describe both as operational. List both, mark as Open Question, name decider.
2. **A role/action assertion has no source in `project-brief.md`, `architecture-overview.md`, or referenced UC/BR/ACL.** Do NOT default to "scoped admins" or similar. Open Question.
3. **A screen/route is uncertain (e.g. /dev-login).** Do NOT list in Entry Points if not confirmed. Open Question.
4. **Module boundary on UX layer doesn't match `module-map.md` draft.** Do NOT silently override. Open Question + escalate to Gate P2.
5. **Configuration value count is dynamic** (e.g. "3 pricing combinations" when backend exposes N combinations). Do NOT hardcode. Reference EN/BR doc and note seed examples only.

A good IA in MVP phase has **many** Open Questions. Empty Open Questions = suspicion of silently-decided assumptions.

---

## Evidence per claim

Every major IA claim traces to a source. Acceptable sources:
- `docs/program/project-brief.md` (operator decision)
- `docs/program/architecture-overview.md` (ADR / NFR / baseline)
- `_ar/BA/{UC,EN,BR,ACL,ARCH,ES}/<id>.md` (canonical)
- operator decision recorded in P0/P1
- prototype reference (acceptable as **evidence of intent**, NOT as confirmation of canonical)

Prototype evidence rule: visual presence in a prototype is **suggestive**, not **authoritative**. When brief contradicts prototype, brief wins. When brief is silent, the question is open — do not infer from prototype.

Claims without traceable source MUST be in Open IA Questions.

---

## Cross-Layer References

**Required:**
- Every entry in Entry Points references a UC `doc_id`
- Every step in Cross-Module Flows references a UC `doc_id`
- Every concept in Information Hierarchy references an EN `doc_id`
- Every role-gated nav item references an ACL `doc_id`
- Every architectural assertion (style, integration boundary) references an ARCH or ES `doc_id`

**Verification:** All cited `doc_id`s must resolve in their target `_REGISTRY.md` before IA may complete (per `cross-layer-discipline.md` § 2).

---

## Structure Depth

IA is **medium-depth**: top-nav + screen map + entry points + cross-module flows + info hierarchy + module boundaries.

IA does **not** descend into screen layout, component contracts, copy, or entity attributes — those are dedicated layers (see "What IA is NOT for" above).

---

## Quality Bar

A good IA doc is:

- project-level (one doc, not per-module fragments)
- complete (every UC entry actor has an entry point declared)
- traceable (every claim has source per "Evidence per claim")
- honest about gaps (Open IA Questions populated, not hidden assumptions)
- module-boundary-aware (screen assignments match module-map.md; mismatches escalated)
- layer-clean (no inline API / provider / config / entity-attribute / business-rule content)

A bad IA doc:

- mixes module-scope screens with project-scope structure
- declares screens without owning module
- has cross-module flows that don't match module-map dependency graph
- silently absorbs decisions that should be Open IA Questions
- inlines content from API, ES, ARCH, EN, BR, ACL (layer leakage)
- infers role capabilities from prototype alone
- enumerates dynamic configuration values
- has empty Open Questions in MVP phase (suspect silently-decided assumptions)
