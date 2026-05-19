---
doc_id: COMP<####>
title: <Component Name>
canonical_layer: COMP
modules: [<module-slug>]
status: draft
design_source: <Figma / Storybook URL>
references: []
---

# COMP<####> – <Component Name>

## Purpose

<One paragraph: what the component represents, intended usage, what problem it solves. State explicitly whether the component is module-scoped or shared cross-module.>

---

## Props / Inputs

| Name | Type | Required | Default | Description |
|---|---|---|---|---|
| `<propName>` | `<Type>` | yes / no | `<default>` | <description> |

---

## Variants

- **size:** small | medium | large
- **<axis>:** <value-1> | <value-2> | <value-3>

Each variant value:

- `<axis>=<value>` — <when to use>

---

## States

### idle

<Normal state appearance and behavior.>

### hover

<Visual change on mouse hover.>

### focused

<Visual change on keyboard focus.>

### disabled

<Visual + behavior change when disabled. CTAs available?>

### loading

<Indicator shown during async operation.>

### error

<Error visual + behavior. Recovery path.>

---

## Events

| Event | Payload | Trigger | Notes |
|---|---|---|---|
| `<onClick>` | `<payload type>` | <user action> | <notes> |

---

## Accessibility

- **ARIA role:** `<role>` (or "inherits native semantics from `<element>`")
- **Keyboard navigation:** <Tab, Enter, Space, Escape, arrow keys behavior>
- **Focus management:** <when focus enters/exits, where it goes on activation>
- **Screen reader:** <what is announced; label/description source>

---

## Usage Constraints

- Use when: <scenario>
- Do not use when: <scenario>
- Cardinality: <one per screen / multiple OK>
- Placement: <inside form / standalone / overlay / ...>

---

## Dependencies

- Other COMPs: `COMP<####>`, `COMP<####>` (composition)
- Data entities: `EN<####>` (for typed props)
- ACL: `ACL<####>` (for role-based visibility)
- External libraries: <library name + reason>

---

## Composition

<If the component composes other COMPs, describe the pattern.>

```
<Component>
  ├─ COMP<####> (purpose)
  ├─ COMP<####> (purpose)
  └─ COMP<####> (purpose)
```

---

## Examples

### Example 1: <typical use case>

```
<Component prop="value" variant="small" />
```

### Example 2: <variant use case>

```
<Component prop="value" variant="large" disabled />
```
