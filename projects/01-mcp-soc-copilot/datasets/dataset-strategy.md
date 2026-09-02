# Dataset Strategy

V1 uses targeted public telemetry and synthetic organizational context to cover eight supported scenarios reproducibly.

| Source class | Intended use | Publication treatment |
| --- | --- | --- |
| OTRF Security Datasets | selected attack telemetry and scenario inspiration | reference upstream; do not mirror blindly |
| Splunk Attack Data | selected detection-oriented telemetry | retain provenance and upstream terms |
| MITRE ATT&CK | canonical tactic and technique context | version the source snapshot and attribution |
| Sigma rules | public detection-rule context | preserve individual repository licenses |
| Synthetic SOC context | assets, users, playbooks, and incident history | generate solely for this project |

Live threat feeds, real organizational logs, broad packet datasets, and malware binaries are deferred. Synthetic data supports systems evaluation but is not proof of production security effectiveness.

## Intake checklist

- record source URL, version/date, license, and checksum
- document selected subsets and transformations
- scan for personal, customer, credential, and secret material
- keep raw datasets outside this public repository
- prevent train/evaluation leakage at scenario and lineage level
- label synthetic fields and generated ground truth
