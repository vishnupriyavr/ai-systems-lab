# ADR 0006: The Model Proposes; Application Policy Decides

Status: accepted

## Context

On the Week 2 held-out set, the prompted 7B model under-classified two high-risk command-execution alerts and routed them to deeper investigation instead of mandatory analyst review.

## Decision

Treat every model output as a proposal. Apply deterministic safety policy after schema validation and report raw model results separately from governed-system results.

## Consequences

Policy corrected two of 18 routes, raising final routing accuracy from 77.78% to 88.89% while eliminating high-risk review misses. The governed score must never be attributed to standalone model capability. Policy adds implementation and test burden but keeps safety invariants outside probabilistic model behavior.
