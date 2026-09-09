# Week 2: What the Baselines Changed

Week 2 turned the Week 1 contracts into working private software and tested whether a prompted model added value over deterministic rules.

## Delivered privately

- eight implemented typed, read-only MCP capabilities
- deterministic normalization, IOC extraction, triage, policy, and ATT&CK mapping
- four versioned local retrieval services for threat, asset, incident, and playbook context
- prompted Qwen 2.5 7B adapter behind the same typed contract and safety policy
- frozen 18-alert held-out baseline comparison
- 134 passing automated tests, repository-wide linting, and strict type checking across 44 source files

## What the evidence showed

1. Rules were the strongest implementation for the frozen V1 scope: 100% routing accuracy, 94.44% severity accuracy, 100% ATT&CK Top-3 recall, and about 0.05 ms mean latency.
2. The prompted model achieved 77.78% raw routing accuracy and 72.22% severity accuracy. Application policy corrected two routes, producing 88.89% governed routing accuracy.
3. A zero high-risk fast-path miss rate was insufficient: the raw model still missed mandatory analyst review on two of three high-risk alerts. Policy reduced governed review misses to zero.
4. Prompted ATT&CK recall was 0% on nine mapped alerts; the deterministic versioned mapper achieved 100% Top-3 recall. ATT&CK therefore remains authoritative outside the model.
5. Retrieval tools exist, but route-triggered RAG and grounded synthesis are not yet integrated. They remain target architecture.

## Architecture after Week 2

```text
Deterministic normalization and extraction
→ rules or SLM triage proposal
→ application-owned safety policy
→ deterministic ATT&CK mapping
→ versioned retrieval
→ human authority for sensitive decisions
```

## Week 3 decision

Proceed conditionally with supervised LoRA/QLoRA using a new training corpus and untouched challenge set. DPO may follow only if preference errors remain. GRPO and production model routing are out of scope for V1.

## Disclosure note

These results are aggregate prototype evidence from synthetic alerts. Prompts, per-alert predictions, held-out fixtures, detailed mappings, and control implementations remain private.
