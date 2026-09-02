# Evaluation Methodology

## Comparison

Evaluate deterministic rules, a prompted SLM, and an adapter/fine-tuned SLM on the same frozen split. Fine-tuning is retained only if its quality, latency, and operating-cost trade-off is supported by evidence.

## Week 1 evaluation asset

The private golden set contains 50 synthetic alerts across eight supported scenarios. It is not published in full to reduce benchmark gaming and disclosure risk. Small examples may be released only when created separately for public explanation.

## Metrics

| Metric | Reporting rule |
| --- | --- |
| Severity macro F1 | report per-class support and confusion matrix |
| Disposition accuracy | define allowed labels before evaluation |
| ATT&CK mapping | report top-1 and candidate-set score |
| IOC extraction F1 | score exact normalized indicator values |
| Retrieval hit rate | require relevant evidence in top-k |
| Groundedness | verify claims against retrieved evidence |
| p50/p95 latency | include hardware and warm/cold conditions |
| Cost per 10,000 alerts | state model/provider assumptions |
| Human-review coverage | high and critical alerts must reach review |

## Guardrails against overstating results

- no production extrapolation from synthetic data
- no “false-positive reduction” claim without representative labels
- report denominators, uncertainty, failures, and abstentions
- separate measured results from targets and illustrative values
- freeze versions, seeds, split logic, and scoring rules before comparison

Use [results-template.md](results-template.md) for future public results.
