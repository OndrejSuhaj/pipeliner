# `agents/modules/**` — Mode M Roles

Roles authored here are invoked by **Mode M** (module orchestration) and are responsible for:

- module declaration (Gate M0),
- **module-scope baseline** — terminology refinements, source authority, module-scope conflicts (Gate M1a — absorbed from pre-v2.0.0 Mode A module-level scope),
- module framing (Gate M1b),
- module architecture and slice map (Gate M3),
- module-release readiness (Gate M4).

## Planned roles (authored in Batch 5)

| Role | Owner gate | Purpose |
|---|---|---|
| `ModuleFramer` | M0, M1b | Drives module declaration and framing |
| `ModuleCorpusCurator` | M1a | Module-scope corpus subset reading (successor to `agents/onboarding/CorpusCurator` with built-in module scope) |
| `ModuleTerminologyResolver` | M1a | Module-scope terminology refinements on top of program-wide glossary |
| `ModuleConflictMapper` | M1a | Module-scope canonical conflict mapping |
| `ModulePlanAuthor` | M3 (architecture) | Authors `module-plan.md` |
| `SliceMapAuthor` | M3 (slice map) | Authors `slice-map.md` with prerequisites |
| `ModuleStagingVerifier` | M4 | Verifies staging readiness |
| `ModuleRiskAuditor` | M1, M3, M4 (cross-cutting) | Audits `module-risks.md` |

Folder is currently a placeholder. Role bodies are authored in Batch 5 of the foundation amendment.
