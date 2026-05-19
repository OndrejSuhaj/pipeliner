# Amendment Plan — Batch 1: Constitution & Foundation

**Status**: ✅ Completed — Batch 1 applied 2026-05-16
**Scope**: Constitutional amendment introducing Mode P, Mode M, 3-tier artifact model, UX/FE canonical layer registrations
**Method**: Direct editing (per operator decision — Cesta A)
**Version bump**: v0.1.0 → **v1.0.0** (major — structural change)

---

## 1. Cíl Batch 1

Položit ústavní a session-level základ pro:

- **Mode P** jako nový mód programového bootstrapu (jednorázový, per projekt)
- **Mode M** jako nový mód modulové orchestrace (integruje module baseline ve své Gate M1a)
- **Mode A beze změny** — zůstává čistě repository onboarding (per finální rozhodnutí riziko 1 = c)
- **Mode B s novým Gate B0** — slice-readiness check jako první krok každého slice
- **Mode C beze změny purpose** — jen flag pro Batch 2 (cross-module routing)
- **Tří-vrstvý artifact model**: program-level (Mode P) / module-level (Mode M) / slice-level (Mode B)
- **4 nové kanonické vrstvy**: IA, WIRE, COMP, COPY (jen registrace v ústavě/CLAUDE.md — soubory s rules a templates přijdou v Batch 4)
- **Konfigurovatelnou modulovou strukturu** (žádné hardcoded názvy modulů v aparátu)
- **Hard-stop disciplínu** pro všechny mezi-módové transitions

Čtyři dotčené soubory:

- `.specify/memory/constitution.md` (amendment, major bump)
- `docs/governance/mode-p.md` (nový soubor, ~200 řádků)
- `docs/governance/mode-m.md` (nový soubor, ~500 řádků)
- `CLAUDE.md` (amendment)

---

## 2. Změny v `.specify/memory/constitution.md`

### 2.1 Header — version bump

**Současný stav:**
```
**Version**: 0.1.0
**Status**: Draft
```

**Změna:**
```
**Version**: 1.0.0
**Status**: Stable
```

**Důvod:** Mode P + Mode M zavedení a 3-tier artifact model jsou structural change. Verze Stable signalizuje, že ústava je teď použitelná pro produkční řízení projektů, ne jen draft.

### 2.2 § 2 Authority — rozšířit priority order

**Současný stav (řádky 39–46):**
```
1. constitution.md
2. guardrails.md
3. impact-classes.md
4. trigger-matrix.md
5. feature artifacts (spec.md, plan.md, tasks.md, review.md, runtime-notes.md)
6. agent-specific instructions
```

**Změna:** Rozšířit na 13 vrstev.

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
11. module-level artifacts (specs/<module>/{module-brief,module-plan,slice-map,…}.md)
12. slice-level feature artifacts (spec.md, plan.md, tasks.md, review.md, runtime-notes.md)
13. agent-specific instructions
```

**Důvod:** Constitution dnes neuznává governance docs jako svoji vlastní downstream priority. Při této příležitosti narovnat + přidat program/module vrstvy + Mode P/M soubory.

### 2.3 § 5 Operating modes — přidat Mode P (před Mode A) a Mode M (po Mode C)

#### 2.3.1 Nová sekce § 5.0 Mode P — Program Bootstrap

**Vložit před stávající § 5.1 Mode A (před řádek 138):**

```
### 5.0 Mode P — Program Bootstrap

Used when:

* a new project is being established within this framework,
* program-level scope, architectural overview, and module decomposition
  must be declared before any module-level work begins,
* re-framing of an existing program is required (adding a new module,
  splitting a module, structural change).

Goal:

* declare the program scope and business purpose,
* establish program-level architectural assumptions and constraints,
* decompose the program into bounded implementation streams (modules),
* declare cross-module dependencies and integration boundaries,
* and produce the program-level artifacts that all subsequent modes depend on.

Mode P is a governed program-level bootstrap mode.

It is not:
* a repository onboarding mode (that is Mode A),
* a module orchestration mode (that is Mode M),
* an implementation mode,
* a comment intake mode (that is Mode C),
* a continuous re-planning mode.

