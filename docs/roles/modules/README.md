# `agents/modules/**` — Mode M Roles

Roles authored here are invoked by **Mode M** (module orchestration) and are responsible for:

- module declaration (Gate M0),
- **module-scope baseline** — terminology refinements, source authority, module-scope conflicts (Gate M1a — absorbed from pre-v2.0.0 Mode A module-level scope),
- module framing (Gate M1b),
- module architecture and slice map (Gate M3),
- module-release readiness (Gate M4).

## Roles in this folder

| Role | Owner gate | Purpose |
|---|---|---|
| [`ModuleFramer`](ModuleFramer.md) | M0, M1b | Drives module declaration and framing |
| [`ModuleCorpusCurator`](ModuleCorpusCurator.md) | M1a | Module-scope corpus subset reading (v2.0.0 successor to legacy `agents/onboarding/CorpusCurator`) |
| [`ModuleTerminologyResolver`](ModuleTerminologyResolver.md) | M1a | Module-scope terminology refinements on top of program-wide glossary |
| [`ModuleConflictMapper`](ModuleConflictMapper.md) | M1a | Module-scope canonical conflict mapping |
| [`ModulePlanAuthor`](ModulePlanAuthor.md) | M3 (architecture) | Authors `module-plan.md` |
| [`SliceMapAuthor`](SliceMapAuthor.md) | M3 (slice map) | Authors `slice-map.md` with prerequisites |
| [`ModuleStagingVerifier`](ModuleStagingVerifier.md) | M4 | Verifies staging readiness |
| [`ModuleRiskAuditor`](ModuleRiskAuditor.md) | M1, M3, M4 (cross-cutting) | Audits `module-risks.md` |
