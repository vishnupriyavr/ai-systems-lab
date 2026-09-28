# Architecture Overview

## Responsibility split

| Layer | Responsibility | Boundary |
| --- | --- | --- |
| Export | Freeze sanitized cases from an exact application revision | No runtime import of the source application |
| Workload profile | Declare contract, evaluator mapping, labels, rubric, and policy | Workload-owned; not embedded in the generic engine |
| Adapter | Execute a rules or model configuration behind one replay interface | Provider-specific behavior stays isolated |
| Replay | Preserve identity, output or attributable error, attempts, latency, tokens, and provenance | Does not decide release eligibility |
| Normalization | Convert successful responses into the workload contract | Raw responses remain separately available for audit |
| Evaluation | Apply versioned deterministic metrics and optional advisory semantic checks | Inapplicable metrics remain explicit |
| Comparison | Identify paired regressions and improvements by case | Aggregate gains cannot erase critical failures |
| Packaging | Bind revisions, configuration, evidence, policy, and artifact hashes | Packaging is not approval |
| Policy | Decide whether evidence permits the next delivery stage | Deterministic safety gates are authoritative |

## Data flow

The exporter reads a pinned application revision and produces a frozen bundle. A replay run combines that bundle with a named configuration, preserving raw provider output even when normalization fails. Versioned evaluators produce case-level evidence and aggregate summaries. Paired comparison identifies changed failures. Packaging then binds the candidate and referenced evidence by cryptographic hash; policy evaluates that evidence separately.

## Trust boundaries

Models, providers, workload inputs, and semantic judges can return malformed, misleading, or nondeterministic content. Their output is evidence to validate, never release authority. Typed contracts, deterministic evaluators, explicit applicability, attributable failures, pinned revisions, artifact hashes, and fail-closed release policy form the public control story.

The complete workload, prompts, per-case outputs, runtime settings, policy thresholds beyond published release criteria, and control implementation remain private.

## Week 1 boundary

Week 1 ends at an offline release decision. Canary stages and rollback rules are recorded in the candidate identity, but no deployment occurs. CI enforcement, repeated-run uncertainty, online telemetry, progressive delivery, and rollback execution are deferred.
