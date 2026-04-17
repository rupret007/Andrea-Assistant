---
name: focus-sprint
description: Kick off a timed focused work session — load context, set duration, surface everything Jeff needs for the block, then close with a wrap. Use when Jeff says "let's do a 90-min block on {project}", "focus sprint", "deep work session", or wants to stop context-switching and just execute.
---

# Focus Sprint

Pomodoro-meets-context-loader. A skill that makes Jeff's next 30–120 minutes of deep work frictionless.

## When to use

- "Let's do a 90-min block on {project}"
- "Focus sprint — {duration}"
- "I need to deep-work on {thing}"
- "Help me lock in — no distractions"

## Process

### Step 1 — Confirm parameters

Ask in one message if not clear:
1. **How long?** 30 / 60 / 90 / 120 min
2. **What project / goal?** (Jeff's input; if ambiguous, suggest using `/mode-switch` first)
3. **Specific deliverable?** (concrete target for the session — "draft chorus for Song X", "close 3 open issues on webjam")
4. **Any blocker to pre-resolve?** (missing file, unanswered question)

### Step 2 — Pre-load

Before starting, do the prep so Jeff doesn't have to:
- Read relevant `memory/projects/` and `memory/music/` files
- Pull recent Drive files related to the project
- Pull the relevant TASKS.md entries
- Surface any open decisions that would block the session
- If the session is music, note the key / setlist context

### Step 3 — Produce a pre-flight brief

Format (under 200 words):

```
🎯 **Focus Sprint — {project}, {duration} min**

**Goal:** {specific deliverable in one sentence}

**Context loaded**
- {3 key facts or files to have in mind}

**Relevant recent activity**
- {2–3 bullets of what happened recently in this project}

**Blockers cleared**
- {anything resolved or explicitly deferred}

**Suggested sequence**
- Minute 0–{X}: {specific action}
- Minute {X}–{Y}: {specific action}
- Minute {Y}–end: {specific action}

**Start when ready.** Tell me when you're done or if you get stuck.
```

### Step 4 — Stay quiet during the sprint

Do NOT ping Jeff with pre-meeting briefs, email alerts, or scheduled-task output during the sprint window. The sprint is a no-interrupt zone. If `pre-meeting-autoprep` fires during a sprint, that brief is fine but should be tagged `[Non-blocking — resume after sprint]`.

(Implementation note: if this skill is adopted as a recurring pattern, we may want a lightweight state file at `memory/state/active-sprint.md` so other scheduled tasks can check "is Jeff in a sprint right now" and defer.)

### Step 5 — End-of-sprint wrap

When Jeff says "done", "that's it", or the timer he set externally expires:

```
⏱ **Sprint complete.**

**What got done:**
- {ask Jeff or infer from recent file changes}

**What's left on the goal:**
- {gap analysis}

**Next actions:**
- {1–3 concrete next steps — can be a follow-up sprint, a different project, or a break}

**Energy check:** Ready to go again, context-switch, or break?
```

### Step 6 — Log the sprint

Optionally append a short entry to `memory/sprints.md`:
- Date / duration / project / goal / what got done / what's next

Over time this becomes a log of Jeff's real deep-work output.

## Never do

- Never interrupt a sprint with non-critical notifications.
- Never extend a sprint automatically — ask first.
- Never mark a sprint as "done" unless Jeff confirms the goal was hit.

## Memory to read
- `CLAUDE.md`
- `memory/projects/{project}.md`
- `TASKS.md`
