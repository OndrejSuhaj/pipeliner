# Amendment Plan — Batch 4: UX Canonical Layer Rules & Templates

**Status**: ✅ Completed — Batch 4 applied 2026-05-19
**Scope**: Authoring rules + templates for the 4 UX canonical layers in `toolingDocs/` and `toolingTemplates/`. Content goes into `_ar/UX/` (structure established in Batch 2 — Canonical Truth Restructure).
**Method**: Direct editing (Cesta A) — framework amendment, no feature branch
**Version bump**: constitution stays v2.0.0 (no semantic change; this batch adds downstream authoring infrastructure registered in v2.0.0 §21)
**Predecessor**: Batch 2 — Canonical Truth Restructure (✅ commit `40b2864`)
**Supersedes**: Original Batch 4 draft (pre-Batch 2) which assumed `specs/<module>/ux/` placement
**Blocks**: Batch 5 (UX agent role bodies in `agents/ux/**`)

---

## 1. Cíl Batch 4

Dodat autorskou infrastrukturu pro 4 UX kanonické vrstvy registrované v Batch 2:

- **IA** — Information Architecture (project-level, jeden dokument per projekt)
- **WIRE** — Wireframe Spec (per-instance, jeden doc per obrazovku)
- **COMP** — Component Spec (per-instance, jeden doc per komponentu)
- **COPY** — Copy Spec (per scope — modul nebo cross-module shared)

Po dokončení Batch 4:
- UX autoři mají kompletní pravidla a šablony pro autorování do `_ar/UX/{IA,WIRE,COMP,COPY}/`,
- Batch 5 může bezpečně autorovat role bodies (`agents/ux/IAAuthor.md`, `WireframeAuthor.md`, atd.) odkazující na tyto rules,
- přechodné poznámky v `_REGISTRY.md` skeletonech ("Authoring rules introduced in Batch 4") lze odstranit.

---

## 2. Dotčené soubory

### 2.1 Vytvořit (8 nových souborů)

**`toolingDocs/`** — autorská pravidla:
- `rules-IA.md` (~80 řádků)
- `rules-WIRE.md` (~150 řádků — větší kvůli state coverage a interaction patterns)
- `rules-COMP.md` (~120 řádků — větší kvůli variants/states/accessibility)
- `rules-COPY.md` (~80 řádků)

**`toolingTemplates/`** — prázdné kostry:
- `template-IA.md`
- `template-WIRE.md`
- `template-COMP.md`
- `template-COPY.md`

### 2.2 Upravit (4 soubory)

- `_ar/UX/IA/_REGISTRY.md` — odstranit pending-note ("Authoring rules introduced in Batch 4...")
- `_ar/UX/WIRE/_REGISTRY.md` — totéž
- `_ar/UX/COMP/_REGISTRY.md` — totéž
- `_ar/UX/COPY/_REGISTRY.md` — totéž

### 2.3 Neoditujeme

Constitution, CLAUDE.md, governance docs — všechny už registrují vrstvy IA/WIRE/COMP/COPY z Batch 2. Batch 4 jen dodává obsah do `toolingDocs/` a `toolingTemplates/`.

---

## 3. Designová rozhodnutí (z předchozího brainstormu)

Tato rozhodnutí padla v rámci přípravy Batch 2 a jsou platná i pro Batch 4:

| Rozhodnutí | Volba | Zdroj |
|---|---|---|
| IA granularita | project-level (jeden doc per projekt) | brainstorm 2026-05-19 |
| WIRE granularita | per-instance (`WIRExxxx-<name>`) | brainstorm 2026-05-19 |
| COMP granularita | per-instance (`COMPxxxx-<name>`) | brainstorm 2026-05-19 |
| COPY granularita | per-scope (`COPY-<scope>`, např. `COPY-core`, `COPY-validation-shared`) | viz §4.1 níže |
| Sdílení komponent | flat v `_ar/UX/COMP/`, sdílení deklarováno přes `modules:` frontmatter | brainstorm 2026-05-19 |
| Design system reference | externí URL (Figma/Storybook) v COMP frontmatteru jako `design_source:` | brainstorm 2026-05-19 |
| ID schema | numerické (např. `WIRE0001`, `COMP0014`) v `_REGISTRY.md` | Batch 2 §10 |
| Cross-references | přes `doc_id` (např. `references: [UC0001, EN0014]`) | Batch 2 §10 |
| Modul-asociace | `modules: [<module-slug>, ...]` v frontmatteru | Batch 2 §10 |

