# `agents/program/**` — Mode P Roles

Roles authored here are invoked by **Mode P** (program bootstrap) and are responsible for:

- program declaration and re-frame authorization (Gates P-R, P0),
- program-level architecture overview (Gate P1 architecture half),
- **program-wide baseline** — terminology, source authority, conflict mapping (Gate P1 baseline half — absorbed from pre-v2.0.0 Mode A),
- module decomposition (Gate P2),
- implementation streams when parallel delivery is non-trivial (Gate P3).

## Planned roles (authored in Batch 5)

| Role | Owner gate | Purpose |
|---|---|---|
| `ProgramBootstrapper` | P-R, P0 | Drives operator through program declaration and re-frame authorization |
| `ArchitectureOverviewAuthor` | P1 (architecture) | Drafts program-level architectural skeleton |
| `ProgramCorpusCurator` | P1 (baseline) | Source authority classification, corpus shape verification (absorbed from `agents/onboarding/CorpusCurator`) |
| `ProgramTerminologyResolver` | P1 (baseline) | Program-wide terminology stabilization (absorbed from `agents/onboarding/TerminologyResolver`) |
| `ProgramConflictMapper` | P1 (baseline) | Program-wide canonical conflict mapping (absorbed from `agents/onboarding/ConflictMapper`) |
| `ModuleMapAuthor` | P2 | Drafts module decomposition with dependencies and integration boundaries |
| `ImplementationStreamsAuthor` | P3 (optional) | Parallel delivery coordination model |
| `IAAuthor` (in `agents/ux/`) | P-UX (optional) | Authors project-level IA in `_ar/UX/IA/IA-<project>.md` |

Folder is currently a placeholder. Role bodies are authored in Batch 5 of the foundation amendment.
