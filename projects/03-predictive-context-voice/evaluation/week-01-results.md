# Week 1 Baseline Evaluation

## Decision and scope

Close the deterministic local baseline and proceed with benchmark and integration work. Week 1 establishes replay and evidence plumbing. It provides no reactive-versus-predictive speedup measurement.

## Recorded results

| Measure | Audio fixture replay | Ticket smoke test |
| --- | ---: | ---: |
| Cases | 10: five clean, five noisy | 500 adapted single-turn tickets |
| Retrieval scenario agreement | 10/10 (100%) | 48% against weak labels |
| Retrieved scenario present in tenant graph | 10/10 (100%) | Not reported |
| Cache hits | 5 | Not reported |
| Recorded p50 | 2.7529 ms | 0.0197 ms |
| Recorded p95 | 3.0295 ms | 0.0249 ms |

The columns measure different local paths and cannot be used as a speed comparison.

## Metric interpretation

- **Fixture retrieval agreement:** the retrieved scenario matches the expected scenario encoded by the fixture identifier. The cases are narrow, deterministic examples.
- **Graph check:** the retrieved scenario exists in the tenant-scoped graph. This is a wiring/coverage check, not an independently labelled graph-retrieval quality score.
- **Ticket agreement:** lexical retrieval matches a keyword-derived weak scenario label. The report calls this retrieval accuracy, but human-reviewed labels are unavailable; public interpretation is weak-label agreement.
- **Fixture timing:** elapsed runtime after a complete WAV is available through local energy detection, supplied transcript replay, retrieval, graph work and response preparation to the first yielded bytes of a prebuilt response WAV. It excludes live capture, inferred ASR, generated speech, network transport and playback.
- **Ticket timing:** software-only transcript-to-simulated-first-audio readiness. No generated audio is measured.

The fixture report records CPython 3.12.5 on macOS arm64. Its p50 is the median; its p95 uses the sorted observation at the rounded `(n - 1) × 0.95` index. With only ten observations, tail-latency interpretation is especially limited. These are saved historical reports, not freshly rerun benchmark measurements.

## Verification evidence

The Week 1 tracker records automated coverage for workload validity, tenant rejection, runtime and cancellation. A 10-case release export passed the sibling Release Lab's actual `WorkloadBundle` contract using schema 1.0.0. The exported manifest binds application revision, configuration, graph snapshot, policy and artifact hashes.

Contract acceptance establishes interoperability, not voice quality, statistical sufficiency, release-gate approval or deployment readiness.

## Evidence basis

This summary reconciles the Week 1 Baseline & Instrumentation tracker (closure recorded 22 October 2026) with implementation-side `evidence/week-1/reactive-fixture-report.json`, `baseline-report.json`, `review.md`, `limitations.md`, the corpus coverage review, architecture notes, ADR 0001 and the exported release manifest. The benchmark implementation was inspected to resolve timing and graph-check semantics. Raw traces, full cases and labels remain private.

## Limitations and next evidence

The ticket labels still need human review. Noise variants reuse supplied transcripts and therefore establish no ASR robustness result. No confidence interval, multi-run variance estimate, production throughput, task-completion score or groundedness score is claimed. The narrow tenant test does not establish exhaustive privacy assurance.

MiniCPM-o, BGE-M3, Redis and NebulaGraph were not executed in these measurements. At Week 1 close, reviewed multi-turn labels, matched predictive comparison, real end-of-speech-to-first-audio timing, live voice quality and production capacity remained open.
