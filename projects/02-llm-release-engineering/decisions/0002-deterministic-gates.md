# ADR 0002: Make Deterministic Gates Authoritative

Status: accepted

## Decision

Use deterministic contract, domain, and safety checks as authoritative release gates wherever the expected behavior can be expressed mechanically. Keep model-based semantic judging optional and advisory until calibrated against human judgments.

## Why

An initial semantic-judge experiment returned uniformly perfect scores despite disagreements detected by deterministic evaluators. That result did not provide credible evidence for release control. A critical safety invariant—zero high-risk fast-path misses—must not be diluted by an aggregate quality score.

## Trade-offs

Deterministic metrics require authoritative labels and cannot capture every qualitative property. Semantic evaluation may later add useful coverage, but it needs a representative human-labeled calibration set, agreement analysis, and documented failure behavior before it can influence release authority.
