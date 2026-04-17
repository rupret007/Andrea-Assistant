---
name: idea-capture
description: Quick-capture an idea, thought, fragment, or commitment and route it to the right place automatically — song catalog, task list, life thread, or memory fact. Use when Jeff says "capture this", "jot this down", "save this thought", or dumps a half-formed idea without telling Andrea where it goes. Andrea routes based on content.
---

# Idea Capture

Lowest-friction entry point. Jeff has a thought. Andrea figures out where it belongs.

## When to use

- "Capture this: {thought}"
- "Jot this down: {thought}"
- "Save this"
- Jeff dumps an idea mid-conversation without telling Andrea how to file it

## Routing

Andrea classifies the input and proposes a destination:

| Content looks like | Route to |
|--------------------|----------|
| A song lyric / hook / verse | `/lyric-vault` → `memory/music/song-catalog.md` + Drive doc |
| A task / reminder with a deadline | `TASKS.md` Active section |
| A task without a deadline | `TASKS.md` Someday section |
| An update on an existing relationship / situation | append to `memory/life-threads/{match}.md` |
| A new relationship / situation to track | propose opening a new life thread |
| A fact about a person Andrea knows | append to `memory/people/{name}.md` |
| A fact about a project | append to `memory/projects/{name}.md` |
| A decision Jeff made | log to `memory/decision-log.md` (if exists, else propose creating) |
| A preference / workflow Jeff wants Andrea to learn | propose adding to `memory/playbooks/` |
| An idea to research later | propose `/watchlist add` or save to `memory/library/` |
| A creative spark (not a song) — video, post, story idea | save to `memory/library/creative-sparks.md` |

## Process

### Step 1 — Classify
Read the input. If the intent is clear (starts with "song idea:", "task:", "note that...") use that. Otherwise ask yourself: which memory file would I want this in next week?

### Step 2 — Propose
Show Jeff the routing before writing:

```
💡 **Capture — "{first 10 words of the input}..."**

I'd file this as: **{target}**
Because: {1-line reasoning}

Looks right?  (y/n / different route)
```

### Step 3 — If ambiguous, offer 2–3 options
```
I could file this as:
1. Song idea (goes to song-catalog.md)
2. Life thread on {X} (appends to existing thread)
3. Task (goes to TASKS.md Someday)

Which one?
```

### Step 4 — Execute on approval
Write to the chosen destination. Return:
```
✓ Captured to {destination}. {Hyperlink or path}.
```

### Step 5 — For song / creative captures, offer follow-up
- "Want me to expand this via /songwriter?"
- "Want me to set a reminder to revisit next week?"

## Ambient capture (future enhancement)

If Jeff ever wires voice-to-content + idea-capture together (Phase 4 of Calling Andrea), he could just say "Hey Andrea, capture this" into his phone and Andrea would:
1. Transcribe the voice
2. Route via this skill
3. Log to the right place
4. Confirm via voice or text

That's the dream: zero-friction idea capture anywhere he is.

## Rules

- Always confirm the routing before writing. Never silent capture.
- Never classify something as "nothing" — if Jeff said to capture it, it goes somewhere.
- Respect privacy: if content looks sensitive (health, financial, personal), default to a private file or ask Jeff where he wants it.

## Memory
- Reads: current state of destinations to avoid duplicates
- Writes: wherever the routing lands
