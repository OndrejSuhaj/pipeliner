# Mode C — Comment Intake / Documentation Amendment / Slice Seeding

## Purpose

Mode C is a governed pre-delivery intake mode for operator-selected issues and comments.

It exists to:
- normalize an operator-selected comment or issue,
- classify what kind of change it actually implies,
- resolve the affected canonical documentation layer,
- amend or create the necessary upstream documentation first,
- and prepare a clean handoff into Mode B when the result should become a real feature slice.

Mode C is **not** a replacement for Mode B.
Mode C is **not** a delivery pipeline for implementation.
Mode C is **not** allowed to bypass the repository authority hierarchy.

---

## Position in the Overall Operating Model

The repository has four operating modes:

- **Mode P — Program Bootstrap**
- **Mode B — Feature Delivery** (default)
- **Mode C — Comment Intake / Documentation Amendment / Slice Seeding** (this document)
- **Mode M — Module Orchestration**

Mode C sits **before** normal feature delivery (and **outside** of normal Mode M/Mode B sequences) when the starting point is a selected issue/comment rather than a normal delivery request.

Typical flow:

`selected issue/comment → Mode C intake and amendment → explicit handoff → Mode B feature delivery`

Mode C is appropriate when:
- the operator selects a page-level or document-passage comment from the annotation layer,
- a review note challenges current upstream documentation,
- a comment suggests missing behavior, missing entity meaning, missing rule, or missing scenario coverage,
- a comment may become a new slice, but first requires documentation normalization,
- a comment challenges a module-level or program-level artifact (routes through Mode M or Mode P respectively).

Mode C is **not** appropriate when:
- the work is already a clean feature request with enough scope clarity for normal Mode B (entering through Gate B0),
- the problem is program-wide baseline trust, source authority, or terminology instability across the program — use Mode P Gate P1,
- the problem is module-scope baseline (terminology, source authority within a module) — use Mode M Gate M1a,
- the problem is program-level structural change — use Mode P Gate P-R,
- the operator wants implementation directly — that still belongs to Mode B.

---

## Core Principles

Mode C inherits the repository principles and adds the following local discipline:

1. **Comment is not source of truth**  
   A selected issue/comment is input, not authority.

2. **Documentation first when truth is challenged**  
   If the comment changes or challenges current upstream understanding, create or amend the correct canonical document before seeding delivery work.

3. **Canonical layer must be resolved before writing**  
   Do not amend an EN-like problem as UC, or a BR-like problem as QUERY, just because the wording is vague.

4. **Minimal sufficient routing still applies**  
   Use only the roles and artifacts materially needed.

5. **No implementation in Mode C**  
   Mode C never implements product code, never opens implementation lanes, and never claims feature completion.

6. **Mode C may seed, not deliver**  
   Its highest outcome is a clean handoff package into future Mode B work.

---

## Typical Outcomes

Every Mode C run must end in exactly one explicit outcome:

- `closed_as_doc_fix`
- `recorded_as_open_question`
- `route_to_existing_slice`
- `promote_to_new_slice_candidate`
- `route_to_module_amendment`
- `route_to_program_amendment`
- `rejected`

These outcomes mean:

### `closed_as_doc_fix`
The selected issue/comment only required documentation correction or clarification at the canonical layer it targeted.

### `recorded_as_open_question`
The issue/comment exposed material ambiguity that cannot be safely normalized yet.

### `route_to_existing_slice`
The issue/comment belongs to an already existing feature slice or slice candidate in `specs/<module>/slice-map.md`.

### `promote_to_new_slice_candidate`
The issue/comment is normalized enough to seed a new future Mode B slice. The slice-seed is recorded in the target module's `slice-map.md` (through Mode M Gate M3 refresh).

### `route_to_module_amendment`
The issue/comment challenges a module-level artifact (`module-brief.md`, `module-plan.md`, `slice-map.md`, etc.). Mode C produces the amendment draft and hands off to Mode M for application.

