# ADR 0004: Separate GitOps Reconciliation from Rollout Control

Status: accepted

## Decision

Use a guarded policy step to authorize desired-state changes, Argo CD to reconcile approved Git state, and Argo Rollouts to own stage progression, metric analysis, and abort behavior.

## Why

Each component has a narrow authority boundary. The release policy answers whether offline evidence permits canary entry. Git records the approved state. Argo CD reconciles that state. Argo Rollouts reacts to live analysis without reinterpreting offline model evidence.

## Trade-offs

Multiple controllers create more state to correlate during incident review. Immutable candidate identifiers and transition records are therefore required across the policy decision, Git change, rollout, analysis, and rollback evidence.
