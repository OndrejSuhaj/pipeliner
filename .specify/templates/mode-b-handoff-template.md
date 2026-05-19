---
artifact: mode-b-handoff
mode: C-to-B
status: draft
source_comment_id: <comment-id>
target_slice: <existing-slice-or-candidate-slug>
recommended_mode_b_entry: Gate 1-3 | Gate 1-5 | attach-to-existing-slice | hold
created_at: <YYYY-MM-DD>
---

# Mode B Handoff

## Handoff Summary

- **Source Comment ID:** `<comment-id>`
- **Target Slice:** `<existing-slice-or-candidate-slug>`
- **Recommended Mode B Entry:** `Gate 1-3 | Gate 1-5 | attach-to-existing-slice | hold`

## What Is Already Normalized

- <normalized problem statement exists>
- <canonical layer resolved>
- <documentation delta visible>
- <other already-done work>

## Upstream Documentation Changes Completed

- <document 1 and what changed>
- <document 2 and what changed>

## What Remains Ambiguous

- <ambiguity 1>
- <ambiguity 2>
- or `None`

## Recommended Starting Point for Mode B

### If starting a new slice
- start with: `Gate 1–3 only` or `Gate 1–5 only`
- initial problem statement: <one paragraph>
- expected artifact path: `specs/<candidate-slice>/`

### If attaching to an existing slice
- target slice: `<slug>`
- attach as: <extension / follow-up / bounded delta>
- update needed in current slice: <short note>

## Likely Routing Signals for Mode B

- `shared contract concern:` `yes | no | maybe`
- `ACL concern:` `yes | no | maybe`
- `QUERY concern:` `yes | no | maybe`
- `JOB concern:` `yes | no | maybe`
- `mobile concern:` `yes | no | maybe`

**Notes:** <brief explanation>

## Hard Stops to Respect in Mode B

- <stop condition 1>
- <stop condition 2>

## Recommended Operator Prompt

```text
Mode B — Feature Delivery.
Use this Mode C handoff as the starting point.
Begin with <Gate 1–3 only / Gate 1–5 only / attach to existing slice>.
Do not reopen broad corpus analysis unless baseline trust is genuinely in doubt.
Respect the upstream documentation amendment already produced in Mode C.
```

## Final Recommendation

Choose one:

- `Proceed to Mode B now`
- `Proceed to existing slice`
- `Hold until open questions are resolved`
