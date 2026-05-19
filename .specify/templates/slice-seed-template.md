---
artifact: slice-seed
mode: C
status: draft
candidate_slice_slug: <module-slug>/phaseN-NN-slice-slug-or-tbd
source_comment_id: <comment-id>
seed_type: existing-slice-extension | new-slice-candidate
created_at: <YYYY-MM-DD>
---

# Slice Seed

## Seed Identity

- **Candidate Slice Slug:** `<module-slug>/phaseN-NN-slice-slug-or-tbd`
- **Source Comment ID:** `<comment-id>`
- **Seed Type:** `existing-slice-extension | new-slice-candidate`

## Problem Statement

<One bounded paragraph describing the problem that remains after documentation normalization.>

## Documentation Delta Summary

- <what was amended upstream>
- <what is now clearer than before>
- <what still remains intentionally unresolved>

## Why This Is Slice-Worthy

- <bounded business / product / UX / documentation-to-delivery reason>
- <why this should not stay only as a note>

## Scope Sketch

### In Scope
- <item 1>
- <item 2>

### Out of Scope
- <item 1>
- <item 2>

## Likely Impact Class

Choose one:
- `IC0`
- `IC1`
- `IC2`
- `IC3`
- `IC4`
- `IC5`
- `uncertain`

**Why:** <brief explanation>

## Likely Protected Areas

Mark only if genuinely plausible:

- `none`
- `authentication and identity`
- `ACL / permissions`
- `tenancy / scoping`
- `shared contract`
- `data model / schema-sensitive behavior`
- `jobs / async / retry / idempotency`
- `external integrations`
- `infrastructure-sensitive behavior`
- `architecture boundaries`

**Notes:** <brief explanation>

## Likely Specialist Triggers

- `SchemaSteward` — `yes | no | maybe`
- `AclPlanner` — `yes | no | maybe`
- `QueryPlanner` — `yes | no | maybe`
- `JobPlanner` — `yes | no | maybe`
- `MobileImplementer` — `yes | no | maybe`

**Notes:** <brief explanation>

## Existing Slice Attachment Check

- **Attach to existing slice instead of creating new one:** `yes | no | maybe`
- **Existing slice candidate:** `<slug-or-none>`
- **Why:** <brief explanation>

## Suggested First Mode B Scope Shape

Choose one:

- `Gate 1–3 only`
- `Gate 1–5 only`
- `Attach to existing slice`
- `Hold until ambiguity is resolved`

**Why:** <brief explanation>

## Risks of Premature Promotion

- <risk 1>
- <risk 2>

## Recommendation

Choose one:

- `Promote to new slice candidate`
- `Route to existing slice`
- `Hold`
