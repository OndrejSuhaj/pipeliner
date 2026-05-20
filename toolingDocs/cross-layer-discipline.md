# Cross-Layer Authoring Discipline

Shared discipline for all canonical authored docs in `_ar/BA/**` and `_ar/UX/**`. Per-layer specifics live in `rules-<LAYER>.md`.

## 1. Reference, do not restate

Claims derived from another canonical layer use `doc_id` reference (in `references:` frontmatter and inline mentions), not inline content.

Examples:
- An **IA** doc references `UC0014` for an entry point. It does NOT restate the use case body.
- A **WIRE** doc references `EN0004` for an entity displayed. It does NOT enumerate attributes.
- A **COMP** doc references `ACL0002` for role-gated visibility. It does NOT inline access rules.
- A **COPY** doc references `BR0011` for validation triggers. It does NOT restate the rule.

## 2. Verify references before authoring

Each cited `doc_id` must resolve to an existing entry in the target layer's `_REGISTRY.md` BEFORE the citing doc is written. Authoring against a non-existent `doc_id` is a dangling reference.

Dangling references block slice DoD (per constitution § 17.5 `_ar/` authoring integrity).

When a needed `doc_id` does not exist:
- At Mode P Gate P-UX: seed the foundational doc in `_ar/BA/{ARCH,EN,BR}/` first (return to P1), OR mark as Open Question in the IA.
- At Mode M Gate M2/M3: author the seed in `_ar/BA/` at M1b first, OR mark as Open Question.
- At Mode B: declare the new doc in slice manifest `touches: create:` block.

## 3. Surface unknowns as Open Questions

Do NOT:
- Infer role/action capability from prototype alone ("admin can X")
- Default to "scoped admins" or similar untraceable claims
- Enumerate dynamic configuration values (status enums, pricing tiers, role lists)
- Describe two unresolved behavior paths as if both are operational

DO surface as the doc's `## Open Questions` section (or equivalent) with named decider.

Empty `Open Questions` in MVP phase = suspicion of silently-decided assumptions. Re-review claims.

## 4. Prototype is suggestive, not authoritative

`docs/program/spec/prototype.*` files (HTML mockups, Figma exports, design demos) or any visual reference are evidence of design **intent**, not canonical truth.

Authority precedence on contradiction:
1. `project-brief.md` (operator decision)
2. `architecture-overview.md` (program-wide ADRs)
3. Existing canonical `_ar/BA/{EN,BR,ARCH,ACL,UC}/` content
4. Prototype evidence

When brief is silent and prototype shows a behavior, the question is **open** — do not silently elevate prototype detail to canonical truth.

## 5. Layer-specific NOT-FOR rules

See `toolingDocs/rules-<LAYER>.md` for each layer's explicit boundary list (what that layer must NOT contain because it belongs in a different layer).

Quick reference:
| Doc kind | Refers to (doc_id ref only) | Never contains inline |
|---|---|---|
| IA | EN, BR, ARCH, UC, ACL, ES, API | entity attributes, business rules, ADRs, endpoints, providers |
| WIRE | EN, BR, UC, QUERY, COMP, COPY | entity attributes, business rule content, component contracts, text |
| COMP | EN, ACL, COMP (sub), API | entity attributes, access rules, child component contracts, text |
| COPY | EN, BR, UC, WIRE, COMP | entity attributes, business rule content, screen logic, component contracts |
| EN | BR, EN (relationships) | use case flows, screen layouts, API endpoints |
| UC | EN, BR, ACL, API, ES, JOB | entity attributes, screen layouts, API contracts |
| BR | EN, UC | screen logic, API contracts |
| ARCH | (program-level only) | per-module details, screen layouts |

## 6. Module-boundary discipline

When a UX-tier doc (IA / WIRE / COMP / COPY) or analytical doc surfaces module-boundary implications that don't match `docs/program/module-map.md`, surface as escalation:
- IA → Mode P Gate P2 (or Gate P-R for re-frame)
- WIRE/COMP/COPY → Mode M Gate M3 (or Mode P Gate P-R if cross-module)

Do not silently override module boundaries by writing docs that imply different ownership.

## 7. Sources / evidence per claim

Every major claim in a canonical doc should trace to a source. Acceptable sources:
- `docs/program/project-brief.md` (operator decision)
- `docs/program/architecture-overview.md` (ADR / NFR / baseline)
- referenced `_ar/<tier>/<layer>/<doc>.md` (canonical)
- operator decision recorded in a gate output (P0/P1/M1b/M3)
- prototype reference (acceptable as evidence of intent, NOT confirmation of canonical)

Claims without traceable source MUST be in `Open Questions` section.

## 8. Enforcement (current state)

These rules are enforced manually at gate review (program-bootstrap subagent for IA, module-orchestrator for WIRE/COMP/COPY, spec-creator for slice-tier `_ar/` touches).

Future: dedicated lint/validator subagent (e.g. `ia-validator`, `wire-validator`) checking:
- `references:` resolution against `_REGISTRY.md`
- forbidden inline patterns (HTTP endpoints, provider names, enumerated config values)
- mandatory Open Questions section non-empty in MVP phase

When such validators exist, they will be invoked as the final step of the relevant gate before completion.
