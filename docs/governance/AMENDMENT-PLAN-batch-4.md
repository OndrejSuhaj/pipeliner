# Amendment Plan — Batch 4: UX Canonical Layer Rules & Templates

**Status**: 🔒 BLOCKED — pending rewrite after Batch 2 lands
**Note 2026-05-19**: This plan assumed `specs/<module>/ux/` placement. Batch 2 (Canonical Truth Restructure) reroutes UX artifacts into `_ar/UX/` (flat per layer). This plan will be rewritten after Batch 2 lands. Do not use as authority in current form.
**Scope**: Authoring infrastructure for the 4 UX canonical layers registered in Batch 1 (IA, WIRE, COMP, COPY)
**Method**: Direct editing — framework amendment (per Batch 1 precedent, Cesta A)
**Version bump**: constitution v1.0.0 → v1.1.0 (minor — additive canonical layer infrastructure)
**Predecessor**: Batch 1 (✅ Completed 2026-05-16) — registered the 4 layers as canonical but deferred authoring rules to Batch 4
**Blocks**: Batch 5 (UX agent roles) — `agents/ux/**` cannot be authored without the rules these files define

---

## 1. Cíl Batch 4

Vytvořit autorskou infrastrukturu pro 4 UX kanonické vrstvy zaregistrované v Batch 1:

- **IA** — Information Architecture (screen map, navigation, entry points)
- **WIRE** — Wireframe Spec (screen-level layout and interaction)
- **COMP** — Component Spec (variants, accessibility, contracts)
- **COPY** — Copy Spec (labels, microcopy, validation text)

