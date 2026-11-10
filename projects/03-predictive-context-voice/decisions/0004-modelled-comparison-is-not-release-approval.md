# Decision 0004: Keep Modelled Comparison Separate from Release Approval

Status: accepted as the public interpretation of Week 2 evidence.

## Context

The graph and synthetic conversations share a source. The comparative replay computes dependency overlap and fixed costs rather than exercising the full prefetch/cache runtime. Perfect scores and lower modelled latency could be mistaken for deployment evidence.

## Decision

Report source linkage, review depth, metric denominators and cost-model exclusions alongside results. Treat this replay as pipeline evidence. Require independent cases and measured runtime latency before performance claims, and finish predictive integration with the existing Release Lab before reporting a release decision.

## Consequences

The local experiment can progress without implying generalization, live voice acceleration or promotion eligibility. Full-turn prediction, partial-checkpoint action accuracy, ticket coverage and context usefulness remain distinct measures. The existing release framework retains release-policy ownership; Week 2 does not establish its predictive integration exit.