---

## 4. Otevřená rozhodnutí

Tato rozhodnutí ještě nepadla a musí padnout před autorováním rules-*.md souborů.

### 4.1 COPY scope konvence

**Otázka:** Jak strukturovat `_ar/UX/COPY/` soubory?

**Volby:**

| Volba | Pattern | Příklad |
|---|---|---|
| A | per-module | `COPY-core.md`, `COPY-payments.md`, `COPY-pipelines.md` |
| B | per-purpose | `COPY-validation.md`, `COPY-cta.md`, `COPY-empty-states.md` |
| C | mixed | `COPY-<module-or-purpose>.md` (každý doc declares scope v frontmatteru) |
| D | per-screen | `COPY-WIRE0014-checkout.md` (vázané na konkrétní WIRE) |

**Doporučení: C — mixed.** Doménově-specifická copy se přirozeně organizuje per-modul (např. všechny dialogy v core), ale sdílená copy (CTA, validation, brand voice) má smysl jako separate scope. `scope:` frontmatter pole jasně deklaruje typ:

```yaml
scope: module-<slug>   # např. module-core
scope: shared-<type>   # např. shared-validation, shared-cta
```

**Rozhodnutí: ⬜ C (doporučené) ⬜ A ⬜ B ⬜ D**

### 4.2 Cross-layer references — povinnost

**Otázka:** Které cross-references jsou v rules-*.md povinné?

**Navržená tabulka:**

| Layer | Required references in frontmatter |
|---|---|
| IA | `references:` může obsahovat foundational UC entries (entry points), foundational EN (entity types v navigaci); není striktně povinné v MVP |
| WIRE | **POVINNÉ:** `realizes_uc:` (alespoň jedno UC `doc_id`); `references:` může obsahovat COMP/EN/QUERY |
| COMP | volné `references:` (např. na další COMP přes composition, na EN přes data binding) |
| COPY | volné `references:` (na WIRE/COMP, kde se text zobrazuje) |

**Doporučení:** Adoptovat tabulku. Pouze WIRE má hard requirement (`realizes_uc:`) — bez vazby na UC nemá obrazovka deterministický důvod existence.

**Rozhodnutí: ⬜ Adoptovat (doporučené) ⬜ Upravit**

### 4.3 Accessibility a state coverage v WIRE/COMP

**Otázka:** Které stavy a accessibility aspekty jsou povinné?

**Navržené minimum pro WIRE:**
- Required sections: `Purpose`, `Layout Zones`, `Components Used`, `Interactions`, `States`, `Validation Surfaces`, `Data Bindings`, `Accessibility Notes`
- Required state coverage: `default`, `empty`, `loading`, `error`
- Required interactions: entry, primary action, secondary actions, exit

**Navržené minimum pro COMP:**
- Required sections: `Purpose`, `Props/Inputs`, `Variants`, `States`, `Events`, `Accessibility`, `Usage Constraints`, `Dependencies`
- Required accessibility coverage: ARIA roles, keyboard navigation, focus management
- Conditional sections (include only if applicable): `i18n`, `Data binding`, `Composition`

**Rozhodnutí: ⬜ Adoptovat minimum (doporučené) ⬜ Upravit**

### 4.4 Project-level IA structure depth

**Otázka:** Jak detailní má být project-level IA?

**Volby:**
- A: high-level pouze (top-level navigation + module boundary map; screen-level detail patří do WIRE)
- B: medium (top-level nav + screen map across all modules + entry points + cross-module flows)
- C: deep (vše z B + information hierarchy + open IA questions + alternative navigation patterns)

**Doporučení: B.** Tovární sada (top nav + screen map + entry points + cross-module flows) pokrývá to, co potřebuje Mode M pro module decomposition a WIRE authoring. Hlubší detail nepatří do project IA, ale do WIRE per screen.

**Rozhodnutí: ⬜ B (doporučené) ⬜ A ⬜ C**

