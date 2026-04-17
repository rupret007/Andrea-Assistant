---
name: what-changed
description: Summarize recent activity in Jeff's Google Drive, Gmail, and calendar since a given time window. Use when Jeff says "what's new", "what did I miss", "catch me up", "what changed since Friday", or returning from time off. Groups activity by project/person so one scan surfaces everything moving.
---

# What Changed

Drive + Gmail + Calendar delta scanner. Useful after a break, before a planning session, or first thing Monday.

## When to use

- "What's new?"
- "Catch me up — I've been off the grid"
- "What changed since {day/date}"
- "What did I miss while I was at the show / on vacation / asleep"
- First-thing-Monday surfacing

## Process

### Step 1 — Determine the window

Jeff's phrasing usually implies:
- "what's new today" → 24 hours
- "since Friday" → compute from date
- "while I was gone" → ask for the start date
- Default if unspecified → 7 days

### Step 2 — Scan three sources

**Drive** (`list_recent_files` + filter by `modifiedTime`)
- Files modified by Jeff in the window → "your work"
- Files modified by others he collaborates with (Chris Story, Travis Worsham, anyone else) → "someone else touched this"
- New files shared with him → "new arrivals"

**Gmail (personal only)**
- Unread threads in the window from known people → rank by sender importance
- Any threads where Jeff was @-mentioned or had a direct ask
- Anything marked important by Gmail's classifier
- Skip newsletters and promotional blasts unless Jeff asked to include everything

**Calendar**
- Events that occurred during the window Jeff may want to remember (meetings he attended, not auto-declined spam)
- Events on his calendar that were edited or moved

### Step 3 — Group by project

Cross-reference with `memory/projects/` and organize findings by project, not by source. A single `/what-changed` output should read like:

```
📊 **What changed — last {N} days**

## Rad Dad
- Travis updated the Rad Dad Setlist sheet (Apr 15) — added 2 songs to stretch list
- New photo in Rad Dad Videos folder from 4-11-26 gig
- No new emails about Wildflower

## Stalemate
- No activity (band paused for Sean's paternity leave — expected)

## Solo music
- Song catalog doc touched Apr 12
- 2 new m4a files in demos folder

## constructiondaily
- Chris pushed 3 commits (see `/repo-standup` for detail)
- New doc shared: "Concrete Schedule Q2 2026" — you haven't opened it yet

## Cisco
- (Work email not connected — you'd need to check directly)

## Inbox highlights
- {sender}: {subject} — {why it matters}

## Quiet zones (nothing changed)
- WebJam, Turdanoid, WPSD-Dashboard
```

### Step 4 — Flag what needs a decision

End with a short "action hits" section — items from the scan that actually need Jeff to do something:

```
🔔 **Needs your attention**
- {concrete open loop}
- {thing unopened for 3+ days}
- {deadline inside the next 7 days you haven't acknowledged}
```

### Step 5 — Offer follow-ups

- "Want me to draft a reply to {name}?"
- "Want me to `/mode-switch` into {project} so we can work it?"
- "Want me to add the {deadline} to TASKS.md?"

## Never do

- Never open private or work-related content. Skip anything that looks like Cisco internal (work email isn't connected but Drive might still contain copied content).
- Never take action on items — just report.
- Never dump raw email subject lines without context — summarize.

## Memory to read
- `CLAUDE.md`
- `memory/people/` (for who touched what)
- `memory/projects/` (for project routing)
