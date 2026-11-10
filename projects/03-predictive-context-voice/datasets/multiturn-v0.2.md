# Multi-turn Benchmark v0.2

## Composition and provenance

The frozen `multiturn-v0.2-reviewed` benchmark contains 50 synthetic conversations, ten per bounded IT-support scenario. Together they contain 200 turns and 600 partial-transcript checkpoints. Each turn carries current state, expected next state and permitted context; checkpoints include predict/abstain expectations for incomplete or ambiguous text and topic changes.

Related template variants stay within a split. That grouping reduces cross-split template leakage, but does not make a graph derived from the same benchmark independent of its evaluation cases.

## Review depth

The project owner approved all 50 conversations on 23 October 2026. The recorded method is **owner glance approval**: no revisions or rejections and no independent detailed second-reviewer audit. “Reviewed” in the version name refers to that limited process.

The freeze preserves the original draft, approval record and source/frozen artifact hashes. The graph is tied to the frozen benchmark and contains 20 transition edges with counts and normalized probabilities.

## Appropriate use

- Verify predictor contracts and graph/state wiring.
- Inspect predict/abstain action behavior at partial checkpoints.
- Compare dependency overlap and declared costs on identical turns.
- Develop failure handling before independent evaluation.

The benchmark does not establish real conversation coverage, independently measured predictor generalization or speech-recognition quality. Supplied scenario/current-state fields and shared graph provenance make the baseline task easier than live inference.

## Secondary corpus remains separate

The 500 adapted tickets retain the provenance and license restrictions described in the [Week 1 workload card](workload-v0.1.md). Week 2 uses them for prediction coverage and balance only. They have no gold next-turn labels and cannot support next-state accuracy claims. Complete benchmark content and labels remain private.
