# Week 3: Fine-Tuning Improved the Router—Not Its Authority

Week 3 tested whether supervised parameter-efficient fine-tuning could improve structured SOC triage without moving safety decisions into model weights.

## Delivered privately

- 960-example synthetic SFT corpus, isolated from the golden evaluation set
- 80/10/10 template-family-separated train, validation, and challenge splits
- token-length and contamination preflight checks
- BF16 LoRA training on Qwen 2.5 3B
- controlled DoRA comparison after independent failures reopened the method gate
- 96-case controlled challenge
- 16 independently authored model cases plus four malformed-input probes
- typed evidence validation and explicit deterministic governance invariants

## Main results

LoRA moved raw routing from 62.5% to 100% on the controlled challenge. That showed successful learning of the bounded synthetic task, not production generalization.

On independently authored cases, LoRA reached:

- 87.5% raw routing accuracy
- 87.5% severity accuracy
- 93.75% schema validity
- 93.75% governed routing accuracy
- zero governed high-risk review misses

Both raw failures involved privilege-escalation probes. Policy contained them, but the failures remain model failures.

DoRA matched every LoRA quality result and repeated the same failures while using more memory and adding substantial latency. It was rejected for V1. QLoRA stayed closed because BF16 LoRA fit with measured headroom. Preference optimization was deferred because the project has no genuine analyst preference or outcome dataset.

## Architecture decision

```text
Model proposes
→ typed code validates
→ deterministic policy authorizes or escalates
→ versioned catalogue owns ATT&CK mapping
→ human analyst owns sensitive decisions
```

## Release decision

- conditional go for LoRA as a controlled proposal component
- no-go for production or autonomous routing
- no model-owned fast-path authority
- no automated remediation in V1

## Next

Week 4 will integrate the bounded components into one auditable MCP workflow and compare retrieval-only, fine-tuned-only, and hybrid paths. The next readiness evidence must include broader independently authored coverage, structured positive/adversarial fast-path cases, and a deployment-specific latency SLO.

## Disclosure note

Only aggregate results and decision boundaries are public. Corpus records, generation templates, prompts, case-level predictions, adapter weights, checksums, private configurations, and detailed signatures remain private.
