---
artifact: comment-intake
mode: C
status: draft
selected_comment_id: <comment-id>
selected_comment_source: annotation-ui | markdown-viewer | db-retrieval
target_type: page | doc_passage
route_id: <route-or-n/a>
doc_id: <doc-id-or-n/a>
passage_anchor: <anchor-or-n/a>
operator_intent: <intent-or-n/a>
created_at: <YYYY-MM-DD>
---

# Comment Intake

## Selected Comment

- **Comment ID:** `<comment-id>`
- **Source:** `annotation-ui | markdown-viewer | db-retrieval`
- **Target Type:** `page | doc_passage`
- **Route ID:** `<route-or-n/a>`
- **Document ID:** `<doc-id-or-n/a>`
- **Passage Anchor:** `<anchor-or-n/a>`
- **Current Comment Status in App:** `open | resolved | wontfix | unknown`
- **Author:** `<author-name-or-unknown>`
- **Created At:** `<timestamp-or-unknown>`

## Raw Comment

> <paste or summarize the selected comment text>

## Operator Intent

<What the operator wants to do with this comment now.>

## Normalized Issue Summary

<One clean paragraph describing the actual problem in neutral language.>

## Why This Matters

- <impact on understanding, review, delivery, or consistency>
- <why this is not just noise>

## Context Boundaries

### In Scope
- <what this intake run covers>

### Out of Scope
- <what this intake run explicitly does not cover>

## Boundedness Assessment

- **Bounded enough for controlled follow-up:** `yes | no | partial`
- **Why:** <brief explanation>

## Known Facts

- <fact 1>
- <fact 2>

## Unknowns

- <unknown 1>
- <unknown 2>

## Possible Protected-Area Suspicion

Mark only if there is a real signal:

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

**Notes:** <why or why not>

## Provisional Classification

Choose one:

- `doc_fix_only`
- `open_question`
- `existing_slice_extension`
- `new_slice_candidate`
- `reject_or_close`

**Why this classification:** <brief explanation>

## Provisional Impact Seed

Choose the smallest honest seed:

- `IC0`
- `IC1`
- `IC2`
- `IC3`
- `IC4`
- `IC5`
- `uncertain`

**Why:** <brief explanation>

## Recommended Next Mode C Gate

Choose one:

- `Gate C2 — Canonical Layer Resolution`
- `Gate C3 — Documentation Amendment`
- `Gate C4 — Slice Seeding / Handoff`
- `Hold for clarification`
- `Reject / close`

## Notes on Comment Status vs Mode C Outcome

- **Comment status in app:** `open | resolved | wontfix | unknown`
- **Mode C outcome candidate:** `<not yet decided / provisional classification above>`

These are not the same thing and must not be silently collapsed.
