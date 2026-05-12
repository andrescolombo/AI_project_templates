# Insights from Architecture Review (Lumi)

This document captures the key architectural decisions and insights discussed during the review of the Lumi repository (Conversation `84157408-e1db-4fc3-a49a-932ea28ce94c`).

## 1. The "Human Source of Truth" Pattern
- **Decision**: Markdown is the primary, human-readable source of truth.
- **Rationale**: Future-proofs data, avoids lock-in, and allows manual editing/reviewing when needed.
- **Implementation**: Databases (SQLite, Qdrant) are treated as derived indexes or technical state, not the origin.

## 2. API-First Security Boundary
- **Decision**: All integrations (Telegram, OpenClaw) must communicate via a central Memory API.
- **Rationale**: Centralizes validation, multitenancy enforcement (`tenant_id`), and path safety checks. Prevents "bridge scripts" or "agents" from having raw filesystem access to the vault.

## 3. Strict Multitenancy
- **Decision**: `tenant_id` is mandatory for all data operations.
- **Rationale**: Ensures scalability and data isolation from the ground up, even for personal projects.

## 4. Intent-First Routing
- **Decision**: Use a dedicated `action-parser` (heuristic + LLM fallback) before executing any command.
- **Rationale**: Prevents AI hallucination during tool calling and ensures that natural language is correctly mapped to a constrained set of valid system actions.

## 5. Conflict Detection in Instructions
- **Decision**: Idempotent installers for AI instructions (`AGENTS.md`) should include hash-based conflict detection.
- **Rationale**: Prevents the automation from overwriting manual improvements made by the user, forcing a `--force` or manual merge when divergence occurs.

## 6. The "Live Test" Rule
- **Insight**: Unit tests are necessary but insufficient for marking a task as "Done" in an operational tracker.
- **Policy**: Verification must occur in the live environment (e.g., real Telegram interaction) to ensure the full stack is functioning.
