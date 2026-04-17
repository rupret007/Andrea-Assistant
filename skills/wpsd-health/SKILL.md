---
name: wpsd-health
description: Check the health of Jeff's Ham radio WPSD DMR hotspot and report any anomalies. Use when Jeff says "check the hotspot", "how's WPSD", "any radio issues", or when preparing for on-air activity. Reads the WPSD dashboard if network-reachable, reports modem state, BrandMeister connection, recent call volume, and temperature. Does NOT modify configuration.
---

# WPSD Health

## Context

Jeff runs a WPSD (Web Panel for Pi-Star Dashboard) DMR Ham radio hotspot. He has a custom WPSD-Dashboard repo he's been building on top of it. WPSD is typically reachable at `http://pi-star.local/` or a local LAN IP when he's on his home network.

## When to use

- Jeff asks "how's my hotspot" / "check WPSD" / "status on the radio"
- Before a net / activity he's joining
- Running as part of a scheduled health watchdog

## Process

### Step 1 — Determine access method

WPSD is hosted on Jeff's home network. Cowork running on his local machine can hit it if he's on the same LAN. If Cowork is in a cloud context, it can't reach the dashboard directly.

Ask (or infer): "Are you on your home network?" — if yes, try `http://pi-star.local/` first, then common hotspot IPs (192.168.x.x range).

If not reachable, tell Jeff and offer alternatives:
- He pastes a screenshot of the dashboard — you read and summarize it
- He copies the `/mmdvmhost.service` journal output — you analyze
- He tells you the BrandMeister talkgroup and you check the public BM page for recent activity

### Step 2 — If dashboard reachable, pull these stats

- **Modem state:** Idle / RX / TX / Error
- **Connected network:** BrandMeister / TGIF / DMR+ — which master server
- **Talkgroup subscriptions:** which TGs are active
- **Recent call log:** last 10 entries — callsign, TG, duration, signal
- **Temperature:** CPU temp (Pi hotspots crash above ~80°C)
- **Uptime:** when did it last reboot
- **Firmware / WPSD version:** for update awareness

### Step 3 — Flag anomalies

Rules for raising flags:
- CPU temp > 75°C → warn
- BrandMeister master offline / error state → warn
- No RX activity in 48 hours AND usually active → curiosity flag ("is the antenna OK?")
- Firmware > 30 days old → suggest update check (but don't auto-update)
- Disk full / > 90% → warn
- Modem in Error state → warn

### Step 4 — Report

Keep it short (under 150 words):

```
📻 **WPSD health — {timestamp}**

Status: {🟢 healthy / 🟡 attention / 🔴 something wrong}

- Modem: {state}
- Network: {BM master} ({connected/offline})
- Temp: {X}°C {flag if hot}
- Uptime: {X days} — last reboot {date}
- Last activity: {timestamp} on TG {number}
- Talkgroups: {count} active

{Any flags or notes in one sentence each}

{Suggested action if any}
```

### Step 5 — Offer next steps

If healthy: done, no follow-up needed.
If flagged: offer "Want me to draft a diagnostic steps list?" or "Want me to check the WPSD forum / GitHub issues for this state?"

## Never do

- Never modify the hotspot's config or reboot it without Jeff's explicit sign-off.
- Never transmit on Jeff's behalf (obviously — no authority to key the mic).
- Never share callsigns, talkgroup IDs, or private QSO data outside this session.

## Memory to read
- `CLAUDE.md`
- `memory/projects/wpsd-dashboard.md`

## Future enhancement

If Jeff deploys a Claude Agent SDK instance on a cloud VM that reaches his home network (via Tailscale or similar), this skill becomes a scheduled watchdog that pings his phone only when something changes. See the build plan doc for that path.
