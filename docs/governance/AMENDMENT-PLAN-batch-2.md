# Amendment Plan — Batch 2: Canonical Truth Restructure & Mode A Elimination

**Status**: ✅ Completed — Batch 2 applied 2026-05-19
**Scope**: Major structural rewrite. Repositions `_ar/` as canonical authored truth (flat BA/UX). Eliminates Mode A. Absorbs Mode A duties into Mode P (program baseline) and Mode M (module baseline). Establishes slice-manifest pattern, numbering registry, per-slice working folders.
**Method**: Direct editing (Cesta A) — framework amendment, no feature branch
**Version bump**: constitution v1.0.0 → **v2.0.0** (major — Mode A elimination + tier redefinition)
**Predecessor**: Batch 1 (✅ Completed 2026-05-16)
**Supersedes**: Originally-planned Batch 2 scope (governance docs cleanup) — expanded into this larger rewrite
**Blocks**: Batch 3 (slice-level scaffolding templates, now depending on slice-manifest schema), Batch 4 (UX rules + templates, now landing into `_ar/UX/`), Batch 5 (agent roles)

---

## 1. Cíl Batch 2

Vyřešit nedořešený konflikt z Batch 1 mezi `_ar/` (Colter source corpus) a novou tří-vrstvou strukturou (`docs/program/` + `specs/<module>/`). Konkrétně:

1. **`_ar/` se stává kanonickou authored pravdou.** Flat per layer (`_ar/BA/EN/`, `_ar/UX/WIRE/`, atd.), žádná per-module fragmentace authored dokumentace.
2. **`specs/<module>/` se zužuje** na orchestrational metadata (`module-brief`, `module-plan`, `slice-map`, `module-risks`) + slice delivery + per-slice working drafts.
3. **`docs/program/`** drží program-level "system" artefakty (`project-brief`, `architecture-overview`, `module-map`) + governance docs.
4. **Mode A se eliminuje.** Repo-level baseline činnosti přechází do Mode P. Module-level baseline činnosti přechází do Mode M Gate M1a.
5. **Slice manifest pattern.** `spec.md` v každém slice deklaruje, které `_ar/` dokumenty slice mění nebo přidává. Mode B Gate B0 + reviewers tento manifest verifikují.
6. **Numbering registry.** Centrální registry soubor per layer (`_ar/BA/UC/_REGISTRY.md`, atd.) tracuje zabraná čísla pro UCxxxx, ENxxxx, atd.
7. **Per-slice working drafts.** `specs/<module>/slices/<slice>/spec/` jako volitelná podsložka pro raw workshop notes, research, drafts vázané na daný slice.

Po landingu Batch 2 bude aparát:
- mít single source of truth pro authored canonical docs (`_ar/`),
- mít 4 módy (P/M/B/C) místo 5 (P/A/M/B/C),
- umožňovat Mode B autorovat `_ar/` přes slice manifest,
- mít čistou separaci mezi authored (`_ar/`) / orchestrational (`specs/`) / program-system (`docs/program/`) / derived governance (`docs/governance/`).

---

## 2. Architektonický cílový stav

### 2.1 Repository struktura po Batch 2