### 4.5 Naming convention pro project-level IA

**Otázka:** Project-level IA žije v `_ar/UX/IA/`. Jak se jmenuje?

**Volby:**
- A: `IA-<project-slug>.md` (např. `IA-pipeliner.md`) — bez numerického ID, protože je jen jeden per projekt
- B: `IA0001-<project-slug>.md` — zachovat numerické ID pro konzistenci s ostatními layers
- C: `IA.md` — flat, žádný suffix

**Doporučení: A.** Project-level IA je svého druhu jediný, numerické ID je zbytečné. Slug v názvu pomáhá pro multi-tenant repos.

**Rozhodnutí: ⬜ A (doporučené) ⬜ B ⬜ C**

---

## 5. Soubor-po-souboru specifikace

Konkrétní obsah finalizován až po odsouhlasení §4. Níže je kostra, kterou budou rules-*.md soubory následovat — jednotná s existujícími `toolingDocs/rules-EN.md`, `rules-UC.md`, …

### 5.1 `rules-IA.md` (~80 řádků)

Struktura:
1. Purpose
2. Naming (`IA-<project-slug>` per §4.5)
3. Required Frontmatter
4. Recommended Structure (per §4.4 — `Module Scope`, `Top-Level Navigation`, `Screen Map`, `Entry Points`, `Cross-Module Flows`, `Information Hierarchy`, `Module Boundaries`)
5. Section Meaning
6. Cross-Layer References (per §4.2)
7. Quality Bar — IA musí pokrýt všechny UC entry actors; žádná screen v map bez owning module.

### 5.2 `rules-WIRE.md` (~150 řádků)

Struktura:
1. Purpose
2. Naming (`WIRExxxx – <Screen Name>`)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: WIRE`, `modules`, `realizes_uc`, `status`, `references`)
4. Recommended Structure (per §4.3)
5. Section Meaning (každá sekce detailně)
6. State Coverage (default/empty/loading/error per §4.3)
7. Validation Surfaces (kde validační error zobrazen — vazba na BR / EN invariants)
8. Cross-Layer References
9. Quality Bar

### 5.3 `rules-COMP.md` (~120 řádků)

Struktura:
1. Purpose
2. Naming (`COMPxxxx – <Component Name>`)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: COMP`, `modules`, `design_source` (optional), `status`, `references`)
4. Recommended Structure (per §4.3)
5. Section Meaning
6. Accessibility Minimum (ARIA, keyboard, focus per §4.3)
7. Cross-Layer References
8. Quality Bar

### 5.4 `rules-COPY.md` (~80 řádků)

