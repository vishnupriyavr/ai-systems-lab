# Predictive Context Voice Runtime Lab

Can a voice assistant prepare the context it will need next before the user finishes speaking, while preserving authorization, grounding and a safe reactive fallback?

Week 1 established the reactive baseline and instrumentation needed to test that question. The local baseline closed on **22 October 2026**. Week 2 added a minimal predictive context experiment. These artifacts report the first two weeks; later implementation work is outside their scope.

## Reference workload

Five bounded enterprise IT-support scenarios cover VPN/login failure, account lockout, device compliance, service outage and software-access requests. Each has permitted roles, required context, a state sequence and an expected outcome. These are workload contracts, not evidence that the assistant can autonomously complete those operations.

## Week 1 result

- Versioned workload and provider-neutral runtime boundaries.
- A secondary corpus of 500 adapted, weakly labelled support tickets.
- Five clean and five noisy synthetic speech fixtures.
- Local reactive retrieval, graph progression, cache reuse, grounded response preparation, cancellation, correlated timing and provenance.
- A 10-case hashed workload export validated against the existing Release Engineering Lab contract.

The 10 narrow audio fixtures achieved 10/10 retrieval matches. The separate ticket smoke test achieved 48% agreement with weak labels. Neither result measures next-state prediction or production task completion. Fixture-runtime p50/p95 was 2.7529/3.0295 ms, excluding live speech recognition and generated speech. See [results and measurement limits](evaluation/week-01-results.md).

## Week 2 result

Week 2 added 50 owner-reviewed synthetic conversations, rules and transition-frequency predictors, asynchronous authorized prefetch, and a scoped one-use cache with consumption-time checks. Review was owner glance approval, not an independent detailed audit.

A paired replay over 200 turns reported 100% next-state top-k recall and 100% modelled context usefulness, with mean latency changing from 37.4 to 10.45 ms under a deterministic cost model. These are source-linked pipeline checks: the graph and benchmark share a source, and the replay models reuse rather than executing the full prefetch/cache lifecycle. They do not establish independent prediction quality or measured voice speedup. See [Week 2 results](evaluation/week-02-results.md).

## Week 2 public artifacts

- [Week 2 engineering update](weekly-updates/week-02.md)
- [Predictive context architecture](architecture/week-02-predictive-context.md)
- [Multi-turn benchmark card](datasets/multiturn-v0.2.md)
- [Week 2 evaluation](evaluation/week-02-results.md)
- [Revalidate context before consumption](decisions/0003-revalidate-context-before-consumption.md)
- [Keep modelled comparison separate from release approval](decisions/0004-modelled-comparison-is-not-release-approval.md)
- [Week 2 safety evidence and gaps](threat-model/week-02-context-lifecycle.md)
- [Week 2 social-post draft](communications/week-02-linkedin.md)

## Week 1 public artifacts

- [Week 1 engineering update](weekly-updates/week-01.md)
- [Reactive baseline architecture](architecture/week-01-reactive-baseline.md)
- [Workload and dataset strategy](datasets/workload-v0.1.md)
- [Week 1 evaluation](evaluation/week-01-results.md)
- [Deterministic baseline decision](decisions/0001-freeze-local-reactive-baseline.md)
- [Separate benchmark roles decision](decisions/0002-separate-stress-tests-from-prediction.md)
- [Safety boundaries and limitations](threat-model/public-summary.md)
- [Week 1 social-post draft](communications/week-01-linkedin.md)

## Next experiment

At Week 2 close, the next priorities were independent evaluation cases and measured runtime latency, followed by live voice evidence and completion of predictive Release Lab integration. The intended success measure remains lower end-of-speech-to-first-audio p95 without degrading quality or exposing unauthorized context. Neither week's local experiment establishes that outcome.

This public package contains engineering summaries and aggregate evidence. Complete fixtures, traces, labels, prompts, implementation and operational policy internals remain private under the repository's [disclosure policy](../../DISCLOSURE.md).
