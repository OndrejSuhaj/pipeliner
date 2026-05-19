# Project Brief: [PROJECT NAME]

**Project Slug**: `[project-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `P — Program Bootstrap`
**Authored at**: Gate P0 — Program Declaration

> **Re-frame note**: If this is a re-frame (existing `project-brief.md` is being amended), `re-frame-authorization.md` must exist alongside this file. See `mode-p.md` § Gate P-R.

## Business Purpose

[One paragraph describing what the project exists to do — the business outcome it enables, not its technical shape.]

## Scope

### In Scope
- [Capability or area the project will deliver]
- [Capability or area the project will deliver]
- [Capability or area the project will deliver]

### Out of Scope
- [Explicitly excluded capability or area]
- [Explicitly excluded capability or area]

## Key Constraints

### Technical Constraints
- [Hard technical constraint — platform, language, framework, integration requirement]
- [Hard technical constraint]

### Regulatory / Compliance Constraints
- [Regulatory requirement, certification, audit obligation, data residency, etc., or `none`]

### Operational Constraints
- [Deadline, budget, team size, geographic, runtime, etc., or `none`]

## Success Criteria at Program Level

- **PSC-001**: [Measurable outcome that signals program-level success]
- **PSC-002**: [Measurable outcome]
- **PSC-003**: [Measurable outcome]

## Known Risks at Bootstrap Time

- **PR-001** — [Risk name]: [Description, severity, current mitigation thinking]
- **PR-002** — [Risk name]: [Description]
- **PR-003** — [Risk name]: [Description]

## Assumptions

Recorded explicitly to make them challengeable later:

- [Assumption about market, users, technology, team, regulation]
- [Assumption]
- [Assumption]

## Stakeholders

| Role | Name / Owner | Decision authority |
|---|---|---|
| [Program owner] | [Name] | [What decisions they own] |
| [Product owner] | [Name] | [What decisions they own] |
| [Architecture owner] | [Name] | [What decisions they own] |

## Downstream Inputs

This brief is consumed by:
- `architecture-overview.md` (Gate P1)
- `module-map.md` (Gate P2)
- `implementation-streams.md` (Gate P3, when applicable)
- Mode A repository onboarding (when starting fresh)
- Mode M for each declared module

## Open Points Moved Out

If material ambiguity remains, record it in `open-questions.md` under the program scope rather than hiding it here.

## Amendment History

[Track structural amendments. Each re-frame appends a new entry pointing to its `re-frame-authorization.md`.]

| Date | Trigger | Re-frame authorization | Summary of change |
|---|---|---|---|
| [DATE] | initial bootstrap | n/a | initial draft |
