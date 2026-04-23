# Hermes Agent patterns adopted (v4.2)

Ported from Nous Research's Hermes Agent (https://github.com/NousResearch/hermes-agent).
v0.10.0 as of April 2026, 90k+ stars, widely considered the gold standard for self-improving agents.

## 1. Bounded memory (adopted)

**Hermes:** MEMORY.md capped at 2,200 chars, USER.md at 1,375 chars. When full, forces consolidation, not append.

**Andrea implementation:** `memory/USER.md` at ~1,500 char cap. Nightly consolidation enforces bound. This is counterintuitive but brilliant — it forces Andrea to develop a "working theory" of Jeff rather than an infinite list of trivia.

**Rationale:** A 10,000-line USER.md is unusable. A 1,500-char one is *the* canonical profile.

## 2. Autonomous skill creation after complex tasks (adopted)

**Hermes:** After a complex task completes, the agent reflects on approach and distills into a `.skill` file with name, trigger_patterns, parameters, steps, success_rate, usage_count, last_optimized.

**Andrea implementation:**
- `/conductor` saves successful orchestrations as new skills via `/learn-skill`
- Each new skill gets metadata fields (via template update — see skill-outcomes.md)
- Skills start as `draft`, graduate through `tested | refined | promoted`

## 3. Skill self-improvement during use (partially adopted, more to port)

**Hermes:** During execution, if agent discovers a better approach than the skill doc describes, it updates the doc. No prompt required.

**Andrea implementation (current):**
- `/outcome-log` tracks corrections
- Weekly skill-reflect (not yet built) reviews low-success skills and proposes v2 via `/learn-skill`

**Gap:** Andrea currently doesn't auto-update skills during use. Future work.

## 4. Periodic nudges (adopted)

**Hermes:** Agent proactively decides to persist certain observations to memory between explicit tasks. Judges what's worth keeping on its own.

**Andrea implementation:** `/nudge` skill. Integrated into scheduled rituals (morning brief, EOD wrap, Sunday preview) and invoked proactively after `/conductor` orchestrations.

## 5. FTS5 session search (not yet adopted)

**Hermes:** SQLite FTS5 full-text index over all past conversations. LLM summarization layer on top.

**Andrea (future):** We don't have SQLite in Cowork. Poor-man's equivalent = grep over `memory/episodes/YYYY-MM/` markdown files. Works for small volumes. If Andrea's episode count grows past ~500, we'd need to add a proper FTS layer.

## 6. Dialectical user modeling / Honcho 12-layer identity (not adopted)

**Hermes:** Tracks not just "who you are" but "how your relationship evolved." 12 identity layers.

**Andrea (future):** We have `memory/life-threads/andrea-evolution.md` as a sketch. Proper implementation would be a dedicated `memory/relationship-log.md` capturing relational shifts over time. Deferred — lower immediate ROI for Jeff's use case.

## 7. agentskills.io open standard (partially compatible)

**Hermes:** Skills are structured Markdown with metadata, callable as slash commands, cross-agent shareable via agentskills.io.

**Andrea:** Skills are structured Markdown with frontmatter (name/description). Close to the standard. Could formalize by adopting the full agentskills.io schema. Would make her skills portable to Hermes or other frameworks.

## 8. Atropos RL trajectory recording (not adopted)

**Hermes:** Records execution trajectories as training data for Hermes 4 and future models.

**Andrea (not applicable):** Cowork-based Andrea runs on Claude, which Jeff doesn't train. If he ever wanted to train a custom model on his patterns, trajectories are available via `memory/episodes/`. Not a current need.

## Summary

Of Hermes's 8 distinctive patterns, Andrea has now adopted 4 fully (bounded USER, skill creation, nudges, skill metadata) and partially matches 2 more (skill improvement, FTS-via-grep). Remaining 2 (dialectical modeling, Atropos) are deferred.

Andrea is now demonstrably Hermes-compatible in her core learning loop. She accumulates experience. She judges what to persist. She distills skills from tasks. She grows with Jeff.
