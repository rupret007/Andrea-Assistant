---
name: action-bundle
description: Present 2–4 approval-gated next steps synthesized from a single answer or situation. Use when Andrea has delivered analysis and there are concrete follow-ups Jeff could take — show them as a bundle so he can approve the whole thing, pick individuals, or skip. Supports partial execution with outcome tracking.
---

# Action Bundle

Ported from Andrea_NanoBot's `ACTION_BUNDLES.md`. Andrea's signature UX pattern.

## When to use

Any time Andrea finishes delivering a primary answer (briefing, meeting prep, research brief, mission output) AND there are concrete next steps Jeff could take. Instead of waiting for him to ask "what should I do", bundle 2–4 options.

## Format

```
🎯 **Action bundle** — {count} steps

1. {verb} {specific action}  — {why it helps}
2. {verb} {specific action}  — {why}
3. {verb} {specific action}  — {why}
(optional 4)

**Pick what you want:**
- Approve all — "do them all"
- Pick specific — "just the first two" / "only 2 and 3"
- Not now — deferred to memory/action-queue.md
- Different — tell me what you'd rather do
```

## Bundle types (from Andrea_NanoBot)

- **create_reminder** — add to TASKS.md or schedule a one-time task
- **draft_follow_up** — produce a draft message for a person or thread (via `/trust-ladder`)
- **send_message** — actually send (if class is tier 3+ and approved)
- **save_to_thread** — append to a life thread in `memory/life-threads/`
- **save_to_library** — add to knowledge library in `memory/library/`
- **pin_to_ritual** — attach to a scheduled task so it surfaces in next morning briefing
- **send_fuller_version** — expand the short answer into a full brief to Drive
- **keep_current_work_visible** — add a "don't forget you're in the middle of…" pin

## Process

### Step 1 — Identify candidate actions
After producing the primary answer, ask yourself: "what would a good chief-of-staff propose right now?" Options come from the bundle types above.

### Step 2 — Cap at 4
More than 4 becomes choice paralysis. If 5+ could apply, pick the 4 highest-ROI.

### Step 3 — Each item is concrete
- ❌ "Maybe follow up with Lucky"
- ✅ "Draft a text to Lucky about the concrete company schedule — takes 30 sec once I draft"

### Step 4 — Report outcomes honestly
When Jeff approves a bundle or subset, execute each item and log to `memory/outcome-log.md`:

```
- {date} | bundle:{id} | item:{N} | status:{completed|partial|skipped|failed|deferred|unknown} | notes
```

Partial execution is normal. "Completed 1 and 3, skipped 2" is the expected shape of reality. Never silently mark `completed` when a reminder-backed deferral hasn't actually happened.

### Step 5 — Shortcuts Jeff might use
- "Just the reminder" → execute only the create_reminder item
- "Do the first two" → items 1 and 2
- "Not now" → move to queue
- "Skip" → log as skipped, no execution

## Bundle IDs

Each bundle gets an ID (`AB-{YYYYMMDD}-{seq}`) so Jeff can refer back: "what happened with that band-comms bundle yesterday?"

## Rules

- Every `send_message` item routes through `/trust-ladder`.
- Every execution gets logged in `memory/outcome-log.md`.
- Never bundle high-risk items for bulk-approve (split into their own bundle needing individual sign-off).
- Never create a bundle when there's really only one action — just propose it directly.

## Memory to read / write
- Writes: `memory/outcome-log.md` (append), `memory/action-queue.md` (for "not now" items)
- Reads: `memory/andrea-identity.md`, `memory/delegation-rules.md`
