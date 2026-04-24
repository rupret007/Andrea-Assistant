---
name: imessage-send
description: Send an iMessage via BlueBubbles. ALWAYS Trust-Ladder gated — drafts first, Jeff approves, only then fires. Use when Jeff says "text Lucky about practice", "reply to Candace", "send a band message". Supports one-to-one and group chats. Never sends without explicit per-message approval (unless Jeff has elevated that specific class in delegation-rules.md).
---

# iMessage Send (via BlueBubbles)

Sends iMessages through Jeff's BlueBubbles server. Always approval-gated via the Trust Ladder.

## Prerequisites

Same as `/imessage-check`:
- BlueBubbles server running
- `config/bluebubbles.local.yml` with password + trusted senders

## Process

### Step 1 — Identify the target

From Jeff's ask:
- "Text {name}" → find handle in `config/bluebubbles.local.yml` trusted_senders
- "Reply to {name}" → use the handle of the most recent thread with them
- "Send to {group chat name}" → look up group chat GUID

If sender not in trusted_senders, ask Jeff for the handle.

### Step 2 — Draft

Produce a message draft matching Jeff's voice (per `memory/andrea-identity.md` style rules):
- Short sentences
- Contractions
- Casual group-text tone for band / friends
- Warmer for Candace / family
- No corporate filler

### Step 3 — Invoke Trust Ladder

Route through `/trust-ladder` with:
- **Class:** `imessage-send`
- **Default tier:** 3 (approve_before_send)
- **High-risk flag:** family emotional topics, commitment-making, financial — cap at tier 3 regardless

Present to Jeff:

```
📨 Ready to send via iMessage

To: {name/handle}
Class: imessage-send  
Tier: 3 (approve_before_send)

Draft:
---
{the message}
---

Reply 'send' to send, 'edit' to revise, or 'skip'.
```

### Step 4 — On approval, fire the API

```
POST {serverUrl}/api/v1/message/text?password={password}
Content-Type: application/json

{
  "chatGuid": "<chat guid for the conversation>",
  "message": "<the text>"
}
```

### Step 5 — Log outcome

Append to `memory/message-log.md`:
```
| {timestamp} | imessage-send | {recipient} | sent | tier 3 | — |
```

Or outcome: `failed`, `skipped`, `deferred` based on result.

### Step 6 — Handle failure gracefully

If BlueBubbles is unreachable or returns error:
- Tell Jeff explicitly ("BlueBubbles server returned 500 — message NOT sent")
- Offer to retry or queue
- Never silently drop a send

## Special flows

### Candace commands
If Candace (via her trusted @andrea mention) is asking Andrea to add something to Jeff's calendar, this skill sends Candace a confirmation message after the action:

```
"Added '{thing}' to Jeff's calendar for {when}. He'll see it in his morning brief."
```

### Band-comms bridge
When `/band-comms` produces a draft, pipe it through this skill to deliver via iMessage directly (still Trust-Ladder gated).

## Rules

- **Never tier up automatically.** Even if Jeff says "just send it" casually, still require his explicit confirmation unless he's pre-approved that specific class.
- **High-risk content = hard tier-3 cap.** Emotional, financial, medical, commitment, first-contact — always approval-gated regardless of rule.
- **Log everything.** `memory/message-log.md` is the audit trail.
- **Never send to unknown handles.** Always via trusted_senders or explicitly provided handle.

## Memory
- Reads: `config/bluebubbles.local.yml`, `memory/people/`, `memory/delegation-rules.md`
- Writes: `memory/message-log.md`
