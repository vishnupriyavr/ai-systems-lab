# Week 1: From Thesis to Architecture

Week 1 established the system boundaries before expanding the AI experience.

## Delivered privately

- eight supported scenarios and 50 synthetic golden alerts
- OCSF 1.8.0 normalization with typed validation
- eight thin, typed, read-only FastMCP contracts
- threat model and working vertical slice
- 60 passing automated tests

## Decisions

1. Normalize before routing, retrieval, or model access.
2. Derive schemas from typed runtime models.
3. Separate structured triage from deeper investigation.
4. Compare rules, prompted SLMs, and fine-tuning on one evaluation set.
5. Keep changing knowledge in versioned retrieval sources.
6. Keep MCP thin and policy-governed.
7. Treat alerts and retrieved content as untrusted data.
8. Separate recommendation from approval; require review for high/critical alerts.

## Dataset direction

Targeted OTRF and Splunk attack telemetry, MITRE ATT&CK, Sigma rules, and synthetic SOC context cover the V1 scenarios reproducibly. Live threat feeds and broader network datasets are deferred.

## Next

Implement tool behavior and establish deterministic and prompted-model baseline benchmarks. Results will be published only with denominators, environment details, limitations, and failure analysis.
