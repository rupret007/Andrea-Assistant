---
name: mode-switch
description: Load a focused working context. Use when Jeff says "switch me to Rad Dad mode", "put me in Cisco mode", "WebJam mode", or any similar context-load request. Pulls the relevant memory files, recent tasks, active Drive docs, and open loops into a single primer so the next 30 minutes of work is focused on that one area.
---

# Mode Switch

Jeff wears a lot of hats (Cisco, Rad Dad, Stalemate, solo music, brother's construction tool, WebJam, WPSD, Ham radio). Context-switching is expensive. This skill loads one context fast.

## Available modes

- **cisco** — Collaboration Service Manager work (Wintrust, Farmers, Check-ins, Utilization Report)
- **rad-dad** — Rad Dad band + the upcoming Wildflower show
- **stalemate** — Stalemate band (even if paused — songwriting, release history)
- **solo-music** — Jeff Story solo catalog + new songs
- **webjam** — the creative-collab desktop app (Python)
- **constructiondaily** — Lucky's concrete-company ops tool (Python, w/ Chris)
- **wpsd** — Ham radio DMR hotspot + WPSD-Dashboard
- **personal** — family / household / general life
- **songwriting** — cross-project: lyrics, ideas, chord sketches
- **custom** — Jeff names something else; infer from memory

## Process

### Step 1 — Identify mode

Jeff's phrasing tells you:
- "Rad Dad mode" → `rad-dad`
- "switch me to Cisco" → `cisco`
- "WPSD time" → `wpsd`

If ambiguous, ask: "which hat?"

### Step 2 — Load the context

Read these files (fast — don't summarize unless asked):
- `CLAUDE.md` (always)
- `memory/projects/{mode}.md`
- `memory/music/{relevant file}` if music mode
- `TASKS.md` — filter to items tagged with the mode

### Step 3 — Pull live signal

- **Calendar:** upcoming events tagged with the mode
- **Gmail (personal):** last 5 threads related to the mode (using keywords: for rad-dad, search "Rad Dad", "Travis", "Lucky", "Wildflower"; for cisco, skip because work email off; etc.)
- **Drive:** recently modified files relevant to the mode

### Step 4 — Present a focused primer

Output format (under 300 words):

```
🎯 **{Mode} mode — loaded.**

**Where you left off**
- {2–3 bullets of most recent activity}

**What's on your plate right now**
- {items from TASKS.md filtered to this mode}

**Upcoming in your calendar**
- {relevant next 3 events}

**Active files**
- [{doc title}]({url}) — last touched {date}

**Open decisions to close**
- {any pending asks / approvals in this mode}

**Suggested first move**
- {one concrete 30-minute action}

Ready when you are. What do you want to do?
```

### Step 5 — Stay in the mode

While the mode is active, bias toward the relevant projects and people. Don't proactively surface unrelated stuff.

## Never do

- Never load `cisco` mode by accessing work email (not connected — and deliberately so).
- Never mix modes without being asked — the point of this skill is to reduce context pollution.
- Never take action in a mode without Jeff's go-ahead.

## Memory to read
- `CLAUDE.md`
- `memory/projects/*`
- `memory/music/*`
- `TASKS.md`
