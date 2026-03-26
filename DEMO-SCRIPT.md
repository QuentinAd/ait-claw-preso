# Demo Script — AI Tinkerers Calgary, March 26, 2026

## Pre-Show Checklist (10 min before)

- [ ] Open presentation: `open http://localhost:8000` (or serve from Mac)
- [ ] iPhone charged and connected for iPhone Mirroring
- [ ] MacServe dashboard open in Safari on iPhone
- [ ] Kitchen app open in Safari on iPhone
- [ ] Telegram open on iPhone
- [ ] Termius connected via Tailscale on iPhone
- [ ] WhatsApp open on iPhone
- [ ] Terminal ready with nanoclaw project

### Serve the presentation

```bash
cd ~/Repos/personal/presentation
python3 -m http.server 8000
```

Or open `index.html` directly in browser.

### Speaker notes

Press `S` in the browser to open speaker notes window.

---

## Slide-by-Slide Guide (15 minutes)

### Slide 1: Title (30s)
- Quick intro. "I'm going to show you real, always-on agents running on a Mac."

### Slide 2: The Crab Revolution (1 min)
- Claude Code crab mascot → community adopted it → OpenClaw → NanoClaw
- Light pun: "things got out of claw"
- Set up the tension: how much code do you actually need?

### Slide 3: OpenClaw — The Leviathan (1.5 min)
- Walk through the stats: 400K lines, 199K stars
- Drop the security bombs: CVE-2026-25253, 12% malicious skills
- "More code = more attack surface"

### Slide 4: NanoClaw vs OpenClaw (1.5 min)
- Side-by-side comparison
- OS-level isolation vs application sandboxing
- Karpathy quote: "It all feels like a skill issue"
- "You can read the entire NanoClaw core in 8 minutes"

### Slide 5: Harness Engineering (1 min)
- "2025 was agents. 2026 is agent harnesses."
- The model is not the hard part. The harness is.
- Karpathy runs 20 agents, hasn't written code since December

### Slide 6: Architecture Diagram (1.5 min)
- Walk through the SVG diagram
- Host process: messaging + routing + security
- Container per group: isolated Linux VM
- Key insight: "security is structural, not just code-level"

### Slide 7: Security Deep Dive (1 min)
- Comparison table — hit the key rows
- Show the blocked mount patterns (actual code)
- "The allowlist lives OUTSIDE the project so containers can't modify their own security"

### Slide 8: Code Walkthrough (30s)
- Quick scan of container-runner.ts
- "This is the actual code that spawns containers"
- Point out mount isolation, credential filtering

### Slide 9: LIVE DEMO — NanoClaw (2 min)

**Terminal commands:**
```bash
# Show the service is running
launchctl list | grep nanoclaw

# Show recent logs
tail -20 ~/Repos/personal/nanoclaw/logs/nanoclaw.log

# Show registered groups
cat ~/Repos/personal/nanoclaw/data/registered_groups.json | python3 -m json.tool

# Show sessions
cat ~/Repos/personal/nanoclaw/data/sessions.json | python3 -m json.tool
```

**WhatsApp demo:**
- Send a message to the main group: "@Andy what's the weather in Calgary?"
- Watch the logs for container spawn
- Show the response come back

**Telegram demo:**
- Show a notification coming in
- Reply from phone

### Slide 10: The Always-On Stack (1 min)
- Three services diagram
- "Zero cloud bills. The Mac IS the server."
- Tailscale mesh — zero-trust, no port forwarding

### Slide 11: LIVE DEMO — iPhone (1.5 min)

**iPhone Mirroring sequence:**
1. **MacServe PWA** — show live dashboard, maybe restart a service
2. **Kitchen App** — show shopping list
3. **Telegram** — show alert history, reply to something
4. **Termius** — quick SSH session showing `uptime` or `launchctl list`

Say: "These are all PWAs on my home screen. No app store, no deployment pipeline. Just hostname:port over Tailscale."

### Slide 12: MCP Bridge (1 min)
- Show kitchen-mcp code — 19 tools
- Walk through the conversation example
- "One WhatsApp message triggers a chain of MCP tool calls"

### Slide 13: Autonomy Spectrum (1 min)
- Point to "near-autonomous" on the spectrum
- What works today vs what needs humans
- "More autonomy by the day"

### Slide 14: Personal → Professional (1.5 min)
- The comparison table is the key slide
- "WhatsApp message becomes SCADA event. Kitchen pantry becomes pipeline pressure."
- Oil & Gas examples: pipeline monitoring, grid frequency, well production
- "Replaces heuristics with contextual reasoning"

### Slide 15: Serverless Architecture (30s)
- Quick walk of the enterprise diagram
- "Same event → reason → act/escalate pattern at industrial scale"

### Slide 16: Closing (30s)
- "500 lines. Three services. Zero cloud bills."
- "Build the harness, not the app."
- Links to repos
- Thank you

---

## Emergency Recovery

If anything breaks during live demo:
- **NanoClaw down?** → Skip to architecture slides, explain what would happen
- **WhatsApp not responding?** → Show logs, explain the message loop
- **iPhone mirror fails?** → Describe the apps verbally, show screenshots
- **Slides won't load?** → Open index.html directly in browser (works offline once loaded)

## Timing Guide

| Section | Duration | Cumulative |
|---------|----------|------------|
| Title + Crab Revolution | 1:30 | 1:30 |
| OpenClaw + NanoClaw + Harness | 4:00 | 5:30 |
| Architecture + Security + Code | 3:00 | 8:30 |
| Live Demo (NanoClaw) | 2:00 | 10:30 |
| Always-On Stack + iPhone Demo | 2:30 | 13:00 |
| MCP + Autonomy + Professional | 3:00 | 16:00 |
| Closing | 0:30 | 16:30 |

**Buffer: ~1 min for questions/transitions**

Total target: 15 minutes (with 1.5 min flexibility)
