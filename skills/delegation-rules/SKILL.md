---
name: delegation-rules
description: Manage Andrea's per-class autonomy rules — what she can do automatically vs. what needs approval. Use when Jeff says "let me set a rule", "you can auto-approve X", "always ask before Y", or wants to inspect / edit what Andrea's allowed to do. All rules are inspectable and editable; Andrea never has silent autonomy.
---

# Delegation Rules

Ported from Andrea_NanoBot's `DELEGATION_RULES_AND_SAFE_AUTOMATION.md`. Where the Trust Ladder defines tiers, this skill manages the per-class rules that decide which tier applies where.

## Storage

Single source of truth: `memory/delegation-rules.md`

```markdown
# Delegation Rules

## Active rules

| Class | Tier | Scope | Usage | Overridden | Last used |
|-------|------|-------|-------|------------|-----------|
| band-text | 3 (approve_before_send) | Rad Dad + Stalemate | 0 | 0 | — |
| work-email | 1 (draft_only) | all | 0 | 0 | — |
| social-post | 3 (approve_before_send) | all public platforms | 0 | 0 | — |
| calendar-confirmation | 4 (schedule_send) | personal | 0 | 0 | — |

## Paused rules
{rules temporarily off — kept for history}

## Rule history
- {YYYY-MM-DD} added {class} at tier {N} — reason: {why Jeff added it}
- {YYYY-MM-DD} overridden {class} at tier {N} — reason: {why Jeff stepped in this time}
```

## Commands

### Add a rule
Jeff says "auto-approve band texts" / "always ask before social posts" / "let me set a rule"

1. Clarify the class (band-text / work-email / etc.)
2. Clarify the tier (1–5; tier 6 is categorical, can't be rule)
3. Clarify the scope (all? specific people? time-boxed?)
4. Write to `memory/delegation-rules.md` with today's date and reason
5. Confirm: "Rule set. {class} → tier {N}. I can change or pause it any time."

### List rules
"Show my rules" / "what can you do automatically" → dump the Active rules table.

### Override a rule (one-time)
Jeff says "just this once, tier up to 4 for this email"  — log an override entry, use the higher tier only for this instance, revert after.

### Pause a rule
"Pause the calendar-confirmation rule" → move to Paused section, keep history.

### Remove a rule
"Remove the social-post rule" → mark removed with date (don't delete the row, just update).

## Metrics per rule

- **usage** — number of times a message used this rule
- **overridden** — number of times Jeff manually stepped in despite the rule
- **last_used** — most recent invocation

These let Jeff see rules-in-practice: "This rule fires 10x/week and I override 8 of those — clearly wrong tier."

## Default (starter) rules to propose

On first use, propose:
- `band-text` → tier 3
- `work-email` → tier 1 (work email isn't connected, but the rule documents the intent)
- `social-post` → tier 3 (high-risk category forces this floor anyway)
- `calendar-confirmation` → tier 4

Jeff can accept all / cherry-pick / skip.

## Safety rails

- **Tier 5 (delegated_safe_send)** requires extra scrutiny — Andrea asks "are you sure you want me sending these without asking each time?" before accepting.
- **Tier 6 (never_automate)** is an explicit hard-block. Used for categories Jeff wants permanently off, e.g., "never draft medical content".
- **High-risk categories** (emotional / financial / medical / commitment / first-contact / public) cap at tier 3 regardless of rule.
- Every rule change logged to `memory/delegation-rules.md` history section. Never silent.

## Companion skill

Use together with `/trust-ladder` — delegation-rules manages the policy, trust-ladder applies it at send-time.

## Memory
- Reads: `memory/andrea-identity.md`, `memory/delegation-rules.md`
- Writes: `memory/delegation-rules.md`
