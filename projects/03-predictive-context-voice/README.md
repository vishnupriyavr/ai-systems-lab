# Predictive Context Voice Runtime Lab

Can a voice assistant prepare the context it will need next before the user finishes speaking, while preserving authorization, grounding and a safe reactive fallback?

Week 1 established the reactive baseline and instrumentation needed to test that question. The local baseline closed on **22 October 2026**. This page reports that historical milestone; later implementation work is outside this artifact set.

## Reference workload

Five bounded enterprise IT-support scenarios cover VPN/login failure, account lockout, device compliance, service outage and software-access requests. Each has permitted roles, required context, a state sequence and an expected outcome. These are workload contracts, not evidence that the assistant can autonomously complete those operations.

## Week 1 result

- Versioned workload and provider-neutral runtime boundaries.
- A secondary corpus of 500 adapted, weakly labelled support tickets.
- Five clean and five noisy synthetic speech fixtures.
- Local reactive retrieval, graph progression, cache reuse, grounded response preparation, cancellation, correlated timing and provenance.
- A 10-case hashed workload export validated against the existing Release Engineering Lab contract.

The 10 narrow audio fixtures achieved 10/10 retrieval matches. The separate ticket smoke test achieved 48% agreement with weak labels. Neither result measures next-state prediction or production task completion. Fixture-runtime p50/p95 was 2.7529/3.0295 ms, excluding live speech recognition and generated speech. See [results and measurement limits](evaluation/week-01-results.md).

## Public artifacts

- [Week 1 engineering update](weekly-updates/week-01.md)
- [Reactive baseline architecture](architecture/week-01-reactive-baseline.md)
- [Workload and dataset strategy](datasets/workload-v0.1.md)
- [Week 1 evaluation](evaluation/week-01-results.md)
- [Deterministic baseline decision](decisions/0001-freeze-local-reactive-baseline.md)
- [Separate benchmark roles decision](decisions/0002-separate-stress-tests-from-prediction.md)
- [Safety boundaries and limitations](threat-model/public-summary.md)
- [Week 1 social-post draft](communications/week-01-linkedin.md)

## Next experiment

At Week 1 close, the next step was a reviewed multi-turn benchmark with current state, next state, permitted context and partial-transcript checkpoints. That benchmark would support paired reactive-versus-predictive comparisons. The intended success measure is lower end-of-speech-to-first-audio p95 without degrading quality or exposing unauthorized context; Week 1 did not measure that outcome.

This public package contains engineering summaries and aggregate evidence. Complete fixtures, traces, labels, prompts, implementation and operational policy internals remain private under the repository's [disclosure policy](../../DISCLOSURE.md).
