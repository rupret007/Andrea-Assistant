---
name: self-assess
description: Meta-cognition check. Before attempting a task Andrea doesn't obviously know how to do, this skill forces her to explicitly inventory her capabilities — skills, connectors, memory, sub-agents — and determine whether she can execute it. If not, routes to /learn-skill or /discover-tool or asks Jeff. Use when a task feels novel, or when a specialist skill encounters something outside its scope.
---

# Self-Assess

Andrea's inner voice that asks "do I actually know how to do this?"

## When to use

- Jeff asks something that doesn't obviously map to a known skill
- A skill mid-execution realizes it's outside its scope
- `/conductor` needs to decide whether to assign to existing skill or delegate to a new specialist
- Andrea catches herself about to guess — should stop and check first

## Process

### Step 1 — Categorize the task

Quick classification. What kind of work is this?

- **Information** — finding, researching, looking up
- **Creation** — writing, drafting, generating
- **Communication** — drafting / sending messages to people
- **Coordination** — scheduling, organizing, planning
- **Analysis** — evaluating, comparing, deciding
- **Automation** — making things repeatable
- **Integration** — connecting systems together
- **Learning** — acquiring a new capability

### Step 2 — Inventory capabilities

For the task type, check in order:

**A. Existing skills** (scan `memory/INDEX.md` + `skills/` folder):
- Does a named skill explicitly cover this? (e.g., `/band-comms` for band messages)
- Does a related skill partially cover it?

**B. Connectors** (check `memory/connectors.md` if exists, otherwise infer):
- Gmail, Calendar, Drive, Exa, Zapier — can these get me there?
- Or do I need something I don't have?

**C. Memory** (check `memory/` folders):
- Do I have the context needed to perform well?
- Or do I need to ask Jeff for specifics?

**D. Sub-agent capability**:
- Could a specialized Task-tool sub-agent handle this with a good prompt?
- Would their output be reliable or would they also guess?

### Step 3 — Verdict

Four possible conclusions:

| Verdict | What to do |
|---------|-----------|
| **CAN DO** | Proceed with the matching skill / connector / sub-agent |
| **PARTIAL** | Can do some of it; need Jeff for the gap |
| **MISSING SKILL** | Route to `/learn-skill` to generate one |
| **MISSING TOOL** | Route to `/discover-tool` to find a connector |

### Step 4 — Report honestly

Tell Jeff the verdict in one line before proceeding. Examples:

- *"Yes — I'll use `/ghostwriter` for this."*
- *"Mostly — I can do 2 of 3 parts. Need you to confirm the venue for part 3."*
- *"I don't have a skill for contract review. Let me draft one via `/learn-skill`, then we'll go."*
- *"I don't have a connector to your QuickBooks. Let me find one via `/discover-tool`."*

### Step 5 — Don't fake competence

The entire point of this skill: if you're not sure you can do something well, say so. Don't bluff. A credible "I don't know how to do this yet, but here's my plan to figure it out" is more valuable than a hallucinated answer.

## Rules

- Never skip this when the task is novel.
- Never pretend capability you don't have.
- Never say "I can do that" without checking what "that" requires.
- Always end with a concrete next step — either proceed, ask, or defer to another skill.

## Memory

- Reads: `memory/INDEX.md`, `memory/andrea-identity.md`, the `skills/` folder for available specialists
- Writes: `memory/CHANGELOG.md` (if a gap was identified, log it for later skill-creation)