Po dokončení Batch 4 bude možné:
- legitimně autorovat `specs/<module>/ux/*.md` v Mode M Gate M2 / M3,
- formalizovat handoff z analytika do UX a z UX do FE,
- napsat UX agent role v Batch 5,
- odstranit přechodný stav v [CLAUDE.md:343](../../CLAUDE.md#L343) (_"Until Batch 4 lands, these layers are registered as canonical but their authoring rules are pending"_).

---

## 2. Dotčené soubory

### 2.1 Vytvořit (8 nových souborů)

**`toolingDocs/`** — autorská pravidla:
- `rules-IA.md` (~80 řádků)
- `rules-WIRE.md` (~150 řádků — větší kvůli stavovým variantám a interaction patterns)
- `rules-COMP.md` (~120 řádků — větší kvůli variants/states/accessibility)
- `rules-COPY.md` (~60 řádků — nejjednodušší)

**`toolingTemplates/`** — prázdné kostry:
- `template-IA.md`
- `template-WIRE.md`
- `template-COMP.md`
- `template-COPY.md`

### 2.2 Upravit (1 soubor)

- `CLAUDE.md` — odstranit přechodnou poznámku v § Canonical Documentation Layer Rule, případně doplnit naming conventions tabulku pro nové vrstvy (závisí na rozhodnutí §4.1).

### 2.3 Volitelně upravit (1 soubor)

- `.specify/memory/constitution.md` — version bump v1.0.0 → v1.1.0 + krátká poznámka v § 21 Downstream artifacts, že rules/templates pro UX vrstvy nyní existují. Není to structural change, takže minor bump.

---

## 3. Závislosti a sekvenování

```
Batch 1 (✅ done) ──> Batch 4 (this) ──> Batch 5 (UX agents)
                          │
                          ├──> umožní Mode M Gate M2/M3 reálně autorovat UX artefakty
                          └──> umožní psát .claude/agents/ux-* subagenty
```

**Batch 4 je nezávislý na:**
- Batch 2 (governance docs — trigger-matrix, impact-classes, DoD detailing)
- Batch 3 (`.specify/templates/` slice-level scaffolding)
- Batch 6 (`docs/program/`)

**Lze pustit paralelně** s Batch 2/3/6. Batch 5 je hard-blocked dokud Batch 4 nelandne.

---

## 4. Otevřená designová rozhodnutí

Tato rozhodnutí musí padnout **před** zápisem rules-*.md. Pro každé navržená volba s rationale; operátor potvrdí nebo přepíše.

### 4.1 Granularita: per-modul agregát vs. per-instance dokument

**Otázka:** Jak rozdělit obsah?

**✅ Rozhodnuto 2026-05-19:**

| Vrstva | Granularita | Umístění |
|---|---|---|
| **IA** | **PROJECT-level** — jeden dokument pro celý projekt | program-level (přesné umístění: viz §4.8) |
| **WIRE** | per-modul, per-instance (`WIRExxxx`) — postupně doplňované | `specs/<module>/ux/wireframes/` |
| **COMP** | per-instance, **sdílené napříč moduly** (viz §4.3) | `specs/_shared/ux/components/` (program-level shared catalog) |
| **COPY** | otevřená otázka — viz §4.9 | TBD |

**Rationale (operátor 2026-05-19):**
- _"uxák vytvoří detailní IA pro celý projekt jako celek, bez toho se nehneme dál"_ → IA je prerekvizita celého programu, ne per-modul artefakt.
- _"WIRE pro jednotlivé moduly, může být per instance a postupně se doplňovat"_ → modulový scope, per-screen granularita.
- _"COMP je per instance, postupně doplňovaná při práci v různých modulech"_ → s explicitním požadavkem na sdílení (§4.3) → musí žít mimo `specs/<module>/`.

### ⚠ Strukturální dopady (mimo původní Batch 4 scope)

Tato rozhodnutí přesahují čistě "rules + templates" scope:

1. **IA se přesouvá z module tier do program tier.**
   - `CLAUDE.md` § Minimum Artifacts dnes řadí `ia.md` pod "module orchestration (Mode M)" — **přesun do "program initialization (Mode P)"**.
   - `constitution.md` § 17.2 Module-definition done dnes vyžaduje IA per modul — **přesun do § 17.1 Program-definition done**.
   - `mode-p.md` Gate sequence (P0–P3) nemá IA gate — **přidat Gate P-UX nebo rozšířit P1 Architecture Overview** (rozhodnout v §4.10).
   - `mode-m.md` Gate M2 dnes produkuje `ia.md` — **přepsat: M2 KONZUMUJE program-level IA, ne produkuje** (může rozšířit / detailovat per modul, ale ne nahrazuje).

2. **`specs/_shared/` se zavádí jako nový namespace** (předtím §4.3 doporučení bylo odložit, teď přijato).
   - `CLAUDE.md` § Minimum Artifacts musí registrovat `specs/_shared/ux/components/`.
   - Cross-module dependency tracking: WIRE odkaz na sdílenou COMP musí být dohledatelný.
   - Ownership rules pro sdílené komponenty: kdo schvaluje breaking change? Pravděpodobně architekt + UX lead společně.

3. **Batch 4 scope roste** — nyní zahrnuje 4 strukturální amendmenty (CLAUDE.md, constitution.md, mode-p.md, mode-m.md) navíc k 8 rules+templates souborům.

**Doporučení k scope:** Rozdělit Batch 4 na dvě fáze:
- **Batch 4a — Strukturální amendmenty** (CLAUDE.md, constitution.md, mode-p.md, mode-m.md) → vyřeší IA přesun na program tier a registruje `specs/_shared/`.
- **Batch 4b — Rules + templates** (8 souborů + finální CLAUDE.md cleanup) → původní scope Batch 4.

⬜ **Operátor potvrzení potřeba:** rozdělit na 4a + 4b (doporučené) / držet v jednom Batch 4 (větší PR, ale jednodušší tracking)?

---

### 4.2 Umístění per-instance dokumentů

Pokud §4.1 vede k WIRExxxx / COMPxxxx, kam je dát?

**Volby:**
- **Volba A:** `specs/<module>/ux/wireframes/WIRExxxx-name.md` a `specs/<module>/ux/components/COMPxxxx-name.md`
- **Volba B:** `specs/<module>/ux/WIRExxxx-name.md` rovnou v ux/ (flat)

**Doporučení:** Volba A. Podsložky drží přehled, agregát `wireframes.md` zůstane jako navigační index s linky.

**Rozhodnutí: ⬜ A (doporučené) ⬜ B**

---

### 4.3 Sdílení komponent napříč moduly

**Otázka:** Komponenta `Button` se používá ve více modulech. Kde žije?

**✅ Rozhodnuto 2026-05-19: Volba B — `specs/_shared/ux/components/`**

Rationale (operátor): _"bude velmi časté, musíme na to myslet rovnou"_ → sdílení komponent je first-class requirement, ne odložená optimalizace.

**Důsledek (požaduje rozhodnutí v §4.8):**

Konkrétní cesta:
- ⬜ A: `specs/_shared/ux/components/COMPxxxx-<name>.md` (jediná lokace pro všechny COMP)
- ⬜ B: `specs/_shared/ux/components/COMPxxxx-<name>.md` + možnost `specs/<module>/ux/components/` pro modul-specific komponenty, které se NEsdílejí (např. `OnboardingStepIndicator` jen pro auth modul)
- ⬜ C: vše v `specs/_shared/ux/components/`, frontmatter pole `scope: shared | module-<name>` určuje záměr

**Doporučení: B** — drtivá většina komponent je sdílená (UI primitives, layout, forms, …), ale ojediněle existují skutečně modul-specific komponenty (např. doménově specifická vizualizace). Mít obě možnosti dovoluje autorům být explicitní.

**Ownership pro sdílené komponenty:**
- Default owner: UX lead + architekt společně.
- Breaking change vyžaduje: dotčené moduly schválí (capture v `module-risks.md` všech dotčených modulů).
- Add new shared component: UX lead schvaluje, žádný cross-module veto needed.

⬜ **Operátor potvrzení potřeba:** volba A/B/C + ownership rules.

---

### 4.4 Cross-layer references

**Otázka:** Jaké odkazy jsou v rules-*.md povinné?

**Navržená pravidla:**

| Layer | Required references |
|---|---|
| IA | → UC (entry points), → EN (klíčové entity v navigaci), → modul-brief (scope confirm) |
| WIRE | → UC (které use case obrazovka realizuje), → QUERY (data feed), → EN (zobrazované entity), → COMP (použité komponenty), případně → CS (FE-first scénáře) |
| COMP | → další COMP (kompozice), → EN (data binding), případně → ACL (visibility per role) |
| COPY | → WIRE (kde se text zobrazuje), → COMP (component-level copy keys), → EN/BR (validační texty navazují na invariants/rules) |

**Doporučení:** Adoptovat tabulku výše jako required cross-references v rules-*.md. Reference se zapisují jako frontmatter pole `references:` (list of doc_ids) + inline odkazy v textu.

**Rozhodnutí: ⬜ Adoptovat doporučenou tabulku ⬜ Upravit ⬜ Odložit do Batch 5**

---

### 4.5 Accessibility a state coverage v WIRE/COMP

**Otázka:** Které stavy a accessibility aspekty jsou povinné?

**Navržené minimum pro WIRE:**
- Required states: `default`, `empty`, `loading`, `error`
- Required interactions: entry, primary action, secondary actions, exit
- Required validation surfaces: kde se zobrazuje validační error (vazba na BR / EN invariants)

**Navržené minimum pro COMP:**
- Required: `name`, `purpose`, `props/inputs`, `variants`, `states`, `accessibility` (ARIA, keyboard, focus), `usage constraints`, `dependencies`
- Conditional: i18n (jen pokud má text), data binding (jen pokud má data), event emissions

**Doporučení:** Adoptovat jako povinné minimum. Conditional sekce jsou "include only if applicable", ale rules-*.md vyžaduje explicitní rozhodnutí (ne implicitní vynechání).

**Rozhodnutí: ⬜ Adoptovat minimum ⬜ Upravit**

---

### 4.6 Design system reference

**Otázka:** COMP odkazuje na "design system". Co to znamená v repu?

**Volby:**
- **Volba A:** Externí Figma / Storybook URL v frontmatteru COMP (`design_source:`). Repo neudržuje design system definici.
- **Volba B:** Samostatná vrstva `DS` (Design System) — nová kanonická vrstva, vlastní rules + template. Ale to je structural change → musí jít samostatným AMENDMENT-PLAN, ne pod Batch 4.
- **Volba C:** Volný markdown v `specs/<module>/ux/design-notes.md` bez rules. Žádný formální layer.

**Doporučení:** Volba A pro Batch 4. Design system jako kanonická vrstva je samostatné rozhodnutí (Batch 8 nebo později). `design_source:` field je optional v COMP frontmatteru, takže pokud design system neexistuje, COMP funguje bez něj.

**✅ Rozhodnuto 2026-05-19: Volba A** — externí URL (Figma / Storybook) v COMP frontmatteru jako `design_source:`, žádná samostatná DS vrstva v Batch 4.

---

### 4.7 Copy key katalogizace

**Otázka:** Jak strukturovat `copy.md`?

**Navržená struktura:**

```yaml
# frontmatter
doc_id: COPY-<module-slug>
canonical_layer: COPY
module: <module-slug>
language: cs | en | multi

# body sections
## Labels
  table: key | text | usage (WIRE/COMP ref)
## Helper texts
## Empty states
## Loading texts
## Error / validation messages
  table: key | text | trigger (BR/EN invariant ref)
## CTAs
## Microcopy conventions (module-specific)
```

**Klíčová konvence:** klíče jako `<module>.<screen-or-component>.<role>` (např. `payments.checkout.submit-cta`). i18n-friendly, kolize odhalí build / lint.

**Rozhodnutí: ⬜ Adoptovat strukturu ⬜ Upravit**

---

### 4.8 Umístění project-level IA

**Otázka (vyplynula z §4.1):** Kde fyzicky žije project-level IA dokument?

**Volby:**
- **Volba A:** `docs/program/ia.md` — vedle `project-brief.md`, `architecture-overview.md`, `module-map.md`. Sémanticky: IA je program-level architektonický artefakt analogický k architecture-overview.
- **Volba B:** `docs/program/ux/ia.md` — `docs/program/ux/` jako vyhrazená UX podsložka pro program-level UX artefakty.
- **Volba C:** `specs/_shared/ux/ia.md` — IA žije vedle sdílených komponent v `specs/_shared/ux/`.

**Doporučení: B** — `docs/program/ux/ia.md`.
- Konzistentní s adresářovou konvencí `docs/program/` pro program-tier artefakty.
- Otevírá místo pro budoucí program-level UX artefakty (např. global navigation patterns, brand voice guidelines).
- `specs/_shared/` zůstává čistě pro sdílené per-instance artefakty (komponenty), ne pro program-tier dokumenty.

**Dopad:** `docs/program/ux/` musí být registrované v CLAUDE.md § Minimum Artifacts pod Mode P.

⬜ **Operátor potvrzení potřeba:** A / B (doporučené) / C.

---

### 4.9 COPY granularita (neuzavřeno §4.1)

**Otázka:** §4.1 určilo granularitu pro IA, WIRE, COMP. COPY zůstává otevřená.

**Volby:**
- **Volba A — per-modul agregát:** `specs/<module>/ux/copy.md` jeden per modul, obsahuje labels/microcopy/validation pro WIRE+COMP toho modulu.
- **Volba B — per-modul agregát + program-level shared copy:** modulový `copy.md` pro modul-specific microcopy + `docs/program/ux/copy-shared.md` pro globální texty (CTA, validation conventions, brand voice texts).
- **Volba C — project-level jediný copy.md:** všechen text v jednom `docs/program/ux/copy.md` (jako IA).

**Doporučení: B** — texty mají paralelní strukturu s komponentami: část je sdílená (globální CTA, "Submit", "Cancel", standardní validation messages), část je modul-specific (doménové labely, dialogy). Konzistentní s rozhodnutím §4.3 o sdílení komponent.

**Závislost:** pokud §4.3 ownership rules vyžadují cross-module schválení pro shared COMP, totéž platí pro shared COPY.

⬜ **Operátor potvrzení potřeba:** A / B (doporučené) / C.

---

### 4.10 Mode P gate pro IA authoring

**Otázka (vyplynula z §4.1):** Mode P dnes nemá gate pro IA. Jak ho přidat?

**Volby:**
- **Volba A — rozšířit P1 Architecture Overview:** P1 dnes produkuje `architecture-overview.md`. Rozšířit purpose: P1 produkuje architecture-overview + IA (paralelně, analytik/architekt + UX).
- **Volba B — nový Gate P-UX:** samostatný gate mezi P1 a P2, vyhrazený pro UX framing. Output: `ia.md`. Owner: UX lead + `IAAuthor` (Batch 5 role).
- **Volba C — IA jako Gate P4:** přidat na konec P-sekvence (P0 → P1 → P2 → P3 → P4-UX).

**Doporučení: B** — nový Gate P-UX (mezi P1 a P2).
- Sémanticky: IA závisí na architecture-overview (rozumí systémovým hranicím) a předchází module decomposition (P2 — IA může ovlivnit, kde leží hranice modulů).
- Owner separation: P1 architekt, P-UX UX lead, P2 architekt + analytik. Žádné role-overloading.
- Lze přeskočit pro projekty bez user-facing surfaces (jako P3 Implementation Streams je optional).

**Dopad:** `constitution.md` § 5.0 Mode P sekvence (z Batch 1), `mode-p.md` Gate sekvence, `CLAUDE.md` § Mode P workflow.

⬜ **Operátor potvrzení potřeba:** A / B (doporučené) / C.

---

## 5. Soubor-by-soubor specifikace

Konkrétní obsah každého souboru bude finalizován až po odsouhlasení §4. Níže je kostra, kterou budou rules-*.md následovat (jednotná s existujícími `rules-EN.md`, `rules-UC.md`, …).

### 5.1 `rules-IA.md` (~80 řádků)

Sekce:
1. Purpose
2. Naming — `IA-<module-slug>` (jeden per modul; pokud §4.1 = agregát)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: IA`, `module`, `status`, `references`)
4. Recommended Structure: Module Scope · Screen Map · Navigation Graph · Entry Points · Exit Points · Cross-Module Boundaries
5. Section Meaning
6. Cross-Layer References (per §4.4)
7. Quality Bar — IA musí pokrýt všechny UC entry actors, žádná visačka bez UC.

### 5.2 `rules-WIRE.md` (~150 řádků)

Sekce:
1. Purpose
2. Naming — `WIRExxxx – <Screen Name>` (per-instance; pokud §4.1 = per-instance)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: WIRE`, `module`, `screen_id`, `status`, `references`, `realizes_uc`)
4. Recommended Structure: Purpose · Layout Zones · Components Used · Interactions · States (default/empty/loading/error) · Validation Surfaces · Data Bindings · Conditional Visibility · Accessibility Notes
5. Section Meaning (každá sekce detailně)
6. Cross-Layer References (per §4.4 + §4.5)
7. Required state coverage (per §4.5)
8. Quality Bar

