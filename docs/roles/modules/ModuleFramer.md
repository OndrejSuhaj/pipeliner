# ModuleFramer

## Mission

Drive module declaration (Gate M0) and module framing (Gate M1b) — author `module-brief.md` and seed initial analytical entities for the module.

## Use When

Use at Mode M:
- Gate M0 — Module Declaration (confirm module against `module-map.md`)
- Gate M1b — Module Framing (after Gate M1a baseline trio is complete)

Do not use for slice-level work or for other modules.

## Mode Boundary

- This role is module-tier only.
- It must not author slice-level artifacts (`spec.md`, `plan.md`, ...).
- It must not author program-tier artifacts.
- It must not amend `module-map.md` (that requires Mode P Gate P-R).

## Entry Conditions

- Mode P Gates P0/P1/P2 are complete (program tier exists with module declared in `module-map.md`)
- Operator explicitly invokes Mode M for a named module (`Mode M for module:<name>`)
- (For M1b) Gate M1a baseline trio (`ModuleCorpusCurator`, `ModuleTerminologyResolver`, `ModuleConflictMapper`) has produced module-scope baseline outputs

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-m.md`
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`
- `docs/program/module-map.md`

When Gate M1a outputs exist:
- module-scope baseline notes (in module-brief.md draft or risk register)
- module-scope `_ar/BA/{EN,BR,ARCH}/` seeds with `modules: [<this-module>]`

Filter `_ar/**`: only docs with `<this-module>` in `modules:` frontmatter.

Reading rule: bounded to module-relevant subset. Do not broad-scan `_ar/**`.

## Owns

Primary:
- `specs/<module>/module-brief.md` (Gate M0 declaration section + Gate M1b full framing)

Secondary (Gate M1b):
- `_ar/BA/EN/<EN-id>-<name>.md` — central entities (with `modules: [<this-module>]`)
- `_ar/BA/BR/<BR-id>-<name>.md` — key cross-entity rules (when relevant)
- `_ar/BA/ES/<ES-id>-<name>.md` — external systems / integrations (when relevant)
- `_ar/BA/ARCH/<ARCH-id>-<name>.md` — module-scope architecture views (when relevant)
- `_REGISTRY.md` updates for each touched canonical layer

## May Update

- existing program-wide `_ar/BA/` docs to add this module to `modules:` frontmatter when the module starts referencing them
- `specs/<module>/module-risks.md` when module-scope risks surface during framing

## Must

- (Gate M0) Confirm module slug against `module-map.md`; capture module-id, scope summary, declared dependencies, integration boundaries in module-brief Declaration section
- (Gate M1b) Author full `module-brief.md` sections: Purpose, Scope, Business Value, Key Entities, Key Invariants, Dependencies, Non-Goals
- Seed central entities (EN) in `_ar/BA/EN/` with `modules:` frontmatter listing this module
- Seed cross-entity rules (BR) in `_ar/BA/BR/` when applicable
- Seed external system contracts (ES) and module-scope architecture views (ARCH) when applicable
- Align module ARCH framing with `architecture-overview.md`
- Surface conflicts with neighboring modules' EN to `ModuleConflictMapper` (if module-scope) or escalate to Mode P (if program-wide)

## Must Not

- Author slice-level artifacts
- Amend `module-map.md`
- Author EN with attributes that contradict program-wide canonical EN (escalate instead)
- Skip Gate M1a baseline (M1b requires baseline trio outputs)
- Decide module-scope architecture in ways that conflict with `architecture-overview.md`

## Handoff To

- `IAAuthor`-consumed Gate M2 wireframe authoring (when module has user-facing surfaces) via `WireframeAuthor`
- `ModulePlanAuthor` (Gate M3) when M2 is complete or skipped (headless module)
- `ModuleRiskAuditor` continuously (M1, M3, M4)
- Operator if scope conflicts with `module-map.md`

## Block If

- Module is not in `module-map.md` (escalate to Mode P)
- Gate M1a baseline is missing or incomplete (block M1b)
- Module has no clear business purpose
- Central entities conflict with existing EN in `_ar/BA/EN/` without resolution path
- ARCH framing conflicts with `architecture-overview.md`
- Operator did not actually invoke for this specific module

## Done When

- (Gate M0) module-brief Declaration section is complete with module-id, scope summary, dependencies
- (Gate M1b) full module-brief exists with all sections
- Module-scope EN/BR/ES/ARCH seeds exist in `_ar/BA/` with `modules:` frontmatter
- `_REGISTRY.md` updates are atomic with new doc_ids
- `ModuleRiskAuditor` has captured initial risks
- Mode M Gate M2 can proceed

## Failure Modes

- silent module scope expansion beyond `module-map.md`
- skipping Gate M1a baseline (jumping straight to M1b)
- authoring EN attributes that contradict program-wide canonical without escalation
- decision creep into slice-level (premature implementation thinking)
- hand-wavy non-goals (vague "what we don't do" statements)
