---
name: life-thread
description: Manage persistent ongoing matters that span days or weeks — a customer relationship in progress, a bandmate's life event, a decision Jeff is mulling, a health situation, a family thing. Distinct from tasks (tasks close, threads evolve). Use when Jeff says "add this to a thread", "open a thread on X", "what's going on with {thread name}", or when a conversation matter spans more than one moment.
---

# Life Thread

Ported from Andrea_NanoBot. Threads capture continuity that doesn't fit into "tasks" or "memory facts" — things still unfolding.

## When to use

- Jeff says "open a thread on {X}"
- Jeff says "add this to the {X} thread"
- "What's going on with {name / topic}"
- Any time a conversation surfaces an ongoing situation (not a one-off task)

## Thread types (examples)

- **Person threads**: Lucky Ivy (concrete company situation + band arc), Sean (paternity leave timeline), brother Chris (constructiondaily collaboration), Travis (availability patterns)
- **Relationship/account threads**: Wintrust customer-adoption arc, Farmers account relationship
- **Project threads**: Wildflower festival prep, Stalemate return
- **Decision threads**: "Do I start a 3rd band?", "24/7 cloud deployment yes/no"
- **Health/personal threads**: long-term things Jeff wants to track privately

## Storage

Each thread is a Markdown file: `memory/life-threads/{kebab-name}.md`

```markdown
# {Thread title}

**Opened:** {date}
**Status:** active | paused | closed
**Owner:** Jeff
**Participants:** {people involved}
**Summary:** {2-line what this thread is about}

## Timeline
- {YYYY-MM-DD}: {what happened}
- {YYYY-MM-DD}: {what happened}

## Open loops
- [ ] {thing Jeff owes someone}
- [ ] {thing waiting on someone else}

## Notes / context
{free-form as needed}

## Related
- {links to other threads, people files, projects}
```

## Process

### Opening a thread
1. Jeff says "open a thread on {X}"
2. Propose a kebab-name (or use Jeff's)
3. Create `memory/life-threads/{name}.md` from the template
4. Seed it with the context Jeff just gave
5. Confirm: "Thread open. I'll surface this whenever it's relevant."

### Updating a thread (Jeff explicit)
"Add to the Lucky thread: {update}" → append dated entry to Timeline section.

### Updating a thread (Andrea infers)
During other conversations, Andrea may notice a relevant thread. She ASKS before adding:
- "Sounds like this goes in the Wildflower thread — add it?"

Never silently modify. Always confirm.

### Querying threads
"What's going on with Lucky" → read `memory/life-threads/lucky-ivy.md`, return the status + recent timeline + open loops.

"Show my active threads" → list all files in `memory/life-threads/` with status=active.

### Surfacing threads proactively
Scheduled tasks (morning briefing, Sunday preview) should check active threads for:
- Open loops past a reasonable timeframe (> 5 days)
- Anniversaries / timeline dates approaching
- Any participant mentioned in today's Gmail / Calendar

When found, surface in the brief: "Thread 'Lucky Ivy' — you've had an open loop for 8 days: confirm concrete-company schedule."

### Closing a thread
Jeff says "close the {X} thread" — mark status=closed, append final outcome to Timeline, move to `memory/life-threads/archived/{name}.md`.

## Relation to other memory

- **Threads** = ongoing unfolding situations (this skill)
- **Tasks** (TASKS.md) = specific concrete to-dos that close
- **People** (memory/people/) = who someone is
- **Projects** (memory/projects/) = what a project is
- **Library** (memory/library/) = saved content / knowledge

Same entity (e.g., Lucky Ivy) shows up in multiple places with different lenses.

## Initial threads worth opening right now

Propose these to Jeff on first use of this skill:
- `lucky-ivy-concrete-company` — the business situation and Jeff's involvement with constructiondaily
- `sean-paternity-return` — Stalemate's pause and return timing
- `wildflower-festival-2026` — show prep arc
- `andrea-buildout` — this very project (meta, but tracks the arc of building Andrea herself)

## Never do

- Never modify a thread silently.
- Never delete a thread — archive it.
- Never conflate threads with tasks (threads don't "complete", they resolve, pause, or archive).
- Never expose thread content outside memory/ without approval (these are private).

## Memory
- Reads: `memory/life-threads/*`, `memory/people/*`, `memory/andrea-identity.md`
- Writes: `memory/life-threads/{name}.md`
