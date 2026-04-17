---
name: decision-log
description: Log an important decision Jeff made, with the reasoning, alternatives considered, and expected signals it was right/wrong. Use when Jeff says "I decided X", "let's go with Y", "commit to Z", or finishes a /mission by picking a direction. Creates a durable record so future Jeff can see what past Jeff was thinking.
---

# Decision Log

Decisions are the forks in the river. A year from now, Jeff will look back and wonder "why did I choose X?" — this skill makes that answerable.

## When to use

- Jeff says "I decided", "let's commit to", "I'm going with"
- End of a `/mission` when Jeff picks a direction
- Major life/work/music/code pivots
- Jeff explicitly says "log this decision"

## Storage

`memory/decision-log.md` — append-only, newest on top.

```markdown
# Decision Log

## {YYYY-MM-DD} — {decision title}

**Decision:** {what Jeff chose, in one sentence}

**Context:** {why a decision was needed}

**Alternatives considered:**
1. {option A} — {why not chosen}
2. {option B} — {why not chosen}
3. {chosen option} — {why chosen}

**Reasoning:** {2–3 sentences, first-person if Jeff stated it}

**Signals this is going well:**
- {leading indicator}
- {leading indicator}

**Signals to reconsider:**
- {what would cause a rethink}

**Revisit:** {date to check back — 30/60/90 days typical}

**Tags:** {#work #music #code #personal #family}

---
```

## Process

### Step 1 — Gather
When Jeff states a decision, ask in one batched message:
1. What alternatives did you consider?
2. What made you pick this?
3. What would make you reconsider?
4. When should I check back?

Keep it efficient — 4 questions, not an interrogation.

### Step 2 — Write entry
Format as above. Keep it tight — this is a snapshot, not a memoir.

### Step 3 — Schedule a revisit (optional)
If Jeff gave a revisit date, create a one-time scheduled task:
```
taskId: decision-revisit-{kebab-title}
fireAt: {revisit date}
prompt: "Revisit {decision}. Check the 'signals to reconsider' — has anything shifted? Surface the entry from memory/decision-log.md and ask Jeff for an update."
```

### Step 4 — Tag for retrieval
Use tags liberally — Jeff can later ask "show my music decisions" or "what have I decided this quarter".

## Querying

"Show my decisions from Q1" → filter by date
"What did I decide about the 24/7 cloud?" → search for "cloud" tag or title
"What am I revisiting this month" → show entries with revisit date in current month

## Examples of decisions worth logging

- "I'm going to use Cowork instead of continuing Andrea_NanoBot" — already made; could retroactively log
- "I'm not connecting work email"
- "I'll do the Phase 4 always-on buildout in June"
- "Rad Dad takes priority over Stalemate until Wildflower"
- "No more coding projects until Wildflower is done"
- "I'm going to ask Cisco for {thing}"

## Rules

- Never overwrite past decisions. New info → add a new entry referencing the old ("Revising {date} decision: {new direction}").
- Never log trivial decisions (what to eat for lunch). This is for strategic choices.
- Never expose this log outside Jeff's trust — it's private.

## Memory
- Reads/Writes: `memory/decision-log.md`
