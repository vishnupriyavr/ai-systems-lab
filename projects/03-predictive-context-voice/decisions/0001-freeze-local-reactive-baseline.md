# Decision 0001: Freeze the Deterministic Local Reactive Baseline

Status: accepted for Week 1 local baseline v0.1; production stack remains proposed.

## Context

A predictive-context experiment needs a repeatable reactive path and attributable evidence. Production voice and storage integration would introduce additional variables before workload and telemetry contracts were established.

## Decision

Freeze a provider-neutral local baseline using transcript replay, token-vector retrieval, an in-memory graph/cache and prebuilt WAV streaming. Record the executed runtime separately from the proposed production stack. Export versioned, hashed cases and telemetry through the existing Release Engineering Lab contract.

## Consequences

The baseline makes cancellation, tenant checks, provenance and bundle compatibility testable without service dependencies. Its timing cannot stand in for live voice latency, and its substitute components provide no performance evidence about the planned models or databases. Production versions, hardware requirements and integration results need their own evidence before a production-stack freeze.
