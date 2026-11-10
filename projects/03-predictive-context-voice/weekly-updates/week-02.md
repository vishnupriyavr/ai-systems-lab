# Week 2: Prepare Context Early, Revalidate Before Use

Week 2 added the first local predictive-context components and a paired replay against the reactive baseline. The engineering focus was controlling the lifecycle of speculative context: what may be fetched, when work should stop, and whether a stored value is still safe to consume.

## Delivered

- A frozen synthetic benchmark of 50 conversations across five scenarios, containing 200 turns and 600 partial-transcript checkpoints. The owner approved it by glance review, not an independent detailed audit.
- A versioned conversation graph with 20 transition edges, counts, normalized probabilities and permitted context dependencies.
- A common predictor contract with ranked candidates, distributions, confidence, evidence and abstention, implemented by rules and transition-frequency baselines.
- Background prefetch with tenant authorization, cancellation, item/time/simulated-cost budgets and structured accepted/rejected/cancelled outcomes.
- A local one-use cache scoped to tenant, user, session, permission scope and source version, with access, freshness and TTL checks at consumption.
- A 200-turn paired replay, a separate 500-ticket coverage check, failure-trace export and a local review.

The Week 2 tracker and evidence index record **41 passing tests** at closeout. This is historical evidence, not a fresh run of the current implementation suite.

## Results and interpretation

Both predictors matched all 200 full-turn labels. Their partial-checkpoint predict/abstain action accuracy was 86.7% over 600 checkpoints. That second metric evaluates the action choice, not whether a predicted state is correct.

The transition-frequency paired replay reported 100% next-state top-k recall, 100% modelled context usefulness, no wasted context and no fallback on these cases. Under fixed costs, mean reactive latency was 37.4 ms and predictive latency was 10.45 ms, a modelled delta of -26.95 ms.

The graph and conversations share a source, and scenario/current-state metadata is supplied to the predictor. The replay computes context overlap and costs; it does not run the full authorized prefetch/cache lifecycle. The results therefore establish source-linked pipeline wiring, not generalization, full runtime integration or live voice speedup. See [metric definitions and limits](../evaluation/week-02-results.md).

## What changed in the design

Fetching context early does not make it safe to use later. Access may be revoked, source data may change, a value may expire, or the conversation may move to another session. Consumption-time revalidation and one-use cache entries make those changes explicit.

## Exit decision

Continue to Week 3 with independent cases and measured runtime latency. Keep uncertain predictions on the reactive path. Complete predictive release manifests, metric adapters and paired comparison in the existing Release Lab before claiming that integration is finished; those tasks remain unchecked in the Week 2 tracker.