### `route_to_program_amendment`
The issue/comment challenges a program-level artifact (`project-brief.md`, `architecture-overview.md`, `module-map.md`). Mode C produces the amendment draft and hands off to Mode P Gate P-R for authorized application.

### `rejected`
The issue/comment does not justify controlled follow-up in the repository workflow.

---

## Non-Goals

Mode C must not become:
- a second implementation workflow,
- a hidden backlog factory,
- a free-form documentation rewrite mode,
- an onboarding replacement,
- a way to bypass constitution / guardrails / impact classification,
- a universal issue tracker.

---

## Entry Conditions

Mode C may start only when all of the following are true:
- the operator explicitly selected an issue/comment,
- the operator wants controlled follow-up rather than only discussion,
- the starting point is not already a normal Mode B feature request,
- there is enough context to identify the affected page / document / artifact,
- the run can stay bounded.

If these conditions are not met, stop and ask for clarification or route elsewhere.

---

## Comment Source Retrieval

When the project ships an annotation feature with persisted comments, operator-selected comments may be retrieved directly from the application data store.

The exact retrieval mechanism is **project-specific** and is declared in the project's overlay (e.g. project-level CLAUDE.md or a project-specific mode-c overlay). The framework does not prescribe a particular database, schema, or command.

### Generic retrieval pattern (illustrative)

Replace `<placeholders>` with project-specific values declared by the project overlay.

```bash
docker compose exec <db-service-name> psql -U <db-service-user> -d <database-name> -c \
  "SELECT id, target_type, route_id, doc_id, passage_anchor, body, status, author_name, created_at \
   FROM <comments-table> ORDER BY created_at DESC;"
```

Where placeholders typically resolve to:
- `<db-service-name>` — the compose service name for the database container,
- `<db-service-user>` — a role with read access to the comments table (frequently bypasses RLS through a service role for operator workflows),
- `<database-name>` — the application's primary database,
- `<comments-table>` — the table where annotation comments are persisted.

### Expected comment columns

The retrieval should expose at least:
- identifier
- target type (e.g. `page`, `document`, `passage`)
- route / document anchor reference
- comment body
- status (e.g. `open`, `resolved`, `wontfix`)
- author identity
- creation timestamp

Specific column names vary per project; the project overlay declares the schema.

### Common filter patterns

- open only: `WHERE status = 'open'`
- specific page or route: `WHERE route_id = '<route-path>'`
- specific document: `WHERE doc_id = '<canonical-doc-id>'`
- specific module: `WHERE doc_id LIKE 'specs/<module>/%'` or via module-aware tag

### Routing discipline

This retrieval path is an operator/support workflow input. It is not a claim that all comments are normally visible in product UI across tenants or companies.

If the input came from direct database retrieval, the Mode C run must still bind itself to:
- one explicit selected comment row,
- or one explicitly bounded filtered set.

Do **not** process "all comments" as one undifferentiated intake.

### When the project has no annotation persistence

If the project does not ship an annotation feature, comments come from other sources (review tools, issue trackers, document margins, operator paste). The Mode C intake routine is the same; only the retrieval step changes. The project overlay declares which source is authoritative.

### Module attribution (when multiple modules exist)

When `docs/program/module-map.md` declares multiple modules, the comment must be attributable to one module via:
- the comment's `doc_id` matching a `specs/<module>/` path,
- the comment's `route_id` matching a route owned by a module,
- or an explicit `module` tag if the project's comment schema supports one.

If a comment spans multiple modules, split intake into one Mode C run per module.

---

## Inputs

Typical Mode C inputs:
- selected issue/comment identifier,
- comment text,
- anchor context:
  - page route,
  - document identifier,
  - or document passage context,
- relevant current upstream artifact, if known,
- operator intent, if provided.

Optional supporting inputs:
- FE evidence,
- screenshot,
- relevant `_ar/**` excerpt,
- existing spec or slice reference,
- prior review note.

---

## Comment Status vs Mode C Outcome

The comment record status in `page_comments` is **not** the same thing as the Mode C workflow outcome.