```
_ar/                                    ← KANONICKÁ AUTHORED PRAVDA
├── BA/                                 ← business analysis layer
│   ├── EN/
│   │   ├── _REGISTRY.md                ← central numbering registry
│   │   ├── EN0001-User.md
│   │   └── ...
│   ├── UC/, BR/, ARCH/, FN/
│   ├── ES/, JOB/, QUERY/
│   ├── ACL/, API/, CS/, MSG/
│   └── (každá podsložka má _REGISTRY.md)
└── UX/                                 ← user experience layer
    ├── IA/
    │   ├── _REGISTRY.md
    │   └── IA-pipeliner.md             ← project-level IA
    ├── WIRE/
    ├── COMP/
    └── COPY/

specs/                                  ← PER-MODULE ORCHESTRATION + DELIVERY
├── core/
│   ├── module-brief.md                 ← module orchestration metadata
│   ├── module-plan.md
│   ├── slice-map.md
│   ├── module-risks.md
│   ├── module-staging-readiness.md     ← (before module release)
│   └── slices/
│       ├── phase0-01-auth-foundation/
│       │   ├── spec.md                 ← SLICE MANIFEST (touches _ar/...)
│       │   ├── plan.md
│       │   ├── tasks.md
│       │   ├── qa-checklist.md
│       │   ├── runtime-notes.md
│       │   ├── review.md
│       │   ├── handoff.md
│       │   └── spec/                   ← (optional) working drafts pro slice
│       │       ├── workshop-2026-02-03.md
│       │       └── stakeholder-feedback.md
│       └── phase0-02-...
├── payments/, pipelines/...

docs/
├── program/                            ← PROGRAM-LEVEL SYSTEM ARTIFACTS
│   ├── project-brief.md
│   ├── architecture-overview.md
│   ├── module-map.md
│   ├── implementation-streams.md       ← (optional)
│   ├── re-frame-authorization.md       ← (when Mode P re-run)
│   └── spec/                           ← (?) program-level working drafts — viz §6.3
└── governance/                         ← DERIVED GOVERNANCE
    ├── guardrails.md
    ├── impact-classes.md
    ├── trigger-matrix.md
    ├── definition-of-done.md
    ├── mode-p.md
    ├── mode-m.md
    ├── mode-c.md
    ├── local-tooling-contract.md
    └── (AMENDMENT-PLAN-batch-*.md / archive)

agents/                                 ← AGENT ROLES (cleanup po Mode A elimination)
├── core/                               ← cross-mode delivery roles (keep)
├── program/                            ← NEW — Mode P + repo baseline absorbed roles
│   ├── ProgramBootstrapper.md
│   ├── ArchitectureOverviewAuthor.md
│   ├── ModuleMapAuthor.md
│   ├── ImplementationStreamsAuthor.md
│   ├── ProgramTerminologyResolver.md   ← was agents/onboarding/TerminologyResolver
│   ├── ProgramCorpusCurator.md         ← was agents/onboarding/CorpusCurator
│   └── ProgramConflictMapper.md        ← was agents/onboarding/ConflictMapper
├── modules/                            ← NEW — Mode M roles
│   ├── ModuleFramer.md
│   ├── ModulePlanAuthor.md
│   ├── SliceMapAuthor.md
│   ├── ModuleStagingVerifier.md
│   ├── ModuleRiskAuditor.md
│   ├── ModuleTerminologyResolver.md    ← was agents/onboarding/* with module scope
│   └── ModuleConflictMapper.md
├── ux/                                 ← NEW — Mode M UX roles (rules in Batch 4)
│   ├── IAAuthor.md
│   ├── WireframeAuthor.md
│   ├── ComponentSpecAuthor.md
│   └── CopySpecAuthor.md
├── issues/                             ← Mode C (keep, minor updates)
├── optional/                           ← (keep)
└── onboarding/                         ← DELETED (folder removed)

toolingDocs/, toolingTemplates/         ← (unchanged in Batch 2; Batch 4 přidá UX)

CLAUDE.md                               ← amended
.specify/memory/constitution.md         ← amended (v2.0.0)
```

### 2.2 Mode mapping po Batch 2

| Mode | Status | Scope after Batch 2 |
|---|---|---|
| **Mode P** | extended | program bootstrap + program-wide baseline (terminologie, source authority, repo-wide conflicts) — absorbuje starou Mode A repo-level scope |
| **Mode A** | ❌ eliminated | (functions split into Mode P + Mode M Gate M1a) |
| **Mode M** | extended | module orchestration + module-level baseline (module-scope terminologie, source authority, conflicts) + UX framing + slice map |
| **Mode B** | extended | slice delivery + **may author `_ar/` per slice manifest** (new authority) |
| **Mode C** | minor update | comment intake + amendment into `_ar/` (current behavior generalized — was "amendment to canonical doc layer", now explicitly "amendment into `_ar/`") |

---

## 3. Soubory dotčené Batch 2

### 3.1 Major amend (rewrite or substantial change)

- `.specify/memory/constitution.md` — major version bump, §5 (Mode A removal), §6 (workflow), §9 (artifact law), §17 (DoD), §21 (downstream)
- `CLAUDE.md` — § Authority, § Operating Modes, § Read Policy, § Source Corpus, § Workflow, § Hard Stops, § Minimum Artifacts, § Subagent Policy, § Git Workflow
- `docs/governance/mode-m.md` — Gate M1a expanded (absorbs Mode A module-level scope), Gate M2/M3 reference `_ar/UX/` instead of `specs/<module>/ux/`
- `docs/governance/mode-p.md` — Gate P0/P1 expanded (absorb Mode A repo-level scope), new Gate P-UX inserted for project-level IA (per §4.10 of Batch 4 plan, now consolidated here)

