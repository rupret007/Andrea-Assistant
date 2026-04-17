---
name: mission
description: Break a big goal or ambitious project into a structured multi-phase plan — proposed phases, concrete next steps, dependencies, success criteria, and blockers. Use when Jeff says "I want to accomplish X", "help me plan Y", "I have this big idea…", or when a goal is too large for a single task and needs structure. Produces a mission brief Jeff can execute against, and can add the first concrete steps to TASKS.md with approval.
---

# Mission

Mirrors Andrea_NanoBot's "missions layer" — multi-step goal planning for things bigger than a single task.

## When to use

Jeff expresses a goal that's bigger than one action:
- "I want to finish the Rad Dad album by end of year"
- "Help me launch constructiondaily to Lucky's team"
- "Plan out my path to 10K monthly listeners"
- "I want to get better at staying on top of Cisco check-ins"
- "Figure out how to build this 24/7 cloud agent"

Don't trigger for small single-step requests.

## Process

### Step 1 — Clarify the goal

Ask Jeff 2–3 focused questions, in a single message:
1. **What does "done" look like?** (specific outcome, not just "more of X")
2. **By when?** (hard deadline, loose target, or no deadline)
3. **What's the one non-negotiable constraint?** (money, time, people, dependencies, quality)

If he's vague, push him to be concrete. You can't plan "get better at guitar" — you can plan "be comfortable soloing in 3 keys by July."

### Step 2 — Research the landscape

Use memory + connectors to gather context:
- Similar past missions in `memory/` (has he attempted anything like this?)
- Relevant people (from `memory/people/`) who could help or block
- Relevant projects (from `memory/projects/`) that intersect
- Any existing Drive docs that relate (search Google Drive)
- Any calendar constraints (busy periods, standing commitments)

### Step 3 — Draft the mission brief

Output this structure (under 600 words):

```
# Mission: {short name}

## Success definition
{one sentence, testable}

## Timeline
{start → target date, with any hard waypoints}

## Non-negotiable constraint
{the one thing that must be respected}

## Phases
### Phase 1 — {name} — {rough duration}
**Goal:** {one line}
**Key actions:**
- {concrete action}
- {concrete action}
**Exit criteria:** {how Jeff knows phase 1 is done}

### Phase 2 — {name} — {rough duration}
(same structure)

### Phase 3 — {name} — {rough duration}
(same structure)

## Dependencies
- {external inputs needed: people, permissions, purchases, etc.}

## Identified risks
- {risk + likely mitigation}

## First concrete step (for TASKS.md)
- [ ] **{single action Jeff can do in 90 minutes}**

## Stretch / if things go fast
- {optional additions once core is done}
```

### Step 4 — Offer to operationalize

After the brief, offer:
1. "Want me to add the first step to TASKS.md?" (requires approval)
2. "Want to schedule the review checkpoints?" (e.g., weekly progress scan via `chief-of-staff`)
3. "Want me to save this mission brief to Drive or memory/projects/?"

### Step 5 — Track over time

If Jeff approves turning it into a living mission:
- Write the mission brief to `memory/missions/{kebab-name}.md`
- Add the first concrete step to TASKS.md
- Optionally schedule a weekly check-in task via the schedule skill

## Style

- Phases should be **3–5** total. More than that = not a mission, that's a job.
- Each phase gets a concrete exit criterion, not vibes.
- The "first concrete step" must be doable in a single ~90-minute block. If it's bigger, you haven't broken it down enough.

## Never do

- Never commit Jeff to specific dates without his sign-off.
- Never create more than 3–5 phases — if the goal needs more, the goal is too big and should be split into two missions.
- Never add items to TASKS.md silently.

## Memory to read
- `CLAUDE.md`
- `memory/missions/` (past missions if any)
- `memory/projects/` (for relevant project context)
