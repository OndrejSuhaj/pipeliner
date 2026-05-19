# Local Tooling Contract

## Purpose

This document defines how optional local authoring support may be used safely in this repository.

It governs two optional root-level folders:

- `toolingDocs/`
- `toolingTemplates/`

These folders may be symlinked to local, non-versioned sources.
They exist to provide layer-specific authoring rules and templates for documentation work, especially in Mode C.

They are **authoring support only**.
They are **not source of truth**.

---

## Scope

This contract applies whenever any agent, script, or operator-guided workflow reads from:

- `toolingDocs/**`
- `toolingTemplates/**`

This contract does not replace:
- the constitution,
- governance docs,
- repository templates,
- approved feature artifacts,
- or canonical upstream documentation.

---

## Authority and Precedence

Local tooling is lower authority than repository governance and approved artifacts.

Precedence order remains:

1. `.specify/memory/constitution.md`
2. `docs/governance/guardrails.md`
3. `docs/governance/impact-classes.md`
4. `docs/governance/trigger-matrix.md`
5. `docs/governance/definition-of-done.md`
6. `docs/governance/mode-c.md` when Mode C is active
7. this file
8. repository canonical artifacts
9. `toolingDocs/**`
10. `toolingTemplates/**`
11. agent instructions

Implications:
- local tooling may help author a document,
- but it may not weaken or override governance,
- and it may not silently redefine what the repository considers true.

If local tooling conflicts with a higher artifact, the higher artifact wins and the conflict must be surfaced.

---

## What the Two Folders Mean

## `toolingDocs/`

Expected purpose:
- layer-specific documentation rules

Examples:
- `toolingDocs/rules-EN.md`
- `toolingDocs/rules-UC.md`
- `toolingDocs/rules-CS.md`
- `toolingDocs/rules-BR.md`

These files answer:
- what a layer is for,
- what sections it should contain,
- what it must not contain,
- what style or evidence rules apply.

## `toolingTemplates/`

Expected purpose:
- layer-specific document templates

Examples:
- `toolingTemplates/template-EN.md`
- `toolingTemplates/template-UC.md`
- `toolingTemplates/template-CS.md`

These files answer:
- how to shape the draft,
- which frontmatter or headings are expected,
- what the initial structure should look like.

---

## Allowed Usage

Local tooling may be used only when all of the following are true:

1. the current work actually needs layer-specific authoring support,
2. the primary canonical documentation layer has already been resolved,
3. the exact target file is known,
4. the read is necessary for safe authoring,
5. the work remains bounded.

Allowed pattern:

1. resolve the canonical layer,
2. read only the exact rules file for that layer,
3. read only the exact template file for that layer,
4. use them as authoring support,
5. keep authority with repository governance and canonical artifacts.

Example:
- canonical layer resolved as `EN`
- allowed reads:
  - `toolingDocs/rules-EN.md`
  - `toolingTemplates/template-EN.md`

---

## Forbidden Usage

The following are forbidden:

- broad scanning of `toolingDocs/`
- broad scanning of `toolingTemplates/`
- reading multiple layer files “just in case”
- using tooling folders before canonical layer resolution
- treating local tooling as higher authority than repository governance
- using local tooling to silently override constitution, guardrails, or approved artifacts
- inventing repository policy from a local helper file
- using local tooling as a shortcut around missing clarification

Examples of forbidden behavior:
- opening every `rules-*.md` file to “see what fits”
- browsing all templates before deciding the target layer
- changing workflow behavior because a local rule suggests a looser approach
- using a local template to justify cross-layer mixing

---

## Exact-File Lookup Rule

All reads from local tooling must be exact-file lookups.

This means:
- determine the canonical layer first,
- then read only the matching file(s).

Pattern:
- `toolingDocs/rules-<LAYER>.md`
- `toolingTemplates/template-<LAYER>.md`

Examples:
- `toolingDocs/rules-API.md`
- `toolingTemplates/template-QUERY.md`

No other lookup style is allowed by default.

---

## Fallback Behavior

If local tooling is absent or incomplete, use this decision rule:

### Case 1 — Exact local tooling file exists
Use it as authoring support.

### Case 2 — Local tooling file missing, repository fallback exists
Use the repository fallback artifact.

### Case 3 — Local tooling file missing and repository fallback missing
Stop and surface the missing prerequisite.

Do not invent the missing rules or structure from memory.

---

## Relationship to Repository Templates

Repository pipeline templates and local layer templates serve different roles.

### Repository templates
These belong in `.specify/templates/`.
They define repository workflow artifacts such as:
- `spec.md`
- `plan.md`
- `tasks.md`
- `open-questions.md`
- `qa-checklist.md`
- `runtime-notes.md`
- `review.md`

### Local tooling templates
These help author canonical layer documents such as:
- EN
- UC
- BR
- CS
- FN
- API
- ACL
- QUERY
- JOB
- ES
- MSG
- ARCH

