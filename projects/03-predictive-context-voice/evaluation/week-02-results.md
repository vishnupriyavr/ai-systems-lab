# Week 2 Predictive Context Evaluation

## Decision

Continue with independent cases and measured runtime latency. The recorded results validate local contracts and source-linked comparison logic. They do not establish production performance or release eligibility.

## Predictor smoke test

| Measure | Rules | Transition-frequency |
| --- | ---: | ---: |
| Full-turn next-state accuracy | 200/200 (100%) | 200/200 (100%) |
| Partial-checkpoint action accuracy | 86.7% over 600 checkpoints | 86.7% over 600 checkpoints |

Full-turn accuracy requires a non-abstained top-ranked state matching the expected next state. Checkpoint action accuracy checks whether predict versus abstain matches the labelled action. It does not check the predicted state's correctness at that checkpoint. No confidence-calibration or independent generalization claim follows from these figures.

## Paired replay

The saved Day 5 report uses the transition-frequency predictor on 200 full-turn cases from the same 50 conversations. Rules are not a second Day 5 comparison arm in this report.

| Measure | Recorded result |
| --- | ---: |
| Next-state top-k recall | 100% |
| Modelled useful context / all prefetched context | 100% |
| Wasted context / all prefetched context | 0% |
| Turns requiring reactive fallback | 0% |
| Mean reactive latency, fixed-cost model | 37.4 ms |
| Mean predictive latency, fixed-cost model | 10.45 ms |
| Mean predictive minus reactive latency | -26.95 ms |
| Failure traces flagged | 0 |

The report names the context-usefulness ratio `useful_cache_hit_rate`. Its implementation counts predicted dependency keys that overlap expected dependency keys, divided by all predicted dependency keys. It is not an observed cache-service hit rate. Wasted context uses the same denominator; fallback occurs when useful context does not cover all required dependencies.

Top-k recall counts turns whose expected state appears among returned candidates. A failure trace is flagged for abstention or a missing expected state. No failures on these source-linked cases does not establish safety on unseen inputs. Wrong predictions and abstention are exercised separately by component tests.

## Cost model and exclusions

The model assigns fixed costs to response preparation, each reactive dependency fetch and each cache read. Reactive latency is response cost plus required fetch costs; predictive latency substitutes cache-read cost for useful dependencies and retains fetch cost for missing ones.

The comparison assumes useful prefetched context is ready. It omits predictor computation, prefetch completion timing, authorization/revalidation overhead, cache writes, background contention, live ASR, generated speech and network effects. Therefore equal modelled fallback latency does not establish zero real-world overhead. These means cannot be compared directly with Week 1's measured local fixture timings, and no p95 or live end-of-speech-to-first-audio improvement was measured.

The comparative replay does not invoke the actual prefetch orchestrator or scoped cache. Authorization, freshness, cancellation and cache isolation are separate local test evidence, not controls exercised by this 200-turn cost calculation.

## Secondary ticket coverage

All 500 tickets received a prediction; none caused abstention. The set has 100 tickets per scenario. This is 100% prediction coverage only, not accuracy or appropriate confidence. Scenario and initial state are supplied, and no next-turn gold labels exist.

## Evidence and limitations

Sources are the Week 2 Sprint Tracker and evidence index, the saved Day 2 predictor and Day 5 comparative reports, the benchmark freeze/review manifests, local Week 2 review and comparative-evaluation ADR. Predictor and replay implementations were inspected to establish metric semantics. These are saved historical results, not newly rerun measurements.

The tracker records 41 passing tests at Week 2 close. Coverage includes invalid transitions, abstention, prefetch authorization/budgets/cancellation, cache identity/revocation/staleness/TTL, wrong-prediction waste and reactive fallback. Test success is bounded evidence, not an exhaustive privacy audit.

The graph and benchmark share a synthetic source; owner review was a glance approval rather than an independent audit. No uncertainty estimates, real task completion, groundedness, production capacity or live voice results are claimed.

The tracker describes a desired Release Lab integration exit, but its associated tasks remain unchecked. Predictive candidate export, normalized lifecycle metric integration, safety hard gates and a paired replay inside the Release Lab are therefore reported as open, not achieved.
