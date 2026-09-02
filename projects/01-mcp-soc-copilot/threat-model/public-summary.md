# Public Threat-Model Summary

| Risk | Example | Public mitigation theme |
| --- | --- | --- |
| Prompt injection | alert text or retrieved document contains instructions | treat all content as data; structured extraction |
| Data leakage | secrets or identifiers enter prompts or traces | allow-list fields; scrub traces; synthetic-only public artifacts |
| Tool misuse | model attempts unauthorized capability | read-only tools; policy outside model; least privilege |
| Hallucinated evidence | summary invents technique or rationale | provenance, groundedness checks, abstention |
| Evaluation leakage | golden examples influence prompts/training | lineage-aware split and private frozen set |
| Automation bias | analyst over-trusts recommendation | uncertainty display and explicit human decision |
| Supply-chain drift | model, dataset, or knowledge source changes | version pinning and recorded provenance |

This summary communicates design intent, not a claim that the prototype is production-secure. Detailed abuse cases, thresholds, canaries, and control implementation remain private.
