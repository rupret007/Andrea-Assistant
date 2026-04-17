---
name: meeting-prep
description: Produce a pre-brief for Jeff's next calendar meeting (or a specified one) — who's attending, recent context with them, relevant docs, suggested talking points, and open items to close out. Use when Jeff says "prep me for my next call", "get me ready for [meeting]", or "who am I meeting with at [time]". Pulls from Google Calendar, Gmail threads, and Drive. Does NOT touch Cisco work email.
---

# Meeting Prep

## When to use

Jeff asks to be prepped for a meeting, call, or interview. Examples:
- "Prep me for my next call"
- "What's my 3pm?"
- "Get me ready for the Rad Dad practice call"
- "I'm meeting with [person] — what should I know?"

## Hard constraint

**Do NOT access Cisco work email.** Jeff has deliberately not connected work email. If the meeting is clearly work-related (Wintrust, Farmers, internal Cisco), draft from calendar metadata + memory only. Tell Jeff what you didn't look at so he can fill the gap himself.

## Process

### Step 1 — Identify the meeting

Pick the target meeting, in order of preference:
1. Jeff named a specific meeting → use that
2. "Next meeting" / "my next call" → query Google Calendar `list_events` from now, limit 1
3. "3pm" or other time → query Google Calendar for events starting at that time today

If nothing matches, ask Jeff to name the meeting.

### Step 2 — Pull metadata

From the calendar event, collect:
- Title
- Date + start/end time
- Duration
- Location / video link
- Attendees (names + emails)
- Description / agenda
- Any attached docs

### Step 3 — Build attendee context

For each attendee:
1. **Check memory** (`memory/people/`) — if we already know them, summarize relationship.
2. **If not in memory**, search Gmail for the last ~5 threads with them (personal Gmail only, not work). Summarize: last exchange topic, any pending asks, tone of relationship.
3. **If they're in Drive collaborations**, note what docs you've worked on together.

If the attendee name or email matches something in `memory/` (e.g., Lucky Ivy, Chris Story, Travis Worsham), pull their profile into the brief.

### Step 4 — Find relevant docs

Search Google Drive for anything that matches:
- The meeting title
- Attendee names
- Key project keywords (e.g., "constructiondaily", "Rad Dad", "WebJam")

Surface up to 3 most relevant docs with direct view-links.

### Step 5 — Build the brief

Output format (under 400 words):

```
# {Meeting title} — {date, time}

## TL;DR
{one sentence — the point of this meeting}

## Attendees ({count})
- **{Name}** — {role/relationship in one line} {(unknown) if not in memory}

## Recent context
- {3–5 bullets of what's been happening with these people / this project}

## Likely agenda / what to cover
- {bulleted list}

## Open items to close
- {anything Jeff owes this group, or they owe him}

## Pre-meeting action
- {1–2 things Jeff should do in the next 15 min to show up prepared}

## Docs worth reading
- [{title}]({view URL}) — {why it matters}
```

### Step 6 — Offer a follow-up

After delivering, offer: "Want me to draft an agenda message to send out beforehand?"

## Never do

- Never auto-send anything.
- Never access Cisco work email.
- Never invent recent context — if Gmail has nothing, say so.
- Never add attendees or modify the calendar event without explicit ask.

## Memory to read
- `CLAUDE.md`
- `memory/people/` (for attendee context)
- `memory/projects/` (for project context)
