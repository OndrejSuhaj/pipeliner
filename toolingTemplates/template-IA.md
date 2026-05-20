---
doc_id: IA-<project-slug>
title: Information Architecture — <Project Name>
canonical_layer: IA
scope: program
status: draft
owners: [ux-lead, architect]
language: cs | en
references:
  - docs/program/architecture-overview.md
  - docs/program/module-map.md
  # Add referenced canonical doc_ids (verify they exist in their _REGISTRY.md first):
  # - ARCH<####> (architecture seeds backing UX-surface claims)
  # - EN<####>   (foundational entities referenced in information hierarchy)
  # - BR<####>   (business rules referenced in flows / validation)
  # - UC<####>   (use cases referenced in entry points / flows)
  # - ACL<####>  (access control referenced in role-gated nav)
  # - ES<####>   (external systems referenced as integration boundaries)
---

# IA — <Project Name>

## 1. Sources / Authority

This IA derives from:
- `docs/program/project-brief.md` (operator decision)
- `docs/program/architecture-overview.md` (ADR / NFR / baseline)
- referenced canonical docs (see `references:` frontmatter)

Suggestive-only (not authoritative):
- `docs/program/spec/prototype.<ext>` (prototype): evidence of design intent; brief wins on contradiction
- operator preliminary breakdown (P0 input): may be refined by P1 / P-UX / P2

See `toolingDocs/cross-layer-discipline.md` § 4 for prototype-vs-canonical precedence.

---

## 2. Top-Level Navigation

For each nav item, reference the gating role (ACL `doc_id`) when role-gated.

- <Nav item 1> — <one-line description> (`ACL<####>` when gated)
- <Nav item 2> — <one-line description>
- <Nav item 3> — <one-line description>
- Account dropdown — <Profile, Settings, Sign out>

---

## 3. Screen Map

Per-module subsection. Each screen: stable screen-id + one-line purpose + EN `doc_id` reference when screen displays a foundational entity.

### 3.1 <module-1>

- S001 <ScreenName> — <one-line purpose> (`EN<####>` if shows entity)
- S002 <ScreenName> — <one-line purpose>

### 3.2 <module-2>

- S100 <ScreenName> — <one-line purpose>

### 3.3 <module-3>

- S200 <ScreenName> — <one-line purpose>

---

## 4. Entry Points

Each entry references the UC `doc_id` it triggers. Entry without a UC is an Open Question, not an authoritative entry.

| Entry | Trigger | First screen | UC ref | Auth required |
|---|---|---|---|---|
| `/` | anonymous visit | S001 | `UC<####>` | no |
| `/login` | direct | S001 | `UC<####>` | no |
| `/<protected-path>` | post-auth redirect or deep link | S010 | `UC<####>` | yes |

---

## 5. Cross-Module Flows

Each step references its UC `doc_id`. No inline restatement of UC content (use UC reference, not paraphrase).

### Onboarding flow

1. S<###> in <module> — <step purpose> (`UC<####>`)
2. S<###> in <module> — <step purpose> (`UC<####>`)
3. S<###> in <module> — <step purpose> (`UC<####>`)

### <Other flow name>

1. ...

---

## 6. Information Hierarchy

Reference EN `doc_id`s at each level. Do NOT enumerate entity attributes. Do NOT enumerate configuration values (use BR reference and note seed examples only).

- **Account level:** <conceptual level> (`EN<####>`, `EN<####>`)
- **Workspace level:** <conceptual level> (`EN<####>`)
- **<Domain> level:** <conceptual level> (`EN<####>`)
- **<Item> level:** <conceptual level> (`EN<####>`)

Example of correct cross-layer discipline:

> Pricing Catalogue (`EN<####>`)
> └── configured combinations exposed by external system per `ES<####>`
> └── seed examples (suggestive, from prototype): Standard, Volume, Premium

NOT:

> ❌ Pricing Catalogue (hardcoded, 3 combinations) — Standard SME / Volume SME / Premium

---

## 7. Module Boundaries (UX layer)

When this section implies module-map.md changes, do NOT silently override. Surface as Open IA Question + escalate to Gate P2.

| Module | Owns screens | Cross-module dependencies |
|---|---|---|
| <module-1> | S001–S0xx | uses <module-2> S2xx for <purpose> |
| <module-2> | S100–S1xx | <none> |
| <module-3> | S200–S2xx | uses <module-1> S010 for <purpose> |

---

## 8. Open IA Questions

Mandatory section. Capture every unresolved behavior with named decider. See `rules-IA.md` § Open Questions discipline.

Common categories to check before declaring this section complete:

- **Role/action capability:** any "X role can do Y" claim without source in brief or ACL → Open Question
- **Two-paths behavior:** when prototype/brief show two interpretations (e.g. claim vs. approval flow) → Open Question, don't describe both as operational
- **Uncertain screens/routes:** any screen visible in prototype but not confirmed in brief → Open Question
- **Configuration variability:** any enumerated value count that depends on dynamic config → Open Question
- **Module-boundary implications:** any UX-surface assignment that doesn't match module-map.md → Open Question + escalate to Gate P2

Format per question:

| # | Question | Context / Impact | Decided by |
|---|---|---|---|
| IA-Q1 | <question> | <context + downstream impact> | <named decider> |

Empty Open Questions section in MVP phase = suspicion of silently-decided assumptions. Re-review claims.

---

## 9. What this IA does NOT cover

This IA does not decide:
- **API contracts** (HTTP methods, endpoints, payload shapes) → see `_ar/BA/API/`
- **External system integrations** (provider names, webhook contracts) → see `_ar/BA/ES/`
- **Technology stack** (libraries, frameworks, UI kits) → see `docs/program/architecture-overview.md` and `_ar/BA/ARCH/`
- **Entity attributes / invariants / lifecycle** → see `_ar/BA/EN/`
- **Business rules and configuration values** → see `_ar/BA/BR/`
- **Access control rules** (which role can do what action) → see `_ar/BA/ACL/`
- **Per-screen layout, components, copy** → see `_ar/UX/{WIRE,COMP,COPY}/`
- **Module ownership beyond UX surface** → see `docs/program/module-map.md`

For each topic above, IA may **reference** the relevant `doc_id` but never restate its content inline. See `toolingDocs/cross-layer-discipline.md`.
