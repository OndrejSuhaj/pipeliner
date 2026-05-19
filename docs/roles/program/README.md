# `agents/program/**` — Mode P Roles

Roles authored here are invoked by **Mode P** (program bootstrap) and are responsible for:

- program declaration and re-frame authorization (Gates P-R, P0),
- program-level architecture overview (Gate P1 architecture half),
- **program-wide baseline** — terminology, source authority, conflict mapping (Gate P1 baseline half — absorbed from pre-v2.0.0 Mode A),
- module decomposition (Gate P2),
- implementation streams when parallel delivery is non-trivial (Gate P3).

## Roles in this folder

| Role | Owner gate | Purpose |
|---|---|---|
| [`ProgramBootstrapper`](ProgramBootstrapper.md) | P-R, P0 | Drives operator through program declaration and re-frame authorization |
| [`ArchitectureOverviewAuthor`](ArchitectureOverviewAuthor.md) | P1 (architecture) | Drafts program-level architectural skeleton |
| [`ProgramCorpusCurator`](ProgramCorpusCurator.md) | P1 (baseline) | Source authority classification, corpus shape verification (v2.0.0 successor to legacy `agents/onboarding/CorpusCurator`) |
| [`ProgramTerminologyResolver`](ProgramTerminologyResolver.md) | P1 (baseline) | Program-wide terminology stabilization (v2.0.0 successor to legacy `agents/onboarding/TerminologyResolver`) |
| [`ProgramConflictMapper`](ProgramConflictMapper.md) | P1 (baseline) | Program-wide canonical conflict mapping (v2.0.0 successor to legacy `agents/onboarding/ConflictMapper`) |
| [`ModuleMapAuthor`](ModuleMapAuthor.md) | P2 | Drafts module decomposition with dependencies and integration boundaries |
| [`ImplementationStreamsAuthor`](ImplementationStreamsAuthor.md) | P3 (optional) | Parallel delivery coordination model |
| `IAAuthor` (in [`agents/ux/`](../ux/IAAuthor.md)) | P-UX (optional) | Authors project-level IA in `_ar/UX/IA/IA-<project>.md` |
