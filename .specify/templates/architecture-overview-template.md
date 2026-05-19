# Architecture Overview: [PROJECT NAME]

**Project Slug**: `[project-slug]`
**Created**: [DATE]
**Last Updated**: [DATE]
**Status**: Draft
**Mode**: `P — Program Bootstrap`
**Authored at**: Gate P1 — Architecture Overview
**Depends on**: `project-brief.md`

## Architectural Style

[Pick one explicitly: monolith, modular monolith, service-oriented, microservices, event-driven, hybrid, …]

**Why this style**: [Short justification rooted in `project-brief.md` constraints.]

**What this style explicitly rules out**: [Approaches considered and rejected, with reason.]

## High-Level System Diagram

[ASCII diagram or link to externally-maintained diagram. The diagram should show modules, external systems, primary data flows. Keep it small enough to fit on one screen.]

```
[ASCII or pseudo-diagram]
```

## External Systems and Integration Boundaries

| External system | Direction | Protocol / contract | Integration owner | Notes |
|---|---|---|---|---|
| [System A] | inbound / outbound / both | [REST / GraphQL / webhook / message bus / file drop] | [Module that owns the integration] | [SLA, rate limits, auth model] |
| [System B] | [direction] | [protocol] | [owner] | [notes] |

## Shared Infrastructure Assumptions

| Infrastructure | Choice | Reason | Risk if changed |
|---|---|---|---|
| Persistence | [PostgreSQL / MySQL / DynamoDB / …] | [reason] | [risk] |
| Messaging | [Kafka / Redis / Pub-Sub / none] | [reason] | [risk] |
| Identity | [Auth0 / Keycloak / custom / none] | [reason] | [risk] |
| File storage | [S3-compatible / local / none] | [reason] | [risk] |
| Cache | [Redis / in-memory / none] | [reason] | [risk] |

## Non-Functional Requirements

### Performance
- [Throughput, latency, response-time targets per critical path]

### Availability
- [Uptime SLO, recovery objectives, degradation expectations]

### Security Posture
- [Authentication model, authorization model, tenant isolation, secret management, audit requirements]

### Observability
- [Logging, metrics, tracing, alerting expectations]

### Operational Sustainability
- [Backup / restore, runbook expectations, on-call expectations]

## Architectural Decisions Log

Record irreversible architectural choices ADR-style. Each entry has a unique identifier and a status.

### ADR-001 — [Decision title]
- **Status**: `proposed | accepted | superseded by ADR-xxx`
- **Context**: [Why was this decision needed]
- **Decision**: [The choice made]
- **Consequences**: [What follows from this choice]
- **Alternatives considered**: [What was rejected and why]

### ADR-002 — [Decision title]
- **Status**: `proposed | accepted`
- **Context**: …
- **Decision**: …
- **Consequences**: …
- **Alternatives considered**: …

## Known Architectural Risks

- **AR-001** — [Risk]: [Description, severity, mitigation thinking]
- **AR-002** — [Risk]: [Description]

## What This Overview Does Not Decide

These belong to module-level Mode M, not program-level Mode P:

- module-internal architecture
- specific data schema shapes
- specific API endpoint signatures
- per-slice implementation choices
- UI component implementation

## Downstream Inputs

This overview is consumed by:
- `module-map.md` (Gate P2) — module decomposition must respect these constraints
- per-module `module-plan.md` — module architecture must align with this overview
- Mode A repo onboarding — for baseline architecture mapping

## Amendment History

| Date | Trigger | Re-frame authorization | Summary of change |
|---|---|---|---|
| [DATE] | initial bootstrap | n/a | initial draft |
