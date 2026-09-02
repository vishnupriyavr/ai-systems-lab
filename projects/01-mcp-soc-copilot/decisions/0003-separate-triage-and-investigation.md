# ADR 0003: Separate Structured Triage from Investigation

Status: accepted

## Decision

Use a bounded router for severity, disposition, ATT&CK candidates, and route selection. Use retrieval and synthesis only for alerts that need deeper investigation.

## Why

The split makes accuracy, latency, cost, and failure modes independently measurable.

## Trade-offs

Routing errors can prevent useful investigation. Conservative abstention and mandatory review for high/critical alerts limit that risk.
