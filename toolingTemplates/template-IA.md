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
---

# IA — <Project Name>

## 1. Purpose

<One paragraph: master IA for the entire product. Single source of truth for top-level navigation, screen map, entry points, cross-module flows, information hierarchy, and module boundaries on the UX layer.>

---

## 2. Top-Level Navigation

- <Nav item 1> — <one-line description>
- <Nav item 2> — <one-line description>
- <Nav item 3> — <one-line description>
- Account dropdown — <Profile, Settings, Sign out>

---

## 3. Screen Map

### 3.1 <module-1>

- S001 <ScreenName> — <one-line purpose>
- S002 <ScreenName> — <one-line purpose>
- ...

### 3.2 <module-2>

- S100 <ScreenName> — <one-line purpose>
- ...

### 3.3 <module-3>

- S200 <ScreenName> — <one-line purpose>
- ...

---

## 4. Entry Points

| Entry | Trigger | First screen | Auth required |
|---|---|---|---|
| `/` | anonymous visit | S001 | no |
| `/login` | direct | S001 | no |
| `/<protected-path>` | post-auth redirect or deep link | S010 | yes |

---

## 5. Cross-Module Flows

### Onboarding flow

<Multi-step user journey across modules>

1. S<###> in <module> — <step purpose>
2. S<###> in <module> — <step purpose>
3. S<###> in <module> — <step purpose>

### <Other flow name>

1. ...

---

## 6. Information Hierarchy

- **Account level:** <what information lives here>
- **Workspace level:** <what information lives here>
- **<Domain> level:** <what information lives here>
- **<Item> level:** <what information lives here>

---

## 7. Module Boundaries (UX layer)

| Module | Owns screens | Cross-module dependencies |
|---|---|---|
| <module-1> | S001–S0xx | uses <module-2> S2xx for <purpose> |
| <module-2> | S100–S1xx | <none> |
| <module-3> | S200–S2xx | uses <module-1> S010 for <purpose> |

---

## 8. Open IA Questions

- <Question 1>: <context and impact>
- <Question 2>: <context and impact>
