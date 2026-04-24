---
name: summarize-thread
description: Summarize a text-message thread (iMessage via BlueBubbles, SMS via Twilio, or pasted content). Use when Jeff says "summarize my thread with X", "what's been going on in the band chat", "catch me up on Candace's texts", or when he returns from being away. Produces a who-said-what digest plus action items owed.
---

# Summarize Thread

Condenses long message threads into a useful digest — what was discussed, what was decided, what Jeff owes, what Jeff is waiting on.

## When to use

- "Summarize my thread with {person}"
- "Catch me up on the {group chat name} chat"
- "What's been going on with Candace lately" (text-wise)
- "I'm back from being off grid — what did I miss?"
- When a scheduled task notices a new burst of activity in a trusted thread

## Process

### Step 1 — Fetch the thread

If iMessage: use `/imessage-check` with specific chat target.
If SMS via Twilio: fetch via Twilio API.
If pasted: use the pasted content.

Default window: last 72 hours unless Jeff specifies.

### Step 2 — Analyze

Identify:
- **Topics discussed** — cluster messages by what they're about
- **Decisions made** — any concrete agreement or commitment
- **Jeff's commitments** — things he said he'd do
- **Other people's commitments** — things they said they'd do
- **Open questions** — asks that didn't get resolved
- **Tone shifts** — did anyone get upset, excited, quiet?

### Step 3 — Format

Under 300 words:

```
💬 **{Thread name} — summary of last {N} messages / {window}**

**Topics discussed**
- {topic 1}: {1-line summary}
- {topic 2}: {1-line summary}

**Decisions**
- {what was agreed}

**Jeff owes**
- {commitment Jeff made}

**Waiting on others**
- {commitment others made to Jeff}

**Open loops**
- {unresolved asks}

**Tone/vibe:** {one line — "productive", "mostly logistics", "emotional stretch with Candace", etc.}
```

### Step 4 — Offer action

- "Want me to draft a reply to {name}?"
- "Want me to add {commitment} to TASKS.md?"
- "Want me to add {decision} to /life-thread for {relevant thread}?"

## Rules

- **Be faithful.** Don't invent decisions or commitments that weren't there.
- **Preserve tone.** If a conversation was emotional, say so. Don't sanitize.
- **Never expose content publicly.** Summaries stay in Cowork.
- **Respect privacy.** If a thread contains sensitive content (mental health, family conflict, confidential work), flag it and summarize at the highest level without quoting.

## Memory
- Reads: thread content, `memory/people/`
- Writes: optionally append a "conversation note" to relevant life thread if Jeff approves
