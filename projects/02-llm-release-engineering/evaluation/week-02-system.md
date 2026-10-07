# Week 2 Policy and Progressive-Delivery Evaluation

## Outcome

The SOC prompted candidate **failed offline and did not enter canary**. A separate synthetic service demonstrated that the approved delivery path can promote a healthy revision and abort a controlled regression while retaining the prior healthy ReplicaSet.

These are separate findings. The synthetic promotion is not evidence that the SOC model passed, and the rollback demonstration is not a production reliability claim.

## Frozen experiment

- Application source: pinned SOC Copilot revision
- Workload: eight untouched challenge cases, one per supported scenario
- Baseline: deterministic SOC rules
- Candidate: untuned Qwen 2.5 3B
- Pairing: identical case IDs for baseline and candidate
- Provider errors: zero
- Policy: frozen before final evaluation

## Offline comparison

| Metric | Rules | Candidate | Delta |
| --- | ---: | ---: | ---: |
| Schema validity | 8/8 (100%) | 5/8 (62.5%) | -37.5 pp |
| Routing accuracy | 8/8 (100%) | 5/8 (62.5%) | -37.5 pp |
| Severity accuracy | 8/8 (100%) | 3/8 (37.5%) | -62.5 pp |
| Disposition accuracy | 8/8 (100%) | 4/8 (50%) | -50 pp |
| ATT&CK Top-3 recall | 4/4 (100%) | 1/4 (25%) | -75 pp |
| Supported ATT&CK mappings | 8/8 (100%) | 8/8 (100%) | 0 pp |
| Evidence validity | 8/8 (100%) | 8/8 (100%) | 0 pp |
| Review-policy accuracy | 8/8 (100%) | 6/8 (75%) | -25 pp |

The candidate preserved resolvable evidence and returned only allowed ATT&CK identifiers, but allowed identifiers were often incorrect for the case. Its failures included unstable schema casing, severity under-classification, unrelated ATT&CK defaults, and a suspicious privilege-escalation case routed to the fast path.

## Operational comparison

| Measure | Rules | Candidate |
| --- | ---: | ---: |
| Logical requests | 8 | 8 |
| Physical attempts | 8 | 8 |
| Average latency | 0.01 ms | 30,513.65 ms |
| p95 latency | 0.03 ms | 39,365.38 ms |
| Prompt tokens | 0 | 12,694 |
| Completion tokens | 0 | 2,960 |
| Provider errors | 0 | 0 |

The zero monetary-cost result reflects an explicit local-model pricing assumption, not zero compute cost. Latency characterizes this local machine and configuration only.

## Release decision

The candidate breached schema, review-policy, routing, severity, ATT&CK recall, routing-regression, and severity-regression rules. It also provided only eight cases and one model run against requirements of at least 50 cases and three repeats. The decision was `FAIL`; GitOps desired state was unchanged.

The sample was too small for the configured statistical inference. That evidence gap did not convert the result into a pass: the deterministic hard-gate failures and large practical regressions independently blocked release.

## Delivery-control demonstration

### Healthy path

A known-good synthetic revision reported 0.99 task success, zero high-risk misses, zero unsupported claims, and 0.10 p95 latency regression. It passed analysis at the logical 5% and 25% stages and reached 100% with a healthy final state.

### Controlled regression

A later synthetic revision reported 0.80 task success, one high-risk miss, 0.10 unsupported-claim rate, and 0.50 p95 latency regression. It failed at the first logical stage. The failed ReplicaSet was reduced to zero while the previous stable ReplicaSet retained two ready pods.

## Limitations

- Eight cases cannot support production-wide inference or meet the release policy's evidence minimum.
- One model run cannot distinguish stable behavior from flakiness.
- The local two-replica setup did not implement exact request-weighted traffic splitting.
- The deployed workload and metrics were synthetic rather than the SOC application and its native telemetry.
- The comparison does not establish provider-wide cost or latency.
- The optional semantic judge was not human-calibrated and had no release authority.
