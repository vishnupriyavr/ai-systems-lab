# Week 1 Safety Boundaries and Limitations

| Risk | Week 1 evidence | Further requirement |
| --- | --- | --- |
| Cross-tenant context retrieval | Tenant-scoped local retrieval and automated rejection coverage | Broader tenant/user/session and permission-change evaluation |
| Incorrect or stale context | Provenance and versioned local graph seed | Consumption-time authorization, freshness and invalidation checks for predictive context |
| Unwanted work after interruption | Local cancellation support and test coverage | Streaming voice and in-flight prefetch cancellation evidence |
| Unsafe action from a prediction | Week 1 path prepares guidance and fixture audio | Prediction must never authorize access or execute side effects |
| Misleading performance claims | Fixture and simulated timing explicitly scoped | Live end-of-speech-to-first-audio measurement with quality checks |
| Misleading benchmark claims | Weak labels and synthetic cases identified | Reviewed multi-turn labels and matched comparisons |
| Evidence detached from configuration | Hashed export and Release Lab contract validation | Separate sufficiency and promotion decisions |

The project design retains reactive retrieval when prediction is uncertain or unusable. At Week 1 close, predictive authorization, scoped-cache lifecycle and safe fallback were requirements for subsequent experiments, not fully validated deployed controls.

Public artifacts contain component-level design, aggregate results and limitations. Complete evaluation fixtures, traces, prompts, operational controls and any real user or customer material remain outside this package. Passing bounded local tests does not establish production security or readiness.