### 3.2 Minor amend

- `docs/governance/mode-c.md` — Mode C amendments now target `_ar/` explicitly (current behavior, just clearer language)
- `docs/governance/trigger-matrix.md` — Mode A rows removed; Mode P/M routing expanded
- `docs/governance/impact-classes.md` — Mode A references removed; tier definitions clarified for new `_ar/`
- `docs/governance/definition-of-done.md` — Mode A DoD removed; program/module/slice DoD detailed per new structure
- `docs/governance/guardrails.md` — Mode A guardrails removed; new `_ar/` authoring guardrails added

### 3.3 New files

- `_ar/BA/<each-layer>/_REGISTRY.md` × 12 (EN, UC, BR, ARCH, FN, ES, JOB, QUERY, ACL, API, CS, MSG)
- `_ar/UX/<each-layer>/_REGISTRY.md` × 4 (IA, WIRE, COMP, COPY)
- `.specify/templates/slice-manifest-template.md` — slice spec template with `touches:` field schema
- `agents/program/*.md` × 7 (new program-level roles)
- `agents/modules/*.md` × 7 (new module-level roles)
- `agents/ux/*.md` × 4 (new UX roles — bodies authored in Batch 5, just registered in Batch 2)

### 3.4 Deleted / renamed

- `agents/onboarding/` — folder deleted (4 roles migrated to `agents/program/` or `agents/modules/`)
- `docs/baseline/` — folder convention reviewed (was derived from `_ar/` in old Mode A; in new model, `_ar/` IS the baseline — see §7.5)
- Constitution § 5.1 Mode A section — removed entirely
- CLAUDE.md § Source Corpus — substantially rewritten (no longer "input documentation", now "canonical authored docs")

---

## 4. Detailní změny v `.specify/memory/constitution.md`

### 4.1 Header — major version bump

```
**Version**: 2.0.0
**Status**: Stable
```

Rationale: Mode A elimination + tier redefinition + `_ar/` semantic change are structural breaking changes — major bump per semver.

### 4.2 § 2 Authority — update priority order

Remove `mode-c.md` (when Mode C is active) — wait, keep that. Remove Mode A references. Update:

```
1. constitution.md
2. guardrails.md
3. impact-classes.md
4. trigger-matrix.md
5. definition-of-done.md
6. mode-c.md (when Mode C is active)
7. mode-m.md (when Mode M is active)
8. mode-p.md (when Mode P is active)
9. local-tooling-contract.md (when relevant)
10. program-level artifacts (docs/program/*)
11. canonical authored documentation (_ar/**)            ← NEW priority level
12. module-level orchestration (specs/<module>/{module-brief,module-plan,slice-map,…}.md)
13. slice-level artifacts (specs/<module>/slices/<slice>/*)
14. agent-specific instructions
```

Note: `_ar/**` is now AUTHORITY layer, not source corpus. This is the core semantic shift.

### 4.3 § 5 Operating modes — DELETE Mode A section, expand Mode P + Mode M

#### 4.3.1 Delete § 5.1 Mode A entirely

Replace with note:

```
### 5.1 Mode A — Deprecated (v2.0.0)

Mode A is no longer part of this framework. Its repository-level baseline
responsibilities are absorbed into Mode P (program-wide baseline,
terminology, source authority). Its module-level baseline responsibilities
are absorbed into Mode M Gate M1a (module-scope baseline within a single
module).

Pre-v2.0.0 artifacts authored under Mode A remain valid; reading them is
unaffected by Mode A's removal.
```

#### 4.3.2 Expand § 5.0 Mode P

Add to "Mode P may":
- establish program-wide terminology baseline (was Mode A)
- establish program-wide source authority classification (was Mode A)
- map program-wide canonical layer conflicts (was Mode A)
- author project-level IA in `_ar/UX/IA/IA-<project>.md`

#### 4.3.3 Expand § 5.4 Mode M

Add to "Mode M may":
- establish module-scope baseline (terminology refinements, module conflicts) per Gate M1a
- author canonical authored docs in `_ar/BA/*` and `_ar/UX/*` for the module scope
- (clarify) `specs/<module>/` contains orchestrational metadata only — canonical authored content lives in `_ar/`

