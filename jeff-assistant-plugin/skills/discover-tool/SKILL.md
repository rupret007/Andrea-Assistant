---
name: discover-tool
description: Find a new MCP connector when Andrea's current tools can't cover a task. Searches the Claude MCP registry, evaluates relevance, and proposes connectors with install paths. Use when /self-assess concluded "MISSING TOOL" or when a task explicitly needs a service Andrea isn't yet wired to (e.g., QuickBooks, Notion, Linear, Shopify). Never installs without Jeff's approval.
---

# Discover Tool

When Andrea needs a capability she doesn't have, she finds it. This skill closes tool gaps.

## When to use

- `/self-assess` returned "MISSING TOOL"
- Jeff names a service Andrea isn't connected to ("check my Shopify orders" when Shopify isn't wired)
- `/conductor` is decomposing a task and hits a step that needs a tool
- Andrea notices herself saying "I'd need X to do this" repeatedly

## Currently connected tools (baseline)

- Gmail (personal)
- Google Calendar
- Google Drive
- Exa (web search)
- Zapier (meta-connector, 8000+ apps accessible but require per-app config)

## Process

### Step 1 — Name the capability needed

What specifically is Jeff trying to do that current tools can't?

- ❌ Too vague: "I need better tools"
- ✅ Specific: "I need to pull recent invoices from QuickBooks"
- ✅ Specific: "I need to check my Shopify store's daily sales"

### Step 2 — Search the MCP registry

Use `search_mcp_registry` with natural-language keywords.
Good queries:
- `["quickbooks", "accounting", "invoices"]`
- `["shopify", "ecommerce", "orders"]`
- `["fathom", "meeting transcripts"]`

Review results. For each candidate:
- Relevance to the actual need
- Official (Anthropic-endorsed) vs community
- Tool surface — does it actually do what Jeff needs?
- Any known issues (check recent activity)

### Step 3 — Check if Zapier covers it

Before recommending a new connector, check: can Zapier cover the same need? Zapier's 8,000+ apps often include the target. If yes, Zapier + config may be simpler than a dedicated MCP.

Trade-off:
- Dedicated MCP: fast, rich tool surface, direct API
- Zapier: covers more apps, slower, sometimes cruder

### Step 4 — Propose to Jeff

Return a short comparison:

```
🔌 **Tool gap: {capability needed}**

**Best match:** {connector name}
- What it does: {1 line}
- Install: {complexity — one-click / OAuth dance / API key}
- Cost: {free / tier-based / paid}

**Alternative via Zapier:** {if applicable}
- Pros: {already connected, works today}
- Cons: {slower, crude fit}

**My recommendation:** {one}

Install it?
```

### Step 5 — Install on approval

If Jeff approves:
- Use `suggest_connectors` to surface the connector UI in Cowork
- Jeff clicks Connect, does OAuth
- You guide any post-install config

After install:
- Update `memory/connectors.md` with the new entry (name, what it does, when to use)
- Update `memory/CHANGELOG.md`
- Test with a realistic call before closing the loop

### Step 6 — Teach yourself how to use it

Read the new connector's tool descriptions. Note:
- What each tool does
- Parameter conventions
- Rate limits / quirks
- Failure modes

Store these notes in `memory/connectors.md` under the new connector's entry. Future Andrea (in fresh sessions) reads that first and skips the learning curve.

## Rules

- **Never install silently.** Every new connector is OAuth or API-key territory — Jeff approves each.
- **Never recommend a connector without checking it exists.** Search results must return actual matches, not guesses.
- **Never skip the Zapier check** — it often covers the need without adding another system.
- **Never forget to document.** `memory/connectors.md` entry is the deliverable, not just "I installed it."

## Memory

- Reads: `memory/connectors.md` (if exists), MCP registry search results
- Writes: `memory/connectors.md` (append new entries), `memory/CHANGELOG.md`
