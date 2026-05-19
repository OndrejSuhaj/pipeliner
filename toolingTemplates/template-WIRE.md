---
doc_id: WIRE<####>
title: <Screen Name>
canonical_layer: WIRE
modules: [<module-slug>]
screen_id: S<###>
realizes_uc: [UC<####>]
status: draft
references: []
---

# WIRE<####> – <Screen Name>

## Purpose

<One paragraph: what this screen accomplishes, which UC it realizes, who uses it (actor), entry context.>

---

## Layout Zones

<Bullet list of layout regions. ASCII sketch optional but recommended.>

- Header — <content description>
- Main content — <content description>
- Sidebar — <content description>
- Footer — <content description>

```
+--------------------------------+
| Header                         |
+--------+-----------------------+
| Side-  | Main content          |
| bar    |                       |
|        |                       |
+--------+-----------------------+
| Footer                         |
+--------------------------------+
```

---

## Components Used

| Zone | COMP-id | Variant/Props | Notes |
|---|---|---|---|
| Header | `COMP<####>` | `<variant>` | <notes> |
| Main | `COMP<####>` | `<variant>` | <notes> |

---

## Interactions

1. **Entry** — <route, deep link, redirect> → state: `default`
2. **Primary action** — <trigger> → <effect>; realizes UC<####>; next: <state or screen>
3. **Secondary action — <name>** — <trigger> → <effect>; next: <state or screen>
4. **Exit** — <how user leaves> → <success/cancel route>

---

## States

### default

<Normal usable state. Components shown, CTAs available.>

### empty

<Shown when: <condition>. Visual treatment, recovery path.>

### loading

<Shown when: <async operation>. Indicators shown, blocked interactions.>

### error

<Shown when: <error condition>. Error display, retry path, fallback CTAs.>

---

## Validation Surfaces

| Field/Zone | Trigger (BR-id) | Surface |
|---|---|---|
| `<field>` | `BR<####>` | inline / toast / modal |

---

## Data Bindings

| Zone | EN-id | QUERY-id | Notes |
|---|---|---|---|
| Main | `EN<####>` | `QUERY<####>` | <notes> |

---

## Conditional Visibility

| Component/Zone | Condition (ACL or BR ref) | Behavior when hidden |
|---|---|---|
| `<component>` | `ACL<####>` / `BR<####>` | <hidden / disabled / replaced> |

---

## Accessibility Notes

- **Tab order:** <description>
- **Focus on entry:** <which element receives focus>
- **Focus on state transition:** <where focus moves when state changes>
- **Landmarks:** <ARIA landmark roles on the screen>
- **Keyboard shortcuts:** <screen-specific shortcuts, if any>
