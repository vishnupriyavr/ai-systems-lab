# Week 4 Limitations and Production Gaps

1. Evidence is synthetic or public and does not reproduce live SOC base rates, tenant behavior, or analyst workload.
2. Retrieval is closed-world and has no live SIEM, EDR, CMDB, ticketing, or threat-intelligence connector.
3. Natural-language MCP planning is not evaluated; application code creates typed requests.
4. LoRA failed its routing, schema, and high-risk review gates and has no routing authority.
5. Rules were safer in this evaluation but remain incomplete in severity and ATT&CK coverage.
6. Retrieval success covers supported exact lookups, not semantic search or changing production indexes.
7. Grounding is structural and does not prove every security inference is semantically complete.
8. Latency, throughput, tokens, and compute hours are local observations, not deployment SLOs.
9. Monetary cost is unavailable because a defensible full-cost rate was not measured.
10. Audit binding lacks production append-only storage, signing, RBAC, retention, and transactional approval protection.
11. Analyst usability, effectiveness, time saved, and decision quality were not measured.
12. No tool can execute remediation. A future execution system requires a separate threat model, authorization service, least-privilege connectors, replay protection, and independent release gates.
