#!/usr/bin/env bash
# Installs the ChatGPT-style CLAUDE.md for Claude Code.
# Backs up any existing ~/.claude/CLAUDE.md before writing, so nothing is lost.
#
#   ./install.sh                    # default style
#   ./install.sh concise            # a variant
#   ./install.sh --append          # append instead of replacing
#
# Variants: default | no-emoji | concise | chat-only | fr | tr | az

set -euo pipefail

VARIANT="${1:-default}"
APPEND="${2:-}"

if [ "$VARIANT" = "--append" ]; then APPEND="--append"; VARIANT="default"; fi

case "$VARIANT" in
  default)   FILE="CLAUDE.md" ;;
  fr)        FILE="CLAUDE.fr.md" ;;
  tr)        FILE="CLAUDE.tr.md" ;;
  az)        FILE="CLAUDE.az.md" ;;
  no-emoji)  FILE="variants/no-emoji.md" ;;
  concise)   FILE="variants/concise.md" ;;
  chat-only) FILE="variants/chat-only.md" ;;
  *) echo "  [!!] unknown variant: $VARIANT"
     echo "       use: default | no-emoji | concise | chat-only | fr | tr | az"; exit 1 ;;
esac

BASE="https://raw.githubusercontent.com/veax-project/claude-code-chatgpt-style/main"
DIR="$HOME/.claude"
TARGET="$DIR/CLAUDE.md"

echo
echo "  Claude Code - ChatGPT-style responses"
echo "  variant: $VARIANT"
echo

mkdir -p "$DIR"

echo "  ... downloading"
TMP="$(mktemp)"
if ! curl -fsSL "$BASE/$FILE" -o "$TMP"; then
  echo "  [!!] download failed - is the repository public yet?"
  rm -f "$TMP"; exit 1
fi

if [ -f "$TARGET" ]; then
  BACKUP="$TARGET.backup-$(date +%Y%m%d-%H%M%S)"
  cp "$TARGET" "$BACKUP"
  echo "  [ok] existing file backed up"
  echo "       $BACKUP"
fi

if [ "$APPEND" = "--append" ] && [ -f "$TARGET" ]; then
  printf '\n\n' >> "$TARGET"
  cat "$TMP" >> "$TARGET"
  echo "  [ok] appended to your existing CLAUDE.md"
else
  mv "$TMP" "$TARGET"
  echo "  [ok] installed to $TARGET"
fi
rm -f "$TMP" 2>/dev/null || true

echo
echo "  NEXT: run /clear or open a new session."
echo "  CLAUDE.md is only read when a session starts."
echo
