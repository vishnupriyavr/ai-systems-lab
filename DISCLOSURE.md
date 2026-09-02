# Public Disclosure Policy

## Safe to publish

- architecture at component and trust-boundary level
- product scope, assumptions, and exclusions
- architectural decision records and trade-offs
- dataset selection rationale, provenance, and license notes
- sanitized schemas and deliberately synthetic examples
- evaluation methodology, aggregate metrics, and limitations
- high-level threat model and human-approval policy
- weekly engineering updates

## Keep private

- application and MCP server implementation
- complete golden evaluation set and adversarial canaries
- system prompts, routing heuristics, and policy thresholds
- internal test fixtures and detailed security-control implementation
- credentials, configuration, traces, logs, or real SOC/customer data
- operational integration details that would increase attackability

## Review rule

Every public artifact must be synthetic or sourced from redistributable public material, contain no secrets or personal data, avoid executable remediation, and distinguish measured results from planned work.
