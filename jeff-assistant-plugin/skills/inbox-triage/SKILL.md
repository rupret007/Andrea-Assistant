---
name: inbox-triage
description: Triage Jeff's personal Gmail into priority batches — what actually needs him vs. what can wait vs. what can be archived/deleted. Drafts fire-and-forget replies where appropriate. Use when Jeff says "triage my inbox", "sort my email", "what needs me in Gmail", or running inbox-zero mode. Does NOT touch Cisco work email.
---

# Inbox Triage

## Hard constraint

**Personal Gmail only. Work email is NOT connected.** This skill exists for Jeff's personal inbox — it must not try to reach Cisco work email under any circumstance.

## When to use

- "Triage my inbox"
- "What needs me in Gmail?"
- "Help me get to inbox zero"
- "What can I archive / delete"

## Process

### Step 1 — Pull unread threads

Use Gmail `search_threads` with `is:unread newer_than:7d` (or a different window if Jeff specifies).

Also include:
- Starred threads regardless of read state — Jeff marked them for a reason
- Threads where Jeff was the last responder (may have a pending "did they reply?" loop)

### Step 2 — Classify each thread into 5 buckets

**🔴 ACT NOW (immediate reply needed)**
- From someone in `memory/people/` with a direct question
- Confirms/denies for an upcoming plan
- Time-sensitive: event tonight, show tomorrow, travel booking, doctor, landlord

**🟡 REPLY THIS WEEK (but not urgent)**
- Casual friend-check-in ("how've you been")
- Non-urgent questions
- Thread Jeff started where the other party responded

**🟢 FYI / READ LATER**
- Newsletters with actually interesting content
- Notifications of things Jeff subscribed to
- Informational-only with nothing to do

**⚪️ ARCHIVE CANDIDATES**
- Delivered / completed confirmations
- Threads where the conversation concluded
- Receipts older than 30 days

**🗑 DELETE CANDIDATES**
- Promotional / marketing blasts Jeff never engages with
- Unsubscribe-bait
- Expired offers

### Step 3 — Produce the triage report

Format (under 500 words):

```
📧 **Inbox Triage — {count} unread in last {window}**

## 🔴 ACT NOW ({N})
1. **{sender}** — {subject}
   - {1-line why it matters}
   - Suggested reply: {1-sentence draft}  [or] "Paste into draft? (y)"

(repeat)

## 🟡 THIS WEEK ({N})
- {sender}: {subject} — {1-line}
(shorter format)

## 🟢 READ LATER ({N})
- {sender}: {subject} (1-line hook)

## ⚪️ ARCHIVE ({N})
- {sender}: {subject}

## 🗑 DELETE ({N})
- {sender}: {subject}

## Summary
- Top 3 things I'd do in the next 15 min:
  1. Reply to {name} about {thing}
  2. Archive {N} delivered-confirmations
  3. Unsubscribe from {sender} if you still don't care
```

### Step 4 — Offer to execute

After delivering the triage, offer:
- "Want me to draft full replies for the 🔴 items?" (creates Gmail drafts via `create_draft`)
- "Want me to label the ⚪️ threads as 'Archive Me' so you can sweep them?"
- "Want me to unsubscribe-link any of the 🗑 senders?"

All actions require explicit confirmation per-item. Never bulk-execute.

### Step 5 — If Jeff approves replies

Use `create_draft` via Gmail to create drafts (NOT send). Each draft:
- Match Jeff's voice (short, direct, warm)
- Use lowercase for casual threads, Title Case for anything formal
- Never invent commitments — if the reply requires Jeff to decide something, leave a `[PLACEHOLDER]` for him to fill

## Style of drafts

- Match the tone of the incoming thread.
- Short. Jeff doesn't write essays.
- End with either a concrete next step or a friendly sign-off, not both.

## Never do

- Never send email on Jeff's behalf. Drafts only.
- Never touch Cisco work email.
- Never delete or archive threads autonomously — Jeff acts, you propose.
- Never include content from customer or work-flavored threads in output (even if they somehow leak into personal Gmail).

## Memory to read
- `CLAUDE.md`
- `memory/people/` (for sender context)
