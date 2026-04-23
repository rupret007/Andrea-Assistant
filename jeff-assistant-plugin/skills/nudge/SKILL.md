---
name: nudge
description: Andrea's "periodic nudge" pattern (ported from Hermes Agent). She proactively surfaces observations she believes should be persisted to memory — not waiting for Jeff to tell her what to remember. Use this pattern inside scheduled rituals or after complex tasks to let Andrea judge what matters and ask Jeff to confirm. Never auto-persists without approval.
---

# Nudge

Ported from Hermes Agent's "periodic nudges" — one of the patterns that distinguishes a truly self-improving agent from a stateless chatbot. Andrea watches what's happening and volunteers observations she thinks should stick.

## When to use

- Inside scheduled rituals (morning briefing, EOD wrap, Sunday preview) as an add-on section
- After a `/conductor` orchestration completes successfully (this pattern is worth saving)
- When Andrea notices a recurring correction pattern during a session
- When user preferences seem to shift (e.g., Jeff explicitly says "I actually don't like X")
- Proactively — she decides it's worth volunteering

## The core insight

Most agents wait to be told to remember. Hermes-style agents judge on their own what's worth keeping. This skill encodes that judgment into a repeatable pattern.

## Process

### Step 1 — Identify candidate observations

Scan the current session / today's episodes / recent outcome-log for:

- **New facts Jeff mentioned** that aren't in memory yet (a new collaborator, a new project, a new preference)
- **Behavioral patterns** (Jeff corrected the same thing twice — that's a signal)
- **Successful orchestrations** worth saving as a skill
- **Anti-patterns** — things Jeff has explicitly rejected twice (never do X again)
- **Relationship shifts** — the register of conversations has changed, indicating a new phase

### Step 2 — Filter by importance

Not everything is nudge-worthy. Filter out:
- One-off observations that probably won't recur
- Things already in memory (check INDEX.md)
- Trivia (Jeff's coffee order — unless he's asked for that level)

Target: **1–3 nudges per run, maximum**. Less is more.

### Step 3 — Propose to Jeff

Format (under 120 words):

```
💭 **Nudges — {date}**

I noticed a few things worth persisting. Confirm / skip / edit each.

1. **{observation}** — propose adding to {memory file}
   {why I think this matters}

2. **{observation}** — propose updating {existing entry}
   {what's different from what I had before}

3. **{observation}** — propose creating skill `/{name}`
   {trigger pattern I'd use}
```

### Step 4 — Act on approval

For each approved nudge:
- **New memory fact** → append to the right `memory/people/{name}.md` or `memory/projects/{name}.md` or `memory/USER.md` (if profile-level)
- **Memory update** → log old vs. new in `memory/CHANGELOG.md`, then update
- **New skill** → invoke `/learn-skill` with the trigger pattern
- **Anti-pattern** → log as a rule in `memory/delegation-rules.md` under "Never do"

For each skipped nudge:
- Quiet. Don't log it. If it's worth re-raising later, Andrea will notice again.

### Step 5 — Don't beg

Nudges are offered once. If Jeff says "not now", move on. Don't re-propose the same observation within the same week unless new evidence makes it more pressing.

## Rules

- **Never auto-persist.** Nudges are always proposals; Jeff approves each.
- **Target quality over quantity.** 1-3 nudges is good. 10 is noise.
- **Respect silence.** If Jeff ignores a nudge, drop it.
- **Show your reasoning.** Each nudge should explain WHY Andrea thinks it matters. If she can't articulate it, the nudge isn't ready.
- **Look for patterns, not one-offs.** A nudge based on a single observation is fragile; a nudge based on 2+ instances is more credible.

## Integration with other skills

- `/chief-of-staff` scans produce nudges as a byproduct when they detect shifts
- `/outcome-log` surfaces skills worth refining → nudges propose refinement
- `/learn-skill` is the output path when a nudge becomes a new skill
- `/idea-capture` is Jeff's manual version; `/nudge` is Andrea's automatic version

## Memory

- Reads: everything in `memory/`, especially `episodes/` and `outcome-log.md`
- Writes: (on approval only) `memory/people/`, `memory/projects/`, `memory/USER.md`, `memory/CHANGELOG.md`, `memory/delegation-rules.md`
