# Week 3 Matched Predictor Evaluation

## Decision

**Adjust: continue transcript-only logistic regression in shadow mode.** Retain deterministic rules, then Markov when available, then reactive retrieval as the documented fallback chain. Synthetic ASR failures and missing live Jev evidence prevent promotion.

## Matched original challenge results

The three local candidates received the same 40 synthetic challenge turns, eight per scenario. Their input usage differs: the learned model uses transcript features, while rules and Markov rely on supplied scenario/current-state fields.

| Candidate | Top-1 accuracy | Five-bin ECE | Multiclass Brier | Local median / p95 inference |
| --- | ---: | ---: | ---: | ---: |
| Rules | 40/40 (100%) | 0 | 0 | 0.00225 / 0.00679 ms |
| Markov | 40/40 (100%) | 0 | 0 | 0.00213 / 0.00442 ms |
| Learned logistic regression | 40/40 (100%) | 0.164 | 0.0845 | 0.03890 / 0.07529 ms |
| Jev | Not measured | Not measured | Not measured | Not measured |

All local candidates recorded zero external API spend for this run. Hardware, energy, operations and engineering costs are excluded. Jev cost is unknown because no live calls occurred; it is not a zero-cost result.

## Metric scope

Top-1 accuracy counts correct non-abstained next-state predictions over all matched cases. ECE groups confidence into five bins and averages the absolute confidence/accuracy gap weighted by bin count. Brier score averages the sum of squared probability errors across labels per case. Lower ECE/Brier is better, but zero error on source-linked deterministic cases is not general confidence calibration.

Calibration metrics in the finalizer are computed on non-abstained outputs. Report coverage alongside these measures when abstention occurs. Predictor timing surrounds local Python prediction calls only; p95 is the sorted sample selected by the runner's percentile index. Forty observations, without repeated-run uncertainty, do not establish a stable hardware benchmark or voice-runtime latency.

The calibration-split learned scores differ from this challenge table: ECE 0.068 and Brier 0.0090 on 40 reserved turns. They are separate partitions, not conflicting estimates or evidence of a before/after calibration improvement. See [robustness and calibration](week-03-robustness.md).

## Candidate packages and scenario checks

Local versioned packages retain candidate identity, benchmark hash, feature/option versions, calibration reference, matched outputs, metrics and artifact hashes. On original cases, each local candidate passed all five scenario checks with eight cases per scenario. Those checks are narrow base-case accuracy checks; they do not override the learned model's ASR-revision failures.

The Jev package records `INSUFFICIENT_EVIDENCE` and no matched outputs. An available adapter or package is not a measured provider result.

The tracker describes support from matched Release Lab evidence, but the inspected finalizer performs comparison and packaging locally. The all-candidate framework evaluation checkbox is still open, and these files do not demonstrate external contract validation or framework execution. Public reporting therefore claims local matched evidence and preserves that integration gap.

## Evidence basis and limits

Sources: the Week 3 Sprint Tracker, predictor-selection ADR, saved Day 5 model-comparison report, candidate manifests/scenario checks, Day 3 calibration report and Day 4 robustness report. The local finalizer and metric implementations were inspected to establish calculation and packaging boundaries. Results are historical saved evidence, not freshly rerun measurements.

The benchmark is small, synthetic, source-related and reviewed only by owner glance approval. Independent/live conversations, matched Jev calls, live voice quality, full-runtime latency, confidence intervals and production capacity remain unmeasured. Selection is an experiment choice, not an automatically optimized winner or deployment approval.
