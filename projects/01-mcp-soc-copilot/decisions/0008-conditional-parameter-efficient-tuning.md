# ADR 0008: Fine-Tuning Is a Conditional Experiment

Status: accepted for experiment; rejected for production replacement

## Decision

Run supervised LoRA or QLoRA only as a bounded Week 3 experiment. Consider DPO later only if supervised tuning leaves preference-ranking or safety-preference errors. Keep GRPO out of scope for V1.

## Preconditions

- create a separate, balanced training corpus with structural and linguistic variation
- do not train on the current 50-alert golden evaluation set
- create a new untouched challenge set because observed failures have influenced experiment design
- keep ATT&CK mapping, evidence validation, safety policy, approval, and remediation outside model weights

## Promotion gates

| Gate | Minimum requirement |
| --- | --- |
| Raw routing accuracy | At least 85% and at least 10 points above prompted 7B |
| Severity accuracy | At least 80%, with no distant-class errors |
| Authentication fast-path errors | 0 |
| Raw high-risk analyst-review misses | 0 |
| Schema validity | 100% |
| Evidence completeness | 100% |
| Generalization | Improvement on unseen templates and command variations |
| Latency | Lower than prompted 7B or justified by material quality gain |

Meeting these gates would justify further evaluation, not autonomous production routing.
