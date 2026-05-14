# AGENTS.md - {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Core Principles
1. **Security & Integrity:** {{SECURITY_PRINCIPLES}}
2. **Source of Truth:** Markdown = Human truth. DB = Technical state.
3. **API Boundaries:** No direct storage/OS writes. Use provided API.
4. **Path Safety:** Validate all paths. No manual concatenation.
5. **Parameterized Ops:** No manual interpolation for queries/commands.

## Policy
- **Language:** English for code, comments, and docs. Preserve user language for UI: {{USER_LANGUAGE}}.
- **Code:** Type hints + Pydantic. Explicit logging. No silent failures.
- **Secrets:** NEVER log secrets, tokens, or env vars.
- **Config:** Maintain `.env.example`.

## Execution Workflow
- **Status:** Review `TASK.md` before starting.
- **Live Test Rule:** Done `[x]` = Verified in live/simulated environment. Unit tests != Done.
- **Contracts:** Update tests/docs/clients if API changes.

## Environment
- **Tests:** `tests/` with isolated fixtures. CMD: `{{TEST_COMMANDS_LIST}}`
- **Docker:** Pin base images. Internal hosts = `127.0.0.1` unless external required.

## Restricted Actions (Confirm First)
- Deleting data/renaming core files.
- DB schema changes in prod.
- Bulk imports.
- Merging ambiguous items.

## Style
- Concise, engineering-focused tone.
- Turn End: Summary of changes, verification, and pending items.
- State tradeoffs before implementation.
- Small, functional commits.
