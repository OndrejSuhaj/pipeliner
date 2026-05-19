---
name: intake
description: Process an operator-selected issue/comment via Mode C — normalize, classify, resolve canonical layer, author amendment, decide outcome. Spawns comment-intake subagent.
disable-model-invocation: true
---

# /intake <comment-ref> — Comment Intake (Mode C)

When the user invokes `/intake <comment-ref>`, follow this procedure exactly.

## Procedure

### 1. Confirm operator-selected input

The `<comment-ref>` should identify a specific comment/issue source:
- File path + line range
- GitHub issue/PR comment URL
- Annotation layer reference
- Plain-text comment pasted by operator

If reference is vague or covers multiple comments, **stop** and ask operator to narrow to one specific comment.

### 2. Spawn `comment-intake` subagent

Use the Agent tool with:
- `subagent_type: comment-intake`
- `description: "Comment Intake: <issue-id-or-slug>"`
- `isolation: worktree`
- prompt: paste verbatim comment + reference + operator's stated concern (if any)

The subagent drives the Mode C gate sequence:
1. Normalize and classify comment
2. Resolve affected canonical layer
3. Clarify ambiguity (if needed)
4. Read layer rules and templates
5. Author `source-amendment.md` and apply to `_ar/`
6. Surface canonical conflicts (if any)
7. Seed slice (if promoting to Mode B)

### 3. Report outcome to operator

Subagent returns one of:
- `closed_as_doc_fix` — amendment applied, done
- `recorded_as_open_question` — ambiguity preserved
- `route_to_existing_slice` — folded into existing planned slice
- `promote_to_new_slice_candidate` — new slice seeded for future Mode B
- `rejected` — comment doesn't justify amendment

For `promote_to_new_slice_candidate`, suggest next action: `/check-readiness <slice-id>` once slice-map is updated.

## Output

- `docs/issues/<id>/comment-intake.md`
- `docs/issues/<id>/source-amendment.md` (when amendment authored)
- Updates to `_ar/<tier>/<layer>/<doc>.md` (when amendment applied)
- `docs/issues/<id>/slice-seed.md` + `mode-b-handoff.md` (when promoting)
- Updates to module's `slice-map.md` (when promoting)

## Hard Stops

- Comment too vague to classify
- Canonical layer unresolvable safely
- Amendment creates program-wide canonical conflict (route to `/init-project` Gate P-R)
- New slice candidate exceeds slice sizing discipline (split or reject)
