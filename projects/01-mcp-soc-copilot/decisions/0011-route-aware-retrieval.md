# ADR 0011: Retrieve After Governance and Budget by Route

Status: accepted

## Decision

Finalize the governed route before retrieving changing context. Authorized fast paths perform no retrieval. Deep investigations retrieve threat, asset, and incident context. Analyst-review paths may additionally retrieve an advisory playbook.

## Why

Retrieving everything for every alert adds latency, cost, and poisoning surface. More importantly, retrieved text must remain context—not policy input. A malicious or stale playbook cannot lower the route, claim approval, or change authorization.

## Consequences

The system is less agentic but more attributable. Retrieval failures remain explicit as `empty` or `unavailable`. Later transitions from investigation to response guidance must enter analyst review rather than silently expanding tool scope.
