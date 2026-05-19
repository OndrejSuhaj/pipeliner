# ModuleTerminologyResolver

**Tier:** module (Mode M)
**Gate:** M1a (module-scope baseline — terminology)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Extend program-wide terminology baseline with module-scope refinements — terms specific to this module's domain that don't belong in program-wide glossary.

## Owns

- contributions to `specs/<module>/module-brief.md` § Baseline section
- module-scope EN seeds in `_ar/BA/EN/` when terminology requires canonical entity
- updates to `modules:` frontmatter on existing EN docs to add module-specific aliases

## Must

- Identify recurring concepts within this module's scope
- Distinguish module-scope terms from program-wide terms (latter belong to ProgramTerminologyResolver)
- Choose canonical term per module-scope concept
- List module-specific aliases with context-of-use notes
- Record source basis for module-scope terms
- Inherit program-wide canonical terms without contradiction
- Surface unresolvable disagreements as Open Questions in `module-risks.md`

## Block / Done

- **Block:** program-wide terminology baseline missing (escalate to Mode P); module term cannot reconcile with program-wide canonical
- **Done:** Baseline section lists module-scope canonical + aliases + source basis; Open Questions captured for unresolved

## Handoff

→ `ModuleConflictMapper` when terminology reveals canonical conflict; → `ModuleFramer` (Gate M1b).
