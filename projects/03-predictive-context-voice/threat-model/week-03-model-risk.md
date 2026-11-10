# Week 3 Model Risk: Evidence and Gaps

| Risk | Week 3 evidence | Remaining work |
| --- | --- | --- |
| Confidence mistaken for correctness | Four high-confidence learned errors on ASR revisions | Independent error-rich calibration and revised-transcript handling |
| Synthetic success mistaken for generalization | Explicit source-related benchmark and limited review | Independent real conversation evaluation |
| Structured metadata masks language failures | Controls retain correct scenario/state inputs | Perturb state estimation and evaluate full pipeline |
| Malicious context changes predictions | Bounded synthetic text-perturbation results | Retrieval/runtime attack evaluation beyond a classifier |
| Missing graph context hides behind covered accuracy | Coverage drops under deterministic edge removal | Incorrect/stale graph evidence and real update behavior |
| Provider failure blocks response | Jev adapter abstention paths tested with fake client | Matched live provider calls and operational failure evidence |
| Missing provider data treated as a pass | Jev package explicitly records insufficient evidence | Complete all-candidate comparison |
| Narrow scenario checks mistaken for approval | Local base-case checks and versioned packages | Independent robustness gates and framework validation |

The learned predictor stays shadow-only. The documented fallback chain is rules, Markov and reactive retrieval; these artifacts report the selection policy rather than proving a fully deployed fallback chain.

Prediction never supplies access authority. Week 2 authorization and freshness requirements continue to apply. Week 3 model metrics do not establish tenant isolation, production security, live voice improvement or safe operational side effects.