Current application comment statuses may include:
- `open`
- `resolved`
- `wontfix`

Mode C outcomes remain:
- `closed_as_doc_fix`
- `recorded_as_open_question`
- `route_to_existing_slice`
- `promote_to_new_slice_candidate`
- `rejected`

Mode C must not silently reinterpret one as the other.
If an operator workflow wants an explicit mapping, that mapping must be written down.

---

## Required Read Order in Mode C

Always read first:
- `.specify/memory/constitution.md`
- `docs/governance/guardrails.md`
- `docs/governance/trigger-matrix.md`
- `docs/governance/definition-of-done.md`
- this file

Read next only as needed:
- `docs/governance/impact-classes.md`
- `docs/governance/mode-m.md` when comment targets module-level artifact
- `docs/governance/mode-p.md` when comment targets program-level artifact
- `docs/governance/local-tooling-contract.md` when local tooling is used
- the selected issue/comment context
- the current upstream artifact being challenged
- `docs/program/module-map.md` for module attribution
- relevant role file(s) in `docs/roles/issues/**`
- exact layer-specific rules/template files only after canonical layer resolution

Do not broad-scan the repository.
Do not broad-scan `toolingDocs/` or `toolingTemplates/`.

---

## Mode C Gate Sequence

## Gate C0 — Operator Selection

### Purpose
Confirm the exact selected issue/comment and operator intent.

Selected issue/comment may come from:
- annotation layer UI,
- markdown viewer context,
- or direct operator retrieval from `page_comments` in the application database.

### Required result
A stable intake target exists.

### Minimum output
- selected issue/comment reference
- target context
- operator intent
- initial one-paragraph problem statement

### Stop if
- the operator did not actually select a bounded issue/comment,
- the starting point is too vague,
- the context cannot be identified,
- or the run is trying to process “all comments” as one backlog blob.

---

## Gate C1 — Intake Classification

### Purpose
Normalize the issue/comment and classify what kind of controlled follow-up it implies.

### Owned by
`docs/roles/issues/CommentIntakeGuard`

### Expected decisions
- doc-fix only,
- open question,
- existing-slice extension,
- new-slice candidate,
- reject.

### Minimum output artifact
`comment-intake.md`

### Required contents
- issue/comment reference
- normalized summary
- target context
- why the issue matters
- provisional classification
- provisional impact seed
- protected-area suspicion if any
- recommendation

### Stop if
- the normalized problem cannot be stated clearly,
- the comment actually contains multiple separate problems that must be split first.

---

## Gate C2 — Canonical Layer Resolution

### Purpose
Resolve which canonical documentation layer is actually affected.

### Owned by
`docs/roles/issues/CanonicalLayerResolver`

### Common mappings
- entity meaning, lifecycle, invariants, relationships → `EN`
- actor-triggered behavior and numbered flow → `UC`
- deterministic system/domain rule → `BR`
- FE-first runtime evidence or reconstruction scenario → `CS`
- capability description → `FN`
- interface contract → `API`
- access model → `ACL`
- read-side behavior → `QUERY`
- background contract → `JOB`
- external system boundary → `ES`
- transactional message contract → `MSG`
- structural system view → `ARCH`

### Minimum output
A resolved primary canonical layer and any secondary affected layers.

### Stop if
- no safe primary layer can be determined,
- multiple layers conflict materially and need clarification first.

---

## Gate C2.5 — Tooling Resolution

### Purpose
Read the exact layer-specific authoring rule/template only if needed.

### Owned by
- `docs/roles/issues/ToolingRuleResolver`
- `docs/roles/issues/ToolingTemplateResolver`

### Allowed reads
Only exact-file lookup after layer resolution, for example:
- `toolingDocs/rules-EN.md`
- `toolingTemplates/template-EN.md`

### Forbidden reads
- scanning all rules,
- scanning all templates,
- using local tooling as authority,
- inventing layer rules when both tooling and fallback are missing.

