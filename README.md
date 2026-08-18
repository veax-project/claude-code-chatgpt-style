# Claude Code — ChatGPT-style responses

Claude Code answers in **flat, terse plain text** by default. Great for a diff review, cold for everything else.

This repo is a drop-in `CLAUDE.md` that makes it answer like **ChatGPT** instead: headings, bold, bullet lists, tables, emoji anchors, and answers that actually explain themselves.

Because a lot of us don't only use Claude Code to fix a build — we ask it real questions, and a warmer tone just makes it nicer to talk to.

---

## 🎯 Before / after

**Before**

> The output style isn't loaded. Use CLAUDE.md instead.

**After**

> ## 🎯 Why it didn't work
>
> Your config was **technically correct but dead**:
>
> - ✅ The file existed
> - ✅ `settings.json` pointed at it
> - ❌ **But its content never reached the model**
>
> ---
>
> ## ⚙️ The fix
>
> Move the rules into `~/.claude/CLAUDE.md` — that one is injected every session…

Same information. One of them you actually want to read.

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

No terminal? Just download `CLAUDE.md` from this repo and drop it in your `.claude` folder by hand. Same result.

> 💾 **Already have a `~/.claude/CLAUDE.md`?** These commands **overwrite it**. Back it up first, or paste this file's content at the end of yours instead.

### 📁 One project only

Don't want it everywhere? Drop `CLAUDE.md` at the root of a single repo instead. The project file takes priority over the global one.

### 🇫🇷 French version

`CLAUDE.fr.md` is the same style written in French, with French tone rules (`tu`, French phrasing).
Download that file instead, and rename it to `CLAUDE.md`.

> ⚠️ `CLAUDE.md` is read **when a session starts**. Run `/clear` or open a new session after installing — otherwise nothing changes.

---

## ⚠️ Why not an output style?

Claude Code has (had) a feature literally built for this: **output styles** — a markdown file in `~/.claude/output-styles/` plus `"outputStyle": "MyStyle"` in `settings.json`.

On **v2.1.179**, I set one up correctly and it **never reached the model** — the style's content was nowhere in the system prompt. The `/output-style` command had already been removed from the CLI too.

So if you tried an output style and nothing changed: **you're not crazy, and it's not your file.**

`CLAUDE.md`, on the other hand, is injected into every session with an explicit *"these instructions override any default behavior"* wrapper. That's the one that works.

| Method | Status |
|---|---|
| `~/.claude/CLAUDE.md` | ✅ Works — injected every session |
| `./CLAUDE.md` (project) | ✅ Works — per project |
| `~/.claude/output-styles/*.md` | ❌ Not applied on v2.1.179 |

*(An `output-styles/` copy is included anyway, in case the feature comes back.)*

---

## 🔧 Tuning it

It's a plain markdown file — edit it. Some obvious knobs:

- **Too many emojis?** Delete the whole `## Emojis` section.
- **Too long?** Replace *"Elaborate"* with *"Stay concise — structure, don't pad."*
- **Want it only for chat, not for code work?** Add: *"On a technical task, keep it minimal — this style applies to discussion."*

---

## 📌 What it deliberately keeps out

Two things that make ChatGPT annoying are **not** in here:

- ❌ Opening flattery — no *"Great question!"*
- ❌ Agreeing with everything — it still tells you when your idea is bad

Warm tone, not a yes-man.

---

## License

MIT — do whatever you want with it.
