# Week 4 Integrated-System Evaluation

## Independent triage benchmark

The same 200 frozen synthetic alerts were evaluated once with deterministic rules, prompted Qwen 2.5 3B, and the selected LoRA adapter.

| Measure | Rules | Prompted 3B | LoRA 3B |
| --- | ---: | ---: | ---: |
| Schema validity | 200/200 (100%) | 179/200 (89.5%) | 177/200 (88.5%) |
| Raw routing | 187/200 (93.5%) | 125/200 (62.5%) | 162/200 (81.0%) |
| Governed routing | 187/200 (93.5%) | 149/200 (74.5%) | 162/200 (81.0%) |
| Severity accuracy | 138/200 (69.0%) | 111/200 (55.5%) | 162/200 (81.0%) |
| Evidence completeness | 200/200 (100%) | 179/200 (89.5%) | 177/200 (88.5%) |
| Exact abstention | 25/25 (100%) | 19/25 (76.0%) | 25/25 (100%) |
| ATT&CK candidate recall | 38/100 (38.0%) | 25/100 (25.0%) | 68/100 (68.0%) |
| High-risk review misses, raw / governed | 0 / 0 | 48 / 5 | 15 / 15 |
| Authentication fast-path errors, raw / governed | 0 / 0 | 2 / 0 | 0 / 0 |
| Policy overrides | 0 | 68 | 0 |
| Mean / P95 inference latency | 0.02 / 0.02 ms | 17.02 / 20.32 s | 5.44 / 6.00 s |
| Input / output tokens | 0 / 0 | 300,220 / 63,021 | 300,220 / 14,709 |

LoRA gained 18.5 percentage points in raw routing, 25.5 points in severity, and 43 points in ATT&CK recall over prompted inference. It reduced output tokens by 76.7% and mean inference latency by approximately 68%.

Those improvements did not satisfy the declared 90% routing and 99% schema-validity gates. Fifteen accepted high-risk credential-access proposals remained outside mandatory analyst review after governance. The production and autonomous-routing decision is therefore no-go.

Rules were the strongest V1 router in this evaluation, but not a complete security solution: all 13 routing errors occurred in suspicious-script cases, severity accuracy was 69%, and ATT&CK recall was 38%.

## Retrieval and grounding

The 16 supported typed retrieval questions achieved:

- 100% expected-record recall
- 100% returned-record precision
- 100% supported-query coverage
- 100% provenance completeness

The 12 boundary cases passed stale-data detection, empty-result behavior, conflicting-snapshot rejection, unsupported-source rejection, and poisoned-instruction isolation. No poisoned retrieved instruction changed route or authorization.

These are closed-world exact-lookup and structural-grounding results. They do not measure vector search, live feeds, arbitrary natural-language planning, changing indexes, or semantic correctness of every paraphrase.

## Deterministic workflow performance

On the local macOS arm64/Python 3.12.4 environment:

- serial deterministic workflow P50/P95: 0.147/0.205 ms across 200 alerts;
- concurrency-four run: 200/200 completed with no failures in 0.0438 seconds;
- observed local throughput: approximately 4,565 alerts/second.

These figures exclude model inference, networked MCP transport, external systems, queues, durable audit storage, and analyst time. They are implementation baselines, not production capacity claims.

## Compute and cost accounting

Prompted inference used 0.946 measured compute hours; LoRA used 0.302 hours across 200 alerts. Local execution had no external API invoice, but monetary cost per 10,000 alerts is reported as unavailable—not zero—because hardware depreciation, energy, labor, storage, networking, and production operations were not measured.

## Final decision

- Continue the controlled prototype and route-aware typed retrieval.
- Keep deterministic rules and policy authoritative for V1.
- Mark LoRA `REVISE`; do not grant it routing authority.
- Keep prompted inference as a comparison baseline only.
- Preserve human decisions and audit binding.
- Reject autonomous routing, production-readiness claims, and remediation execution.

## Limitations

- All alerts are synthetic or public and do not represent live SOC base rates or workload.
- Retrieval uses pinned local snapshots, not live SIEM, EDR, CMDB, ticketing, or threat-intelligence connectors.
- Natural-language MCP planning was not evaluated.
- Structural citations do not prove complete semantic correctness.
- Performance is local and workload-specific; no deployment SLO was established.
- Audit records are content-bound but not stored in a production append-only, signed, RBAC-controlled system.
- Analyst effectiveness and usability were not measured.
- No remediation execution exists.
