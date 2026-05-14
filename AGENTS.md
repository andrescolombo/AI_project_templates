# AGENTS.md - {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Non-Negotiable Principles

1. **Security & Integrity.** {{SECURITY_PRINCIPLES}}
2. **Source of Truth.** {{SOURCE_OF_TRUTH_DESCRIPTION}} (e.g., Markdown is the human source of truth, DB is technical state).
3. **API Boundaries.** {{API_BOUNDARY_RULES}} (e.g., Tools must not write directly to storage; use the provided API).
4. **Path Safety.** Always validate paths and avoid manual concatenation.
5. **Parameterized Operations.** Never use manual interpolation for queries or commands.

## Language Policy

- **Internal Communication:** Use English by default for code, comments, implementation notes, and agent-facing documentation.
- **User-facing Content:** Preserve the user's preferred language (e.g., {{USER_LANGUAGE}}). Do not translate user memories or quoted text unless explicitly asked.
- **Design for Multilingualism:** Avoid hardcoding language-specific assumptions in schemas or contracts.

## Code Conventions

- Use type hints and structured models (e.g., Pydantic).
- Log context explicitly; avoid silent failures (`except Exception: pass`).
- Use standard logging for services; reserve `print()` for CLI output.
- Never log secrets, tokens, or environment variables.
- Maintain a `.env.example` file for all required configuration.

## Before Changing

- Review `TASK.md` as the current operational tracker.
- **The "Live Test" Rule:** Only mark a task as done `[x]` if it has been verified in the live environment (or a high-fidelity simulation). Unit tests alone are not enough for a "Done" status.
- If changes touch API contracts, update all related tests, documentation, and client integrations.

## Tests

- Tests should live in `tests/` and use isolated fixtures.
- Common commands:
```bash
{{TEST_COMMANDS_LIST}}
```

## Docker & Deployment

- {{DOCKER_DEPLOYMENT_RULES}}
- Prefer pinned versions for base images.
- Default internal hosts to localhost/127.0.0.1 unless external access is required.

## Do Not Do Without Confirmation

- Destructive actions (deleting data, renaming core files).
- Schema changes in production-ready databases.
- Bulk imports from external sources.
- Merging or closing ambiguous items without user validation.

## Working Style

- Maintain a concise, engineering-focused tone.
- At the end of every turn: summarize what changed, what was verified, and what remains pending.
- State tradeoffs before implementing complex decisions.
- Keep commits small and push functional milestones.
