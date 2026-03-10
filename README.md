# stl-cc

STL Claude Code setup.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/socialtechnologylab/stl-cc/main/install.sh | bash
```

Restart Claude Code after.

## What it does

1. **Plugins** - dev-browser, code-review, pyright-lsp, typescript-lsp, commit-commands, feature-dev, github, superpowers, context7
2. **Safety** - Destructive Command Guard (blocks `rm -rf`, etc.)
3. **Best practices** - `~/.claude/CLAUDE.md` (use uv, pnpm, ruff, ops.py)

## Update

```bash
stl-cc update
```

## Files

```
stl-cc/
├── install.sh       # Clones repo, adds to PATH, runs stl-cc update
├── stl-cc           # The command (update/uninstall/list)
└── papa-CLAUDE.md   # Best practices → ~/.claude/CLAUDE.md
```