### Stop if
- local tooling is needed and missing,
- no repository fallback exists,
- safe authoring cannot continue.

See `docs/governance/local-tooling-contract.md`.

---

## Gate C3 — Documentation Amendment

### Purpose
Create or amend the necessary upstream documentation before any slice promotion.

### Owned by
`docs/roles/issues/DocumentationAmendmentAuthor`

### Typical outputs
- amendment to existing canonical doc,
- new draft canonical doc,
- correction note,
- conflict note,
- or explicit open question when amendment is unsafe.

### Required behavior
- follow the resolved canonical layer,
- follow layer-specific restrictions,
- keep implementation details out when the layer forbids them,
- preserve uncertainty instead of smoothing it away,
- never treat the issue/comment as authority by itself.

### Minimum output artifact
`source-amendment.md` or equivalent upstream amendment artifact

### Stop if
- the upstream change would silently cross into protected-area design,
- the amendment would require unsupported claims,
- the evidence is too weak.

---

## Gate C4 — Slice Seeding / Handoff

### Purpose
Prepare future Mode B work only when the result justifies it.

### Owned by
`docs/roles/issues/SliceSeedAuthor`

### When used
Only for:
- `route_to_existing_slice`
- `promote_to_new_slice_candidate`

### Minimum outputs
- `slice-seed.md` when a new slice candidate is created
- `mode-b-handoff.md` when a future Mode B run should start from the Mode C result

### Required contents
- normalized problem statement
- documentation delta summary
- recommended slice slug or target existing slice
- likely impact class
- likely protected areas
- likely specialist triggers
- recommended next step:
  - `Mode B, Gate 1–3 only`
  - or `Mode B, Gate 1–5 only`

### Stop if
- the result is still too ambiguous for safe seeding,
- the change is actually strategic / architecture-sensitive and needs governance escalation first.

---

## Default Agent Set for `docs/roles/issues/**`

Mode C should use a small, explicit set of issue-focused agents.

### Required

#### `CommentIntakeGuard`
Normalizes the selected issue/comment and classifies it.

#### `CanonicalLayerResolver`
Determines which canonical documentation layer is affected.

#### `DocumentationAmendmentAuthor`
Creates or amends upstream documentation using the resolved layer.

#### `SliceSeedAuthor`
Prepares the future Mode B seed/handoff when promotion is justified.

### Conditional

#### `ToolingRuleResolver`
Reads the exact local authoring rules file when needed.

#### `ToolingTemplateResolver`
Reads the exact local authoring template file when needed.

#### `ClarificationSeeder`
Used when ambiguity materially blocks safe intake or amendment.

#### `ConflictMapperLite`
Used when current sources materially conflict and the conflict must be surfaced before proceeding.

---

## Required Artifacts in Mode C

These artifacts are Mode C-specific and do not replace Mode B artifacts.

Document source-amendment.md is not sufficient by itself when the target is an existing canonical doc and the amendment is actionable.

### Always when applicable
- `comment-intake.md`
- `source-amendment.md` or equivalent amendment artifact

### When ambiguity is material
- `open-questions.md`

### When future delivery is justified
- `slice-seed.md`
- `mode-b-handoff.md`

Mode C must not create:
- `spec.md`
- `plan.md`
- `tasks.md`
- `qa-checklist.md`
- `runtime-notes.md`
- `review.md`

unless the run is explicitly handed off and restarted as Mode B.

---
##  Canonical application rule

If the amendment type is correction-note or clarification-amendment and target_doc_id points to an existing canonical document, the amendment must be applied to that canonical document within Gate C3.

If the amendment type is new-draft-artifact, canonical application is not required in the same step.

If the amendment type is conflict-note, canonical application is forbidden until the conflict is resolved.

---

## Routing and Impact Guidance

Mode C still follows repository routing discipline:
- classify by **effect**, not by wording,
- use **minimal sufficient routing**,
- **highest risk wins**,
- escalate uncertainty rather than guessing.

