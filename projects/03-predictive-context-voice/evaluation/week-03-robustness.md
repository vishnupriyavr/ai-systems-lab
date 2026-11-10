# Week 3 Calibration, Robustness and Graph Coverage

## Calibration evidence

On the reserved 40-turn synthetic calibration partition, learned logistic regression recorded five-bin ECE 0.0679 and multiclass Brier 0.00903. Rules and Markov recorded zero for both on these source-linked cases.

The learned reliability summary has two observations averaging 0.764 confidence and 38 averaging 0.941; both groups were fully correct. That small, all-correct sample gives little evidence about confidence on failure cases. Risk-based confidence policies are provisional, with abstention for insufficient confidence, unfamiliar input or unknown risk. Exact operational thresholds remain private.

At an equal budget of 20 predictions, each local candidate selected 20/20 correct predictions. The report calls these useful predictions; this is state-label precision among selected predictions, not measured cache utility. Jev remains unevaluated.

## Synthetic text perturbations

Each category modifies all 40 challenge turns, producing 240 variants per local predictor. Expected labels stay fixed; these are deterministic text transformations, not recordings or measured ASR output.

| Perturbation | Rules accuracy | Markov accuracy | Learned accuracy | Learned stability |
| --- | ---: | ---: | ---: | ---: |
| Irrelevant context | 100% | 100% | 40/40 (100%) | 100% |
| Reordered history | 100% | 100% | 40/40 (100%) | 100% |
| Contradictory history | 100% | 100% | 38/40 (95%) | 95% |
| Malicious instruction text | 100% | 100% | 40/40 (100%) | 100% |
| Paraphrase | 100% | 100% | 40/40 (100%) | 100% |
| Simulated ASR revision | 100% | 100% | 28/40 (70%) | 70% |

Stability measures agreement with the corresponding unperturbed prediction. All reported perturbation abstention rates were zero. The learned model produced four diagnostically high-confidence errors, all on ASR revisions. That count is a subset of its errors, not the total ASR failure count. The diagnostic error category is separate from the operational prefetch policy.

Rules and Markov retain correct structured fields while transcript text changes. Their stability is expected and does not demonstrate resilience when scenario/state estimation is wrong. A transcript classifier resisting these malicious strings does not establish broad prompt-injection protection for the voice system.

Fifteen Jev option variants were generated across five scenarios: reordered choices, opaque names and rotated rubrics. No live scoring occurred, so option sensitivity remains `INSUFFICIENT_EVIDENCE`.

## Graph-edge removal

| Edges removed | Remaining edges | Lookup coverage | Correct over all cases | Correct when covered |
| --- | ---: | ---: | ---: | ---: |
| 0% | 20 | 100% | 100% | 100% |
| 10% | 18 | 90% | 90% | 100% |
| 25% | 15 | 75% | 75% | 100% |
| 50% | 10 | 50% | 50% | 100% |

This deterministic ablation removes edges and measures lookup coverage on the 40 challenge cases. The report's end-to-end accuracy field means correct next-state lookups over all cases, counting missing edges as failures. It is not full assistant task completion. It does not test noisy edge weights, incorrect edges, stochastic removals or real graph update behavior.

## Implication

Keep the learned predictor in shadow mode, improve handling of revised transcripts, and collect independent cases containing actual errors before trusting confidence policy. Track graph coverage separately from correctness when covered, and preserve reactive retrieval when useful prediction is unavailable.
