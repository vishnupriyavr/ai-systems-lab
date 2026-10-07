# Public Threat-Model Summary

## Protected properties

- candidate and evidence identity remain reproducible
- failures remain attributable to the model, adapter, provider, platform, or evaluator
- critical safety regressions cannot be hidden by aggregate improvements
- failed candidates cannot be mistaken for approved releases
- evaluation labels and challenge membership do not leak into candidate context

## Principal risks and controls

| Risk | Public control |
| --- | --- |
| Artifact or policy changes after evaluation | Pinned revisions and cryptographic hashes; verification of the package and every referenced artifact |
| Baseline and candidate see different cases | Frozen workload and stable case identifiers behind one replay contract |
| Malformed output disappears during parsing | Raw responses retained separately from normalized results |
| Provider or platform errors become model-quality failures | Explicit error attribution, attempts, and retry outcomes |
| Aggregate gains conceal a severe regression | Paired case comparison and fail-closed critical gates |
| Model judge rubber-stamps a candidate | Semantic judging remains advisory until human-calibrated |
| Test-set leakage inflates results | Separated calibration, regression, and challenge roles; labels excluded from candidate context |
| Package is interpreted as deployment approval | Separate package identity from policy decision and promotion authorization |
| Failed candidate changes desired state | Guard GitOps updates with a versioned decision bound to the candidate identity |
| Offline pass bypasses staged observation | Authorize only canary entry; require fresh analysis at each stage |
| Stale or synthetic metrics produce a false promotion | Bind analysis evidence to rollout revision and preserve transition records |
| Failed rollout disrupts the stable service | Abort the candidate and retain the prior healthy ReplicaSet |
| Production failures poison future evaluation data | Quarantine failures for review before dataset admission |

## Residual risk

Hashes show that evaluated artifacts have not changed; they do not prove that the workload is representative, labels are correct, or implementation is secure. A small offline sample cannot characterize nondeterminism or provider drift. The Week 2 rollback used simulated telemetry and a generic service, so it validates the lab control path rather than production SOC reliability.
