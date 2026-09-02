# Sanitized MCP Tool Catalog

These are illustrative public contracts, not callable endpoints or source code.

| Tool | Purpose | Read-only output |
| --- | --- | --- |
| `normalize_alert` | Map a supported alert into the common schema | normalized alert or validation errors |
| `extract_iocs` | Identify bounded indicator types | typed indicators with source fields |
| `classify_triage` | Estimate severity and disposition | label, confidence, rationale |
| `map_attack` | Propose ATT&CK candidates | technique IDs with evidence |
| `retrieve_threat_context` | Retrieve controlled security knowledge | versioned evidence snippets |
| `retrieve_asset_context` | Retrieve synthetic asset context | criticality and ownership metadata |
| `recommend_action` | Suggest a playbook-aligned next step | recommendation and required review |
| `create_approval_record` | Record a proposed human decision | pending audit record; no action execution |

## Example

```json
{
  "tool": "classify_triage",
  "input": {
    "alert_id": "synthetic-alert-007",
    "activity_name": "suspicious_process_execution",
    "asset_criticality": "high"
  },
  "output": {
    "severity": "high",
    "disposition": "investigate",
    "confidence": 0.82,
    "requires_human_review": true,
    "reason": "Illustrative value; not a measured result"
  }
}
```

Field names and values are deliberately simplified. Operational schemas, validation details, prompts, thresholds, and transport configuration are private.
