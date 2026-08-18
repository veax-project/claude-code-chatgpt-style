<div align="center">

<img src="assets/hero.png" alt="Claude Code, but it talks back properly" width="100%">

<br><br>

# Claude Code — ChatGPT-style responses

**A single drop-in `CLAUDE.md` that makes Claude Code answer like ChatGPT.**<br>
Headings, bold, tables, emoji anchors — instead of a flat wall of plain text.

<br>

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-D97757?style=flat-square)](https://creativecommons.org/licenses/by/4.0/)
[![For Claude Code](https://img.shields.io/badge/for-Claude%20Code-1B1B1F?style=flat-square)](https://claude.com/claude-code)
[![One file](https://img.shields.io/badge/install-one%20file-3A3A44?style=flat-square)](#-install)

</div>

<br>

---

## 🎯 Why

Claude Code answers in **terse, flat plain text** by default. That's the right call for a diff review. It's a cold read for everything else.

And a lot of us don't only use it to fix a build — we ask it real questions, we think out loud with it, we come back to it at 2am. A warmer, structured tone just makes that nicer.

This repo is that tone, in one file.

---

## 🚀 Install

Pick **one** command — the one matching your system. They both do the exact same thing.

### 🪟 Windows (PowerShell)

```powershell
curl.exe -o "$env:USERPROFILE\.claude\CLAUDE.md" https://raw.githubusercontent.com/veax-project/claude-code-chatgpt-style/main/CLAUDE.md
```

### 🍎 macOS / 🐧 Linux

```bash
curl -o ~/.claude/CLAUDE.md https://raw.githubusercontent.com/veax-project/claude-code-chatgpt-style/main/CLAUDE.md
```

Both write the same file to the same place — `~/.claude/CLAUDE.md` — which applies to **all your projects**.

No terminal? Download [`CLAUDE.md`](CLAUDE.md) and drop it in your `.claude` folder by hand. Same result.

> ⚠️ **Restart required.** `CLAUDE.md` is read when a session *starts*. Run `/clear` or open a new session — otherwise nothing changes.

> 💾 **Already have a `~/.claude/CLAUDE.md`?** These commands **overwrite it**. Back it up first, or paste this file's content at the end of yours instead.

<details>
<summary><b>📄 See exactly what you're installing</b> (it's 40 lines of markdown, no code, no telemetry)</summary>

<br>

It's a plain instruction file. It tells the model to use headings, bold key terms, bullet lists, tables and emoji section anchors, to elaborate rather than answer dryly — and to keep two ChatGPT habits *out*: opening flattery and agreeing with everything.

Read the whole thing here: [`CLAUDE.md`](CLAUDE.md)

</details>

### 📁 Only one project

Drop [`CLAUDE.md`](CLAUDE.md) at the root of a single repo instead. The project file takes priority over the global one.

### 🇫🇷 Version française

[`CLAUDE.fr.md`](CLAUDE.fr.md) is the same style written in French, with French tone rules.
Download that one instead and rename it to `CLAUDE.md`.

---

## ⚠️ Why not an output style?

Claude Code has (had) a feature literally built for this: **output styles** — a markdown file in `~/.claude/output-styles/`, plus `"outputStyle": "MyStyle"` in `settings.json`.

On **v2.1.179**, I set one up correctly and it **never reached the model** — the style's content was nowhere in the system prompt. The `/output-style` command had already been removed from the CLI too.

So if you tried an output style and nothing happened: **you're not crazy, and it's not your file.**

`CLAUDE.md`, on the other hand, is injected into every session wrapped in an explicit *"these instructions override any default behavior"*. That's the one that works.

| Method | Scope | Status |
|---|---|---|
| `~/.claude/CLAUDE.md` | All projects | ✅ **Works** — injected every session |
| `./CLAUDE.md` | One project | ✅ **Works** — and wins over the global one |
| `~/.claude/output-styles/*.md` | All projects | ❌ Not applied on v2.1.179 |

*(An `output-styles/` copy ships here anyway, in case the feature comes back.)*

---

## 🔧 Tuning it

It's plain markdown — open it and edit. The obvious knobs:

| You want | Do this |
|---|---|
| 😵 Fewer emojis | Delete the whole `## Emojis` section |
| ✂️ Shorter answers | Swap *"Elaborate"* for *"Stay concise — structure, don't pad"* |
| 💬 Style only in chat, not while coding | Add *"On a technical task, keep it minimal"* |
| 🎩 More formal | Remove the warmth line, keep the structure rules |

---

## 📌 What it deliberately leaves out

Two things that make ChatGPT tiring are **not** in here:

- ❌ **Opening flattery** — no *"Great question!"*
- ❌ **Agreeing with everything** — it still tells you when your idea is bad

Warm tone, not a yes-man.

---

## 📜 License

Licensed under **[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)**.

In plain English:

- ✅ Use it, copy it, modify it — commercially too
- ✅ Ship it in your own setup, your team, your company
- ⚠️ **If you republish or fork it, credit the original** and link back to this repo

The whole point of this file is to be copied. Just don't pass it off as your own. 🙂

<div align="center">
<br>
<sub>Built by <a href="https://github.com/veax-project">veax-project</a></sub>
</div>
