# ADR 0005: Version RAG Sources and Preserve Human Authority

Status: accepted

## Decision

Keep changing security knowledge in versioned retrieval sources. Treat alerts and retrieved content as untrusted. Separate recommendations from approval records, and require human review for all high/critical alerts.

## Why

Versioning makes evaluation reproducible; explicit authority boundaries prevent a model recommendation from becoming an operational action.

## Trade-offs

Human review limits automation and adds latency. That cost is intentional for sensitive decisions.
