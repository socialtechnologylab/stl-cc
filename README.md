# STL Claude Code Config

Shared Claude Code plugins and best practices for the STL team.

## Installation

### One-liner

```bash
git clone git@github.com:stl-nl/claudeconfig.git ~/code/claudeconfig && \
echo 'export PATH="$HOME/code/claudeconfig:$PATH"' >> ~/.zshrc && \
source ~/.zshrc && \
stl-plugins install
```

### Step by step

```bash
# 1. Clone
git clone git@github.com:stl-nl/claudeconfig.git ~/code/claudeconfig

# 2. Add to PATH (add this line to ~/.zshrc)
export PATH="$HOME/code/claudeconfig:$PATH"

# 3. Reload shell
source ~/.zshrc

# 4. Install all plugins
stl-plugins install

# 5. Restart Claude Code
```

## Commands

```bash
stl-plugins install    # Install all plugins
stl-plugins update     # Update all plugins + marketplaces
stl-plugins delete     # Remove all plugins
stl-plugins list       # Show plugin list
stl-plugins add <name> # Add a new plugin
```

## Included Plugins

| Plugin | What it does |
|--------|--------------|
| `dev-browser` | Browser automation - scraping, testing, screenshots |
| `code-review` | Automated code review with confidence scoring |
| `security-guidance` | Warns about security issues when editing files |
| `pyright-lsp` | Python language server (type checking, intellisense) |
| `typescript-lsp` | TypeScript/JS language server |
| `commit-commands` | `/commit`, `/push`, `/pr` slash commands |
| `feature-dev` | 7-phase structured feature development |
| `github` | GitHub API - issues, PRs, repos |
| `superpowers` | TDD workflow, subagent development, debugging |
| `context7` | Fetch up-to-date library documentation |

## New Project Setup

Copy the CLAUDE.md template:

```bash
cp ~/code/claudeconfig/CLAUDE.md.template ./CLAUDE.md
```

Edit the `Project-Specific` section with your project details.

## Adding New Plugins

```bash
# Add and install
stl-plugins add playwright@claude-plugins-official

# Or edit plugins.txt directly, then:
stl-plugins install
```

Browse available plugins: https://github.com/anthropics/claude-plugins-official

---

## For AI Agents

This section is for Claude and other AI agents working with STL codebases.

### Stack

- **Python**: Use `uv` (never pip). Config in `pyproject.toml`.
- **JavaScript**: Use `pnpm` (never npm).
- **Linting**: `ruff` for Python, `prettier` for JS.
- **Testing**: `pytest`.

### Deployment

All STL projects use `stl-infra` with `ops.py`:

```bash
uv run ops provision        # Create infrastructure
uv run ops deploy [target]  # Deploy application
uv run ops deploy --all     # Deploy everything
uv run ops status           # Health check
```

### Infrastructure Conventions

- **Cloud**: Hetzner Cloud (servers), Cloudflare (DNS)
- **IaC**: Terraform + Ansible
- **Monitoring**: BetterStack
- **Secrets**: `.env` file (never commit)

### Path Conventions

```
/run/<app>/<app>.sock    # Unix socket
/opt/<app>/              # App directory
/var/log/<app>/          # Logs
/var/www/<app>/          # Web root
```

### Key Commands

```bash
# Python
uv run <script>           # Run with uv
uv sync                   # Install dependencies
ruff check .              # Lint
ruff format .             # Format

# JavaScript
pnpm install              # Install
pnpm dev                  # Dev server
pnpm build                # Build

# Infrastructure
uv run ops infra plan     # Terraform plan
uv run ops infra apply    # Terraform apply
uv run ops configure      # Ansible configure
```

### Important

1. Always read `CLAUDE.md` in project root first
2. Use `uv` for Python, `pnpm` for JS - never pip/npm
3. Secrets go in `.env`, never committed
4. All infra changes go through `ops.py`

---

## Files

| File | Purpose |
|------|---------|
| `stl-plugins` | CLI tool for plugin management |
| `plugins.txt` | List of team plugins |
| `CLAUDE.md.template` | Template for new projects |
