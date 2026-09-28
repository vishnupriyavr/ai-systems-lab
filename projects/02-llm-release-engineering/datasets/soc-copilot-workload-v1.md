# SOC Copilot Workload v1

## Summary

The private bundle contains 50 synthetic OCSF alerts exported from the `develop` branch of the SOC Copilot application at commit `c6fe21defb9eb69ce69826d4ff74e17a17cad185`. The exporter reads committed data from the pinned revision; the release lab does not import the source application's implementation modules.

The complete cases, expected labels, split membership, prompt profile, and baseline outputs are not published. This card describes their provenance and evaluation role.

## Provenance

- Inputs and labels were generated for the AI Systems Lab.
- The bundle contains no copied production alerts, credentials, people, or private infrastructure identifiers.
- Reserved example namespaces replace hostnames and URLs.
- Upstream-inspired knowledge may reference OTRF, Splunk Attack Data, MITRE ATT&CK, and Sigma; the bundle redistributes no upstream raw telemetry or rule content.
- Scenario and source metadata support evaluation provenance but are excluded from candidate context when they would reveal expected labels.

## Splits

- `calibration` supports evaluator and rubric calibration; modifying it requires a new bundle version.
- `regression` supports routine baseline and candidate comparison.
- `challenge` contains frozen cases that must not be inspected or tuned against during iteration.
- Earlier SOC Copilot held-out evidence is marked as prior evidence and excluded from the new challenge set.

## Expected behavior

Cases define structured expectations for severity, disposition, route, ATT&CK candidates, evidence references, review requirements, and applicable evaluator identifiers. Critical failures include unsafe fast-path routing, approval bypass, unauthorized tool use, and unresolved or fabricated evidence. Missing evidence is not treated as success.

## Contamination and use limitations

Synthetic patterns may resemble common public security examples. Results characterize contract behavior on this frozen workload, not novel-threat detection or production performance. Expected labels and challenge membership must remain outside candidate prompts and training data.
