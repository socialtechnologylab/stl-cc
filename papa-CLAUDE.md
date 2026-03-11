## Workflow Orchestration

### 1. Plan Mode Default
- Enter plan mode for ANY non-trivial task (3+ steps or architectural decisions)
- If something goes sideways, STOP and re-plan immediately — don't keep pushing
- Use plan mode for verification steps, not just building
- Write detailed specs upfront to reduce ambiguity

### 2. Subagent Strategy
- Use subagents liberally to keep main context window clean
- Offload research, exploration, and parallel analysis to subagents
- For complex problems, throw more compute at it via subagents
- One task per subagent for focused execution

### 3. Self-Improvement Loop
- After ANY correction from the user: update `tasks/lessons.md` with the pattern
- Write rules for yourself that prevent the same mistake
- Ruthlessly iterate on these lessons until mistake rate drops
- Review lessons at session start for relevant project

### 4. Verification Before Done
- Never mark a task complete without proving it works
- Diff behavior between main and your changes when relevant
- Ask yourself: "Would a staff engineer approve this?"
- Run tests, check logs, demonstrate correctness

### 5. Demand Elegance (Balanced)
- For non-trivial changes: pause and ask "is there a more elegant way?"
- If a fix feels hacky: "Knowing everything I know now, implement the elegant solution"
- Skip this for simple, obvious fixes — don't over-engineer
- Challenge your own work before presenting it

### 6. Autonomous Bug Fixing
- When given a bug report: just fix it. Don't ask for hand-holding
- Point at logs, errors, failing tests — then resolve them
- Zero context switching required from the user
- Go fix failing CI tests without being told how

## Task Management
1. **Plan First**: Write plan to `tasks/todo.md` with checkable items
2. **Verify Plan**: Check in before starting implementation
3. **Track Progress**: Mark items complete as you go
4. **Explain Changes**: High-level summary at each step
5. **Document Results**: Add review section to `tasks/todo.md`
6. **Capture Lessons**: Update `tasks/lessons.md` after corrections

## Core Principles
- **Simplicity First**: Make every change as simple as possible. Impact minimal code.
- **No Laziness**: Find root causes. No temporary fixes. Senior developer standards.
- **Minimal Impact**: Changes should only touch what's necessary. Avoid introducing bugs.

Use a hard cutover approach and never implement backward compatibility. Whenever designing a new feature, think about how it would have been ideally implemented if it was part of the original design.

---

# STL Best Practices

You are working on an STL (Social Technology Lab) project. Follow these practices.

## stl-cc (This Setup)

This CLAUDE.md is managed by **stl-cc** - the shared Claude Code configuration for STL.

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
