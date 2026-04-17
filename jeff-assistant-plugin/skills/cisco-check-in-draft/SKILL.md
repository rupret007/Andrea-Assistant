---
name: cisco-check-in-draft
description: Draft Jeff's weekly Cisco Check-in using the pattern from previous weeks. Use when Jeff needs to write or prep his weekly Collaboration Service Manager check-in. Reads last week's check-in from Google Drive (personal) for structure and tone, then produces a new draft Jeff reviews and submits himself. Does NOT access Cisco work email — Jeff keeps work separate.
---

# Cisco Check-in Draft

## Context

Jeff Story is a **Collaboration Service Manager at Cisco**, supporting enterprise customers — primary accounts **Farmers** and **Wintrust**.

He has a weekly **Check-in** to complete. Jeff's stated preference is to do it Monday, hard deadline Thursday EOD. He has self-reported being historically bad at staying on top of these — so this skill exists specifically to lower the activation energy of getting them done.

## Hard constraint

**Work email is NOT connected to this assistant and must not be accessed.** Jeff keeps his Cisco work email deliberately separate.

Source material for this skill comes from:
- Jeff's personal Google Drive (where he may store copies of past check-ins or notes)
- Jeff pasting content inline

If Jeff hasn't provided anything, ask — do not attempt to reach into work email by any means.

## Process

### Step 1 — Get a reference
Ask Jeff: "Got a copy of last week's check-in in Drive I can use as reference, or want to paste it in here?"

If **Drive**:
- Use `search_files` on the Google Drive connector.
- Try queries in this order until something plausible comes back:
  - `title contains 'check-in' or title contains 'checkin' or title contains 'check in'`
  - `title contains 'weekly update' or title contains 'weekly status'`
  - `title contains 'cisco' and modifiedTime > <last 10 days>`
- Show Jeff the top 3 candidates (title, modified date). He picks.
- Read the selected file with `read_file_content`.

If **pasted**:
- Use the pasted content as-is.

### Step 2 — Learn the pattern

From the reference, extract:
- Section headings Jeff uses (Wins / Progress / Blockers / Next Week / etc.)
- Typical length per section
- Tone (first-person casual vs. corporate-formal)
- Whether he names customers explicitly or uses codes
- Any recurring metrics he cites

### Step 3 — Gather this week's content

Ask Jeff for 3 things in one batched message:
1. **Wins** — what moved forward this past week? (2–4 bullets)
2. **Open items / blockers** — what's stuck or needs help?
3. **Wintrust / Farmers specifics** — any new TAC cases, defects, escalations, customer calls of note?

If Jeff has other accounts or themes beyond Wintrust/Farmers, include those.

### Step 4 — Draft

Produce a draft in the same structure as the reference. Rules:
- Match Jeff's voice from the reference — don't impose a generic corporate tone.
- Lead with impact, not activity ("Closed TAC-12345 for Wintrust" > "Worked on TAC-12345").
- Use bullets for wins and blockers.
- Keep sections proportional to the reference length.
- Flag any sentence where you had to guess or generalize — Jeff should see those before submitting.

### Step 5 — Hand off

Return the draft as a Markdown block Jeff can copy into whatever tool Cisco uses (their internal platform, an email draft, a Word doc). Offer:
- A tighter version if the draft feels long
- A more casual / more formal variant if Jeff wants to tweak voice

## Style

- Concise. Execs skim.
- Specific numbers > vague impressions ("3 new defects logged this week" > "several defects").
- First-person where the reference uses first-person.
- No emojis unless the reference uses them.

## Never do

- Never submit anything on Jeff's behalf.
- Never access Cisco work email.
- Never invent customer outcomes or metrics.
- Never save the draft to a shared location without asking.

## Also useful

- Track completion in `TASKS.md` by marking "Weekly Check-ins" as done for the week after Jeff confirms he's submitted it.
- If Jeff says he missed the Thursday deadline, tag that in memory so the Thursday noon reminder gets escalated next week.

## Memory to read
- `CLAUDE.md`
- `memory/context/company.md`
- `TASKS.md` (to check current-week status)
