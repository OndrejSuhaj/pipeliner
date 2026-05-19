# Impact Classes

## 1. Purpose

This document defines the impact classes used to classify delivery work.

It answers four questions:

1. how risky the change is,
2. how much rigor is required,
3. whether lightweight handling is allowed,
4. when escalation or reclassification is required.

This document is a severity layer.

It does not redefine:
- the constitution,
- protected areas,
- routing rules,
- or definition of done.

---

## 2. Authority

Priority order:

1. `constitution.md`
2. `guardrails.md`
3. `impact-classes.md`
4. `trigger-matrix.md`
5. `definition-of-done.md`
6. feature artifacts
7. agent instructions

If this document conflicts with a higher artifact, the higher artifact wins.

---

## 3. Classification Rules

### 3.1 Classify by effect
Classify by actual impact, not by wording such as:
- “small”
- “quick”
- “just UI”

### 3.2 Highest risk wins
If more than one class is plausible, use the stricter class until clarified.

### 3.3 Uncertainty escalates
If the class cannot be assigned safely, clarify, classify upward provisionally, or block the affected lane.

### 3.4 Protected-area contact dominates
A small change may still be high impact if it touches:
- auth / identity
- ACL / permissions
- tenancy / scoping
- shared contract
- schema-sensitive behavior
- jobs / async
- integrations
- infrastructure
- architecture boundaries

### 3.5 Reclassification is mandatory
If later evidence shows higher impact, reclassify explicitly.
Do not continue under obsolete classification.

---

## 4. Class Summary

| Class | Meaning |
|---|---|
| `IC0` | documentation or non-executable support change |
| `IC1` | local presentation change |
| `IC2` | bounded feature change without protected-area impact |
| `IC3` | contract or shared-behavior change |
| `IC4` | protected-area or cross-boundary change |
| `IC5` | strategic or architecture-sensitive change |

---

## 5. IC0 — Documentation / Non-Executable Support Change

Use `IC0` when the change:
- does not alter executable behavior,
- does not alter runtime behavior,
- does not alter shared contract,
- and does not affect protected areas.

Typical posture:
- lightweight handling may be used,
- review may be simplified,
- implementation lanes are usually not needed.

Escalate if any real system behavior is affected.

---

## 6. IC1 — Local Presentation Change

Use `IC1` when the change:
- is local in surface area,
- is primarily presentation or interaction level,
- uses existing contract behavior,
- uses existing permission behavior,
- and does not affect protected areas.

Must remain true:
- no new contract surface,
- no permission change,
- no tenant/scoping change,
- no hidden cross-client effect.

Escalate if any of the above becomes false.

---

## 7. IC2 — Bounded Feature Change Without Protected-Area Impact

Use `IC2` when the change:
- alters executable behavior,
- is still a bounded feature slice,
- may span multiple lanes,
- but does not change shared contract,
- and does not affect protected areas.

This is the default class for normal feature delivery.

Escalate if:
- shared contract changes,
- protected-area implications appear,
- or the feature stops being a safe bounded slice.

---

## 8. IC3 — Contract or Shared-Behavior Change

Use `IC3` when the change affects:
- GraphQL schema,
- shared types,
- response or mutation shape,
- shared projections,
- or shared behavior expected by multiple consumers.

`IC3` is still bounded delivery, but requires contract-aware handling.

Escalate if the change also affects:
- permissions,
- tenancy,
- schema-sensitive invariants,
- async correctness,
- integration semantics,
- or architecture boundaries.

---

## 9. IC4 — Protected-Area or Cross-Boundary Change

Use `IC4` when the change materially affects one or more protected areas.

This includes:
- auth / identity behavior,
- ACL / permission behavior,
- tenancy / scoping,
- protected shared-contract consequences,
- schema-sensitive persistence behavior,
- jobs / retry / idempotency,
- external integration behavior,
- infrastructure-sensitive behavior,
- or significant cross-client risk.

`IC4` requires stricter handling, stronger visibility, and higher willingness to block.

Implementation in affected lanes must not proceed before required upstream analysis exists.

---

## 10. IC5 — Strategic / Architecture-Sensitive Change

Use `IC5` when the request is too broad or structural for normal feature delivery.

Typical signals:
- redesign of auth, ACL, tenancy, or architecture boundaries,
- multi-epic structural rewrite,
- platform migration hidden inside feature work,
- cleanup that is really redesign.

`IC5` is not a normal implementation class.

Default handling:
- decompose,
- escalate,
- or block.

Normal implementation should not proceed until the work is translated into smaller lower-impact slices.

---

## 11. Lightweight Handling Rule

Lightweight handling is allowed only when all of the following are true:
- class is clearly `IC0` or `IC1`,
- no protected area is touched,
- no shared-contract ambiguity exists,
- runtime verification is straightforward,
- and the lighter path is explicitly justified.

Lightweight handling may reduce:
- clarification depth,
- planning depth,
- review overhead.

It may not bypass:
- constitution check,
- scope discipline,
- uncertainty honesty,
- runtime visibility.

---

## 12. Reclassification Rule

Reclassify when:
- actual work exceeds the original class,
- planning reveals stronger implications,
- shared-contract change appears,
- protected-area impact appears,
- cross-client consequence appears,
- architecture drift appears,
- or the feature becomes too large for bounded delivery.

A reclassification note should state:
- previous class,
- new class,
- reason,
- and newly required handling.

---

## 13. Minimal Artifact Implication

This document does not define full routing or full completion criteria.

It does define this minimum implication:

- `IC0` may use lightweight handling
- `IC1` still requires normal delivery discipline, but proportionate
- `IC2` uses standard feature delivery
- `IC3` requires contract-aware handling
- `IC4` requires protected-area-aware handling
- `IC5` requires decomposition or governance escalation

Detailed routing belongs in `trigger-matrix.md`.
Detailed completion criteria belong in `definition-of-done.md`.

### 13.1 Per-class slice size targets

Slice sizing caps complement these handling implications. Per `CLAUDE.md` § Slice Sizing Discipline:

- `IC0`: ≤ 3 files. Single doc-level surface.
- `IC1`: ≤ 5 files. Single FE/UI surface.
- `IC2`: ≤ 10 files. Single feature surface.
- `IC3`: ≤ 12 files. Single contract surface. Split if more.
- `IC4`: must split — never delivered as a single slice.
- `IC5`: must decompose into IC2/IC3 slices before any implementation.

If the planned scope exceeds the per-class cap, the spec-creator subagent returns a `split-recommendation.md` instead of authoring `spec.md` / `plan.md` / `tasks.md`. Splits become sequential sub-slices that merge to develop one at a time.

The cap counts source files in the implementation diff. It excludes generated/codegen outputs (e.g. `apps/web/src/generated/graphql.ts`) and spec artifacts.

When a slice would naturally exceed its class cap, the correct response is split, not reclassify upward — the impact class is set by the change's effect, not by file count. A slice can be IC3 at 8 files or IC3 at 24 files; the latter must split.

---

## 14. Final Stance

Impact classes exist to apply proportional rigor.

They must prevent both:
- risky under-classification,
- and wasteful over-processing.

When unsure, classify upward, not downward.