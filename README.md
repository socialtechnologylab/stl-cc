# stl-cc

STL Claude Code setup - plugins, safety, and best practices.

## Install

```bash
git clone git@github.com:socialtechnologylab/stl-cc.git ~/code/stl-cc && \
echo 'export PATH="$HOME/code/stl-cc:$PATH"' >> ~/.zshrc && \
source ~/.zshrc && \
stl-cc install
```

## Commands

```bash
stl-cc install     # Install everything
stl-cc update      # Update everything
stl-cc uninstall   # Remove plugins
stl-cc list        # Show plugins
```

## What it installs

### Plugins

| Plugin | Description |
|--------|-------------|
| `dev-browser` | Browser automation (scraping, testing) |
| `code-review` | Automated code review |
| `security-guidance` | Security warnings |
| `pyright-lsp` | Python language server |
| `typescript-lsp` | TypeScript/JS language server |
| `commit-commands` | `/commit`, `/push`, `/pr` |
| `feature-dev` | 7-phase feature development |
| `github` | GitHub API integration |
| `superpowers` | TDD, subagent development |
| `context7` | Up-to-date library docs |

### Safety

**Destructive Command Guard (dcg)** - blocks dangerous commands like `rm -rf`, `git reset --hard`, etc.

### Best Practices

Installs `~/.claude/CLAUDE.md` with STL conventions:
- Use `uv` for Python (never pip)
- Use `pnpm` for JS (never npm)
- Use `ruff` for linting
- Deployment via `ops.py`

---

## For AI Agents

You are working on an STL project. Key rules:

1. **Python**: Use `uv` (never pip)
2. **JavaScript**: Use `pnpm` (never npm)
3. **Linting**: `ruff` for Python, `prettier` for JS
4. **Testing**: `pytest`
5. **Deployment**: `uv run ops deploy`
6. **Secrets**: `.env` file, never commit

See `~/.claude/CLAUDE.md` for full details.
