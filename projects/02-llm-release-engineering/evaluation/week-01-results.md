# Week 1 Offline Release Evaluation

## Decision

**Reject the Qwen 2.5 3B LoRA candidate from canary.** It produced one high-risk fast-path miss where the release policy allows zero. Packaging preserves the evaluated identity and evidence; it does not authorize deployment.

## Setup

All three configurations replayed the same 50 sanitized synthetic alerts through one result contract. Deterministic evaluators were authoritative. Semantic judging was disabled after an initial uncalibrated run failed to discriminate outputs that deterministic checks showed were different.

## Primary results

| Measure | Deterministic rules | Prompted Qwen 2.5 3B | Qwen 2.5 3B LoRA |
| --- | ---: | ---: | ---: |
| Schema validity | **50/50 (100%)** | 26/50 (52%) | 47/50 (94%) |
| Routing accuracy | **49/50 (98%)** | 26/50 (52%) | 39/50 (78%) |
| Severity accuracy | **46/50 (92%)** | 16/50 (32%) | 30/50 (60%) |
| Disposition accuracy | **49/50 (98%)** | 22/50 (44%) | 33/50 (66%) |
| ATT&CK Top-3 recall | **25/25 (100%)** | 4/25 (16%) | 5/25 (20%) |
| Evidence completeness | **50/50 (100%)** | 49/50 (98%) | **50/50 (100%)** |
| Review-policy accuracy | **49/50 (98%)** | 31/50 (62%) | 43/50 (86%) |
| High-risk fast-path misses | **0/7** | **0/7** | 1/7 |

Tool-name, authorization, and argument metrics had no authoritative labels and were not applicable. They were not counted as passes.

## Interpretation

The LoRA candidate materially improved schema validity, routing, severity, disposition, and review-policy accuracy relative to the prompted model. It did not outperform deterministic rules on the principal task metrics and introduced a critical safety regression. Aggregate improvement therefore could not override the zero-miss gate.

The deterministic configuration also had one routing error and is not presented as perfect. It remains the rollback baseline because it satisfied the critical gate and led the compared configurations on the measured task.

## Evidence and reproducibility

- The source application revision, workload version, configuration identity, evaluator versions, policy, and referenced artifacts are bound into a hashed candidate record.
- Raw provider responses are retained separately from normalized results.
- Errors, retries, latency, token use, and execution provenance are attributable per case in private audit artifacts.
- The closeout suite contained 28 passing automated tests covering contracts, replay, failures, evaluators, comparison, semantic boundaries, packaging, and tamper detection.

## Limitations

- This was one replay per configuration; no confidence intervals or flaky-case estimates are claimed.
- The 50 alerts are synthetic and bounded to the supported SOC scenarios.
- Results do not establish production security effectiveness, false-positive reduction, or deployment readiness.
- Local execution used a zero monetary-cost assumption; hosted execution would require versioned pricing.
- Retrieval and authoritative tool behavior were outside this workload.
- Progressive delivery, production-style telemetry, and rollback execution were not tested in Week 1.
