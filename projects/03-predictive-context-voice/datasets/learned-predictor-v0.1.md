# Learned Predictor v0.1: Model and Data Card

## Purpose

Estimate the next conversational state from transcript language as a shadow experiment. Predictions may inform experimental context preparation; they grant no authorization and must not trigger operational actions.

## Model

The implementation is dependency-free multiclass logistic regression with hashed transcript unigram and bigram features. Scenario IDs, current-state fields, graph transitions and expected labels are excluded from features. The saved model and evidence retain model/data identities for reproducibility.

## Data partitions

| Partition | Conversations | Turns | Role |
| --- | ---: | ---: | --- |
| Regression | 30 | 120 | Training |
| Calibration | 10 | 40 | Provisional confidence policy |
| Challenge | 10 | 40 | Original matched comparison and perturbation basis |

These partitions come from the same 50-conversation synthetic benchmark described in the [v0.2 benchmark card](multiturn-v0.2.md). Template grouping reduces variant leakage, but held-out language remains related to the generator. Review was owner glance approval, not independent detailed annotation.

## Appropriate interpretation

The 40/40 original challenge result is a learned-baseline smoke test. The 28/40 result on simulated ASR revisions exposes sensitivity to transcript changes. Neither result establishes generalization to real callers, recognition quality, end-to-end task completion or production safety.

Rules and Markov are useful controls with different inputs: they use correct structured scenario/state metadata. Their perfect results cannot be interpreted as an equal-input comparison with the transcript-only model.

The secondary 500-ticket corpus is not the source of authoritative next-turn labels. Full training/evaluation records, feature internals, labels and model artifacts remain private under the repository disclosure policy.
