# Week 2 Context Lifecycle: Evidence and Gaps

| Risk | Local component evidence | Remaining validation |
| --- | --- | --- |
| Unauthorized speculative retrieval | Tenant permission checked before each load; rejection coverage | Broader permission models and live integration |
| Cross-tenant or cross-session cache reuse | Identity checks; tests reject foreign reads without deleting the owner's entry | Distributed cache and concurrent access |
| Access revoked after preparation | Consumption-time scope check and discard | Real identity-provider changes and race conditions |
| Source becomes stale | Version comparison and targeted invalidation | Real source update propagation |
| Expired or repeated reuse | TTL checks and one-use consumption | Distributed expiry and retry behavior |
| Work continues after interruption | Cancellation propagated to in-flight retrieval; local coverage | Live barge-in and streaming behavior |
| Speculation grows without bounds | Item, elapsed-time and simulated-cost budgets | Measured resource contention and actual cost |
| Wrong prediction or abstention | Separate replay tests cover fallback and waste | Independent adverse cases and end-to-end runtime overhead |

The 200-turn comparison models context overlap and costs. It does not execute these safety controls, and its zero-fallback result is not evidence of universal correctness. Component tests and comparative metrics answer different questions.

Prediction must not authorize access or trigger operational side effects. Live voice behavior, production isolation, model calibration and release-gate integration remain outside the Week 2 result. Exact policy thresholds, fixtures and detailed control implementations remain private under the repository disclosure policy.
