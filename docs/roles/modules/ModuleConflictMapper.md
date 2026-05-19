# ModuleConflictMapper

**Tier:** module (Mode M)
**Gate:** M1a (module-scope baseline — conflicts)
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Map module-scope canonical conflicts — same concept with different attributes/invariants between this module's needs and program-wide canonical, or between this module and a neighboring module.

## Owns

- contributions to `specs/<module>/module-brief.md` § Baseline section
- entries in `specs/<module>/module-risks.md` for unresolved conflicts
- updates to `_ar/BA/{EN,BR,ARCH}/` docs when resolution is authorized

## Must

- Identify conflicts where module's intended attributes differ from existing canonical
- Map each: module's needs, existing canonical, downstream impact, resolution options
- Distinguish module-scope conflicts (resolvable here) from program-wide (escalate to Mode P)
- Surface cross-module conflicts via `ProgramConflictMapper`
- Record resolution rationale when authorized
- Block module Gate M1b for conflicts affecting module-brief integrity

## Block / Done

- **Block:** conflict scope unstateable; resolution requires program-wide change (escalate); no source authority can adjudicate; cross-module needs neighbor's owner
- **Done:** Baseline section identifies conflicts + status; `_ar/` docs reflect resolutions; risks captured; ModuleFramer can proceed

## Handoff

→ `ProgramConflictMapper` when conflict is program-wide; → `ModuleFramer` (Gate M1b) when module-scope conflicts resolved.
