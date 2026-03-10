# STL Best Practices

You are working on an STL (Social Technology Lab) project. Follow these practices.

## stl-cc (This Setup)

This CLAUDE.md was installed by **stl-cc** - the shared Claude Code configuration for STL.

**Location**: `~/code/stl-cc`

**What it provides**:
- MCP plugins (dev-browser, code-review, superpowers, context7, etc.)
- Destructive Command Guard (blocks `rm -rf`, etc.)
- This best practices file

**Commands**:
```bash
stl-cc update      # Pull latest and reinstall plugins
stl-cc list        # Show installed plugins
stl-cc uninstall   # Remove everything
```

**Repo**: `github.com/socialtechnologylab/stl-cc`

## Package Management

**Python: Always use `uv`**
```bash
uv sync                    # Install dependencies
uv run <script>            # Run scripts
uv add <package>           # Add dependency
uv run pytest              # Run tests
```
Never use `pip`, `pip install`, or `python -m pip`. Always `uv`.

**JavaScript: Always use `pnpm`**
```bash
pnpm install               # Install dependencies
pnpm dev                   # Dev server
pnpm build                 # Build
pnpm add <package>         # Add dependency
```
Never use `npm` or `yarn`. Always `pnpm`.

## Code Quality

**Python**
- Linter/formatter: `ruff` (not black, not flake8)
- Type hints: yes, check with `pyright`
- Testing: `pytest`
- Config: `pyproject.toml` with hatchling build backend

```bash
ruff check .               # Lint
ruff format .              # Format
uv run pytest              # Test
```

**JavaScript/TypeScript**
- Formatter: `prettier`
- Node version: pinned via volta in package.json

## Deployment (stl-infra)

All STL projects use `ops.py` powered by `stl-infra`:

```bash
uv run ops provision       # Create server + initial setup
uv run ops deploy [target] # Deploy application
uv run ops deploy --all    # Deploy all targets
uv run ops infra plan      # Terraform plan
uv run ops infra apply     # Terraform apply
uv run ops configure       # Run Ansible configure
uv run ops status          # Health check
```

## Infrastructure Stack

- **Cloud**: Hetzner Cloud (servers)
- **DNS**: Cloudflare
- **IaC**: Terraform + Ansible
- **Monitoring**: BetterStack
- **Secrets**: `.env` file (NEVER commit)

## Path Conventions

```
/run/<app>/<app>.sock      # Unix socket (not ports)
/opt/<app>/                # Application directory
/var/log/<app>/            # Logs
/var/www/<app>/            # Web root (static sites)
```

## Git Practices

- Commit messages: concise, imperative mood
- Use conventional commits when appropriate (feat:, fix:, etc.)
- PR descriptions: include context and test plan

## Key Rules

1. **Read project CLAUDE.md first** - it has project-specific context
2. **Never use pip/npm** - always uv/pnpm
3. **Secrets in .env** - never hardcode, never commit
4. **Infrastructure via ops.py** - don't manually SSH and edit
5. **Unix sockets** - not ports, for local services
