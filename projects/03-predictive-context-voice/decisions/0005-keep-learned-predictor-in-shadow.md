# Decision 0005: Keep the Learned Predictor in Shadow Mode

Status: accepted for the next lab experiment; no production approval.

## Context

All three local candidates matched every original synthetic challenge label. Rules and Markov use structured scenario/state inputs, while logistic regression uses transcript language. The learned candidate therefore tests a different question despite equal base-case scores.

Its accuracy fell to 70% under simulated ASR revisions, including four high-confidence errors. Jev has no matched live evidence, and the conversations remain related to the synthetic generator.

## Decision

Continue logistic regression as a shadow experiment. Retain the documented fallback chain of rules, Markov when available, then reactive retrieval. Require stronger ASR-revision handling and independent/live evaluation before considering activation. Keep Jev at insufficient evidence until matched calls exist.

## Consequences

The selection reflects the learning value of a transcript-only experiment, not proof that it outperforms simple controls. Base-case scenario checks and hashed packages cannot override robustness failures or authorize deployment. Further work must evaluate the whole runtime, revalidate confidence policy on independent data, and complete release-framework comparison.
