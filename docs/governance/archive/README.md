# `docs/governance/archive/` — Historical Amendment Plans

This folder contains completed AMENDMENT-PLAN-*.md files for historical traceability. They are not authoritative for current operation — see `docs/governance/` parent folder + `.specify/memory/constitution.md` for current rules.

## Completed amendments

| Plan | Status | Constitution version | Summary |
|---|---|---|---|
| [AMENDMENT-PLAN-batch-1.md](AMENDMENT-PLAN-batch-1.md) | ✅ 2026-05-16 | v0.1.0 → v1.0.0 | Foundation: Mode P + Mode M introduction, 3-tier artifact model, UX layer registration |
| [AMENDMENT-PLAN-batch-2.md](AMENDMENT-PLAN-batch-2.md) | ✅ 2026-05-19 | v1.0.0 → v2.0.0 | Canonical Truth Restructure: Mode A elimination, `_ar/**` as canonical authored truth (flat BA/UX), slice manifest pattern, §17.5 `_ar/` authoring integrity |
| [AMENDMENT-PLAN-batch-4.md](AMENDMENT-PLAN-batch-4.md) | ✅ 2026-05-19 | v2.0.0 | UX canonical layer rules + templates (toolingDocs/rules-{IA,WIRE,COMP,COPY}.md + toolingTemplates/template-{IA,WIRE,COMP,COPY}.md) |
| [AMENDMENT-PLAN-batch-5.md](AMENDMENT-PLAN-batch-5.md) | ✅ 2026-05-19 | v2.0.0 | Agent role bodies in `agents/{program,modules,ux}/`; deletion of legacy `agents/onboarding/` |

## Note on batch numbering

Numbering follows the original [AMENDMENT-PLAN-batch-1.md](AMENDMENT-PLAN-batch-1.md) sequencing. Two "Batch 2" exist in commit history:
- Pre-v2.0.0 "Batch 2" (commit `d8a4950`, governance docs alignment with v1.0.0) — no plan file
- v2.0.0 "Batch 2" — Canonical Truth Restructure (this folder's `AMENDMENT-PLAN-batch-2.md`, commit `40b2864`)

Batch 3 (pre-v2.0.0 templates, commit `8115e5a`) also has no plan file.

For full transition record see `CHANGELOG.md` at repo root.
