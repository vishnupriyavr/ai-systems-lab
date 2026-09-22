# Week 4: The Model Improved; the Architecture Still Said No

Week 4 integrated the four-week prototype and tested the opening thesis against a larger independent evaluation.

## Delivered privately

- application-owned orchestration across eight typed, read-only MCP capabilities
- route-specific retrieval budgets
- bounded context bundles with provenance and freshness
- structurally grounded investigation summaries
- explicit analyst approve, modify, and reject decisions
- content-bound audit records with authorization kept `not_granted`
- 200 independently authored synthetic triage alerts
- 19 fast-path cases, 16 supported retrieval questions, and 12 retrieval boundary cases
- one frozen final comparison of rules, prompted Qwen 2.5 3B, and LoRA

## What changed

LoRA improved over prompted inference:

- raw routing: 62.5% → 81.0%
- severity: 55.5% → 81.0%
- ATT&CK candidate recall: 25.0% → 68.0%
- mean latency: 17.02 s → 5.44 s
- output tokens: 63,021 → 14,709

It still failed the declared routing and schema gates and retained 15 governed high-risk review misses. Fine-tuning earned a bounded research role, not routing authority.

Rules were strongest for routing at 93.5% with zero evaluated high-risk misses, but their 69% severity accuracy and 38% ATT&CK recall show that deterministic coverage also needs work.

Typed retrieval earned a narrow role for changing context. Supported exact lookups and provenance passed on 16 questions, and 12 boundary cases verified empty, stale, conflicting, unsupported, and poisoned-content behavior. Retrieval never changed route or authorization.

## Final architecture

```text
Alert → OCSF validation → typed extraction
→ rules-authoritative triage (LoRA optional proposal)
→ deterministic ATT&CK mapping
→ route-aware MCP retrieval
→ bounded cited summary
→ analyst decision
→ content-bound audit record
```

## Sprint decision

- controlled-prototype continue
- LoRA proposal path revise
- production/autonomous routing no-go
- remediation execution absent by design

The main lesson is that improved model quality does not automatically justify increased authority. Architecture should follow measured evidence, even when it changes the original thesis.

## Disclosure note

Only aggregate results and responsibility boundaries are public. Alert records, case-level outputs, prompts, policies, retrieval snapshots, manifests, hashes, adapters, detailed signatures, and private implementation remain unpublished.
