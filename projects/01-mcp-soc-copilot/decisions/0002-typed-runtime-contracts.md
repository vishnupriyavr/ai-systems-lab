# ADR 0002: Typed Models Are the Runtime Contract

Status: accepted

## Decision

Use typed Pydantic models as the private runtime source of truth and derive interface schemas from them rather than maintaining duplicate handwritten JSON schemas.

## Why

One source reduces schema drift across services, MCP contracts, tests, and evaluation.

## Trade-offs

Generated schemas must still be reviewed for compatibility and accidental disclosure before publication.
