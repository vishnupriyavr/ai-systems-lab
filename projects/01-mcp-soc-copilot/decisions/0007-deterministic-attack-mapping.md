# ADR 0007: Keep Authoritative ATT&CK Mapping Deterministic

Status: accepted

## Context

After output ambiguity was removed with a closed list of valid technique IDs, the prompted 7B model abstained on all nine mapped held-out alerts. The versioned deterministic mapper returned supported candidates with evidence and provenance for all nine.

## Decision

The model may propose scenario and triage metadata, but a versioned deterministic catalogue owns authoritative ATT&CK candidates.

## Consequences

The system gives up model autonomy for traceability and reproducibility. Empty mappings remain valid for unsupported evidence, reducing pressure to invent a technique.
