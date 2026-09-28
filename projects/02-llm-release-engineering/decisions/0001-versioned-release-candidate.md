# ADR 0001: Package Identity Separately from Release Approval

Status: accepted

## Decision

Create an integrity-protected package for every evaluated candidate, including candidates that fail release policy. Treat packaging and approval as separate actions.

The package binds the release-lab and application revisions, model and adapter identity, workload and prompt profile identity, evaluator versions, release policy, intended canary stages, rollback rules, and hashes of referenced evidence.

## Why

A negative result must remain reproducible and attributable. Discarding a failed candidate loses the evidence behind the decision; treating a package as an approval confuses identity with authority.

## Trade-offs

Retaining failed packages adds storage and lifecycle work. Hash verification detects changed evidence but does not establish that the evidence was correctly generated, so independent validation and access controls remain necessary.