Rule:
- pipeline templates are repository workflow contract,
- local layer templates are authoring support.

Do not mix the two roles.

---

## Relationship to Mode C

Mode C is the main consumer of local tooling.

Expected sequence:
1. selected issue/comment is normalized,
2. canonical layer is resolved,
3. local tooling is consulted only if needed,
4. upstream documentation amendment is written,
5. future Mode B handoff may be prepared.

Local tooling must therefore stay:
- exact,
- bounded,
- low-authority,
- and easy to reason about.

Mode B may occasionally use local tooling for bounded documentation work, but Mode B should not rely on it by default.

Mode P Gate P1 (program-wide baseline) and Mode M Gate M1a (module-scope baseline) should not use local tooling as a substitute for source authority analysis.

---

## Canonical Layer Mapping Support

Local tooling is expected to support these common layers:

- `EN`
- `UC`
- `BR`
- `CS`
- `FN`
- `API`
- `ACL`
- `QUERY`
- `JOB`
- `ES`
- `MSG`
- `ARCH`

The local files should follow consistent naming:

- `rules-EN.md`
- `rules-UC.md`
- `rules-BR.md`
- `rules-CS.md`
- `rules-FN.md`
- `rules-API.md`
- `rules-ACL.md`
- `rules-QUERY.md`
- `rules-JOB.md`
- `rules-ES.md`
- `rules-MSG.md`
- `rules-ARCH.md`

and

- `template-EN.md`
- `template-UC.md`
- `template-BR.md`
- `template-CS.md`
- `template-FN.md`
- `template-API.md`
- `template-ACL.md`
- `template-QUERY.md`
- `template-JOB.md`
- `template-ES.md`
- `template-MSG.md`
- `template-ARCH.md`

If naming drifts, treat that as a local tooling defect to be surfaced.

---

## Safe-Use Rules for Agents

Agents using local tooling must follow these rules:

1. resolve the canonical layer first,
2. read only the exact matching local files,
3. preserve uncertainty when evidence is weak,
4. respect layer restrictions,
5. stop when conflict or missing guidance matters,
6. never silently convert local authoring help into repository truth.

For `docs/roles/issues/**`, the normal split is:

- `CanonicalLayerResolver`  
  decides the target layer

- `ToolingRuleResolver`  
  reads the exact `toolingDocs/rules-<LAYER>.md`

- `ToolingTemplateResolver`  
  reads the exact `toolingTemplates/template-<LAYER>.md`

- `DocumentationAmendmentAuthor`  
  uses those outputs to author the amendment safely

This separation helps preserve minimal sufficient routing and prevents “one agent does everything” drift.

---

## Special Note for CS Work

When the resolved layer is `CS`, local tooling must be interpreted carefully.

`CS` work is FE-first and evidence-sensitive.
If FE evidence and older analytical aids differ:
- FE evidence stays primary,
- the mismatch must remain visible,
- and the result should be expressed as observed fact, working assumption, open question, inconsistency, or note from the last analysis run.

Local tooling may help structure the artifact.
It must not be used to overstate backend truth.

---

## Stop Conditions

Stop or block local-tooling-assisted work when:
- canonical layer is unresolved,
- the exact local file cannot be identified,
- the local file conflicts with higher governance or canonical truth,
- authoring would require guessing beyond evidence,
- multiple local files are being read without a bounded reason,
- the operator is trying to use local tooling as an authority shortcut.

Blocked is a valid control state.

---

## Maintenance Expectations

Because these folders are local-only and may not be versioned with the repository:

- keep naming stable,
- keep contents small and specific,
- avoid adding broad notes unrelated to layer authoring,
- do not turn them into a second governance system,
- update them deliberately when repository expectations change.

If repository governance and local tooling drift apart, repository governance wins.

---

## Recommended Minimal Folder Shape

```text
toolingDocs/
  rules-ACL.md
  rules-API.md
  rules-ARCH.md
  rules-BR.md
  rules-CS.md
  rules-EN.md
  rules-ES.md
  rules-FN.md
  rules-JOB.md
  rules-MSG.md
  rules-QUERY.md
  rules-UC.md

toolingTemplates/
  template-ACL.md
  template-API.md
  template-ARCH.md
  template-BR.md
  template-CS.md
  template-EN.md
  template-ES.md
  template-FN.md
  template-JOB.md
  template-MSG.md
  template-QUERY.md
  template-UC.md
```

Optional extra folders may exist, but agents should ignore them unless explicitly allowed by a higher artifact.

---

## Short Operator Reminder

Use local tooling like this:

- pick the issue/comment,
- resolve the target layer,
- read only the exact rules/template for that layer,
- write the amendment,
- then decide whether Mode B handoff is justified.

Do not start by browsing all local helper files.
