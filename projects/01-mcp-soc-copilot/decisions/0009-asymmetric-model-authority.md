# ADR 0009: Use Asymmetric Model Authority

Status: accepted

## Decision

The model may propose scenario, severity, disposition, route, evidence references, and a rationale. Typed code validates. Deterministic policy authorizes or escalates. Humans retain sensitive decisions.

A proposal can be made more restrictive without model permission. It cannot enter a fast path without independently recognized structured evidence. Missing rule coverage is uncertainty, not an automatic reason to replace a valid investigation proposal.

## Why

The first governed Week 3 evaluation reused a full rules classifier as a blanket veto. Its fallback overrode valid model investigation routes, creating 60 overrides and reducing governed routing accuracy to 37.5%. Replacing that competing classifier with explicit safety invariants produced a more accurate ownership boundary without weakening high-risk protection.

## Consequences

Governance becomes more precise but requires explicit, testable invariants. Aggregate governed accuracy can fall when a dataset expects fast paths without carrying the structured evidence needed to authorize them; that discrepancy is reported as a contract gap rather than hidden by relaxing policy.
