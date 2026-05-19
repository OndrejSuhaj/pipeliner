# Changelog

Constitution version history and major framework amendments.

For active rules see `.specify/memory/constitution.md` and `docs/governance/`.
For full amendment plans see `docs/governance/archive/`.

## v2.0.0 — Canonical Truth Restructure (2026-05-19)

**Plan:** [AMENDMENT-PLAN-batch-2.md](docs/governance/archive/AMENDMENT-PLAN-batch-2.md)
**Commits:** `40b2864` (canonical truth restructure), `bcdfedb` (Batch 4 UX rules+templates), `f2dae5b`+`57761dd`+`ddc5716` (Batch 5 agent roles)

Structural rewrite of the framework's authority model:

- **Mode A eliminated.** Repository-level baseline duties moved to Mode P Gate P1. Module-level baseline duties moved to Mode M Gate M1a.
- **`_ar/**` redefined** from raw source corpus to canonical authored documentation library, organized flat by layer (`_ar/BA/<layer>/`, `_ar/UX/<layer>/`).
- **Slice manifest pattern** introduced: every slice's `spec.md` declares all `_ar/**` docs the slice creates, updates, or references via a `touches:` block in frontmatter.
- **Mode B granted authority** to author/amend `_ar/**` docs declared in slice manifest.
- **New constitutional rule §17.5** — `_ar/` authoring integrity (atomicity with `_REGISTRY.md`, no dangling cross-references, `modules:` frontmatter accuracy).
- **Gate P-UX** added between Gate P1 and Gate P2 for project-level IA authoring (when project has user-facing surfaces).
- **`docs/baseline/` removed.** `_ar/**` IS the canonical authored truth; no derived baseline layer needed.

### v2.0.0 file structure additions

- `_ar/BA/{EN,UC,BR,ARCH,FN,ES,JOB,QUERY,ACL,API,CS,MSG}/_REGISTRY.md` — 12 BA layer registries
- `_ar/UX/{IA,WIRE,COMP,COPY}/_REGISTRY.md` — 4 UX layer registries
- `docs/roles/program/**` — 7 program-tier roles (incl. ProgramCorpusCurator, ProgramTerminologyResolver, ProgramConflictMapper absorbing legacy onboarding roles at program scope)
- `docs/roles/modules/**` — 8 module-tier roles (incl. ModuleCorpusCurator, ModuleTerminologyResolver, ModuleConflictMapper absorbing legacy onboarding roles at module scope)
- `docs/roles/ux/**` — 4 UX canonical-layer roles (IAAuthor, WireframeAuthor, ComponentSpecAuthor, CopySpecAuthor)
- `toolingDocs/rules-{IA,WIRE,COMP,COPY}.md` + `toolingTemplates/template-{IA,WIRE,COMP,COPY}.md` — UX layer authoring rules and templates
- `.specify/templates/slice-manifest-template.md`

### v2.0.0 removals

- Constitution § 5.1 Mode A section
- `agents/onboarding/` folder (4 legacy roles + DEPRECATED.md)
- `docs/baseline/` convention (was derived from `_ar/**` in pre-v2.0.0)

---

## v1.0.0 — Foundation (2026-05-16)

**Plan:** [AMENDMENT-PLAN-batch-1.md](docs/governance/archive/AMENDMENT-PLAN-batch-1.md)
**Commits:** `8fc30ed` (initial), `d8a4950` (governance amendments), `8115e5a` (templates)

Constitutional foundation establishing operating modes and tier model:

- **Mode P — Program Bootstrap** introduced (program-level, once per project)
- **Mode M — Module Orchestration** introduced (module-level, once per module + once per release)
- **Mode B Gate B0** — slice-readiness check inserted as first step of Mode B sequence
- **3-tier artifact model**: program (`docs/program/*`) / module (`specs/<module>/*`) / slice (`specs/<module>/slices/<slice>/*`)
- **4 new canonical layers registered**: IA, WIRE, COMP, COPY (authoring rules pending — landed in v2.0.0 Batch 4)
- **Configurable module structure** — no hardcoded module names in framework
- **Hard-stop discipline** across all mode transitions
- 27 `.specify/templates/` slice scaffolding templates authored (Batch 3 — note: many require v2.0.0 refresh for slice manifest schema and `_ar/` paths)
