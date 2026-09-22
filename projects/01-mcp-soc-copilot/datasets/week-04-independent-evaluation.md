# Week 4 Independent Evaluation Design

## Frozen datasets

| Evidence set | Records | Purpose |
| --- | ---: | --- |
| Independent triage alerts | 200 | Rules, prompted 3B, and LoRA triage quality and safety |
| Fast-path authorization cases | 19 | Structured positive and adversarial authorization behavior |
| Supported retrieval questions | 16 | Exact record correctness and provenance |
| Retrieval boundary cases | 12 | Empty, stale, conflict, unsupported-source, and poisoning behavior |

The triage set contains 25 independently authored cases for each of eight supported scenarios. It is separate from the Week 3 generator and earlier robustness set.

## Integrity checks

All 247 Week 4 records were checked for provenance, balance, duplicate semantics, and contamination. The 200 alerts were compared with 1,026 earlier training and evaluation records. No exact or near match crossed the frozen 0.92 token-similarity threshold; the highest observed similarity was 0.55.

Before final evaluation, the datasets, prompt, policy, retrieval snapshots, ATT&CK catalogue, model revision, adapter, and identity-relevant code were frozen in a reproducibility manifest. Private records, fingerprints, checksums, prompts, and case-level results are not published.

## Denominator discipline

The 200 triage alerts, 16 supported retrieval questions, 12 boundary cases, route-dependent latency samples, and historical Week 3 sets remain separate. Results are presented as a metric matrix, never pooled into a composite score.

Natural-language questions are preserved for readability, but retrieval correctness is measured through hidden typed MCP requests with exact expected records. The sprint evaluates retrieval given a valid request; it does not claim to evaluate arbitrary natural-language tool planning.
