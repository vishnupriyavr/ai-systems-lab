# Week 2 Baseline Benchmark

Status: frozen held-out comparison  
Evaluation set: 18 scenario-separated synthetic alerts  
Metrics revision: 1.1.0

## Systems compared

- deterministic rules baseline
- Qwen 2.5 7B prompted router, run locally through Ollama at temperature zero

Both systems used the same frozen held-out split. Prompt and model selection were completed on a separate development split before the final comparison.

## Aggregate results

| Measure | Rules | Prompted 7B |
| --- | ---: | ---: |
| Raw routing accuracy | **18/18 (100%)** | 14/18 (77.78%) |
| Governed routing accuracy | **18/18 (100%)** | 16/18 (88.89%) |
| Severity accuracy | **17/18 (94.44%)** | 13/18 (72.22%) |
| Adjacent severity errors | **1** | 5 |
| Distant severity errors | 0 | 0 |
| ATT&CK Top-3 recall | **9/9 (100%)** | 0/9 (0%) |
| Schema validity | 18/18 (100%) | 18/18 (100%) |
| Evidence completeness | 18/18 (100%) | 18/18 (100%) |
| Policy overrides | 0 | 2/18 (11.11%) |
| Mean latency per alert | **0.05 ms** | 9.98 s |
| P50 latency per alert | **0.02 ms** | 8.63 s |
| P95 latency per alert | **0.36 ms** | 14.91 s |

Governed routing is the final application decision after deterministic policy enforcement. The improvement from 14/18 raw model decisions to 16/18 governed decisions came from two policy overrides, not better model reasoning.

## Safety interpretation

The prompted model never sent a high-risk alert to `fast_path`, but it sent two of three expected high-risk alerts to `deep_investigation` instead of mandatory `analyst_review`.

| Safety measure | Raw prompted 7B | After policy |
| --- | ---: | ---: |
| High-risk fast-path misses | 0/3 | 0/3 |
| High-risk analyst-review misses | 2/3 (66.67%) | 0/3 |

The first metric alone would hide a meaningful safety failure. Model quality and governed-system quality are therefore reported separately.

## Benchmark environment

- MacBook Pro with a 12-core Apple M3 Pro and 18 GB unified memory
- local Ollama runtime
- Qwen 2.5 7B, temperature zero
- 18 alerts processed sequentially

The SLM run used approximately 179.6 seconds of serial compute. At the same measured rate, 10,000 alerts would require approximately 27.7 serial compute hours. This is a latency-derived capacity illustration, not a cost or production-throughput claim.

## Decision

Rules remain the authoritative V1 baseline for the frozen scenario taxonomy. The model remains a bounded research candidate. ATT&CK mapping stays deterministic, and application policy continues to own the final route.

## Limitations

- Eighteen synthetic test alerts are too few for broad conclusions; one alert changes accuracy by about 5.56 percentage points.
- Rules were designed for the frozen V1 taxonomy and may not generalize to unseen attacks, obfuscation, missing telemetry, or vendor drift.
- The comparison evaluates two candidate implementations under one interface; it does not equalize the domain knowledge encoded in rules and prompts.
- Token counts, utilization, memory consumption, power draw, and monetary cost were not captured.
- The 0% prompted ATT&CK recall is specific to this prompt, model, contract, and dataset—not evidence that language models can never map ATT&CK.
- No result represents live enterprise SOC traffic or production security effectiveness.

Detailed per-alert expected, raw, governed, and scenario-level reports remain private to protect the frozen evaluation set.
