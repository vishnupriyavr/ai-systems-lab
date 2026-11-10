# Decision 0003: Revalidate Context Before Consumption

Status: accepted for the Week 2 local cache component.

## Context

Authorized speculative retrieval can become inappropriate before use: permissions may change, a source version may advance, an entry may expire, or the caller may belong to another session.

## Decision

Scope local entries to tenant, user, session, permission scope and source version. Recheck identity, current authorization, version and TTL before consumption. Consume accepted entries once; discard revoked, stale or expired entries. Reject foreign identities without deleting the owning session's value. Retain targeted invalidation and observable lifecycle outcomes.

## Consequences

A prediction supplies a candidate for preparation, never access authority. Revalidation can turn a possible reuse into a miss, so callers need a reactive path. Local tests cover these transitions; distributed cache behavior and full runtime integration require separate evidence.
