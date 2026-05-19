# Amendment Plan — Batch 5: Agent Role Bodies (program, modules, ux)

**Status**: 🟢 Approved 2026-05-19 — proceeds per Batch 2/4 sequencing
**Scope**: Author 19 agent role files in `agents/program/`, `agents/modules/`, `agents/ux/`; delete legacy `agents/onboarding/` folder
**Method**: Direct editing (Cesta A) — framework amendment, no feature branch
**Version bump**: constitution stays v2.0.0
**Predecessor**: Batch 4 — UX rules + templates (✅ commit `bcdfedb`)
**Blocks**: Batch 6 (`docs/program/` actual content — depends on `agents/program/` role bodies for Mode P bootstrap)

---

## 1. Cíl Batch 5

Dodat těla agentních rolí pro 3 nové folders zaregistrované v Batch 2:

- `agents/program/` — Mode P + Gate P1 program-wide baseline (7 rolí)
- `agents/modules/` — Mode M orchestrace + Gate M1a module-scope baseline (8 rolí)
- `agents/ux/` — UX kanonické vrstvy IA/WIRE/COMP/COPY (4 role)

Po dokončení Batch 5:
- Subagenty `program-bootstrap` a `module-orchestrator` mají k dispozici delegovatelné role,
- Mode P / Mode M mohou spustit reálné autorování (program-tier a module-tier artefaktů),
- `agents/onboarding/` je smazán (legacy role nahrazeny scoped variantami).

---

## 2. Soubory dotčené Batch 5

### 2.1 Vytvořit (19 nových rolí)

**`agents/program/` (7 souborů):**
- `ProgramBootstrapper.md` — Gate P-R, P0
- `ArchitectureOverviewAuthor.md` — Gate P1 (architecture half) + program ARCH seeds
- `ProgramCorpusCurator.md` — Gate P1 (baseline half — corpus shape)
- `ProgramTerminologyResolver.md` — Gate P1 (baseline half — terminology)
- `ProgramConflictMapper.md` — Gate P1 (baseline half — conflicts)
- `ModuleMapAuthor.md` — Gate P2
- `ImplementationStreamsAuthor.md` — Gate P3 (optional)

**`agents/modules/` (8 souborů):**
- `ModuleFramer.md` — Gate M0, M1b
- `ModuleCorpusCurator.md` — Gate M1a (module-scope)
- `ModuleTerminologyResolver.md` — Gate M1a (module-scope)
- `ModuleConflictMapper.md` — Gate M1a (module-scope)
- `ModulePlanAuthor.md` — Gate M3 (architecture)
- `SliceMapAuthor.md` — Gate M3 (slice map)
- `ModuleStagingVerifier.md` — Gate M4
- `ModuleRiskAuditor.md` — M1, M3, M4 (cross-cutting)

**`agents/ux/` (4 souborů):**
- `IAAuthor.md` — Mode P Gate P-UX
- `WireframeAuthor.md` — Mode M Gate M2
- `ComponentSpecAuthor.md` — Mode M Gate M3
- `CopySpecAuthor.md` — Mode M Gate M3

### 2.2 Smazat (5 souborů)

- `agents/onboarding/CorpusCurator.md`
- `agents/onboarding/TerminologyResolver.md`
- `agents/onboarding/ConflictMapper.md`
- `agents/onboarding/ArchitectureBaselineMapper.md`
- `agents/onboarding/DEPRECATED.md`

Folder `agents/onboarding/` zůstane prázdný a po commitu zmizí.

### 2.3 Aktualizovat (3 README placeholders)

- `agents/program/README.md` — update z "Folder is currently a placeholder. Role bodies are authored in Batch 5." na seznam autorů
- `agents/modules/README.md` — same
- `agents/ux/README.md` — same

---

## 3. Role file format (per existing convention)

Každá role má strukturu (viz [agents/core/ConstitutionGuard.md](../../agents/core/ConstitutionGuard.md) a [agents/onboarding/CorpusCurator.md](../../agents/onboarding/CorpusCurator.md) jako vzory):

1. **Mission** — 1-2 lines, what the role accomplishes
2. **Use When** — gates/modes where activated
3. **Mode Boundary** — what mode this belongs to and what's out of scope
4. **Entry Conditions** — preconditions before invocation
5. **Read** — required reading order with scope rules
6. **Owns** — primary output artifacts (paths)
7. **May Update** — secondary writes (often "none")
8. **Must** — required behaviors
9. **Must Not** — anti-patterns / forbidden actions
10. **Handoff To** — next roles in sequence
11. **Block If** — stop conditions
12. **Done When** — success criteria
13. **Failure Modes** — anti-patterns to watch for

Target length: 80–120 řádků per role.

---

## 4. Sequence of work

Three stages, commit per stage:

### Stage A — `agents/program/` (7 roles + README update)

Authoring order:
1. `ProgramBootstrapper.md` (kalibrace formátu pro program tier)
2. `ProgramCorpusCurator.md`, `ProgramTerminologyResolver.md`, `ProgramConflictMapper.md` (baseline trio)
3. `ArchitectureOverviewAuthor.md`
4. `ModuleMapAuthor.md`
5. `ImplementationStreamsAuthor.md`
6. Update `agents/program/README.md`

### Stage B — `agents/modules/` (8 roles + README update)

Authoring order:
1. `ModuleFramer.md` (kalibrace pro module tier)
2. `ModuleCorpusCurator.md`, `ModuleTerminologyResolver.md`, `ModuleConflictMapper.md` (baseline trio — module-scope analogs)
3. `ModulePlanAuthor.md`
4. `SliceMapAuthor.md`
5. `ModuleStagingVerifier.md`
6. `ModuleRiskAuditor.md`
7. Update `agents/modules/README.md`

### Stage C — `agents/ux/` (4 roles + README update + onboarding/ deletion)

Authoring order:
1. `IAAuthor.md` (Mode P Gate P-UX)
2. `WireframeAuthor.md`
3. `ComponentSpecAuthor.md`
4. `CopySpecAuthor.md`
5. Update `agents/ux/README.md`
6. Delete `agents/onboarding/*` (5 files)
7. Update CLAUDE.md § Subagent Policy "Keep in `agents/onboarding/**`" note (mark as fully retired)

---

## 5. Co Batch 5 NEDĚLÁ (explicit out-of-scope)

- ❌ Nevytváří `.claude/agents/*` subagent registrace (program-bootstrap.md, module-orchestrator.md, ux-author.md) — to je samostatná infrastruktura mimo `agents/`
- ❌ Nemodifikuje constitution nebo CLAUDE.md (kromě finálního CLAUDE.md cleanup v Stage C)
- ❌ Nevytváří actual `_ar/**` content nebo `docs/program/*` content (Mode P/M activities, Batch 6)
- ❌ Žádný produkční kód, žádný feature branch

---

## 6. Quality bar (per stage)

Stage merge-ready, když:

1. Všechny role files mají všech 13 sekcí (Mission ... Failure Modes)
2. Read scope is bounded (no broad scans declared)
3. Owns paths existují v constitution / CLAUDE.md / mode-*.md
4. Handoff to references existing roles
5. Block If conditions are specific (named missing artifacts, not vague warnings)
6. Done When criteria are verifiable
7. README updated to reflect that roles exist (no longer "placeholder")

---

## 7. Po dokončení Batch 5

Sequence for subsequent work:

- **Batch 6** — `docs/program/` actual content při prvním Mode P běhu (živá data, ne framework amendment)

Tento plán lze přesunout do `docs/governance/archive/` po dokončení.

Status v hlavičce přepsat na `✅ Completed — Batch 5 applied <datum>`.
