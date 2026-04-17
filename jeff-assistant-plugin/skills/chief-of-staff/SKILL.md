---
name: chief-of-staff
description: Cross-source scan that surfaces what actually needs Jeff's attention — commitments he's made, things he's waiting on, open loops, upcoming deadlines, pressure points, slip risks, prep needed, new opportunities, and good focus candidates for the day. Use when Jeff asks "what's on my plate", "what am I forgetting", "what needs my attention", or when running a Monday morning prioritization. Reads Google Calendar, personal Gmail, Drive, TASKS.md. Does NOT touch work email.
---

# Chief of Staff

This skill is the Cowork equivalent of Andrea_NanoBot's signature Chief-of-Staff Mode. It scans across everything connected and returns the 9 signal types that matter.

## When to use

Jeff asks:
- "What's on my plate?"
- "What am I forgetting?"
- "What needs my attention this week?"
- "Can you scan everything and tell me what's slipping?"
- Or during Monday morning prioritization / Friday review.

## Process

### Step 1 — Load context

Read:
- `CLAUDE.md`
- `TASKS.md`
- `memory/projects/` (top-level overview of each project)

### Step 2 — Pull live data

**Calendar** (Google Calendar connector)
- Events for the next 7 days
- Any tentative or declined invitations

**Email** (personal Gmail only)
- Unread threads from the last 7 days, from known people first
- Threads flagged starred/important that are unread
- Threads where Jeff was the last responder but there's a pending ask

**Drive**
- Recently modified files (last 7 days) — what's he been working on?
- Any docs shared with him recently that he hasn't opened

### Step 3 — Classify into 9 signal types

Walk through each item you found and tag it with one of:

| Signal | Meaning | Example |
|--------|---------|---------|
| **commitment** | Jeff told someone he'd do X — track it. | "Sent that over by Thursday" |
| **waiting_on** | Jeff's waiting on someone else's response. | "Sent request, no reply in 6 days" |
| **open_loop** | Thread or thought that petered out without resolution. | Email thread with no outcome, mid-conversation |
| **deadline** | Hard due date. | Utilization Report, Thursday Check-ins, May 16 show |
| **pressure_point** | Multiple things coming due simultaneously. | "Friday has 3 deadlines AND a 2-hour meeting" |
| **slip_risk** | Task drifting past its intended moment. | Check-ins still open Wednesday |
| **prep_needed** | Meeting or event with visible prep gap. | Meeting tomorrow, no agenda set |
| **opportunity** | Something positive to lean into. | Practice opened up Saturday, two songs close to ready |
| **focus_candidate** | Good candidates for "if I had 90 minutes right now, work on this." | Specific unblocked task with clear next step |

### Step 4 — Output

Return a structured digest (under 500 words) with ONLY signals that are actually present. Skip any category with nothing in it.

Format:

```
# Chief-of-Staff Scan — {date}

## 🔴 Needs action now
- {deadline or slip_risk items ranked by urgency}

## 🟡 Pressure points this week
- {pressure_point items}

## 🕑 Prep needed
- {prep_needed items with what's missing}

## 🟢 Commitments outstanding
- {commitment items Jeff owes}

## ⏳ Waiting on others
- {waiting_on items with age}

## ➿ Open loops
- {open_loop items}

## 🎯 Good focus candidates
- {3–5 focus_candidate items with clear next step}

## ✨ Opportunities
- {positive / momentum items}

## 🤖 My top-3 suggestion for right now
1. {concrete action}
2. {concrete action}
3. {concrete action}
```

### Step 5 — Offer to act

Close with: "Want me to draft anything, schedule anything, or clear any of these before you move on?"

## Never do

- Never take action without explicit approval.
- Never access work email.
- Never log a commitment you're not sure Jeff actually made — err on the side of flagging uncertain items as "open_loop" instead.
- Never generate volume-for-volume's-sake — the signal is in what's flagged, not how much.

## Memory to read
- `CLAUDE.md`
- `TASKS.md`
- `memory/` (broad)
