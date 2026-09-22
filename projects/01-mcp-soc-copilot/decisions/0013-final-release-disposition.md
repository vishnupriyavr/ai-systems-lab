# ADR 0013: Continue the Prototype; Reject Production Routing

Status: final four-week sprint decision

## Decision

Continue typed validation, rules-authoritative policy, pinned ATT&CK mapping, route-aware MCP retrieval, cited summaries, human decisions, and audit binding. Mark LoRA `REVISE` with no routing authority. Reject production/autonomous routing and remediation.

## Evidence

Rules achieved 93.5% routing with zero high-risk review misses on 200 frozen alerts. LoRA materially improved over prompted inference but achieved only 81% routing, 88.5% schema validity, and 15 governed high-risk review misses. Supported typed retrieval and provenance tests passed within their closed-world scope.

## Consequences

The final architecture differs from the opening thesis: the model is not the router of record. The sprint preserves useful model adaptation and retrieval while keeping authority with verifiable software controls and people. Any future production reconsideration requires new behavior-diverse training data, a fresh untouched evaluation set, live-integration controls, deployment SLOs, durable audit infrastructure, and independent security review.
