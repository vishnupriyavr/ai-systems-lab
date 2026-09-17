# ADR 0010: Retain LoRA; Reject DoRA and Defer Preference Optimization

Status: accepted for the controlled prototype

## Decision

Retain LoRA as the V1 experimental proposal adapter. Reject DoRA for the current task. Defer DPO, ORPO, KTO, IPO/SimPO, and GRPO until suitable human preference or outcome data exists.

## Evidence

Under the same frozen model, data, training schedule, decoding, policy, and evaluations, DoRA matched LoRA's quality scores and repeated the same two independent failures. DoRA used more peak memory and increased mean inference latency from 5.35 to 8.60 seconds on the controlled challenge and from 5.44 to 8.87 seconds on the robustness suite.

The observed gaps concern privilege-escalation coverage, structured-output validity, missing fast-path authorization evidence, and deterministic taxonomy ownership. Synthetic preferences derived from the same labels would not provide new evidence.

## Reopen conditions

- DPO: genuine analyst-ranked chosen/rejected responses
- KTO-style methods: sufficient audited desirable/undesirable outcomes
- GRPO: a validated reward that cannot be cheaply gamed and compute justified by a concrete product need
- DoRA: a new failure hypothesis or materially changed model, data, hardware, or runtime

Deterministic safety and human approval remain authoritative regardless of training method.