### 5.3 `rules-COMP.md` (~120 řádků)

Sekce:
1. Purpose
2. Naming — `COMPxxxx – <Component Name>` (per-instance)
3. Required Frontmatter (`doc_id`, `title`, `canonical_layer: COMP`, `module`, `status`, `references`, `design_source` (optional, per §4.6))
4. Recommended Structure: Purpose · Props/Inputs · Variants · States · Events · Accessibility · Usage Constraints · Dependencies · Composition · Examples
5. Section Meaning
6. Cross-Layer References (per §4.4)
7. Accessibility minimum (per §4.5 — ARIA, keyboard, focus management)
8. Quality Bar

### 5.4 `rules-COPY.md` (~60 řádků)

Sekce:
1. Purpose
2. Naming — `COPY-<module-slug>` (agregát per modul)
3. Required Frontmatter (`doc_id`, `canonical_layer: COPY`, `module`, `language`, `status`)
4. Recommended Structure (per §4.7)
5. Key naming convention (per §4.7)
6. Cross-Layer References (per §4.4)
7. Quality Bar — žádný key bez WIRE/COMP odkazu; žádný validation message bez BR/EN trigger.

### 5.5 Templates — `template-IA.md`, `template-WIRE.md`, `template-COMP.md`, `template-COPY.md`

