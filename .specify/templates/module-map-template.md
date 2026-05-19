# Module Map: [PROJECT NAME]

**Project Slug**: `[project-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `P — Program Bootstrap`
**Authored at**: Gate P2 — Module Decomposition
**Depends on**: `project-brief.md`, `architecture-overview.md`

> **Re-frame note**: Changes to this file (adding, removing, splitting, merging, or renaming modules) require Gate P-R authorization. Mode B and Mode M may not amend this file.

## Module List

Each module is a bounded delivery stream owned through its own Mode M lifecycle.

### `core`
- **Display name**: [Core]
- **Scope summary**: [What this core module owns — typically shared infrastructure, foundational entities, cross-module utilities]
- **Owner**: [Name / role]
- **Entry sequence**: 1 (core is typically first)
- **Module impact class**: `M0 | M1 | M2 | M3` — see `impact-classes.md` § 14
- **Notes**: [Any constraint specific to the core module]

### `[module-slug-1]`
- **Display name**: [Display Name]
- **Scope summary**: [What this module owns]
- **Owner**: [Name / role]
- **Entry sequence**: [N — relative ordering of Mode M starts]
- **Module impact class**: `M0 | M1 | M2 | M3`
- **Notes**: [Constraints]

### `[module-slug-2]`
- **Display name**: [Display Name]
- **Scope summary**: [What this module owns]
- **Owner**: [Name / role]
- **Entry sequence**: [N]
- **Module impact class**: `M0 | M1 | M2 | M3`
- **Notes**: [Constraints]

### `[module-slug-3]`
- **Display name**: [Display Name]
- **Scope summary**: [What this module owns]
- **Owner**: [Name / role]
- **Entry sequence**: [N]
- **Module impact class**: `M0 | M1 | M2 | M3`
- **Notes**: [Constraints]

## Dependency Graph

[Show dependencies between modules. Use ASCII or list form. Verify there are no cycles.]

```
core ←─ [module-slug-1]
core ←─ [module-slug-2]
[module-slug-1] ←─ [module-slug-3]
```

Or in list form:
- `[module-slug-1]` depends on: `core`
- `[module-slug-2]` depends on: `core`
- `[module-slug-3]` depends on: `core`, `[module-slug-1]`

## Integration Boundaries

| From → To | Contract surface | Owner of contract | Notes |
|---|---|---|---|
| `[module-slug-1]` → `[module-slug-3]` | [GraphQL types / API endpoints / message contracts / shared types] | `[module-slug-1]` | [Contract is exposed by source module; consumers must respect versioning] |
| `[module-slug-2]` → `core` | [contract surface] | `core` | [notes] |
| `[module-slug-3]` → external system | [contract surface] | `[module-slug-3]` | [external integration responsibility] |

## Entry Sequence

The order in which modules enter Mode M:

1. `core` — foundational; everything else depends on it
2. `[module-slug-1]` — second wave
3. `[module-slug-2]` — second wave (parallel with `[module-slug-1]` if dependencies allow)
4. `[module-slug-3]` — third wave (depends on `[module-slug-1]`)

If multiple modules can enter Mode M in parallel, this is recorded in `implementation-streams.md` (Gate P3).

## Module Class Distribution

| Class | Count | Modules |
|---|---|---|
| `M0` | [n] | [list] |
| `M1` | [n] | [list] |
| `M2` | [n] | [list] |
| `M3` | [n] | [list] |

`M3` modules carry protected-area responsibility. Their delivery cycle has higher scrutiny — see `impact-classes.md` § 14.4 and `mode-m.md` Gate M4.

## Re-frame Change Log

[When Mode P is re-run through Gate P-R, record the structural changes here. The matching `re-frame-authorization.md` provides full rationale.]

| Date | Re-frame authorization | Modules added | Modules removed | Modules split | Modules merged | Scope changed |
|---|---|---|---|---|---|---|
| [DATE] | initial bootstrap | [all initial modules] | n/a | n/a | n/a | n/a |
