# Week 3 SFT Data Methodology

The supervised fine-tuning corpus was created separately from the 50-alert golden evaluation asset.

## Corpus design

- 960 synthetic examples across eight supported scenarios
- 120 examples per scenario
- each record contains a validated OCSF alert, validated triage target, provenance, template-family identifier, deterministic seed, and fingerprint
- scenario balance is enforced; severity and route labels preserve their operational meaning rather than being artificially balanced

## Split strategy

| Split | Records | Share |
| --- | ---: | ---: |
| Training | 768 | 80% |
| Validation | 96 | 10% |
| Controlled challenge | 96 | 10% |

Whole template families—not random records—were assigned to splits. This reduces leakage from near-identical variants, but the challenge still shares the generator's vocabulary and overall structure. It measures controlled task learning, not real-world generalization.

Exact- and near-match contamination checks against the earlier golden set passed. The private records, templates, seeds, fingerprints, and transformation logic are not published.

## Token preflight

All 960 complete conversations were tokenized with the pinned model tokenizer before training. Mean length was approximately 1,532 tokens, maximum length was 1,544, and no example exceeded the 2,048-token limit. The preflight must be repeated whenever the tokenizer, prompt, target format, or corpus changes.

## Independent robustness set

A separately authored suite contained 16 valid cases—two per scenario—and four malformed OCSF inputs. It was intentionally outside the SFT generator, but remains too small to estimate production or per-scenario reliability. Case-level contents remain private to preserve the evaluation boundary.
