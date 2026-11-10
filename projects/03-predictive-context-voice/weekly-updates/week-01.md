# Week 1: Establish the Baseline Before Predicting Context

The project asks whether a voice assistant can prepare useful context early enough to reduce response latency. Week 1 built the reactive path and evidence contracts needed for a fair comparison.

## Delivered

- Five bounded IT-support scenario contracts with personas, permissions, tenant boundaries, expected context and outcomes.
- A versioned 500-ticket secondary stress-test corpus with source lineage, deterministic sanitization and weak labels requiring human review.
- Four separately marked synthetic coverage-gap cases for VPN and device compliance, also pending review.
- Ten synthetic audio fixtures: one clean and one noisy variant for each scenario.
- A deterministic local path from WAV energy detection and manifest transcript replay through tenant-scoped retrieval, graph progression and response preparation to the first bytes of a prebuilt WAV.
- Cancellation, cache reuse, correlation IDs, stage timing and provenance, with automated coverage for the runtime and cross-tenant rejection.
- A hashed 10-case release bundle validated against workload schema 1.0.0 in the existing LLM Release Engineering Lab.

## What the evidence says

The narrow audio fixtures produced 10/10 retrieval matches and graph scenario-presence checks, with five cache hits. Their recorded fixture-runtime p50/p95 was 2.7529/3.0295 ms. Those timings begin after a complete WAV is available and use a supplied transcript and prebuilt response audio.

The separate 500-ticket lexical smoke test recorded 48% agreement with machine-generated scenario labels. It identifies a retrieval/label-review problem to investigate; it does not establish expert-labelled accuracy.

Neither experiment measures predictive benefit, real ASR quality, live voice latency or end-to-end support resolution. Full definitions and caveats are in the [evaluation report](../evaluation/week-01-results.md).

## Engineering lesson

Single-turn tickets support domain coverage and failure inspection, but they do not label what happens next in a conversation. A prediction experiment needs reviewed transitions and explicit context dependencies. Keeping those benchmark roles separate became a design decision.

The reference stack also needs a clear distinction between proposed components and executed adapters. Week 1 used standard-library local substitutes; no latency or quality result is attributed to the proposed production models or services.

## Exit decision

**Close the minimal local baseline and continue with adjustments.** The tracker records closure on 22 October 2026. Bundle compatibility is evidence that the release contract can consume the workload; it is not a promotion or production-readiness decision.

At that milestone, the next priorities were reviewed multi-turn conversations, stronger retrieval and weak-label review, followed by bounded prediction and prefetch experiments. Live voice integration and production-stack benchmarking remained open.
