# LLM Release Engineering Lab

An evaluation-led lab for turning model, prompt, and policy changes into reproducible, governable release candidates.

> Packaging records what was tested. Deterministic policy decides whether the candidate may progress. A package is not an approval.

## Project question

What evidence, integrity controls, and release gates should an AI change satisfy before it enters progressive delivery?

The first workload reuses the synthetic [MCP-Based SOC Copilot](../01-mcp-soc-copilot/README.md) task, but the release engine remains independent of SOC-specific types and rules. Week 1 freezes a workload, replays identical cases across interchangeable configurations, evaluates results, compares failures, and packages the evidence. Online rollout and rollback behavior remain out of scope until Week 2.

## Week 1 result

One 50-case synthetic workload was replayed against deterministic rules, prompted Qwen 2.5 3B, and a Qwen 2.5 3B LoRA candidate.

| Configuration | Schema validity | Routing accuracy | High-risk fast-path misses |
| --- | ---: | ---: | ---: |
| Deterministic rules | **50/50 (100%)** | **49/50 (98%)** | **0/7** |
| Prompted Qwen 2.5 3B | 26/50 (52%) | 26/50 (52%) | **0/7** |
| Qwen 2.5 3B LoRA | 47/50 (94%) | 39/50 (78%) | **1/7** |

The LoRA candidate improved on the prompted model, but it violated the predeclared zero-miss safety gate. The release decision was **reject from canary**. Deterministic rules remain the rollback baseline.

These are single-run results on a frozen synthetic workload, not production SOC-effectiveness claims. See [evaluation/week-01-results.md](evaluation/week-01-results.md) for denominators and limitations.

## Week 1 architecture

```mermaid
flowchart LR
    A[Pinned application revision] --> B[Frozen workload]
    B --> C[Generic replay contract]
    D[Rules or model configuration] --> C
    C --> E[Raw response]
    C --> F[Normalized result]
    F --> G[Deterministic evaluators]
    E --> H[Audit evidence]
    G --> I[Paired comparison]
    I --> J[Hashed candidate package]
    J --> K{Release policy}
    K -->|pass| L[Eligible for canary]
    K -->|fail| M[Retain evidence; reject]
```

See [architecture/overview.md](architecture/overview.md) for component and trust boundaries.

## Public artifacts

- [Week 1 update](weekly-updates/week-01.md)
- [Architecture overview](architecture/overview.md)
- [Workload card](datasets/soc-copilot-workload-v1.md)
- [Metric definitions](evaluation/metrics.md)
- [Week 1 results](evaluation/week-01-results.md)
- [Release-candidate identity decision](decisions/0001-versioned-release-candidate.md)
- [Deterministic-gates decision](decisions/0002-deterministic-gates.md)
- [Public threat-model summary](threat-model/public-summary.md)

## Explicit exclusions

- no complete evaluation set, expected labels, prompts, or per-case outputs
- no model weights, adapters, runtime configuration, or private implementation
- no production traffic, customer data, credentials, or private infrastructure identifiers
- no production-readiness or security-effectiveness claim
- no canary deployment, online telemetry, or automated rollback in Week 1
- no release authority assigned to an uncalibrated model judge
