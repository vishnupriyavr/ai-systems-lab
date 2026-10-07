# Statistical Assumptions

## Paired comparison

Baseline and candidate scores refer to the same cases. Deltas are calculated per aligned case before aggregation. Bootstrap intervals resample those paired deltas with replacement; a recorded seed makes the calculation reproducible but does not remove sampling uncertainty.

## Evidence states

- Metrics below the policy's minimum applicable-pair count are `insufficient_evidence`.
- Failed, missing, and non-applicable evaluations remain distinct.
- Repeated cases are flaky when their outputs or metric outcomes differ.
- Flaky evidence is reported as unstable rather than resolved by selecting a favorable repetition.
- Practical significance and statistical uncertainty remain separate.

## Limits on inference

Improvement or regression should not be inferred when case IDs are misaligned, too few applicable pairs exist, or failures prevent paired evaluation. Confidence intervals assume that evaluated cases represent the intended workload; they cannot correct biased selection, tuning on the test set, template correlation, or an unbalanced corpus.

Per-metric intervals do not provide a simultaneous guarantee across all metrics. They show association on a frozen dataset, not causality, provider-wide performance, production safety, or future traffic behavior. Hard safety failures remain release-policy decisions and cannot be averaged away by a favorable aggregate or confidence interval.

The Week 2 challenge contained eight cases, below the configured 50-pair minimum. Its comparison is therefore descriptive and correctly classified as insufficient for statistical inference.
