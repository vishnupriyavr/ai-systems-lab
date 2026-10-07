# ADR 0003: Offline Pass Authorizes Canary Entry Only

Status: accepted

## Decision

An offline `PASS` permits a candidate to enter the first canary stage. It does not authorize direct deployment to 100%, bypass online analysis, or transfer release authority to the model.

A `FAIL` or insufficient required evidence prevents the candidate from changing GitOps desired state. A `WARN` requires an explicitly named approver before canary entry.

## Why

Offline evaluation can detect reproducible contract, quality, and safety failures, but it cannot observe behavior under deployment conditions. Progressive stages create additional opportunities to stop on operational regressions while limiting exposure.

## Trade-offs

This adds promotion latency and operational machinery. It also means passing the offline suite is necessary but intentionally insufficient; every stage needs fresh evidence.
