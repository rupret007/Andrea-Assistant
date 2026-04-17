---
name: repo-standup
description: Produce a weekly standup report across all of Jeff's active GitHub repos — what changed, what's broken, what's next. Use when Jeff says "repo status", "code standup", "what's happening in my projects", or running a Sunday/Monday planning session. Surfaces commits, open issues, failing CI, and stale branches so Jeff knows where to focus his next coding block.
---

# Repo Standup

## Jeff's active repos (github.com/rupret007)

- **webjam** (Python) — creative-collab desktop app (Jamulus + Webex + canvas)
- **constructiondaily** (Python) — Lucky's concrete-company ops tool (with Chris Story)
- **WPSD-Dashboard** (TypeScript) — Ham radio hotspot dashboard
- **RadDadSite** (HTML) — Rad Dad band website → raddadband.com
- **Andrea_NanoBot** (TypeScript) — Jeff's previous personal-assistant build (superseded by this Cowork setup)
- **Turdanoid** (HTML) — Arkanoid-with-a-twist game

## When to use

- "Repo status" / "what's happening in my code"
- Sunday night prep
- Before a scheduled coding block
- Running as a scheduled task at a set cadence

## Process

### Step 1 — Determine scope

- Default: all active repos (exclude Andrea_NanoBot unless Jeff is revisiting it)
- If Jeff names a specific repo: just that one
- Time window: last 7 days by default; Jeff can override

### Step 2 — Gather per-repo signals

For each repo, check these via WebFetch on the public GitHub pages (no GitHub MCP currently wired; upgrade path below):

- **Commits:** count in last 7 days + latest commit message + which author
- **Open issues:** count + any marked as bug / critical
- **Stale branches:** branches > 14 days old that aren't main
- **Pull requests:** any open? needs review?
- **Last push date:** if none in 14+ days, flag as stalled

GitHub URLs follow `https://github.com/rupret007/{repo}/commits/main` and `/issues` and `/branches`.

### Step 3 — Produce the standup

Format (under 400 words):

```
💻 **Repo standup — week of {date range}**

## Summary
{1 line — "active week" vs. "mostly quiet" etc.}

## {repo-name}
- **Activity:** {N commits, last push {date}}
- **What changed:** {most important 1–2 commits in plain English}
- **Open:** {N issues, any blockers}
- **Status:** 🟢 active / 🟡 slow / 🔴 stalled
- **Next move:** {one concrete suggestion}

(repeat for each active repo)

## Flags across the stack
- {stale branches to kill}
- {repos that haven't been touched in > 2 weeks}
- {dependency alerts / security issues if visible}

## Suggested next coding block
- {one specific task in one specific repo that's a 90-minute win}
```

### Step 4 — Offer the follow-up

"Want me to open any of these in a `/mission` plan? Or draft a quick commit-message template for {repo}?"

## Upgrades Jeff could enable

- **Install a GitHub MCP connector** (when a stable one ships for Cowork) — then this skill can read commit diffs, PR comments, CI status, and security alerts automatically.
- **Run as a scheduled task** every Sunday 8pm so the weekly status lands without asking.
- **Pair with Chris Story cross-check** — if Chris's activity on `constructiondaily` is visible, highlight where Jeff + Chris might collide.

## Never do

- Never push, merge, or modify any repo without explicit approval.
- Never expose tokens or private repo content if accidentally surfaced.
- Never invent commit summaries — if you can't see the commit message, say so.

## Memory to read
- `CLAUDE.md`
- `memory/projects/webjam.md`
- `memory/projects/constructiondaily.md`
- `memory/projects/wpsd-dashboard.md`
- `memory/projects/rad-dad.md`
- `TASKS.md`
