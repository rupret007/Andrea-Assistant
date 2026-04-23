---
name: learn-skill
description: Auto-generate a new skill when Andrea encounters a task she doesn't already have coverage for. Uses Exa to research best practices, drafts a SKILL.md, presents to Jeff for approval, and installs it into her skill library. The mechanism by which Andrea gets smarter over time. Never creates a skill without Jeff's review and approval.
---

# Learn Skill

Andrea evolves. When she hits a gap in her capabilities, this skill closes it — she researches how the work is usually done, drafts a new skill, and adds it to her library with Jeff's approval.

## When to use

- `/self-assess` concluded "MISSING SKILL" for a task
- Jeff explicitly says "you should have a skill for this"
- A recurring pattern emerges (same type of task came up 3+ times) and a skill would save time

## Process

### Step 1 — Define the gap precisely

What specifically is the new skill supposed to do?
- **Name** (kebab-case, fits her naming pattern): e.g., `/venue-research`, `/setlist-optimizer`, `/tour-planner`
- **Trigger conditions**: when Jeff says what, should this fire?
- **Inputs**: what does Jeff provide?
- **Outputs**: what does she produce?
- **Safety/approval gates**: what can she do autonomously, what needs Jeff to sign off?

Write these down clearly. A vague skill definition produces a useless skill.

### Step 2 — Research best practices

Use `/research-topic` to run a bounded investigation:
- How do professionals in this domain approach this task?
- What tools or frameworks exist?
- What patterns fail / produce bad results?
- What ethical or safety considerations apply?

Keep the research scoped — ~300 words of findings, not a dissertation.

### Step 3 — Examine existing skills for pattern

Open 2-3 related skills from `skills/` folder. Study their structure:
- How do they introduce themselves (description, triggers)?
- What's their process structure?
- How do they handle rules and memory references?
- What tone / voice do they use?

New skill should feel native to Andrea's existing library.

### Step 4 — Draft the SKILL.md

Write a new `SKILL.md` matching Andrea's conventions:

```markdown
---
name: {kebab-name}
description: {one paragraph — when to use, what it does, what it returns, approval boundaries}
---

# {Human Name}

{2-3 sentence opening — what this skill is for and why}

## When to use
- {trigger 1}
- {trigger 2}

## Process
### Step 1 — {action}
### Step 2 — {action}
### Step 3 — {action}

## Rules
- {constraint}
- {what never to do}

## Memory
- Reads: {files}
- Writes: {files if any}
```

### Step 5 — Present to Jeff for approval

Return the draft in a code block. Ask clearly:
- "Here's the draft. Read it — does it match what you want?"
- Call out any assumptions you made that he should verify
- Offer to revise based on his feedback

**Never install without approval.**

### Step 6 — Install (after approval)

If Jeff approves:
1. Write the new `SKILL.md` to `skills/{kebab-name}/SKILL.md`
2. Copy into the plugin bundle at `jeff-assistant-plugin/skills/{kebab-name}/SKILL.md`
3. Update `plugin.json` skills array alphabetically
4. Update `memory/INDEX.md` with the new skill entry
5. Append to `memory/CHANGELOG.md`: "Learned skill: /{name} — purpose."
6. Tell Jeff to restart Cowork to pick it up (skills load at startup)

### Step 7 — Test

Right after install, invoke the new skill once with a realistic input. Confirm it behaves as drafted. If it feels off, propose a v2 immediately rather than shipping the rough version.

## Rules

- **Never install without approval.** Draft → review → install → test. Always in that order.
- **Never fabricate research.** If Exa doesn't return useful results, say so and propose asking Jeff directly for domain knowledge.
- **Never invent skills for nonexistent needs.** Only create when there's a real gap (self-assess said so, or Jeff asked).
- **Match her voice.** The new skill should sound like other Andrea skills — no corporate-assistant tone, no sycophancy.

## Memory

- Reads: existing `skills/`, `memory/INDEX.md`, `memory/andrea-identity.md`, Exa research
- Writes: new `skills/{name}/SKILL.md`, `plugin.json`, `memory/INDEX.md`, `memory/CHANGELOG.md`

## Growth path

Over time, Andrea's skill count grows from 37 → 50 → 100, shaped specifically by Jeff's actual work. Each skill is a captured pattern of "how Jeff likes this done." The library becomes a personalized playbook nobody else has.
