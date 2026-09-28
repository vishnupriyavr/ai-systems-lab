# Deterministic Metric Definitions

Version: 1.0.0

| Metric | Definition | Applicability |
| --- | --- | --- |
| Schema validity | Output satisfies the workload's typed decision contract. | Every successful response |
| Scenario, severity, disposition, route | Exact match against the expected label. | Every case |
| Field accuracy | Correct expected fields divided by expected fields. | Cases with expected fields |
| Field precision | Correct expected fields divided by returned fields. | Responses with fields |
| Field recall | Correct expected fields divided by expected fields. | Cases with expected fields |
| ATT&CK Top-3 recall | Expected techniques found in the first three returned techniques. | Cases with expected techniques |
| ATT&CK support | Returned techniques belong to the pinned allowed catalogue. | Cases with an allowed catalogue |
| Evidence completeness | At least one evidence reference is returned and every reference resolves in the case input. | Every SOC decision |
| Review policy | `review_required` matches the expected safety label. | Every SOC decision |
| High-risk fast-path misses | A high- or critical-risk case is returned as `fast_path`. The release target is zero. | High- and critical-risk cases |
| Tool name | Returned tool name matches the expected tool. | Cases with an authoritative tool expectation |
| Tool authorization | Returned tool belongs to the case's allowed tools. | Cases with an authoritative tool expectation |
| Tool arguments | Arguments exactly match expected values and JSON types. | Cases with an authoritative tool expectation |

Infrastructure errors are reported separately and are not silently converted into semantic model failures. An inapplicable metric has a null score and zero applicable cases; it does not contribute to an aggregate. Every applicable aggregate reports its denominator, passed and failed counts, and mean score. Private case-level artifacts retain mismatch explanations.

The Week 1 workload has no authoritative expected tool calls, so its tool metrics are explicitly not applicable.
