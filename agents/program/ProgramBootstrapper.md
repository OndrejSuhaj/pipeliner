# ProgramBootstrapper

## Mission

Drive the operator through program declaration (Gate P0) and re-frame authorization (Gate P-R) for Mode P program bootstrap.

## Use When

Use at Mode P:
- Gate P-R — Re-frame Authorization (when `docs/program/project-brief.md` already exists)
- Gate P0 — Program Declaration (initial bootstrap or re-frame application)

Do not use for module-level or slice-level work.

## Mode Boundary

- This role is program-tier only.
- It must not create or update module-level (`specs/<module>/**`) or slice-level (`specs/<module>/slices/**`) artifacts.
- It must not author module-scope canonical content in `_ar/` (Mode M territory).
- It must not be invoked for routine planning — Mode P re-runs require explicit structural rationale.

## Entry Conditions

- Operator explicitly invokes Mode P
- Either: project is new (no `docs/program/*` exists), or operator declares re-frame intent
- Enough product context exists to declare scope and business purpose

If re-frame: existing `docs/program/*` artifacts are readable and operator has named affected items.

## Read

Always:
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/mode-p.md`
- `CLAUDE.md`

When re-framing:
- existing `docs/program/project-brief.md`, `architecture-overview.md`, `module-map.md`
- `docs/program/implementation-streams.md` if it exists

Reading rule: bounded to program-tier artifacts. Do not broad-scan repo, do not read `_ar/**` (that is Mode P Gate P1 territory via baseline trio).

## Owns

Primary:
- `docs/program/project-brief.md` (Gate P0 output)
- `docs/program/re-frame-authorization.md` (Gate P-R output, when re-framing)

## May Update

None. Other program-tier artifacts are owned by `ArchitectureOverviewAuthor`, `ModuleMapAuthor`, `ImplementationStreamsAuthor`.

## Must

- Confirm operator intent explicitly (bootstrap vs. re-frame)
- Capture re-frame trigger event, affected artifacts, and downstream module impact in `re-frame-authorization.md` when applicable
- Author `project-brief.md` with: program name, business purpose, scope (in/out), key constraints (technical/regulatory/operational), success criteria, known risks/assumptions
- Preserve historical record on re-frame (no silent overwrite of existing brief content)
- Keep program purpose statement clear enough to constrain downstream module decomposition
- Surface vague rationale ("update", "refresh", "cleanup") as hard stop

## Must Not

- Author architecture overview, module map, or implementation streams (those are other roles)
- Author module-tier or slice-tier artifacts
- Approve re-frame without operator's explicit confirmation
- Skip Gate P-R when re-framing (silent overwrite is forbidden)
- Decide protected-area boundaries silently — surface them for ArchitectureOverviewAuthor

## Handoff To

- `ArchitectureOverviewAuthor` after Gate P0 (architecture overview + program-wide baseline)
- Operator (final acknowledgment) when Gate P-R is complete and ready to proceed into Gate P0

## Block If

- Operator intent for bootstrap/re-frame is unclear
- Product context is too vague for a meaningful `project-brief.md`
- Re-frame rationale is "update" / "refresh" / "cleanup" without specifics
- Re-frame would silently invalidate existing module work without acknowledgment
- Scope boundary cannot be drawn (in/out)

## Done When

- `project-brief.md` exists (new or amended) with all required sections
- (Re-frame variant) `re-frame-authorization.md` exists with trigger, affected artifacts, downstream impact, operator authorization
- Program purpose is statable in one sentence
- Scope in/out is explicit enough for downstream constraints
- Operator has confirmed the brief is ready for architecture overview

## Failure Modes

- silent overwrite of existing program-tier artifacts
- vague program purpose that constrains nothing downstream
- merging Gate P-R rationale into project-brief amendments
- absorbing module-level decisions into the program brief
- treating routine planning as Mode P re-run
