# Week 1: Build the Evidence Before the Rollout

A model and a prompt do not constitute an AI release. Week 1 built the offline foundation needed to identify, reproduce, compare, and govern a candidate before any progressive delivery begins.

## Delivered privately

- export of a 50-case sanitized workload from a pinned application revision
- one replay contract for deterministic and model-backed configurations
- separate preservation of raw provider responses and normalized results
- workload-owned deterministic evaluators behind a generic evaluation engine
- case-level baseline and candidate comparison
- human-readable and machine-readable reports
- a hashed candidate package binding configuration, evidence, policy, canary stages, and rollback rules
- package and referenced-artifact integrity verification
- 28 passing automated tests

## Evaluated configurations

The same frozen cases were replayed against deterministic SOC rules, prompted Qwen 2.5 3B, and Qwen 2.5 3B with the `qwen2.5-3b-soc-lora-v1` adapter.

| Configuration | Schema validity | Routing accuracy | High-risk fast-path misses |
| --- | ---: | ---: | ---: |
| Deterministic rules | 50/50 (100%) | 49/50 (98%) | 0/7 |
| Prompted Qwen 2.5 3B | 26/50 (52%) | 26/50 (52%) | 0/7 |
| Qwen 2.5 3B LoRA | 47/50 (94%) | 39/50 (78%) | 1/7 |

## Decision

**Reject the LoRA candidate from canary.** Its aggregate results improved substantially over the prompted model, but one of seven applicable high-risk cases was incorrectly sent to the fast path. The release policy permits zero such misses.

The package is retained as evidence of the evaluated candidate and negative decision. It is not a deployment approval. Deterministic rules remain the stable rollback baseline.

## Architecture decisions

1. Keep replay, evaluation orchestration, comparison, and packaging application-neutral.
2. Let each workload own its schema, evaluators, labels, rubric, and release policy.
3. Use deterministic checks as authoritative release evidence wherever possible.
4. Preserve raw responses separately from normalized results.
5. Keep infrastructure failures attributable and separate from model-quality failures.
6. Treat semantic model judging as optional and advisory until calibrated against human judgments.
7. Separate immutable candidate packaging from promotion authorization.

## Limitations

- A single run does not estimate variance or distinguish stable failures from flakiness.
- The sanitized synthetic workload does not measure production SOC effectiveness.
- Tool-selection metrics were not applicable because authoritative tool-call labels were unavailable.
- Local inference recorded token use, but monetary cost was zero under the declared local-pricing assumption.
- Retrieval, progressive delivery, online telemetry, and rollback execution were not exercised.

## Next

Week 2 will add repeated-run uncertainty, evidence-sufficiency policy, CI enforcement, and a local progressive-delivery demonstration. The failed LoRA package remains intentionally ineligible for promotion.
