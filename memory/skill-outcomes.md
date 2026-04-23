# Skill Outcomes

Per-skill success tracking — inspired by Hermes Agent's skill metadata pattern. Every time Andrea invokes a skill, append an outcome entry here. Nightly consolidation aggregates into success rates and flags skills that need refinement.

## Schema

```
| Date | Skill | Invoker | Outcome | Correction? | Notes |
|------|-------|---------|---------|-------------|-------|
```

**Outcome values:** `completed | partial | failed | deferred | skipped | unknown`

**Correction field:** `none` if Jeff accepted output as-is; `light-edit` if small tweaks; `heavy-rewrite` if he rewrote most of it; `rejected` if he discarded.

## Per-skill success aggregates

(Updated by nightly-memory-consolidation. Don't edit manually.)

| Skill | Invocations | Success rate | Avg corrections | Last used | Status |
|-------|-------------|--------------|-----------------|-----------|--------|
| *(populated over time)* | — | — | — | — | — |

**Status values:** `draft` (new, unproven) · `tested` (≥3 invocations, ≥70% success) · `refined` (skill updated once based on outcomes) · `promoted` (trusted for higher autonomy tier)

## Refinement queue

Skills with sustained failure (<50% success over 5+ invocations) land here for `/learn-skill` review.

*(empty — populated as needed)*

## Raw log

(newest at top — append on every skill invocation)

---
