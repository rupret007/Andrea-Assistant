---
name: outcome-log
description: Track the actual outcomes of Andrea's work — what got done, partially done, skipped, failed, or deferred. Six-state closure ledger distinct from TASKS.md. Use when Jeff says "what happened with X", "show outcomes", "close the loop on Y", or when reviewing what Andrea actually accomplished vs. what was planned.
---

# Outcome Log

Ported from Andrea_NanoBot. Separates "what happened" from "what was planned" — reality vs. intent.

## Why this exists

Tasks have a binary close (done / not done). Real outcomes are fuzzier. A reminder-backed deferral shouldn't be marked `completed`. A partially executed Action Bundle shouldn't silently succeed. This skill gives Jeff an honest record.

## Storage

Append-only log at `memory/outcome-log.md`:

```markdown
# Outcome Log

## {YYYY-MM-DD}

- **{time}** | bundle:{AB-20260417-001} | item 1 of 3 | **completed** — Drafted and sent band-comms text for practice confirmation
- **{time}** | bundle:{AB-20260417-001} | item 2 of 3 | **deferred** — User said "not now" for drafting the setlist email
- **{time}** | bundle:{AB-20260417-001} | item 3 of 3 | **skipped** — Jeff chose to skip the Wintrust prep
- **{time}** | mission:{wildflower-prep} | phase 1 exit | **partial** — 3 of 5 sub-tasks done; setlist lock still open
- **{time}** | schedule:{morning-briefing} | run | **completed** — Brief delivered at 6:58am
- **{time}** | skill:{cisco-check-in-draft} | invocation | **failed** — User didn't provide reference; Andrea asked and waited
```

## The six states

| State | Meaning |
|-------|---------|
| **completed** | Fully executed, intended outcome reached |
| **partial** | Some parts succeeded, others didn't — specify which |
| **skipped** | Jeff explicitly chose not to proceed |
| **failed** | Attempted but broke (tool error, context missing, etc.) |
| **deferred** | Moved to a later time, with a target date if possible |
| **unknown** | Not sure what happened — flag for Jeff to resolve |

Never use `completed` to paper over `partial` / `deferred` / `unknown`.

## When to log

Every meaningful operation Andrea performs:
- Action Bundle executions (per item)
- Mission phase transitions
- Scheduled task runs
- Skill invocations that attempt to produce an outcome

Skip logging: conversational answers, briefings that are purely informational, passive reads.

## Commands

### Query outcomes
"Show outcomes for last week" → filter by date range, return by state
"What happened with bundle AB-20260417-001" → all items for that bundle
"Show unknowns" → items marked `unknown` awaiting review
"Close the loop on {X}" → find the open item, prompt Jeff for actual outcome, update state

### Weekly review integration
The Sunday weekly preview and monthly review skills should read this log to produce accurate "what got done" summaries. Not "what was planned" — what actually happened.

## Outcome rollups

Running counts per state, per week, per skill:
- `/outcome-log summary` → "Last week: 12 completed, 3 partial, 4 deferred, 1 failed, 0 unknown"
- Helps Jeff spot patterns: "You defer 30% of social-post bundles — maybe drop the rule tier."

## Integration with other skills

- `/action-bundle` — every bundle item execution logs to outcome-log
- `/mission` — phase transitions log outcomes
- `/trust-ladder` — every send attempt logs
- `/chief-of-staff` — reads outcomes to flag slip-risk patterns

## Never do

- Never overwrite past outcome entries. Append-only.
- Never mark `completed` without evidence. `unknown` is honest; false `completed` is a trust breach.
- Never hide failures. Log them visibly — that's the value.

## Memory
- Reads: `memory/outcome-log.md`
- Writes: `memory/outcome-log.md` (append)