Každý template je prázdná kostra odpovídající rules-*.md `Recommended Structure`, s placeholder hodnotami (`<...>`). Form factor identický s `template-EN.md` / `template-UC.md`.

---

## 6. Změny v `CLAUDE.md`

### 6.1 § Canonical Documentation Layer Rule — odstranit transition note

**Současný stav** ([CLAUDE.md:343](../../CLAUDE.md#L343)):
```
Note: rules and templates for IA, WIRE, COMP, COPY layers are introduced by Batch 4
of the foundation amendment (`toolingDocs/rules-{IA,WIRE,COMP,COPY}.md` and
`toolingTemplates/template-{IA,WIRE,COMP,COPY}.md`). Until Batch 4 lands, these
layers are registered as canonical but their authoring rules are pending.
```

**Změna:** Odstranit celý odstavec (po landingu Batch 4 je obsolete).

### 6.2 § Canonical Documentation Layer Rule — případně doplnit naming conventions

Pokud §4.1 finalizuje granularitu, doplnit krátkou tabulku per layer:

| Layer | File pattern |
|---|---|
| IA | `IA-<module>` (agregát per modul) |
| WIRE | `WIRExxxx-<name>` (per obrazovka) |
| COMP | `COMPxxxx-<name>` (per komponenta) |
| COPY | `COPY-<module>` (agregát per modul) |

---

## 7. Co Batch 4 NEDĚLÁ (explicit out-of-scope)

- ❌ Nevytváří role v `agents/ux/**` (Batch 5: `IAAuthor`, `WireframeAuthor`, `ComponentSpecAuthor`, `CopySpecAuthor`)
- ❌ Nevytváří `.claude/agents/ux-*` subagent registrace (Batch 5)
- ❌ Nepatchuje `docs/governance/trigger-matrix.md` (Batch 2 — routing pro IA/WIRE/COMP/COPY)
- ❌ Nepatchuje `docs/governance/impact-classes.md` (Batch 2)
- ❌ Nepatchuje `docs/governance/definition-of-done.md` (Batch 2 — DoD detailing pro UX artefakty)
- ❌ Nezavádí `specs/_shared/` sdílení komponent napříč moduly (samostatný governance event)
- ❌ Nezavádí novou kanonickou vrstvu `DS` (Design System) — odloženo
- ❌ Nevytváří `.specify/templates/ux-*-template.md` slice-level scaffolding (Batch 3, pokud bude potřeba)
- ❌ Neměnit ani jednu existující `rules-*.md` ani `template-*.md` (žádný regress na analytické vrstvy)
- ❌ Žádný produkční kód, žádný branch creation

---

## 8. Finalizovaná rozhodnutí

| Rozhodnutí | Volba | Status |
|---|---|---|
| §4.1 Granularita IA/WIRE/COMP/COPY | IA project-level, WIRE+COMP per-instance, COPY viz §4.9 | ✅ 2026-05-19 |
| §4.2 Umístění per-instance souborů | A — podsložky `wireframes/`, `components/` (doporučené) | ⬜ čeká |
| §4.3 Sdílení komponent napříč moduly | B — `specs/_shared/ux/components/` + možnost modul-specific | ✅ 2026-05-19 (umístění detail v §4.3 čeká) |
| §4.4 Cross-layer references | Adoptovat doporučenou tabulku (doporučené) | ⬜ čeká |
| §4.5 Accessibility + state coverage | Adoptovat minimum (doporučené) | ⬜ čeká |
| §4.6 Design system reference | A — externí URL v frontmatteru | ✅ 2026-05-19 |
| §4.7 Copy key katalogizace | Adoptovat strukturu (doporučené) | ⬜ čeká |
| **§4.8 Umístění project-level IA** | **B — `docs/program/ux/ia.md` (doporučené)** | ⬜ **nové, čeká** |
| **§4.9 COPY granularita** | **B — per-modul + program-level shared (doporučené)** | ⬜ **nové, čeká** |
| **§4.10 Mode P gate pro IA** | **B — nový Gate P-UX (doporučené)** | ⬜ **nové, čeká** |
| **Batch split (4a/4b)** | **Rozdělit na strukturální + rules+templates (doporučené)** | ⬜ **nové, čeká** |
| Constitution version bump | v1.0.0 → v1.1.0 (minor) — pravděpodobně major (v2.0.0) kvůli IA přesunu | ⬜ čeká přehodnocení |
| Method | Direct editing (Cesta A) | ✅ implicitní per Batch 1 precedent |
| Branch / commit policy | Žádný feature branch — framework amendment commit přímo na `main` | ⬜ čeká potvrzení |

---

## 9. Po schválení rozhodnutí v §4

Sekvence prací po operátorově GO na rozhodnutí §4 + §8:

1. **Napsat `rules-COPY.md`** (nejjednodušší — kalibrace formátu)
2. **Napsat `rules-IA.md`** (taky agregát, menší)
3. **Napsat `rules-WIRE.md`** (nejnáročnější — state coverage, interaction patterns)
4. **Napsat `rules-COMP.md`** (variants, accessibility)
5. **Napsat 4 templates** (`template-IA.md`, `template-WIRE.md`, `template-COMP.md`, `template-COPY.md`)
6. **Patch `CLAUDE.md`** — odstranit transition note (§6.1), případně přidat naming tabulku (§6.2)
7. **Patch `constitution.md`** — version bump v1.1.0, krátká note v § 21
8. **Sanity check** — `grep -r "IA\|WIRE\|COMP\|COPY"` napříč repem, ověřit konzistenci

Reportování po dokončení:
- diff summary,
- ověření konzistence napříč 8+ soubory,
- návrh start Batch 5 (UX agent roles).

---

## 10. Quality bar (pre-merge)

Batch 4 je merge-ready, když:

1. Všech 8 souborů existuje a má frontmatter dle konvence (`doc_id`, `canonical_layer`, …).
2. Každý `rules-*.md` má sekce: Purpose, Naming, Required Frontmatter, Recommended Structure, Section Meaning, Cross-Layer References, Quality Bar.
3. Každý `template-*.md` přesně odpovídá `Recommended Structure` ve svém `rules-*.md`.
4. `CLAUDE.md` neobsahuje žádný odkaz na "Batch 4 pending" / "until Batch 4 lands".
5. Žádná existující `rules-*.md` ani `template-*.md` nebyla modifikována (žádný regress).
6. Konstituční version bump zapsán v hlavičce + záznam v changelog sekci (pokud existuje).

---

## 11. Po dokončení Batch 4

Tento plán lze:
- ponechat jako historický záznam vedle [AMENDMENT-PLAN-batch-1.md](AMENDMENT-PLAN-batch-1.md),
- nebo přesunout do `docs/archive/` (analogicky jako se navrhuje pro Batch 1 po dokončení).

Status v hlavičce přepsat na `✅ Completed — Batch 4 applied <datum>`.
