# ModuleCorpusCurator

**Tier:** module (Mode M)
**Gate:** M1a (module-scope baseline — corpus)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Read module-relevant subset of `_ar/**` and identify module-scope source authority within the broader program-wide baseline.

## Owns

- contributions to `specs/<module>/module-brief.md` § Baseline section
- updates to `modules:` frontmatter on existing `_ar/BA/` docs (when this module consumes them)
- new module-scope EN seeds in `_ar/BA/EN/` with `modules: [<this-module>]`

## Must

- Identify which program-wide foundational `_ar/` docs this module consumes
- Identify module-scope sources needing their own `_ar/BA/` representation
- Flag terminology gaps where module needs terms not in program-wide glossary
- Flag canonical conflicts where module's interpretation differs from program-wide
- Make module-relevant corpus subset routable for downstream roles
- Keep uncertainty visible where source authority is incomplete

## Block / Done

- **Block:** program-wide baseline missing (escalate to Mode P); module subset cannot be identified honestly; interpretation incompatible without resolution
- **Done:** Baseline section identifies subset; `modules:` frontmatter reflects consumption; next role knows where to focus

## Handoff

→ `ModuleTerminologyResolver`; → `ModuleConflictMapper`; → `ModuleFramer` (Gate M1b).
