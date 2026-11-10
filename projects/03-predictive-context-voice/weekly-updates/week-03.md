# Week 3: Perfect Base Scores Still Led to a Shadow-Only Decision

Week 3 tested whether a small language-based predictor could estimate the next useful conversational state. The selected experiment candidate was transcript-only logistic regression. The exit decision was **adjust: continue in shadow mode**, because speech-recognition revisions exposed failures that the original synthetic cases did not.

## Delivered

- A dependency-free multiclass logistic-regression baseline using hashed transcript unigrams and bigrams, excluding structured scenario/state fields and expected labels from features.
- A shadow-only Jev adapter behind the common predictor contract, with bounded choice definitions, timeout/retry/circuit-breaker handling and abstention on unusable results. Adapter tests used an injected fake client; no live or paid Jev calls were made.
- Calibration evidence, reliability data, provisional risk-based abstention policy and an equal-budget prediction comparison.
- Six synthetic text perturbation categories, plus generated Jev option-order/name/rubric variants awaiting live scoring.
- A matched 40-turn comparison, deterministic graph-edge removal analysis, error taxonomy, scenario checks and versioned local candidate packages.

## Results that changed the decision

Rules, Markov lookup and logistic regression each matched all 40 original challenge turns. The learned predictor's local median/p95 inference time was about 0.039/0.075 ms. These are Python predictor timings, not live voice response times.

The learned model retained 100% accuracy on paraphrases but fell to 95% under contradictory history and 70% under simulated ASR revisions. Four ASR-revision errors were high-confidence errors under the report's diagnostic definition. Rules and Markov remained stable because they retained correct structured inputs while text changed.

Removing 10%, 25% and 50% of graph edges reduced lookup coverage to 90%, 75% and 50%. Covered transitions remained correct: graph completeness and prediction correctness need separate accounting.

Jev has no matched live evidence. Its accuracy, calibration, latency, robustness and external cost remain unknown, rather than zero.

## Decision and remaining work

Continue logistic regression as the shadow experiment because it directly tests prediction from observed language. This is a research choice, not an aggregate-score winner or production approval. The documented fallback order is rules, Markov when available, then reactive retrieval.

Independent conversations, revised-ASR handling, measured full-runtime behavior and live Jev comparison remain required. The saved packages support local audit and comparison; packaging and base-case scenario checks do not establish completed external Release Lab evaluation or permission to activate prediction.

See [matched results](../evaluation/week-03-results.md), [robustness and calibration](../evaluation/week-03-robustness.md), and the [selection decision](../decisions/0005-keep-learned-predictor-in-shadow.md).
