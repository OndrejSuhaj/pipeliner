# Re-frame Authorization: [PROJECT NAME]

**Project Slug**: `[project-slug]`
**Created**: [DATE]
**Status**: Draft → Authorized
**Mode**: `P — Program Bootstrap`
**Authored at**: Gate P-R — Re-frame Authorization
**Authorizing operator**: [Name]
**Authorization timestamp**: [DATE + TIME]

> **Purpose**: Block silent overwrites of existing program artifacts. Make structural change explicit, named, and operator-authorized. See `mode-p.md` § Gate P-R.

## Trigger Event

[What changed in the world that requires this re-frame? Concrete event, not "general cleanup". Examples:
- "Legal review on 2026-04-15 introduced a new compliance scope (PCI) that requires a dedicated billing module."
- "Module `payments` exceeded operational complexity threshold and must be split into `payments-checkout` and `payments-reconciliation`."
- "External partner contract renegotiation removed the need for integration module `partner-sync`."]

## Affected Program-Level Artifacts

List exactly which program-level files will be amended by this re-frame.

- [ ] `docs/program/project-brief.md` — [what section changes]
- [ ] `docs/program/architecture-overview.md` — [what section changes]
- [ ] `docs/program/module-map.md` — [what section changes]
- [ ] `docs/program/implementation-streams.md` — [what section changes, or n/a]

## Downstream Module Impact

For each module currently declared in `module-map.md`, declare the impact of this re-frame.

| Module | Status before | Status after | Action required |
|---|---|---|---|
| `core` | active | unchanged | none |
| `[module-slug-1]` | active | unchanged | none |
| `[module-slug-2]` | active | **split** | Mode M re-framing for new module(s); migration plan for in-flight slices |
| `[module-slug-3]` | active | **removed** | active slices halted; deferred slices archived; downstream consumers notified |
| `[new-module-slug]` | n/a | **added** | new Mode M Gate M0 declaration |

### Impact on in-flight slices

For each module with `split`, `merged`, `removed`, or `scope-changed` status, name the affected in-flight slices:

- `[slice-id]` in `[module-slug]` — current state: `in-progress | ready | deferred` — re-frame consequence: [migrated to / paused / discarded with reason]
- `[slice-id]` — current state: … — consequence: …

## Re-frame Rationale

[Detailed explanation of why this re-frame is the correct response to the trigger event. Should answer:
- Why now (timing)?
- Why this scope (not larger, not smaller)?
- What alternatives were considered?
- What is the cost of not re-framing?]

## Operator Authorization

By signing below, the authorizing operator confirms:

- [ ] The trigger event is a real structural change, not routine planning.
- [ ] The downstream impact on existing module work is acknowledged and accepted.
- [ ] No in-flight slice will be silently discarded; affected slices have explicit disposition.
- [ ] The cost of re-frame (in time, in invalidated work) is justified by the trigger.
- [ ] Re-frame does not bypass any constitutional rule (see `constitution.md` § 19).

**Operator signature**: [Name + timestamp]

## Post-Authorization Actions

After this authorization is signed, the following must happen:

1. Mode P proceeds through Gate P0 → P1 → P2 → P3 (as relevant) to apply amendments to the named artifacts.
2. Each amended artifact appends an entry to its own Amendment History.
3. Affected modules' Mode M state is updated:
   - `removed` modules: archived (typically moved under `specs/_archive/<module>/`)
   - `split` modules: original module archived; new modules enter Mode M Gate M0
   - `merged` modules: target module's `module-brief.md` amended through Mode M Gate M1b refresh
   - `scope-changed` modules: target module's `module-brief.md` amended
4. Cross-module integration consumers are notified of contract changes (if any).
5. `implementation-streams.md` is reviewed and amended if parallel delivery model changes.

## Open Points

If material ambiguity remains after authorization, record it in `open-questions.md` under the program scope.
