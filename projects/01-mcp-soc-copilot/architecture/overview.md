# Architecture Overview

## Responsibility split

| Layer | Responsibility | Boundary |
| --- | --- | --- |
| Ingest | Accept allow-listed public or synthetic alerts | No real tenant data |
| Normalization | Map supported fields to OCSF 1.8.0 | Reject or quarantine invalid input |
| Router | Produce structured severity, disposition, ATT&CK candidates, and route | Compared against deterministic rules |
| MCP | Expose narrow, typed, read-only SOC capabilities | Policy enforced outside model output |
| Retrieval | Return versioned evidence from controlled sources | Retrieved text remains untrusted data |
| Synthesis | Summarize evidence and surface uncertainty | No unsupported operational claims |
| Authority | Record analyst approval or rejection | Recommendation is never execution |

## Trust boundaries

Alerts and retrieved text can contain prompt injection, malformed fields, misleading indicators, or sensitive-looking strings. They are data, never instructions. Typed validation, allow-listed fields, bounded retrieval, provenance, output validation, and trace scrubbing form the public control story. Control implementations and thresholds remain private.

## MCP shape

The server is intentionally thin. Domain services own normalization, routing, retrieval, and policy; MCP provides discoverable typed contracts. This keeps evaluation possible without coupling results to one client and allows a later private MCP app without redesigning the domain boundary.
