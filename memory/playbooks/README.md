# Playbooks — procedural memory

Playbooks capture HOW Jeff likes specific recurring work done. They're distinct from skills (which are callable workflows) — playbooks are reference documents that inform how skills execute.

Every playbook answers: "when faced with X, here's what we've learned works."

## Current playbooks

(Empty to start. Populated over time as Andrea learns Jeff's patterns.)

## How playbooks get created

1. **Jeff says** "when I do X, I always do it Y way" → Andrea drafts a playbook
2. **Correction pattern emerges** — Jeff edits Andrea's output the same way 2-3 times → Andrea proposes capturing it as a playbook
3. **After a mission completes** successfully → Andrea offers to turn the sequence into a playbook for future similar missions

## Naming convention

Lowercase kebab-case named after the recurring situation:
- `cisco-monday-check-in.md`
- `rad-dad-show-week.md`
- `release-day-for-jeff-solo.md`
- `wednesday-cisco-util-report.md`

## Template

```markdown
# {Situation name}

**Last updated:** {YYYY-MM-DD}
**Frequency:** {weekly / monthly / per-event}

## When this applies
{trigger conditions}

## Jeff's preferred approach
1. {step}
2. {step}
3. {step}

## Common pitfalls
- {things Jeff wants to avoid}

## Handoff rules
- {what's automated vs. what Jeff always does personally}

## Related skills
- {which Andrea skills draw on this playbook}
```