Typical impact posture:
- documentation-only correction may remain `IC0`,
- bounded clarification with no protected-area touch may remain lightweight,
- if the issue/comment implies contract, ACL, QUERY, JOB, schema, tenancy, or architecture effects, surface that in the handoff rather than pretending it is doc-only.

If protected areas are implicated, Mode C may identify them but must not silently design the downstream solution.

---

## Hard Stops in Mode C

Stop or block when:
- the selected issue/comment is unclear,
- canonical layer cannot be resolved,
- tooling guidance is required but unavailable,
- upstream sources materially conflict,
- protected-area implications exist but are being hand-waved,
- the work is actually strategic and should not be seeded casually,
- the operator is trying to use Mode C as a shortcut around Mode B.
- the amendment text exists, but canonical application is still pending without explicit reason.

Blocked is a valid Mode C state.

---

## Handoff to Mode B

A Mode C result may hand off into Mode B only when:
- the issue/comment has been normalized,
- the upstream documentation delta is visible,
- the likely scope is bounded enough,
- the next delivery step is explicit,
- the slice's slice-readiness prerequisites can be expressed in `slice-map.md`,
- and the operator wants promotion.

Mode C handoff should state one of:
- `Start Mode B Gate B0` (slice-readiness check followed by full Mode B sequence)
- `Start Mode B Gate B0 + 1–3 only` (scope and clarification only, no implementation)
- `Start Mode B Gate B0 + 1–5 only` (through plan / tasks, no implementation)
- `Attach to existing slice`
- `Hold until open questions are resolved`

Mode C never creates a branch by itself.
Mode C never opens implementation lanes by itself.
Mode C never bypasses Mode B Gate B0.
Normal git gates remain a Mode B concern.

## Handoff to Mode M

A Mode C result must hand off to Mode M when:
- the comment challenges a module-level artifact (`module-brief.md`, `module-plan.md`, `slice-map.md`, `module-risks.md`, etc.),
- the comment seeds a new slice in an existing module (Mode M Gate M3 refresh of `slice-map.md`),
- the comment requires module-scope terminology or baseline amendment (Mode M Gate M1a refresh).

Mode C produces the amendment draft (`source-amendment.md`); Mode M applies it through the appropriate gate.

## Handoff to Mode P

A Mode C result must hand off to Mode P (through Gate P-R) when:
- the comment challenges a program-level artifact (`project-brief.md`, `architecture-overview.md`, `module-map.md`),
- the comment implies a new module or module split,
- the comment implies a scope change at program level.

Mode C produces the amendment draft; Mode P authorizes and applies it through Gate P-R.

---

## Relationship to Canonical Authored Documentation (`_ar/`)

`_ar/**` in v2.0.0 is canonical authored truth, not raw source corpus.

Mode C uses `_ar/**` only in a bounded way and may **author amendments** into it via `source-amendment.md`:

Rules:
- read only the subset needed for the selected issue/comment,
- amend a canonical `_ar/` doc only when `source-amendment.md` declares the change (analogous to slice manifest in Mode B),
- update `_REGISTRY.md` atomically when a new `doc_id` is introduced,
- preserve inconsistencies and open questions,
- do not use broad corpus reading unless the work has actually turned into a baseline problem (in which case escalate to Mode P or Mode M, not Mode C).

When the affected layer is `CS`, keep FE evidence primary and avoid overclaiming backend truth from UI alone.

---

## Quality Bar

A good Mode C result is:
- bounded,
- explicit,
- evidence-aware,
- layer-correct,
- honest about uncertainty,
- and easy to hand off.

A bad Mode C result is:
- vague,
- over-architected,
- silently authoritative,
- implementation-shaped without documentation normalization,
- or indistinguishable from a hidden backlog entry.

---

## Example Short Prompts

- `Mode C, Gate C0-C2 only for selected issue 17`
- `Mode C, create comment-intake.md and resolve canonical layer`
- `Mode C, amend upstream EN draft only`
- `Mode C, prepare slice-seed and mode-b-handoff only`
