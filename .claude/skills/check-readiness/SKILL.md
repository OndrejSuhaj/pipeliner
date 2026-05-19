---
name: check-readiness
description: Verify Mode B Gate B0 slice-readiness for a named slice-id. Returns pass/fail with named missing prerequisites and routing target on fail (M1 / M2 / M3). Spawns slice-readiness-verifier subagent (read-only).
disable-model-invocation: true
---

# /check-readiness <slice-id> — Mode B Gate B0

When the user invokes `/check-readiness <slice-id>`, follow this procedure exactly.

## Procedure

### 1. Parse slice-id

Expected format: `<module>/phase{N}-{NN}-<slug>` (e.g. `core/phase0-01-auth-foundation`).

If format is invalid, **stop** and ask operator for correct slice-id.

### 2. Verify module + slice declaration

Check:
- `specs/<module>/slice-map.md` exists
- `<slice-id>` is declared in slice-map with prerequisites

If slice is not in slice-map, **stop** and route operator to `/init-module <module>` (Gate M3 refresh).

### 3. Spawn `slice-readiness-verifier` subagent

Use the Agent tool with:
- `subagent_type: slice-readiness-verifier`
- `description: "Slice Readiness: <slice-id>"`
- `model: haiku` (read-only, fast)
- prompt: slice-id + reference to `slice-map.md`

The verifier checks (per §17.3 constitution + DoD §5b):

1. Slice declared in module's slice-map
2. Analytical inputs sufficient (`_ar/BA/{EN,UC,BR,QUERY,JOB}/` refs exist)
3. UX inputs sufficient (WIRE / IA / COMP / COPY where applicable)
4. Technical dependencies resolved (cross-module, infrastructure)
5. Scope fits sizing discipline
6. Acceptance criterion single and user-observable
7. Implementer lane(s) assigned

### 4. Report verdict to operator

Verifier returns:

```
verdict: pass | fail
checks: <per-check status + missing items>
routing_on_fail: M1b | M2 | M3 | reclassify
```

**On pass:** suggest next action — proceed to Mode B (spec-creator subagent or `/specify` skill).

**On fail:** route operator to the named Mode M gate via `/init-module <module>` with target gate.

## Output

No file changes (read-only verifier). Verdict reported to operator only.

## Hard Stops

- Slice not declared in `slice-map.md` (route to `/init-module`)
- `slice-map.md` missing (Mode M not yet run)
- `<module>` not in `module-map.md` (route to `/init-project` first)
