# Week 2: Connect Offline Evidence to Deployment Control

Week 2 moved the lab from reproducible offline evaluation to policy-controlled progressive delivery. It tested two different questions and kept their evidence separate: whether the SOC model qualified for canary, and whether the delivery system could promote a healthy synthetic revision and contain a controlled regression.

## Delivered privately

- versioned release policy with hard gates, regression limits, evidence requirements, and rollback rules
- paired comparisons with reproducible bootstrap intervals and practical-effect thresholds
- repeated-run and flaky-case classification
- CI enforcement that prevents failed candidates from changing GitOps desired state
- guarded GitOps updates, including explicit approval for warning outcomes
- Argo CD reconciliation and Argo Rollouts staged analysis in a local Kubernetes lab
- Prometheus-compatible synthetic telemetry for controlled promotion and rollback tests
- immutable release-transition records and quarantined failure evidence
- 76 passing automated tests

## Offline result

The final challenge contained eight frozen cases, one for each supported SOC scenario. Deterministic rules and untuned Qwen 2.5 3B replayed the same cases.

| Challenge measure | Deterministic rules | Prompted Qwen 2.5 3B |
| --- | ---: | ---: |
| Schema validity | **8/8 (100%)** | 5/8 (62.5%) |
| Routing accuracy | **8/8 (100%)** | 5/8 (62.5%) |
| Severity accuracy | **8/8 (100%)** | 3/8 (37.5%) |
| ATT&CK Top-3 recall | **4/4 (100%)** | 1/4 (25%) |

The prompted candidate failed schema, routing, severity, ATT&CK, review-policy, and regression gates. It also fell below the predeclared minimum of 50 cases and three repeated model runs. It did not enter canary.

## Progressive-delivery result

A separate generic synthetic service exercised the delivery path:

- A known-good revision passed the logical 5% and 25% analysis stages before promotion to 100%.
- A controlled regression reported 0.80 task success, one high-risk miss, 0.10 unsupported-claim rate, and 0.50 p95 latency regression.
- The regression failed at the first analysis stage; the failed ReplicaSet scaled to zero and the prior healthy ReplicaSet remained available with two ready pods.

The local lab used two replicas and no traffic router. The stage weights therefore represent rollout checkpoints, not exact percentages of production requests.

## Decisions

1. Offline `PASS` authorizes canary entry only, never direct full deployment.
2. A failed or evidence-insufficient candidate cannot update GitOps desired state.
3. Argo CD owns reconciliation of approved Git state; Argo Rollouts owns staged progression and analysis-driven abort.
4. Hard safety failures remain policy decisions even when statistical inference is unavailable.
5. Production failures must enter quarantine and receive review before inclusion in a new dataset version.

## Limitations

- Eight challenge cases cannot satisfy the policy's minimum evidence requirement or support the configured confidence intervals.
- The deployment target was a generic HTTP service, not the SOC application.
- Telemetry was simulated through a Prometheus-compatible lab endpoint.
- Local model latency does not generalize to hosted providers or production hardware.
- Semantic-grader calibration remained deferred; deterministic checks retained authority.

## Next

Expand the untouched challenge set, repeat model runs, add a supported traffic router, replace simulated metrics with workload-emitted telemetry, deploy an application adapter, and evaluate a corrected candidate as a new immutable release.