Mode P may:
* create program-level artifacts in `docs/program/`,
* declare modules in `docs/program/module-map.md`,
* set program-level architectural assumptions,
* be re-run when structural program change is required.

Mode P must not:
* author module-level artifacts (that is Mode M),
* author repository baseline artifacts (that is Mode A),
* implement product code,
* be confused with normal Mode B feature delivery.
```

#### 2.3.2 § 5.1 Mode A — beze změny

Mode A purpose zůstává „repository onboarding" exactly jak je. Žádný amendment v Batch 1.

#### 2.3.3 Nová sekce § 5.4 Mode M — Module Orchestration

**Vložit za § 5.3 Mode C (po řádku 200):**

```
### 5.4 Mode M — Module Orchestration

Used when:

* a new implementation stream (a module) is being established within
  an existing program scope,
* the module requires coordinated baseline trust, analytical, UX, and
  architectural framing before any slice-level work begins,
* multiple roles (analyst, UX, architect, BE, FE) will operate in
  parallel on the same module,
* a module nears release and requires release-readiness verification,
* or the module is the natural carrier of multiple Mode B slices.

Goal:

* declare the module as a bounded delivery stream,
* establish module-level baseline trust (terminology, source authority,
  conflict register within the module's scope),
* frame the module's analytical, UX, and architectural inputs into a
  coherent module-level plan,
* author a slice map enabling safe parallel Mode B delivery,
* and verify module-release readiness when the module nears completion.

Mode M is a governed module-level orchestration mode.

It is not:
* a slice-level implementation mode (that is Mode B),
* a replacement for Mode B,
* a repository onboarding mode (that is Mode A),
* a program bootstrap mode (that is Mode P),
* a comment intake mode (that is Mode C),
* a way to bypass slice-level governance.

Mode M may:
* create module-level artifacts in `specs/<module>/`,
* invoke onboarding roles (`agents/onboarding/*`) with module scope
  during Gate M1a (module baseline),
* coordinate analytical, UX, and architectural inputs,
* produce a slice map enabling parallel Mode B execution,
* verify module-release readiness.

Mode M must not:
* implement product code,
* merge code to delivery branches,
* claim slice completion (that is Mode B per slice),
* silently turn module framing into hidden feature delivery,
* re-author repository baseline (that is Mode A).
```

### 2.4 § 6 Workflow law — opravit duplicitní hlavičku a přidat dvě nové sekce

**Současný stav (řádky 204–206):** Duplicitní `## 6. Workflow law` na řádku 204 i 206 — chyba, opravit.

**Změna 1:** Odstranit duplicitní hlavičku (řádek 206).

**Změna 2:** Přepsat řádky 238–247 — v § 6.2 Mode C je tam omylem zkopírovaná Mode B sekvence (řádky 238–247). Odstranit.

**Změna 3:** Přidat za § 6.2 Mode C dvě nové sekce.

```
### 6.3 Mode M — Module Orchestration

Mode M is allowed when a new module is being established within an
existing program scope, or an existing module needs re-framing before
further slice delivery.

Its governed sequence is:

1. module declaration and scope confirmation against the program-level
   module map (M0),
2. module baseline establishment — bounded corpus reading,
   terminology stabilization, source authority, module-scope conflicts
   (M1a) — followed by module framing — module-brief and initial
   analytical seeds (M1b),
3. behavior and UX framing — IA, first wireframes, UC/QUERY/JOB/CS
   inputs as relevant (M2),
4. module architecture and slice map authoring, plus module-level
   component and copy specs when relevant (M3),
5. module-release readiness verification when all slices are merged
   or explicitly deferred (M4).

Mode M must not implement product code directly.
Each downstream slice continues through Mode B, entering through
Gate B0 (slice-readiness check).

Program-level framing (project-brief, architecture-overview, module-map)
is a Mode P activity, not Mode M. Mode M requires those program-level
artifacts to exist before it begins.

Repository-level baseline (full _ar/** reading, repo terminology) is a
Mode A activity, not Mode M. Mode M scope is bounded to one module.

### 6.4 Mode P — Program Bootstrap

Mode P is allowed when a new project is being established within this
framework, or when an existing program requires structural re-framing.

Its governed sequence is:

1. program declaration — business purpose, scope, key constraints (P0),
2. program-level architecture overview — architectural assumptions,
   external systems, non-functional constraints (P1),
3. module decomposition — module-map with named modules, dependencies,
   integration boundaries (P2),
4. (optional) implementation streams — parallel delivery coordination
   model when non-trivial (P3).

Mode P must not author module-level artifacts directly. Each declared
module continues through Mode M.

Mode P is typically run once per project. Re-runs are explicit
structural events (new module, module split, scope rewrite) and must
not be normalized into routine planning.
```

**Změna 4:** Aktualizovat § 6.1 Mode B sekvenci — přidat nový Gate B0 jako první krok.

**Současný stav (řádky 212–222):**
```
1. constitution check,
2. specify,
3. clarify,
4. plan,
5. tasks,
6. implement,
7. QA and runtime verification,
8. independent review.
```

**Změna:** Přidat Gate B0 jako krok 1, posunout ostatní.

```
1. slice-readiness check (B0) — verify the slice meets §17.2
   slice-ready prerequisites recorded in `slice-map.md`,
2. constitution check,
3. specify,
4. clarify,
5. plan,
6. tasks,
7. implement,
8. QA and runtime verification,
9. independent review.

Gate B0 is a hard prerequisite. If slice-readiness is not satisfied,
the slice returns to Mode M (M1 / M2 / M3 depending on missing
prerequisite) before Mode B may begin.

Implementation without an existing specification is prohibited.
```

### 2.5 § 9 Artifact law — rozšířit o 3-tier model

**Současný stav (řádky 316–339):** Vyjmenovává jen slice-level artefakty.

**Změna:** Před stávající seznam vložit:

```
Artifact law applies at three tiers, each owned by its respective mode:

**Program tier** (Mode P, once per project) must produce or update:
- `docs/program/project-brief.md`
- `docs/program/architecture-overview.md`
- `docs/program/module-map.md`

When the program spans multiple parallel implementation streams:
- `docs/program/implementation-streams.md`

**Module tier** (Mode M, once per module + once per release) must
produce or update:
- `specs/<module>/module-brief.md`
- `specs/<module>/module-plan.md`
- `specs/<module>/slice-map.md`
- `specs/<module>/module-risks.md`
- `specs/<module>/baseline/authority-map.md`
- `specs/<module>/glossary/module-glossary.md`
- `specs/<module>/module-staging-readiness.md` (before module release)

When the module has user-facing surfaces, the module tier must also
produce:
- `specs/<module>/ux/ia.md`
- `specs/<module>/ux/wireframes.md`
- `specs/<module>/ux/components.md` (when reusable components exist)
- `specs/<module>/ux/copy.md` (when non-trivial text content exists)

**Slice tier** (Mode B, per slice) must produce or update:
[existující seznam beze změny]
```

### 2.6 § 17 Constitutional definition of done — přidat 4 nové úrovně

**Současný stav (řádky 466–481):** 10 bodů pro slice-level done.

**Změna:** Přidat za seznam čtyři nové sekce. Slice-level done zůstává jako § 17.0 (default).

```
### 17.1 Program-definition done

A program is bootstrap-ready when:
1. `project-brief.md` declares scope, business purpose, key constraints,
2. `architecture-overview.md` records architectural assumptions and
   external system boundaries,
3. `module-map.md` declares all modules with explicit dependencies and
   integration boundaries,
4. `implementation-streams.md` exists if parallel delivery is non-trivial,
5. all declared modules have a clear owner and entry path into Mode M.

### 17.2 Module-definition done

A module is delivery-ready when:
1. `module-brief.md` defines scope, boundaries, dependencies on core
   and other modules,
2. module baseline exists (`baseline/authority-map.md`,
   `glossary/module-glossary.md`) per Gate M1a,
3. initial analytical minimum exists (EN/BR/UC inputs as relevant),
4. `ia.md` and `wireframes.md` exist when the module has user-facing
   surfaces,
5. `module-plan.md` and `slice-map.md` exist,
6. `module-risks.md` records known risks and open dependencies,
7. each planned slice has explicit slice-readiness prerequisites
   recorded in `slice-map.md`.

### 17.3 Slice-ready done

A slice is ready to enter Mode B Gate B0 when:
1. analytical inputs are sufficient (EN/UC/BR/QUERY/JOB as relevant),
2. UX inputs are sufficient (wireframes + relevant component/copy
   coverage),
3. technical dependencies on core and other modules are explicit and
   resolved (or explicitly accepted as risk),
4. scope fits within slice sizing discipline,
5. acceptance criterion is single and user-observable,
6. assigned implementer lane(s) are clear.

### 17.4 Module-release readiness

A module is release-ready when:
1. all slices in `slice-map.md` are merged or explicitly deferred,
2. `module-staging-readiness.md` records staging verification evidence,
3. open risks and known gaps are visible in `module-risks.md`,
4. cross-module integration is verified (when applicable),
5. release recommendation is explicit (`release` | `defer` | `block`).
```

### 2.7 § 21 Downstream artifacts — rozšířit seznam

**Současný stav (řádky 534–541):** 6 odvozených artefaktů.

**Změna:** Přidat:
```
- `mode-c.md` (when Mode C is active)
- `mode-m.md` (when Mode M is active)
- `mode-p.md` (when Mode P is active)
- `local-tooling-contract.md`
- module orchestration role specs (`agents/modules/**`)
- UX canonical role specs (`agents/ux/**`)
- program bootstrap role specs (`agents/program/**`)
```

---

## 3. Nový soubor `docs/governance/mode-p.md`

Cílová délka ~200 řádků. Postaven po vzoru mode-c.md, ale jednodušší (Mode P je menší než Mode M).

### Sekce:

1. **Purpose**
2. **Position in the Overall Operating Model** — vztah k Mode A/B/C/M, kdy P začíná, kdy končí, kdy se re-runuje
3. **Core Principles**
   - Program-level decisions are structural
   - Module decomposition is bounded and named
   - Re-runs are explicit structural events
   - Mode P does not author module substance
4. **Typical Outcomes** — `program_bootstrapped`, `program_re_framed`, `blocked`
5. **Non-Goals**
6. **Entry Conditions** — operator confirmation that this is bootstrap, ne routine planning
7. **Inputs** — product brief, architectural assumptions, předběžný module breakdown
8. **Required Read Order in Mode P** — constitution, guardrails, trigger-matrix, DoD, mode-p.md, existující `docs/program/*` (pokud re-frame)
9. **Mode P Gate Sequence (P0–P3) + Gate P-R for re-frames:**

   #### Gate P-R — Re-frame Authorization (only when re-running Mode P)
   - **Trigger:** `docs/program/project-brief.md` already exists
   - **Owner:** operator + `ProgramBootstrapper`
   - **Required result:** explicit re-frame rationale recorded; affected program-level artifacts named; downstream impact on existing modules acknowledged
   - **Minimum output:** `docs/program/re-frame-authorization.md` (sekce: trigger event, affected artifacts, downstream module impact, operator authorization)
   - **Stop if:**
     - operator did not explicitly confirm re-frame intent
     - re-frame would silently invalidate existing module work without acknowledgment
     - rationale is vague ("update", "refresh", "cleanup" without specifics)
   - **Hands off to:** P0 (with re-frame flag)

   #### Gate P0 — Program Declaration
   - Owner: operator + `ProgramBootstrapper`
   - Output: `project-brief.md` (new) or amended (re-frame mode)
   - Re-frame variant: must preserve historical record (no silent overwrite)

   #### Gate P1 — Architecture Overview
   - Owner: architekt + `ArchitectureOverviewAuthor`
   - Output: `architecture-overview.md`

   #### Gate P2 — Module Decomposition
   - Owner: architekt + analytik + `ModuleMapAuthor`
   - Output: `module-map.md`
   - Re-frame: changes to module-map must explicitly list which modules are added, removed, split, merged, or scope-changed

   #### Gate P3 — Implementation Streams (optional)
   - Owner: projektový lead + `ImplementationStreamsAuthor`
   - Output: `implementation-streams.md`
10. **Default Agent Set for `agents/program/**`** — ProgramBootstrapper, ArchitectureOverviewAuthor, ModuleMapAuthor, ImplementationStreamsAuthor
11. **Required Artifacts in Mode P**
12. **Hard Stops in Mode P**
13. **Handoff to Mode A and Mode M** — po Mode P typicky Mode A (repo onboarding) následuje, pak per-modul Mode M
14. **Re-run Conditions** — kdy je legitimní Mode P re-runovat
15. **Quality Bar**
16. **Example Short Prompts**

---

## 4. Nový soubor `docs/governance/mode-m.md`

Cílová délka ~500 řádků. Postaven po vzoru mode-c.md.

### Sekce:

1. **Purpose**
2. **Position in the Overall Operating Model** — vztah k Mode A/B/C/P
3. **Core Principles**
   - Module is bounded delivery stream
   - Module baseline before module framing
   - Slice-readiness before Mode B
   - Parallel work coordinated through slice map
   - No implementation in Mode M
4. **Typical Outcomes** — `module_declared`, `module_framed`, `slice_map_ready`, `slice_handed_off_to_mode_b`, `module_release_ready`, `blocked`
5. **Non-Goals**
6. **Entry Conditions** — program-level artefakty musí existovat
7. **Inputs** — `docs/program/*`, existující modulové artefakty (pokud refresh), corpus subset `_ar/<module>/**` (pokud existuje)
8. **Required Read Order in Mode M**
9. **Mode M Gate Sequence (M0–M4):**

   #### Gate M0 — Module Declaration
   - Purpose, owner (`ModuleFramer` v `agents/modules/`), required result, minimum output, stop conditions
   
   #### Gate M1 — Module Baseline & Framing
   
   **Gate M1a — Module Baseline:**
   - Owner: invokované `agents/onboarding/*` role s module scope (CorpusCurator, TerminologyResolver, ConflictMapper)
   - Output: `specs/<module>/baseline/authority-map.md`, `specs/<module>/glossary/module-glossary.md`, případně `specs/<module>/baseline/conflict-register.md`
   - Stop: pokud module-level conflict nelze resolve
   
   **Gate M1b — Module Framing:**
   - Owner: `ModuleFramer` + analytical role calls (EN/BR/ES/ARCH authors)
   - Output: `specs/<module>/module-brief.md` + `specs/<module>/analysis/EN/*`, `BR/*`, `ES/*`, `ARCH/*`
   - Stop: pokud entity konfliktují s existujícími EN v sousedních modulech
   
   #### Gate M2 — Behavior & UX Framing
   - Owner: `IAAuthor`, `WireframeAuthor` (z `agents/ux/`) + analytical role calls (UC, QUERY, JOB, CS)
   - Output: `ia.md`, `wireframes.md`, `analysis/UC/*`, `analysis/QUERY/*`, `analysis/JOB/*`, `analysis/CS/*`
   - Stop: IA bez vazby na UC, wireframe element bez datového/funkčního pokrytí
   
   #### Gate M3 — Module Architecture & Slice Map
   - Owner: `ModulePlanAuthor`, `SliceMapAuthor`, `ComponentSpecAuthor`, `CopySpecAuthor`
   - Output: `module-plan.md`, `slice-map.md`, `module-risks.md`, `components.md`, `copy.md`
   - Stop: slice mapa porušuje sizing discipline, slice-level dependency cyklus
   
   #### Gate M4 — Module Release Readiness
   - Owner: `ModuleStagingVerifier`, `ModuleRiskAuditor`
   - Output: `module-staging-readiness.md`, update `slice-map.md` a `module-risks.md`
   - Stop: otevřený slice work, staging unavailable, cross-module integration conflict

10. **Default Agent Set for `agents/modules/**`** — ModuleFramer, ModulePlanAuthor, SliceMapAuthor, ModuleStagingVerifier, ModuleRiskAuditor
11. **Default Agent Set for `agents/ux/**`** — IAAuthor, WireframeAuthor, ComponentSpecAuthor, CopySpecAuthor
12. **Reuse of `agents/onboarding/**` in Gate M1a** — explicitní pravidlo, že existující onboarding role jsou invokované s module scope, žádný duplikátní agent katalog
13. **Required Artifacts in Mode M**
14. **Routing and Impact Guidance** — modulová impact classification placeholder, detailní definice až v Batch 2 (impact-classes.md)
15. **Hard Stops in Mode M** — explicit list včetně program-level missing, M1 before M2, M2 before M3
16. **Handoff to Mode B (Gate B0)** — co musí být splněno
17. **Handoff back to Mode P** — kdy module-level work odhalí program-level problem
18. **Handoff back to Mode A** — kdy module work odhalí repo baseline problem
19. **Relationship to Mode C** — placeholder pro cross-module comment routing (TODO Batch 2)
20. **Relationship to Source Corpus** — bounded reading `_ar/<module>/**`
21. **Quality Bar**
22. **Example Short Prompts**

---

## 5. Změny v `CLAUDE.md`

### 5.1 § Authority — narovnat hierarchii

Aktualizovat na 13 vrstev se stejnou logikou jako § 2.2 v ústavě.

### 5.2 § Operating Modes — přidat Mode P (před Mode A) a Mode M (po Mode C)

Koncepční definice jako v ústavě, formulačně sezavřenější. Mode A sekce **beze změny**.

### 5.3 § Read Policy — rozšířit Mode M a Mode P reads

V "read next only as needed" přidat:
- `docs/governance/mode-m.md` when Mode M is active
- `docs/governance/mode-p.md` when Mode P is active
- relevant `docs/program/*` for module-level work
- relevant `specs/<module>/module-brief.md`, `module-plan.md`, `slice-map.md`
- relevant files in `agents/modules/**`, `agents/ux/**`, `agents/program/**`

### 5.4 § Workflow — přidat Mode M Workflow a Mode P Workflow

Dvě nové sekce mezi Mode B a Mode C workflows.

### 5.5 § Canonical Documentation Layer Rule — rozšířit o 4 nové vrstvy

Současných 12 → 16 vrstev. Přidat:
```
- information architecture: screen map, navigation, entry points → `IA`
- screen-level layout and interaction spec → `WIRE`
- component contract, variants, accessibility → `COMP`
- user-facing copy: labels, helpers, empty states, CTAs → `COPY`
```

**Pozn.:** Skutečné soubory rules-*.md a template-*.md přijdou v Batch 4.

### 5.6 § Slice Sizing Discipline — rozšířit o modulový kontext a Gate B0

Přidat na začátek sekce odstavec o tom, že slice nyní žije uvnitř modulu, a před vstupem do Mode B musí projít Gate B0 (slice-readiness check per §17.3 ústavy). Cap hodnoty zůstávají stejné.

### 5.7 § Hard Stops — rozšířit o program a module-level

Přidat:
- **Program-level:**
  - Mode M cannot start without `docs/program/module-map.md` containing the module
  - Mode B Gate B0 cannot pass without Mode M Gate M3 completion (slice-map exists)
- **Module-level:**
  - Mode M Gate M2 cannot start without Gate M1 completion
  - Mode M Gate M3 cannot start without Gate M2 completion
  - Mode M Gate M4 cannot start with any open slice work
- **Slice-level:**
  - Mode B Gate 1 cannot start without Gate B0 pass

Všechno hard stop s named missing artifact, žádné polite warnings.

### 5.8 § Minimum Artifacts — rozšířit o program a module tier

Přidat sekce "For program initialization (Mode P)" a "For module orchestration (Mode M)". Mode B sekce beze změny.

### 5.9 § Subagent Policy — přidat module-orchestrator a program-bootstrap subagenti

```
### Program bootstrap

Program-level artifacts must always be created by a worktree subagent.

When starting a new project, spawn `program-bootstrap` subagent
(in `.claude/agents/program-bootstrap.md`, color blue, model opus).

Use `description: "Program Bootstrap: {project-id}"`.

### Module orchestration

Module-level artifacts must always be created by a worktree subagent.

When starting a new module or refreshing module framing, spawn
`module-orchestrator` subagent (in `.claude/agents/module-orchestrator.md`,
color magenta, model opus).

Use `description: "Module Orchestrator: {module-id}"`.

The module-orchestrator produces `module-brief.md`, `module-plan.md`,
`slice-map.md`, `module-risks.md`, and invokes existing onboarding
roles (with module scope) for Gate M1a baseline work.

UX artifact authoring (ia, wireframes, components, copy) uses
dedicated UX subagents in `agents/ux/**` invoked separately.

### Slice readiness verification

Before each Mode B run, spawn `slice-readiness-verifier` subagent
(read-only, model haiku, color green).

Returns pass/fail for §17.3 slice-ready prerequisites.
```

### 5.10 § Git Workflow — rozšířit branch naming

Aktualizovat sekci "Branch naming":
```
`{module}/phase{N}-{NN}-{feature-slug}` — derived from the slice map
in `specs/<module>/slice-map.md`. The `{module}` prefix is the module
slug (e.g. `core`, `payments`, …) as declared in
`docs/program/module-map.md`.
```

Plus přidat hard-stop pravidla:
- žádný branch nelze založit dřív, než modul je deklarován v `module-map.md`
- žádný branch nelze založit dřív, než slice je v `slice-map.md` a má pass z Gate B0

---

## 6. Co Batch 1 NEDĚLÁ (explicit out-of-scope)

- ❌ Nepatchuje `docs/governance/trigger-matrix.md` (Batch 2 — routing pro M0–M4 a P0–P3)
- ❌ Nepatchuje `docs/governance/impact-classes.md` (Batch 2 — definuje module-level impact)
- ❌ Nepatchuje `docs/governance/definition-of-done.md` (Batch 2 — detailní implementace §17.1–17.4 ústavy)
- ❌ Nepatchuje `docs/governance/guardrails.md` (Batch 2 — module/program guardrails)
- ❌ Nepatchuje `docs/governance/mode-c.md` (Batch 2 — cross-module routing, project-specific cleanup)
- ❌ Nevytváří šablony v `.specify/templates/` (Batch 3)
- ❌ Nevytváří `rules-*.md` ani `template-*.md` pro IA/WIRE/COMP/COPY (Batch 4)
- ❌ Nevytváří role v `agents/modules/`, `agents/ux/`, `agents/program/` (Batch 5)
- ❌ Nevytváří `.claude/agents/module-orchestrator.md`, `program-bootstrap.md`, `slice-readiness-verifier.md` (Batch 5)
- ❌ Nevytváří složku `docs/program/` (Batch 6)
- ❌ Neregeneruje `compile.md` (Batch 7)
- ❌ **NEMĚNÍ Mode A** (purpose zůstává „repository onboarding", žádné rozšíření)

Po Batch 1 bude aparát v **přechodném stavu**: konstituce a CLAUDE.md odkazují na artefakty, šablony a role, které ještě neexistují. Tento stav je řízený — Batch 2 ho rychle uzavře governance vrstvou, Batches 3–6 doplní operační infrastrukturu.

---

## 7. Finalizovaná rozhodnutí

Všechna review rozhodnutí padla. Pro auditní dohledatelnost:

| Rozhodnutí | Volba |
|---|---|
| Cílový repo | Framework v arg-pipeliner |
| Mode D scope | Plnohodnotný constitutional mode (přejmenován na Mode M) |
| UX/FE artefakty | Kanonická vrstva (full first-class) |
| Modulová struktura | Konfigurovatelná per projekt |
| Bootstrap metoda Batch 1+2 | Cesta A — direct editing |
| Mode A double-purpose | Riziko 1 = (c) Mode A jen pro repo, modul plyne pod Mode M |
| Mode M Gate M4 / slice-readiness | Přesunout do Mode B Gate B0 |
| Mode P existence | Ano, samostatný 5. mód |
| Mode P pozice v ústavě | § 5.0 (před Mode A) |
| Mode B Gate B0 numbering | Krok 1 v sekvenci (1–8 posun na 2–9) |
| Constitution status | Draft → Stable |
| Mode P re-frame governance | Ano — Gate P-R přidán |
| Constitution version | v0.1.0 → v1.0.0 (major) |

---

## 8. Po schválení

Po tvém GO udělám **čtyři editace** v tomto pořadí:

1. `.specify/memory/constitution.md` (amendments — version bump + §2/§5/§6/§9/§17/§21 změny)
2. `docs/governance/mode-p.md` (nový soubor, ~200 řádků)
3. `docs/governance/mode-m.md` (nový soubor, ~500 řádků)
4. `CLAUDE.md` (amendments — 10 sekcí)

Pak ti reportuju diff summary, ověřím konzistenci hierarchie autority napříč 4 soubory, a navrhnu start Batch 2.

Po dokončení Batch 1 můžeš plán smazat nebo přesunout do `docs/archive/`.
