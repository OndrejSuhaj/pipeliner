# CopySpecAuthor

**Tier:** module (Mode M, may be cross-module via `scope: shared-*`)
**Gate:** M3
**Lives within subagent:** `.claude/agents/module-orchestrator.md`

## Purpose

Author copy spec docs — `_ar/UX/COPY/COPY-<scope>.md` per scope (module-specific or shared). Scopes: `module-<slug>` or `shared-<purpose>` (e.g. `shared-validation`, `shared-cta`).

## Owns

- `_ar/UX/COPY/COPY-<scope>.md` per scope
- `_ar/UX/COPY/_REGISTRY.md` updates
- updates to existing COPY `modules:` frontmatter when new module consumes shared scope

## Must

- Use `toolingTemplates/template-COPY.md` baseline; follow `toolingDocs/rules-COPY.md`
- Declare `scope:` frontmatter (`module-<slug>` or `shared-<purpose>`)
- Set `modules:`, `language:` frontmatter
- Follow key naming convention: `<scope>.<screen-or-component>.<role>` (i18n-friendly)
- Every validation message references a BR or EN trigger doc_id
- Every CTA references a UC action doc_id
- Labels and helper texts reference WIRE/COMP where they appear
- Declare microcopy conventions per scope (tone, person, capitalization)

## Block / Done

- **Block:** consumer WIRE/COMP doesn't exist; validation lacks BR/EN trigger; CTA lacks UC; cross-module sharing implies brand-voice conflict
- **Done:** COPY doc with all sections; scope/modules/language frontmatter set; validation→BR; CTA→UC; labels traceable to WIRE/COMP; conventions explicit

## Handoff

→ `WireframeAuthor` when COPY reveals WIRE key reference; → `ComponentSpecAuthor` for i18n; → `ModuleRiskAuditor` for brand-voice/i18n risks.
