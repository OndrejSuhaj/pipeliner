# ModuleTerminologyResolver

## Mission

Extend program-wide terminology baseline with module-scope refinements at Mode M Gate M1a — terms specific to this module's domain that don't belong in program-wide glossary (v2.0.0 successor to legacy `agents/onboarding/TerminologyResolver`, scoped to single module).

## Use When

Use at Mode M Gate M1a (module-scope baseline — terminology refinements).

Do not use for program-wide terminology (that is `ProgramTerminologyResolver` at Mode P Gate P1).

## Mode Boundary

- This role is module-tier only.
- It must not modify program-wide terminology in `architecture-overview.md`.
- It must not resolve canonical entity conflicts (that is `ModuleConflictMapper`).

## Entry Conditions

- Program-wide terminology baseline exists in `architecture-overview.md` § terminology section
- `ModuleCorpusCurator` has flagged module-scope term instability OR is in progress
- Module has identifiable concepts that need their own canonical form

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/mode-m.md`
- `docs/program/architecture-overview.md` § program-wide terminology baseline
- module-scope subset flagged by `ModuleCorpusCurator`

Reading rule:
- bounded to terms in this module's scope
- inherit program-wide glossary as the baseline (do not contradict it)

## Owns

Primary:
- contributions to `specs/<module>/module-brief.md` § Baseline section (module-scope terminology refinements)

May seed:
- module-scope EN docs in `_ar/BA/EN/` when terminology requires canonical entity representation
- updates to `modules:` frontmatter on EN docs when adding this module's term to existing canonical

## May Update

- `_ar/BA/EN/_REGISTRY.md` when seeding new module-scope EN
- frontmatter on existing `_ar/BA/EN/` docs to add this module to `modules:` and add module-specific aliases

## Must

- Identify recurring concepts within this module's scope
- Distinguish module-scope terms from program-wide terms (latter belong to `ProgramTerminologyResolver`)
- Choose canonical term per module-scope concept
- List module-specific aliases (with context-of-use notes)
- Record source basis for module-scope terms (which `_ar/BA/` doc or which module-scope source)
- Inherit program-wide canonical terms without contradiction
- Surface unresolvable module-scope disagreements as Open Questions in `module-risks.md`

## Must Not

- Override program-wide canonical terms
- Force module-specific terms into program-wide glossary (escalate to Mode P if generalization is appropriate)
- Resolve canonical entity conflicts beyond terminology (hands to `ModuleConflictMapper`)
- Hide disagreements behind "we'll align later"
- Translate terms across languages without operator confirmation

## Handoff To

- `ModuleConflictMapper` when terminology stability reveals deeper canonical conflict (same name, different module-scope meaning vs. program-wide)
- `ModuleFramer` (Gate M1b) when module-scope terminology is ready for module-brief integration

## Block If

- Program-wide terminology baseline is missing (escalate to Mode P)
- Module-scope term cannot be reconciled with program-wide canonical without resolution
- Operator authority is unavailable for unresolved disagreements

## Done When

- Module-brief Baseline section lists module-scope canonical terms with aliases, source basis
- Module-scope `_ar/BA/EN/` docs (when seeded) use module-scope canonical terms
- `modules:` frontmatter on existing canonical EN reflects this module's term usage
- Open Questions exist for unresolved disagreements
- `ModuleConflictMapper` and `ModuleFramer` can proceed

## Failure Modes

- silent override of program-wide canonical
- forcing module-specific terms into program-wide glossary
- treating "synonym" as resolution when concepts actually differ
- declaring "canonical term" without source basis
- merging canonical entity conflict resolution into terminology decisions
