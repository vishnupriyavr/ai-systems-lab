# Workload v0.1 and Benchmark Roles

## Bounded support scenarios

| Scenario | Context categories | Intended outcome |
| --- | --- | --- |
| VPN/login failure | Identity, device, VPN status, approved runbook | Permitted recovery guidance or escalation |
| Account lockout | Identity, account status, authentication policy | Verified recovery path or escalation |
| Device compliance | Ownership, findings, device policy, runbook | Approved guidance or escalation |
| Service outage | Service status, tenant impact, incident, status message | Verified status and next steps |
| Software access | Role, entitlement, approval policy, catalog | Fulfilment, approval routing or rejection |

The contracts distinguish employee, support-agent and administrator roles. Ambiguous and out-of-domain requests are explicit workload categories. The listed outcomes describe requirements, not measured autonomous execution.

## Secondary ticket corpus

The source is [Tobi-Bueck Customer Support Tickets](https://huggingface.co/datasets/Tobi-Bueck/customer-support-tickets), recorded in the project as CC BY-NC 4.0. The adapted corpus therefore has a non-commercial restriction; the documentation repository's MIT license does not replace the source terms.

Week 1 deterministically selected 500 English candidate records, balanced at 100 per scenario, sanitized them and assigned keyword-based weak labels. Source IDs, source split, transformations, review status and synthetic status are retained privately for lineage. The corpus is adapted and relabelled, rather than an untouched copy or expert-reviewed benchmark.

Four additional synthetic edge cases cover certificate/MFA issues and encryption/endpoint-agent compliance gaps. They are separate from the 500 source-derived tickets and require human review. Balanced counts and added examples do not prove semantic coverage.

## Audio fixtures

Five clean and five noisy fixtures use a system voice and synthetic noise. Their supplied transcripts make replay deterministic. They exercise local pipeline wiring; they do not test recognition accuracy under noise or generalization to real callers.

## Planned primary predictive benchmark

At Week 1 close, 50–100 reviewed multi-turn conversations were planned for Week 2. Each turn needs current state, gold next state, required/permitted context and partial-transcript checkpoints. Ambiguity, topic changes and abstention must be represented, with related templates grouped within splits to reduce leakage.

This benchmark has a different job from the ticket corpus: measure next-state prediction and whether early retrieval supplies useful authorized context. Single-turn tickets cannot supply that evidence on their own.
