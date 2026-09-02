# ADR 0001: Normalize to OCSF 1.8.0 Before AI Processing

Status: accepted

## Decision

Map each supported source into a validated OCSF 1.8.0 representation before routing, retrieval, or model access.

## Why

A stable semantic boundary makes baselines comparable, reduces prompt coupling to vendor syntax, and lets malformed input fail early.

## Trade-offs

Normalization adds mapping work and can lose source-specific detail. Raw source references therefore remain available privately for audit, while only allow-listed normalized fields enter AI context.
