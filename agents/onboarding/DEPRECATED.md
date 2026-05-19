# `agents/onboarding/` — DEPRECATED in v2.0.0

This folder housed Mode A onboarding roles in pre-v2.0.0 framework. As of constitution v2.0.0 (Batch 2 — Canonical Truth Restructure, 2026-05-19):

- **Mode A is eliminated.**
- Its responsibilities split into:
  - **Program-wide baseline** → `agents/program/Program{Corpus,Terminology,Conflict}*` (Mode P Gate P1)
  - **Module-scope baseline** → `agents/modules/Module{Corpus,Terminology,Conflict}*` (Mode M Gate M1a)

## Migration map

| Legacy role (this folder) | New location (Batch 5) |
|---|---|
| `CorpusCurator` | `agents/program/ProgramCorpusCurator` + `agents/modules/ModuleCorpusCurator` |
| `TerminologyResolver` | `agents/program/ProgramTerminologyResolver` + `agents/modules/ModuleTerminologyResolver` |
| `ConflictMapper` | `agents/program/ProgramConflictMapper` + `agents/modules/ModuleConflictMapper` |
| `ArchitectureBaselineMapper` | `agents/program/ArchitectureOverviewAuthor` (refocused on program-level) |

## Status

Legacy role files in this folder remain readable for historical reference and to ease Batch 5 migration. They are **not invokable** in v2.0.0+ workflows — use the new locations in `agents/program/` and `agents/modules/`.

Folder will be removed in Batch 5 once successor roles are authored.
