# Harness Engineering, Crustaceans & Near-Autonomous Agents

Presentation for [AI Tinkerers Calgary](https://calgary.aitinkerers.org/) — March 27, 2026

**[View slides](https://quentinad.github.io/ait-claw-preso/)**

## About

A 15-minute talk exploring event-driven near-autonomous AI agents — from personal infrastructure to professional applications.

**Presenter:** Quentin Adam, AI/Data Engineer @ [Dakota Analytics](https://dakotaanalytics.com)

## What's Covered

- **The Crab Revolution** — Claude Code's crab mascot spawned an ecosystem: OpenClaw (~400K lines) vs NanoClaw (~500 lines)
- **Harness Engineering** — 2025 was agents, 2026 is agent harnesses. The model isn't the hard part.
- **NanoClaw Architecture** — Container isolation (Apple Container / Docker), ephemeral spawning, mount security
- **Security** — OS-level isolation vs app-level sandboxing. Why size IS the attack surface.
- **The Always-On Stack** — Three launchd services, one Mac, zero cloud bills, Tailscale mesh VPN
- **MCP: Agent-to-World Bridge** — Model Context Protocol for tool calling (kitchen-mcp: 19 tools)
- **Autonomy Spectrum** — Iterative approach: harness → skills → MCP tools → event triggers → context engineering
- **Professional Applications** — Same event→agent→act/escalate pattern for pipeline monitoring, electricity grids

## Projects Shown

| Project | Description | Repo |
|---------|-------------|------|
| **NanoClaw** | Minimal personal AI assistant with container isolation | [gavrielc/nanoclaw](https://github.com/gavrielc/nanoclaw) |
| **MacServe** | macOS server monitoring dashboard with Telegram alerts | [QuentinAd/macserve](https://github.com/QuentinAd/macserve) |
| **life-os / kitchen** | Family kitchen management with MCP integration | [QuentinAd/life-os](https://github.com/QuentinAd/life-os) |

## Key Sources

- [Effective Harnesses for Long-Running Agents](https://www.anthropic.com/engineering/effective-harnesses-for-long-running-agents) — Anthropic
- [Karpathy on Autonomous AI Agents](https://fortune.com/2026/03/17/andrej-karpathy-loop-autonomous-ai-agents-future/) — Fortune
- [AutoResearch](https://github.com/karpathy/autoresearch) — Karpathy (630 lines)
- [Model Context Protocol](https://modelcontextprotocol.io) — Anthropic
- [2025 Was Agents. 2026 Is Agent Harnesses.](https://aakashgupta.medium.com/2025-was-agents-2026-is-agent-harnesses-heres-why-that-changes-everything-073e9877655e)

## Running Locally

```bash
python3 -m http.server 8000
# open http://localhost:8000
```

Press `S` to open speaker notes.

## Tech

Single self-contained HTML file using [Reveal.js](https://revealjs.com/) with an ocean/crab theme. No build step. SVG diagrams and embedded QR code.
