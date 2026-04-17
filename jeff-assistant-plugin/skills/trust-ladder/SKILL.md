---
name: trust-ladder
description: Applies Andrea's six-tier Messaging Trust Ladder to any outbound communication (band-text, email, social post, comment). Use when Jeff is deciding how much autonomy Andrea should have on a specific message or class of messages. Returns the tier + delivery state + what Andrea will actually do. Never auto-sends regardless of tier without Jeff's explicit per-class opt-in.
---

# Trust Ladder

Ported from Andrea_NanoBot's `MESSAGING_TRUST_LADDER_AND_LIVE_DELIVERY.md`. Six tiers of increasing autonomy, explicit delivery states, and high-risk categories that are categorically blocked.

## The six tiers

| Tier | Label | What Andrea does |
|------|-------|-------------------|
| 1 | **draft_only** | Produces a draft. Jeff copies and sends himself. (Current default for everything.) |
| 2 | **suggest_and_ask** | Drafts + presents 2–3 variants + asks "which one, or should I try again?" |
| 3 | **approve_before_send** | Drafts + shows exactly what will be sent, where, and to whom. Jeff clicks approve. Andrea sends via connector. |
| 4 | **schedule_send** | Approved now, delivered later. Andrea re-validates at send time (is the context still true?) before firing. |
| 5 | **delegated_safe_send** | For a specific narrow category Jeff has pre-approved. Andrea sends immediately without asking each time, but logs every send. |
| 6 | **never_automate** | Hard block. Even tier-5 rules can't override. |

## Delivery states

Every message tracked in a Trust Ladder flow goes through: `drafted | approved | scheduled | sent | deferred | failed | skipped`

State log lives at `memory/message-log.md` (append-only).

## High-risk categories — always blocked from tier 5

Even if Jeff sets tier 5 for a class, these never auto-send:
- **Emotional** — messages expressing care, concern, apology, conflict
- **Financial** — anything involving money, pricing, contracts, pay
- **Medical** — health-related communications
- **Commitment** — messages that lock Jeff into an obligation (meetings, promises, RSVPs)
- **First-contact** — messages to someone Jeff hasn't messaged before
- **Public posts** — social media, any audience > 3 people

These degrade gracefully to tier 3 (approve_before_send) regardless of the class rule.

## Process

### Step 1 — Classify
When Jeff initiates an outbound communication, identify:
- Recipient(s) and relationship (known / new / group / public)
- Content category (scheduling / ack / ask / share / emotional / financial / etc.)
- Class (band-text / work-email / social-post / etc.)

### Step 2 — Determine tier
- Default = **tier 1 (draft_only)** unless Jeff has set a class rule in `memory/delegation-rules.md`
- High-risk category detected → cap at **tier 3** regardless of rule
- First-contact recipient → cap at **tier 2**
- Otherwise use the class rule

### Step 3 — Report the tier decision
```
📨 Trust Ladder: tier {N} ({label})
For: {class}
Because: {reason for this tier}
I will: {concrete action — "draft and show you", "draft and send after approval", etc.}
```

### Step 4 — Execute
Act according to the tier. Log the draft + tier + state to `memory/message-log.md`.

### Step 5 — Surface the log on request
Jeff says "show message log" / "what did you send for me" → dump the tail of `memory/message-log.md` with dates, tiers, outcomes.

## Class rules (examples Jeff might set)

In `memory/delegation-rules.md`:
- `band-text` → tier 3 (approve_before_send)
- `work-email` → tier 1 (draft_only) — because work email isn't connected anyway
- `social-post` → tier 3 always (high-risk category)
- `reply-to-chris-story` → tier 3 (family but still wants approval)
- `calendar-confirmation` → tier 4 (schedule_send OK)

Jeff can add / remove / override class rules any time via `/delegation-rules`.

## Never do

- Never tier-up (escalate autonomy) without explicit Jeff approval for that class.
- Never send a high-risk category message without approval regardless of class rule.
- Never delete message log entries.
- Never operate above tier 3 for any class that doesn't appear in `memory/delegation-rules.md`.

## Memory to read
- `memory/andrea-identity.md`
- `memory/delegation-rules.md` (if exists)
- `memory/message-log.md` (tail for context on recent sends)
