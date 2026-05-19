---
artifact: source-amendment
mode: C
status: draft
primary_canonical_layer: EN | UC | BR | CS | FN | API | ACL | QUERY | JOB | ES | MSG | ARCH
amendment_type: correction-note | clarification-amendment | new-draft-artifact | conflict-note
target_doc_id: <doc-id-or-new>
related_comment_id: <comment-id>
created_at: <YYYY-MM-DD>
canonical_application_status: pending | applied | blocked | not-applicable
canonical_application_target: <path-or-n/a>
---

# Source Amendment

## Amendment Context

- **Related Comment ID:** `<comment-id>`
- **Primary Canonical Layer:** `EN | UC | BR | CS | FN | API | ACL | QUERY | JOB | ES | MSG | ARCH`
- **Amendment Type:** `correction-note | clarification-amendment | new-draft-artifact | conflict-note`
- **Target Document ID:** `<doc-id-or-new>`
- **Related Route / Viewer Context:** `<route-or-doc-context>`

## Why Amendment Is Needed

<Brief explanation of what the selected comment challenged and why the upstream documentation must change before future delivery work.>

## Current Source State

<What the current canonical source says today.>

## Problem With Current Source State

- <missing statement>
- <incorrect statement>
- <ambiguous statement>
- <conflicting statement>

## Evidence Used

### Directly Relevant Evidence
- <evidence item 1>
- <evidence item 2>

### Secondary Analytical Support
- <secondary support item 1>
- <secondary support item 2>

## Confidence

Choose one:
- `confirmed`
- `partial`
- `uncertain`
- `blocked`

**Why:** <brief explanation>

## Proposed Amendment

<Write the actual correction / clarification / new draft content here, or summarize it if the amendment is applied elsewhere.>

## Layer-Specific Guardrails Applied

- <relevant rule or restriction followed>
- <what was intentionally excluded because the layer forbids it>

## What This Amendment Does Not Claim

- <no unsupported backend truth>
- <no implementation detail if forbidden>
- <no scope expansion beyond the amendment>

## Open Questions

- <question 1>
- <question 2>
- or `None`

## Conflict Notes

Use only if needed:

- **Conflicting sources:** <source A vs source B>
- **Current handling:** <preserved / unresolved / blocked>

## Recommendation After Amendment

Choose one:

- `Close as documentation fix`
- `Record as open question`
- `Route to existing slice`
- `Promote to new slice candidate`
- `Hold until more evidence exists`

**Why:** <brief explanation>

## Canonical Application

- **Application Status:** `pending | applied | blocked | not-applicable`
- **Canonical Target:** `<path-or-n/a>`
- **Application Mode:** `patched-existing-doc | created-new-draft | conflict-held | note-only`
- **Why:** <brief explanation>

## Applied Canonical Change

- <what was actually changed in the canonical doc>
- <or `not yet applied` with explicit blocker>
