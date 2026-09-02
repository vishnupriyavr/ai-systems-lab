# ADR 0004: Keep MCP Thin, Typed, and Read-Only in V1

Status: accepted

## Decision

Expose eight narrow FastMCP tool contracts. V1 tools normalize, retrieve, classify, recommend, or record a pending approval; they do not execute containment or remediation.

## Why

Tool boundaries stay auditable and reusable while policy and domain behavior remain testable outside the protocol layer.

## Trade-offs

This is less dramatic than autonomous response, but better matches the evidence and risk profile of a portfolio prototype.
