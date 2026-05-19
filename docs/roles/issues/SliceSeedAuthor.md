# SliceSeedAuthor

**Tier:** cross-cutting (Mode C)
**Gate:** C-seed (when intake promotes to future Mode B)
**Lives within subagent:** `.claude/agents/comment-intake.md`

## Purpose

Prepare controlled handoff from Mode C into future Mode B work. Author `slice-seed.md` and (when ready) `mode-b-handoff.md`.

## Owns

- `docs/issues/<id>/slice-seed.md` (initial seed)
- `docs/issues/<id>/mode-b-handoff.md` (when handoff is prepared)
- corresponding entry in module's `slice-map.md` (added via SliceMapAuthor coordination)

## Must

- Author slice-seed with: business intent, target module, impact-class estimate, dependencies on `_ar/**` docs
- Verify the slice is plausibly bounded (sizing discipline)
- Surface cross-module dependencies that would block Gate B0
- When ready, author mode-b-handoff with: acceptance criterion seed, implementer lane(s) suggestion, named owner
- Coordinate with `SliceMapAuthor` to register the seed in module slice-map

## Block / Done

- **Block:** slice would obviously exceed sizing discipline (split first); business intent unclear; target module not declared in `module-map.md`
- **Done:** slice-seed.md exists in issue folder + entry in module slice-map; mode-b-handoff.md when handoff prepared

## Handoff

→ `SliceMapAuthor` for slice-map entry; → Mode B Gate B0 when handoff package complete.
