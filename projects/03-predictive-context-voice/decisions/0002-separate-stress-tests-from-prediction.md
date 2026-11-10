# Decision 0002: Separate Ticket Stress Tests from Prediction Evaluation

Status: accepted at Week 1 close.

## Context

The 500 adapted tickets provide bounded domain examples and retrieval failures. They contain no authoritative next-turn labels, and their current scenario labels are machine-generated.

## Decision

Retain tickets as secondary stress-test data. Use reviewed multi-turn conversations as the primary predictive benchmark, with transition labels, context permissions, partial transcripts and ambiguity cases. Keep synthetic coverage-gap cases explicitly marked and separate from source-derived records.

## Consequences

Ticket retrieval agreement cannot be presented as next-state accuracy or predictive benefit. The primary benchmark requires additional review effort before paired reactive/predictive conclusions are defensible. Every later result must identify its benchmark role and label provenance.