Struktura:
1. Purpose
2. Naming (`COPY-<scope>` per §4.1)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: COPY`, `scope`, `modules`, `language`, `status`)
4. Recommended Structure (Labels, Helper Texts, Empty States, Loading Texts, Error/Validation Messages, CTAs, Microcopy Conventions)
5. Section Meaning
6. Key Naming Convention (např. `<module>.<screen-or-component>.<role>`)
7. Cross-Layer References (per §4.2)
8. Quality Bar

### 5.5 Templates — `template-IA.md`, `template-WIRE.md`, `template-COMP.md`, `template-COPY.md`

Každý template je prázdná kostra odpovídající `Recommended Structure` ve svém `rules-*.md`, s placeholder hodnotami (`<...>`). Form factor identický s `template-EN.md` / `template-UC.md`.

---

## 6. `_REGISTRY.md` cleanup (4 souborů)

Po dokončení rules+templates, odstranit přechodnou poznámku z každého UX _REGISTRY.md:

**Současný stav** (např. v `_ar/UX/WIRE/_REGISTRY.md`):
```
**Note:** Authoring rules for WIRE layer details (sections, required fields,
accessibility minimums, etc.) are introduced in Batch 4 of the foundation
amendment (`toolingDocs/rules-WIRE.md` and `toolingTemplates/template-WIRE.md`).
Until Batch 4 lands, this layer is registered but its authoring rules are pending.
```

**Po Batch 4:** Odstranit celý odstavec.

---

## 7. Co Batch 4 NEDĚLÁ (explicit out-of-scope)

- ❌ Nevytváří role v `agents/ux/**` (Batch 5)
- ❌ Nevytváří `.claude/agents/ux-*` subagent registrace (Batch 5)
- ❌ Nevytváří actual `_ar/UX/<layer>/<doc>.md` content (autorské činnosti Mode P/M/B)
- ❌ Neměnit constitution nebo CLAUDE.md (Batch 2 už vše zaregistroval)
- ❌ Nevytváří `.specify/templates/ux-*-template.md` — UX templates patří do `toolingTemplates/`, ne `.specify/templates/`
- ❌ Žádný produkční kód, žádný feature branch

---

## 8. Finalizovaná rozhodnutí

| Rozhodnutí | Volba | Status |
|---|---|---|
| IA granularita | project-level | ✅ 2026-05-19 (Batch 2 brainstorm) |
| WIRE granularita | per-instance | ✅ 2026-05-19 |
| COMP granularita | per-instance, sdílení přes `modules:` frontmatter | ✅ 2026-05-19 |
| Design system reference | externí URL v `design_source:` | ✅ 2026-05-19 |
| ID schema | numerické (`<LAYER>####`) + `_REGISTRY.md` | ✅ 2026-05-19 (Batch 2) |
| Authority hierarchy | Mode P (P-UX) pro IA, Mode M pro WIRE/COMP/COPY, Mode B přes manifest | ✅ 2026-05-19 (Batch 2) |
| §4.1 COPY scope konvence | C — mixed (`scope:` frontmatter) | ✅ 2026-05-19 |
| §4.2 Cross-layer references | Adoptovat tabulku | ✅ 2026-05-19 |
| §4.3 Accessibility + state coverage | Adoptovat minimum | ✅ 2026-05-19 |
| §4.4 IA structure depth | B — medium | ✅ 2026-05-19 |
| §4.5 IA naming | A — `IA-<project-slug>.md` | ✅ 2026-05-19 |
| Method | Direct editing (Cesta A) | ✅ Batch 1 precedent |
| Branch / commit policy | direct commit on `main` | ✅ Batch 2 precedent |

---

## 9. Po schválení rozhodnutí — sequence of work

After operator GO on §4 / §8 pending items, Batch 4 executes in this order:

1. **`rules-COPY.md`** (nejjednodušší — kalibrace formátu)
2. **`rules-IA.md`** (project-level, středně velký)
3. **`rules-WIRE.md`** (nejnáročnější — state coverage, interaction patterns)
4. **`rules-COMP.md`** (variants, accessibility)
5. **`template-COPY.md`**
6. **`template-IA.md`**
7. **`template-WIRE.md`**
8. **`template-COMP.md`**
9. **`_REGISTRY.md` cleanup** — odstranit pending poznámky v 4 UX registries
10. **Sanity check** — verify templates match `Recommended Structure` from corresponding rules
11. **Diff summary report** — files touched, line counts, next batch suggestion

After Batch 4 lands, Batch 5 (UX agent roles) is unblocked.

---

## 10. Quality bar (pre-merge)

Batch 4 je merge-ready, když:

1. Všech 8 souborů existuje a má frontmatter dle konvence.
2. Každý `rules-*.md` má sekce: Purpose, Naming, Required Frontmatter, Recommended Structure, Section Meaning, Cross-Layer References, Quality Bar.
3. Každý `template-*.md` přesně odpovídá `Recommended Structure` ve svém `rules-*.md`.
4. Žádný UX `_REGISTRY.md` neobsahuje pending poznámku.
5. Žádná existující `rules-*.md` ani `template-*.md` nebyla modifikována (žádný regress na BA layers).
6. Cross-references mezi UX vrstvami fungují (WIRE → UC, COMP → EN, atd.).

---

## 11. Po dokončení Batch 4

Tento plán lze:
- ponechat jako historický záznam,
- nebo přesunout do `docs/governance/archive/`.

Status v hlavičce přepsat na `✅ Completed — Batch 4 applied <datum>`.

Subsequent batches:
- **Batch 5** — agent role bodies v `agents/program/`, `agents/modules/`, `agents/ux/`; smazat `agents/onboarding/`
- **Batch 6** — `docs/program/` actual content při prvním Mode P běhu