### 4.4 § 6 Workflow law — remove Mode A, expand Mode B authority

#### 4.4.1 Remove § 6.x Mode A workflow

#### 4.4.2 Expand § 6.1 Mode B sequence

Add as step 4.5 (between specify and clarify):

```
4.5. slice manifest review (B-M) — verify that spec.md declares all
     `_ar/**` docs that this slice will create, update, or reference.
     Manifest format: `touches:` block in spec.md frontmatter listing
     doc_ids and action (create | update | reference).
```

Add to "Implementation" step note:

```
Implementation in Mode B may author or amend canonical authored docs in
`_ar/**` if and only if those docs are declared in the slice manifest
(`touches:` block in spec.md). Undeclared changes to `_ar/**` are
prohibited and must be raised via Mode C as a separate amendment.
```

### 4.5 § 9 Artifact law — rewrite for new tier model

```
Artifact law applies at three tiers + one authored layer:

**Program tier** (Mode P) — `docs/program/`:
- project-brief.md
- architecture-overview.md
- module-map.md
- implementation-streams.md (optional)

**Authored canonical layer** (Mode P / Mode M / Mode B per authority) — `_ar/`:
- _ar/BA/<layer>/<doc>.md for analytical canonical content
- _ar/UX/<layer>/<doc>.md for UX canonical content
- _ar/<...>/<layer>/_REGISTRY.md for numbering registry

**Module tier** (Mode M) — `specs/<module>/`:
- module-brief.md
- module-plan.md
- slice-map.md
- module-risks.md
- module-staging-readiness.md (before module release)

**Slice tier** (Mode B) — `specs/<module>/slices/<slice>/`:
- spec.md (includes slice manifest `touches:` block)
- plan.md
- tasks.md
- qa-checklist.md
- runtime-notes.md
- review.md
- handoff.md (compact orchestration summary)
- spec/ (optional working drafts subfolder — workshop notes, research, etc.)
```

### 4.6 § 17 Constitutional definition of done — update DoD per tier

Add to § 17.0 Slice-level DoD:

```
12. slice manifest (`touches:` block in spec.md) is complete and accurate
13. all _ar/ changes declared in manifest are reviewed in review.md
```

Update § 17.2 Module-definition done:

```
1. module-brief.md defines scope, boundaries, dependencies
2. module-level baseline (Gate M1a) is complete: module-scope terminology
   stabilized, source authority verified, module conflicts resolved
3. minimum analytical canonical docs exist in _ar/BA/* for the module's
   scope (EN, UC, BR as relevant)
4. IA exists in _ar/UX/IA/ (project-level — created in Mode P)
5. WIRE for in-scope screens exists in _ar/UX/WIRE/
6. module-plan.md and slice-map.md exist
7. module-risks.md records known risks and open dependencies
8. each planned slice has explicit slice-readiness prerequisites in slice-map
```

Add new § 17.5 `_ar/` authoring integrity:

```
A change to any `_ar/**` document is well-formed when:
1. originating mode has authority to author at that layer (Mode P for
   program baseline + IA, Mode M for module-scope, Mode B per slice manifest)
2. the change is declared in either:
   - module-plan.md or module-brief.md (Mode M scope), or
   - slice manifest `touches:` block in spec.md (Mode B scope), or
   - source-amendment.md (Mode C scope)
3. _REGISTRY.md is updated when new doc_ids are added
4. cross-references to other _ar/ docs remain valid (no dangling refs)
```

### 4.7 § 21 Downstream artifacts — refresh list

Remove Mode A references. Add:
```
- mode-p.md, mode-m.md, mode-c.md (governance per active mode)
- local-tooling-contract.md
- agents/program/**, agents/modules/**, agents/ux/**
- _ar/<layer>/_REGISTRY.md per layer
- .specify/templates/slice-manifest-template.md
```

---

## 5. Detailní změny v `CLAUDE.md`

### 5.1 § Authority — sync with constitution § 2

Same 14-layer hierarchy as §4.2 above.

### 5.2 § Operating Modes — remove Mode A, expand Mode P + Mode M

Delete Mode A section. Expand Mode P and Mode M descriptions per §4.3.

### 5.3 § Read Policy — major revision

**Replace § Source Corpus entirely.** New version:

```
## Canonical Authored Documentation

`_ar/**` is the canonical authored documentation library for the project.

Rules:
- Treat `_ar/**` as canonical truth, not raw input.
- Organized flat by layer: `_ar/BA/<layer>/<doc>.md` and `_ar/UX/<layer>/<doc>.md`.
- No per-module fragmentation of canonical docs — module association is
  declared in document frontmatter (`modules:` field) and tracked via
  module-level cross-references (slice-map, module-plan).
- Authority to author depends on mode:
  - Mode P: program-wide baseline + project-level IA
  - Mode M: module-scope analytical and UX docs
  - Mode B: slice-scoped amendments declared in slice manifest (`touches:`)
  - Mode C: amendments via source-amendment.md
- Each layer folder has `_REGISTRY.md` tracking reserved doc_ids.
- Cross-references between `_ar/` docs use `doc_id` (e.g. `UC0014`,
  `EN0001`) and must remain valid (no dangling references at module-DoD
  or slice-DoD time).

`docs/program/baseline/` is no longer used (was derived artifact from
pre-v2.0.0 Mode A; superseded by direct `_ar/` authoring).
```

### 5.4 § Workflow — update Mode B sequence

Add slice manifest review step per §4.4.2.

### 5.5 § Canonical Documentation Layer Rule — clarify path conventions

After current layer list, add:

```
Path conventions for canonical authored docs:
- `_ar/BA/EN/<doc_id>-<name>.md` for entities
- `_ar/BA/UC/<doc_id>-<name>.md` for use cases
- `_ar/BA/BR/<doc_id>-<name>.md` for business rules
- ... (same for all BA layers)
- `_ar/UX/IA/<doc_id>-<name>.md` for IA (typically one project-level doc)
- `_ar/UX/WIRE/<doc_id>-<name>.md` for wireframes
- `_ar/UX/COMP/<doc_id>-<name>.md` for components
- `_ar/UX/COPY/<doc_id>-<name>.md` for copy docs

Each layer folder has `_REGISTRY.md` tracking reserved doc_ids.
```

### 5.6 § Hard Stops — update

Remove Mode A hard stops. Add:
- Mode B implementation cannot proceed without slice manifest verification
- `_ar/` change without declaration in slice manifest, module-plan, or source-amendment is prohibited
- new `_ar/` doc_id without `_REGISTRY.md` update is prohibited

### 5.7 § Minimum Artifacts — restructure per new tier model

Replace existing sections with structure from §4.5 above.

### 5.8 § Subagent Policy — rename onboarding subagents, add UX

Update subagent table:
- Remove any references to "Mode A subagents"
- Add `program-baseline-verifier` (model haiku, used in Mode P Gate P1)
- Add `module-baseline-verifier` (model haiku, used in Mode M Gate M1a)
- Existing `slice-readiness-verifier` extended to check slice manifest validity
- Existing `module-orchestrator` rewritten to reflect `_ar/` authoring authority

### 5.9 § Git Workflow — no changes needed

Branch naming, commit conventions stay. Remote URL is current (per recent edit).

### 5.10 Remove "Local Authoring Support" warning — keep as is

`toolingDocs/` and `toolingTemplates/` semantics unchanged.

---

## 6. New conventions established by Batch 2

### 6.1 Slice manifest pattern

`spec.md` for every slice MUST contain a `touches:` block in frontmatter:

```yaml
---
slice_id: phase0-01-auth-foundation
module: core
acceptance_criterion: User can log in with email + password and is redirected to /dashboard
touches:
  create:
    - _ar/BA/EN/EN0014-Session.md
    - _ar/UX/WIRE/WIRE0001-LoginScreen.md
  update:
    - _ar/BA/EN/EN0001-User.md       # add `email_verified` attribute
    - _ar/BA/UC/UC0001-Login.md      # add email verification step
  reference:
    - _ar/BA/BR/BR0003-PasswordPolicy.md
    - _ar/UX/IA/IA-pipeliner.md
---
```

**Verification:**
- Mode B Gate B0 (slice-readiness) verifies that `create` docs don't yet exist, `update` docs exist, `reference` docs exist.
- `review.md` must address each `create` and `update` entry — what was added/changed and why.
- `_REGISTRY.md` for each affected layer is updated atomically with the slice commit.

### 6.2 Numbering registry pattern

Each `_ar/<tier>/<layer>/` folder has `_REGISTRY.md`:

```markdown
# UC Registry

| ID | Title | Status | Owner mode | Created |
|---|---|---|---|---|
| UC0001 | Login | canonical | Mode M (core) | 2026-05-20 |
| UC0002 | Logout | canonical | Mode M (core) | 2026-05-20 |
| UC0003 | Password reset | draft | Mode B (slice phase0-04) | 2026-05-25 |
| UC0014 | Checkout | reserved | Mode M (payments) | 2026-05-21 |
```

**Conflict resolution:**
- Numbers are reserved by adding a row with status `reserved`.
- PR adding a number that conflicts: git merge conflict on `_REGISTRY.md`, the second PR must pick a new number.
- Status transitions: `reserved` → `draft` → `canonical` → `deprecated`.

### 6.3 Per-slice working drafts

Each slice MAY have `specs/<module>/slices/<slice>/spec/` subfolder for:
- workshop notes specific to the slice
- stakeholder feedback recordings
- research summaries
- drafts of `_ar/` docs before canonicalization

**Rules:**
- `spec/` content is not authoritative — only `_ar/**` and the slice's canonical artifacts (spec.md, plan.md, etc.) are.
- `spec/` may be deleted at slice merge time or kept for traceability per team policy.
- `spec/` is never read by Mode B/C reviewers for verdict purposes.

**Program-level and module-level working drafts:**
- Program-level workshops: `docs/program/spec/` (analogous folder).
- Module-level workshops: `specs/<module>/spec/` (folder at module root, parallel to `slices/`).
- ⬜ **Operator confirmation needed:** Are program-level and module-level `spec/` folders in Batch 2 scope, or deferred?

### 6.4 Mode B authority over `_ar/`

Per §4.4.2:
- Mode B MAY author or amend `_ar/**` docs.
- Each such change MUST be declared in slice manifest (`touches:` block).
- Review (`review.md`) addresses each declared change individually.
- Unrelated `_ar/` changes within a Mode B slice are prohibited (scope rule).
- New `_ar/` docs require `_REGISTRY.md` update in same commit.

---

## 7. Operational decisions still open

These decisions are TBD before §11 sequence can run.

### 7.1 Slice manifest `touches:` location

- ⬜ A: frontmatter YAML block (proposed in §6.1)
- ⬜ B: body section `## Touches` with bullet list
- ⬜ C: separate file `manifest.md` alongside spec.md

**Recommendation: A** — frontmatter is parseable for verifier subagent, doesn't pollute human-readable body.

### 7.2 _REGISTRY.md format

- ⬜ A: table (per §6.2)
- ⬜ B: YAML list
- ⬜ C: line-delimited with structured comments

**Recommendation: A** — readable in PR diffs, scannable in editor.

### 7.3 `modules:` frontmatter field on `_ar/` docs

Each `_ar/` doc has frontmatter declaring module association(s):

```yaml
modules: [core, payments]  # this entity is referenced from these modules
```

- ⬜ A: required for every `_ar/` doc
- ⬜ B: required for docs that are clearly module-bound; optional for project-wide (e.g. shared EN-User)
- ⬜ C: optional always, association tracked only via cross-references in slice-maps

**Recommendation: A** — explicit module association enables slice-readiness verifier to find module-relevant docs efficiently. Cost: another frontmatter field to maintain.

### 7.4 Mode B authority limits

If Mode B can author `_ar/`, can it author:
- new doc_ids in canonical layers? — proposed YES (declared in manifest as `create:`)
- substantial rewrites of existing canonical docs? — ⬜ YES / NO / scope-class-dependent
- new canonical layer files (e.g. first ACL doc for a module)? — ⬜ YES / NO

**Recommendation:** YES for new doc_ids and updates; NO for "first doc in a layer for a module" (that's Mode M Gate M1a territory — a new layer presence is module-level decision, not slice-level).

### 7.5 `docs/baseline/` folder fate

Pre-v2.0.0 design had `docs/baseline/` as derived artifacts from `_ar/**` for Mode A repo onboarding.

- ⬜ A: Delete entirely — `_ar/` IS the baseline now, no derived layer needed
- ⬜ B: Keep as derived summary index — auto-generated from `_ar/` for quick scanning
- ⬜ C: Reuse as program-level glossary location

**Recommendation: A** — `_ar/` is authored canonical; derived artifacts don't add value when the source is already canonical and well-organized.

### 7.6 `agents/onboarding/` folder migration

Existing roles:
- `CorpusCurator.md` → `agents/program/ProgramCorpusCurator.md` + `agents/modules/ModuleCorpusCurator.md` (split by scope)
- `TerminologyResolver.md` → similar split
- `ConflictMapper.md` → similar split
- `ArchitectureBaselineMapper.md` → `agents/program/ArchitectureOverviewAuthor.md` (rename, scope program-level)

- ⬜ A: Mechanical split (4 roles → 7 roles, scope-prefixed)
- ⬜ B: Single `BaselineAgent.md` per tier, parameterized by scope
- ⬜ C: Defer to Batch 5 — Batch 2 only deletes `agents/onboarding/`, new roles authored in Batch 5

**Recommendation: C** — Batch 2 is already large; agents/ cleanup is mechanical and can be Batch 5. In meantime, `agents/onboarding/` folder still readable but referenced as deprecated.

---

## 8. Co Batch 2 NEDĚLÁ (explicit out-of-scope)

- ❌ Nevytváří UX rules + templates (Batch 4 — `_ar/UX/` layers IA/WIRE/COMP/COPY have only path registration, authoring rules in toolingDocs/ come in Batch 4)
- ❌ Nevytváří actual `_ar/<layer>/_REGISTRY.md` content with reserved IDs (Batch 2 creates empty registry skeletons; reservation happens as docs are authored)
- ❌ Nevytváří `.specify/templates/spec-template.md` slice manifest variant (Batch 3 — slice scaffolding templates)
- ❌ Nemigruje `agents/onboarding/` (Batch 5 — agent roles cleanup)
- ❌ Nevytváří `agents/program/`, `agents/modules/`, `agents/ux/` role bodies (Batch 5 — only folder registration here)
- ❌ Nevytváří `docs/program/` content (Batch 6 — actual program-level artifacts when project starts Mode P)
- ❌ Neregeneruje `compile.md` (Batch 7)
- ❌ Žádný produkční kód, žádný feature branch

---

## 9. Migration considerations

Repo is currently empty of project content — only governance + framework artifacts exist. Migration is trivial:

- No `_ar/<layer>/` docs exist yet → empty folders + `_REGISTRY.md` skeletons created fresh
- No `specs/<module>/` modules declared yet → no migration needed
- No `docs/program/` content yet → no migration needed
- `_ar/` folder is empty currently → can be restructured without preserving content
- `agents/onboarding/` has 4 files → preserve content, decide migration in Batch 5

**No data loss risk.** All amendments are to framework structure, not to live project content.

---

## 10. Finalizovaná rozhodnutí

| Rozhodnutí | Volba | Status |
|---|---|---|
| Mode A elimination | YES — Mode P absorbs repo-level, Mode M Gate M1a absorbs module-level | ✅ 2026-05-19 |
| `_ar/` semantics | canonical authored truth, flat per layer (BA/UX) | ✅ 2026-05-19 |
| `_shared/` namespace | not introduced (no per-component module ownership signal at folder level) | ✅ 2026-05-19 |
| project-level IA placement | `_ar/UX/IA/IA-<project>.md` | ✅ 2026-05-19 |
| Mode B authority over `_ar/` | YES (scenario B) — slice manifest declares all touches | ✅ 2026-05-19 |
| Numbering scheme | numeric IDs with central `_REGISTRY.md` per layer (option A) | ✅ 2026-05-19 |
| Per-slice working drafts | YES — `specs/<module>/slices/<slice>/spec/` (option A) | ✅ 2026-05-19 |
| Constitution version bump | v1.0.0 → v2.0.0 (major) | ✅ 2026-05-19 |
| Approach | Path X — large rewrite now, Batch 4 (UX rules) follows | ✅ 2026-05-19 |
| §7.1 slice manifest location | A — frontmatter YAML | ✅ 2026-05-19 |
| §7.2 _REGISTRY format | A — markdown table | ✅ 2026-05-19 |
| §7.3 `modules:` field requirement | A — required on every `_ar/` doc | ✅ 2026-05-19 |
| §7.4 Mode B authoring limits | YES for create/update, NO for first-layer-doc | ✅ 2026-05-19 |
| §7.5 `docs/baseline/` fate | A — delete | ✅ 2026-05-19 |
| §7.6 agents/onboarding/ migration | C — defer to Batch 5 (only mark deprecated) | ✅ 2026-05-19 |
| §6.3 program/module working drafts | YES — enable both `docs/program/spec/` and `specs/<module>/spec/` (symmetric with per-slice) | ✅ 2026-05-19 |
| Branch / commit policy | direct commit on `main`, no feature branch (framework amendment per Batch 1 precedent) | ✅ 2026-05-19 |

---

## 11. Po schválení rozhodnutí — sequence of work

After operator GO on §7 and §10 pending items, Batch 2 executes in this order:

1. **Constitution rewrite** (`.specify/memory/constitution.md`)
   - version bump, §2 authority, §5 mode removal/expansion, §6 workflow, §9 artifact law, §17 DoD, §21 downstream

2. **Governance docs cleanup**
   - `mode-p.md` — expand Gate P0/P1 absorb Mode A repo-level
   - `mode-m.md` — expand Gate M1a absorb Mode A module-level; clarify `_ar/` authoring
   - `mode-c.md` — minor language update (Mode C amends `_ar/` explicitly)
   - `trigger-matrix.md` — remove Mode A rows
   - `impact-classes.md` — remove Mode A references
   - `definition-of-done.md` — restructure per new tiers
   - `guardrails.md` — `_ar/` authoring guardrails

3. **CLAUDE.md rewrite** — all sections per §5 above

4. **Folder skeleton creation**
   - `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/_REGISTRY.md` (12 files)
   - `_ar/UX/{IA,WIRE,COMP,COPY}/_REGISTRY.md` (4 files)
   - `agents/program/.gitkeep`, `agents/modules/.gitkeep`, `agents/ux/.gitkeep`
   - mark `agents/onboarding/` as deprecated (add `DEPRECATED.md` note)

5. **Slice manifest template** — `.specify/templates/slice-manifest-template.md` (or update `spec-template.md` to include `touches:` frontmatter)

6. **Sanity check**
   - `grep -r "Mode A" docs/governance/ CLAUDE.md .specify/` — only deprecation notes should remain
   - constitution version + status consistent across header and §21
   - all referenced files (`mode-p.md`, `mode-m.md`, ...) exist

7. **Report diff summary** — what changed, line counts, files touched, next Batch suggestion

After Batch 2 lands, the framework is in a coherent v2.0.0 state and Batch 3 (slice scaffolding templates) or Batch 4 (UX rules+templates) can begin.

---

## 12. Quality bar (pre-merge)

Batch 2 is merge-ready when:

1. constitution.md is v2.0.0 with consistent §2/§5/§6/§9/§17/§21 changes
2. No grep hits for "Mode A" in any governance doc except in deprecation notice (§5.1 of constitution)
3. CLAUDE.md § Source Corpus is replaced with § Canonical Authored Documentation
4. All 16 `_REGISTRY.md` skeleton files exist with header + empty table
5. `agents/onboarding/DEPRECATED.md` notice exists pointing to Batch 5
6. `docs/baseline/` is removed (or empty, if folder is preserved)
7. `.specify/templates/` includes slice manifest schema (either standalone or in spec-template.md)
8. No dangling references to deleted artifacts (mode-a.md, agents/onboarding/CorpusCurator.md, etc.)
9. Cross-batch dependencies clear: Batch 4 (UX rules) and Batch 5 (agent roles) are unblocked, Batch 3 (templates) clear path
10. Diff summary reported to operator

---

## 13. After Batch 2

Sequence for subsequent batches:

- **Batch 3** — `.specify/templates/` slice-level scaffolding (incl. spec-template with manifest schema)
- **Batch 4** — UX rules + templates in `toolingDocs/` and `toolingTemplates/` for IA/WIRE/COMP/COPY (now landing into `_ar/UX/`)
- **Batch 5** — agent roles cleanup: split `agents/onboarding/` into `agents/program/` + `agents/modules/`, author `agents/ux/` bodies, register subagents in `.claude/agents/`
- **Batch 6** — `docs/program/` actual content when first Mode P run starts (project bootstrap)
- **Batch 7** — `compile.md` regeneration

Each subsequent batch reads this plan + its own AMENDMENT-PLAN-batch-N.md.

This plan can be archived to `docs/governance/archive/` after Batch 2 lands.
