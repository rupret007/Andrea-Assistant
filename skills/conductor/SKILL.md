---
name: conductor
description: Orchestrate complex multi-part tasks by decomposing them, spawning specialist sub-agents (or routing to specific skills), coordinating their parallel execution, and synthesizing results. Use when Jeff asks for something that clearly requires multiple steps or specialized capabilities — "research X, then draft Y, then schedule Z" style requests. Also invoked when any skill realizes mid-execution that a task is bigger than its own scope. The default orchestration pattern for Andrea.
---

# Conductor

Andrea's orchestration skill. Turns her from a specialist into a meta-agent — the conductor who delegates to specialists and synthesizes their outputs.

## When to use

- Complex goals spanning multiple domains ("research 3 venues, draft outreach, schedule the follow-ups")
- Any request too big for a single specialist skill
- When a skill mid-execution hits its scope boundary and needs to delegate
- When Jeff says "orchestrate", "figure out", "handle this", or similar high-level direction

## Process

### Step 1 — Listen and classify

Read the request. Quick triage:

| Complexity | Response |
|-----------|----------|
| Single simple ask | Route directly to the right skill, no orchestration needed |
| 2-3 step sequential | Use mission pattern, still single-agent execution |
| Multi-domain, parallel work | **Conductor pattern applies — continue** |
| Needs capabilities I don't have | Call `/self-assess` first, then `/learn-skill` or `/discover-tool` |

### Step 2 — Decompose

Break the goal into 2-5 sub-tasks. Each sub-task should be:
- **Single-purpose** (one clear outcome)
- **Assignable** (maps to a known skill, sub-agent role, or external tool)
- **Bounded** (has a clear done condition)
- **Independent where possible** (can run in parallel)

Label dependencies explicitly: "task 3 depends on output of task 1."

### Step 3 — Assign specialists

For each sub-task, pick the best executor:

**Option A — Existing skill.** If one of Andrea's 37 skills matches, use it.

**Option B — Spawn a sub-agent** via the Task tool. Good for:
- Research across multiple angles (parallel researchers)
- Writing in specific styles (specialist drafters)
- Analysis or synthesis of collected data
- Any role where a dedicated focused prompt produces better results than a general skill

**Option C — External tool.** Gmail, Calendar, Drive, Zapier, Exa — whichever fits.

**Option D — Ask Jeff** for info or approval if it's something only he can provide.

### Step 4 — Execute

Parallel where independent (use parallel sub-agent calls in a single tool invocation).
Serial where dependent.

Example:

```
Goal: "Research 3 venues in Dallas, draft outreach, schedule follow-ups"

Decomposition:
  Task A — Research venues (independent, parallel)
    → Sub-agent: venue researcher (3 parallel instances, one per venue)
  Task B — Draft outreach emails (depends on A)
    → Skill: /ghostwriter with venue data
  Task C — Schedule follow-up reminders (depends on B acceptance)
    → Skill: /schedule with 1-week follow-ups
```

### Step 5 — Synthesize

Collect all outputs. Produce a unified response:
- Lead with the answer / recommendation
- Section by specialist output (attributable)
- Flag any conflicts or open questions
- End with an `/action-bundle` of next steps

### Step 6 — Report honestly

Name what was done, by whom (which skill or agent), and what's still needed from Jeff. Log to `memory/outcome-log.md` so the orchestration history is auditable.

## Example invocations

**Jeff:** "Plan the Wildflower show launch campaign."

**Andrea (conductor):**
1. Spawns venue/logistics sub-agent (pulls festival info)
2. Invokes `/band-comms` for bandmate coordination draft
3. Invokes `/release-day` for social fan-out strategy
4. Invokes `/market-scan` for similar-artist promo patterns
5. Synthesizes into a 14-day countdown plan with Action Bundle

**Jeff:** "Figure out why WPSD dropped connectivity last night."

**Andrea:**
1. Invokes `/wpsd-health` for current state
2. Spawns log-parser sub-agent for historical data
3. Spawns researcher sub-agent to check Ham radio forums for similar issues
4. Synthesizes: "Here's the most likely cause, here's how to fix, here's what to watch for."

## Rules

- **Never fake orchestration.** If a single skill handles it, don't pretend you spawned 5 agents.
- **Never synthesize outputs you didn't collect.** If a sub-agent failed or didn't return, say so.
- **Always show attribution.** "The venue researcher found X. The ghostwriter drafted Y."
- **Never take irreversible actions** without Jeff's approval — the conductor coordinates, doesn't commit.

## Memory

- Reads: `memory/andrea-identity.md`, `memory/INDEX.md`, all skill files (to know what specialists exist), `memory/connectors.md` (for tool availability)
- Writes: `memory/outcome-log.md` (orchestration history), `memory/orchestration-log.md` (decomposition patterns that worked — for learning)
