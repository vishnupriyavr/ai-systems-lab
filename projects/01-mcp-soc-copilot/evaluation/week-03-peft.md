# Week 3 Parameter-Efficient Fine-Tuning

## Question

Can supervised parameter-efficient fine-tuning improve a small model's bounded triage proposals, and does DoRA improve enough over LoRA to justify its additional cost?

## Experiment

- base model: Qwen 2.5 3B Instruct
- runtime: Apple-native MLX-LM on a MacBook Pro with an Apple M3 Pro and 18 GB unified memory
- primary method: BF16 LoRA
- controlled alternative: DoRA with the same model, corpus, split, rank, targets, optimizer, schedule, decoding, and evaluation sets
- QLoRA gate: open only if BF16 LoRA showed measured memory pressure

The LoRA configuration trained approximately 1.84 million parameters—about 0.06% of the 3.09-billion-parameter model—using rank 8, alpha 16, 5% dropout, and attention query/value projections.

## Training evidence

| Measure | LoRA | DoRA |
| --- | ---: | ---: |
| Training duration | 4 h 21 min | 4 h 36 min |
| Peak memory | 8.877 GB | 9.552 GB |
| Trainable parameters | 1.843 M | 1.926 M |
| Adapter size | ~7 MB | ~7.4 MB |

LoRA fit comfortably in available memory, so QLoRA was intentionally not run. Training and validation loss reached almost zero early; this was treated as a warning about a regular synthetic corpus, not proof of generalization.

## Controlled 96-case challenge

| Metric | Untuned 3B | LoRA 3B | DoRA 3B |
| --- | ---: | ---: | ---: |
| Schema validity | 100% | 100% | 100% |
| Raw routing accuracy | 62.5% | 100% | 100% |
| Governed routing accuracy | Not reported | 75% | 75% |
| Raw severity accuracy | 50% | 100% | 100% |
| Labeled ATT&CK candidate recall | Not reported | 100% | 100% |
| Raw high-risk review misses | 12 | 0 | 0 |
| Governed high-risk review misses | 0 | 0 | 0 |
| Mean latency per alert | 6.32 s | 5.35 s | 8.60 s |
| P95 latency per alert | Not reported | 5.64 s | 9.68 s |

The adapters' 24 policy overrides came from expected fast-path cases that lacked the structured authorization evidence required by policy. The 75% governed score therefore exposes a dataset-contract gap and deliberate safety denial; it is not evidence of 24 model classification errors.

## Independent robustness

| Metric | LoRA 3B | DoRA 3B |
| --- | ---: | ---: |
| Valid model cases | 16 | 16 |
| Malformed inputs rejected | 4/4 | 4/4 |
| Schema validity | 93.75% | 93.75% |
| Raw routing accuracy | 87.5% | 87.5% |
| Governed routing accuracy | 93.75% | 93.75% |
| Severity accuracy | 87.5% | 87.5% |
| Raw high-risk review misses | 2/4 | 2/4 |
| Governed high-risk review misses | 0/4 | 0/4 |
| Correct abstention on unsupported cases | 2/2 | 2/2 |
| Evidence validity among accepted proposals | 15/15 | 15/15 |
| Mean latency per alert | 5.44 s | 8.87 s |
| P95 latency per alert | 5.92 s | 9.67 s |

Both adapters failed the same two independently authored privilege-escalation probes: one was under-classified and one produced invalid structured output. Deterministic governance escalated the recognized risk signal and failed closed on invalid output. This contained risk without converting the failures into model successes.

## Decisions

- **Conditional go:** LoRA as an untrusted, controlled triage-proposal component.
- **Reject DoRA for V1:** identical quality and failures with higher memory and roughly 61–63% higher mean latency in the controlled local comparisons.
- **Keep QLoRA closed:** BF16 LoRA had sufficient measured memory headroom.
- **Defer preference optimization:** no genuine analyst-ranked pairs, audited binary feedback, or trustworthy non-gameable reward exists yet.
- **Production no-go:** independent routing, severity, and schema-validity gates were not met; the independent set is also too small.

## Limitations

- The controlled challenge shares the synthetic generator's language and structure with training.
- The independent set has only two cases per scenario.
- Percentages across Week 2 and Week 3 datasets are not interchangeable.
- Local serial latency is hardware- and runtime-specific and is not a deployment SLO.
- The challenge lacks structured positive authorization evidence for fast paths.
- No live SOC traffic, analyst feedback, operational base rates, concurrency, or remediation was evaluated.
- Adapter weights remain private pending disclosure and upstream-license review.
