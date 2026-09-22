# ADR 0012: Enforce Structural Grounding

Status: accepted

## Decision

Build summaries from bounded typed context. Separate observed alert facts, retrieved claims, model inference, deterministic mapping, recommendations, and uncertainty. Require resolvable OCSF paths and record-level retrieval provenance.

## Why

A stronger prompt cannot prove where each claim originated. Typed sections and exact references make provenance testable and prevent unsupported sources or fabricated paths from entering an accepted summary.

## Consequences

Oversized or unapproved context is rejected rather than silently truncated. The system can demonstrate structural grounding, but must not claim that citations prove every semantic interpretation is correct.
