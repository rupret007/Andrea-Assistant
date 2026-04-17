---
name: research-topic
description: Launch a deep, multi-angle research investigation on any topic and deliver a consolidated brief with citations. Use when Jeff says "research X", "deep dive on Y", "what's the state of Z", or needs comprehensive background on something before a decision. Spawns parallel sub-agents to cover different angles, synthesizes findings, and saves the brief for future reference.
---

# Research Topic

Multi-agent research orchestrator. Spawns parallel investigators for speed + triangulation.

## When to use

- "Research {topic}"
- "Deep dive on {topic}"
- "What's the state of {domain} in 2026"
- "I'm trying to decide on X — research my options"
- "Background brief on {company / product / person}"

## Process

### Step 1 — Scope the investigation

Ask Jeff (in one message):
1. **What's the specific question you want answered?** (not "research this" but "should I use X for Y" or "how did thing Z happen")
2. **How deep?** quick scan (5 min) / medium (15 min) / comprehensive (30+ min, multi-agent)
3. **Target format?** bullet brief / narrative report / decision matrix / docx
4. **Any angles you already know about?** so the research doesn't retread ground he's covered

### Step 2 — Decompose into research angles

Break the question into 2–4 distinct sub-investigations. Good decompositions:
- Current state / landscape / key players
- History / how we got here
- Controversies / failures / what's NOT working
- Concrete user/customer experiences
- Pricing / distribution / access
- Alternatives / competitors / adjacent options

### Step 3 — Spawn parallel sub-agents

Use the Task tool to launch independent agents — one per angle. Each agent gets:
- A focused brief (under 200 words) with their specific question
- Explicit output structure
- Target length
- Instruction to cite sources inline

Don't give all agents the same question. The power is in diverse angles.

### Step 4 — Synthesize

When sub-agents return, produce ONE consolidated brief that:
- Leads with the answer to Jeff's original question
- Supports with cross-cited findings (note when 2+ sub-agents corroborated something)
- Flags disagreements / contradictions between sources
- Calls out gaps ("no one had a good answer on X")
- Cites sources inline using `[Title](URL)` format

### Step 5 — Deliver

Format options based on Jeff's scope choice:
- **Bullet brief** (quick): under 400 words, grouped bullets
- **Narrative report** (medium): under 900 words, paragraphs with subheads
- **Decision matrix** (if comparing options): table + recommendation
- **docx** (comprehensive): use the docx skill for a formatted document saved to Drive-delivery folder

### Step 6 — Save + offer follow-ups

- Save the brief to `memory/research/{kebab-title}-{YYYY-MM-DD}.md` for future reference
- Offer: "Want me to dig deeper on {specific angle}?" or "Want this as a `/mission` brief with next steps?"

## Quality rules

- **Specificity beats volume.** A short report with specific names, dates, and numbers beats a long one with generalities.
- **Cite. Everything.** Every factual claim needs an inline link.
- **Flag hype vs. shipped.** A lot of AI / product coverage is marketing. Distinguish.
- **Don't punt.** If Jeff asked for a recommendation, give one — with the caveats.

## Never do

- Never fabricate sources or quotes.
- Never claim certainty where the sources are thin — say "couldn't verify" instead.
- Never run research on topics clearly outside scope (e.g., personal info about named private individuals who aren't public figures).

## Memory to read
- `CLAUDE.md`
- `memory/research/` (to avoid re-researching topics already covered)
