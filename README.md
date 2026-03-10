# stl-cc

STL Claude Code setup.

## Install

```bash
git clone git@github.com:socialtechnologylab/stl-cc.git ~/code/stl-cc
cd ~/code/stl-cc
./install.sh
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
├── install.sh       # Adds to PATH, runs stl-cc update
├── stl-cc           # The command (update/uninstall/list)
└── papa-CLAUDE.md   # Best practices → ~/.claude/CLAUDE.md
```
