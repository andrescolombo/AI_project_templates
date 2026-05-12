# AI Project Templates

A compendium of normalized templates and guidelines for initializing and maintaining AI-assisted coding projects. These are based on the successful patterns established in the **Lumi** project.

## Templates

1.  **`AGENTS.md.template`**: Core project principles, security rules, and code conventions.
2.  **`CLAUDE.md.template`**: Behavioral guidelines for Claude Code and general agentic work.
3.  **`GEMINI.md.template`**: Behavioral guidelines for Gemini-based tools.
4.  **`CURSORRULES.template`**: Configuration for Cursor `.mdc` rules or `.cursorrules`.
5.  **`HANDOVER.md.template`**: Standard format for transferring context between AI sessions.
6.  **`HANDOVER_TASK.md.template`**: The prompt to give an AI when you want it to generate a handover.

## Key Concepts

### Graphify Integration
Every project should use `graphify` to maintain a knowledge graph of the codebase.
- **Setup**: `graphify install --platform <platform>`
- **Workflow**: `graphify update .` after code changes; read `graphify-out/GRAPH_REPORT.md` for architectural context.

### The Live Test Rule
Never mark a task as done based solely on unit tests. Functional verification in the live environment (or a high-fidelity staging setup) is mandatory for operational integrity.

### API Boundaries
Encapsulate storage and sensitive operations behind a central API to prevent AI agents from performing unsafe direct writes or path traversal.

## File Placement & Usage

| Template File | Project File | Location | Purpose |
|---|---|---|---|
| `AGENTS.md.template` | `AGENTS.md` | Repo Root `/` | Core principles, tech stack, and safety rules. |
| `CLAUDE.md.template` | `CLAUDE.md` | Repo Root `/` | Behavioral guidelines for Claude Code. |
| `GEMINI.md.template` | `GEMINI.md` | Repo Root `/` | Behavioral guidelines for Gemini tools. |
| `CURSORRULES.template` | `project.mdc` | `.cursor/rules/` | Project-specific rules for Cursor AI. |
| `HANDOVER.md.template` | `HANDOVER.md` | Repo Root `/` | Context transfer between AI sessions. |
| `HANDOVER_TASK.md.template` | N/A | Anywhere | Copy-paste this prompt to ask the AI for a handover. |

---

## Tool-Specific Setup

### 1. Antigravity (Advanced Agentic Coding)
Antigravity is highly agentic and uses specialized workflows.
- **Setup**: 
  1. Rename `AGENTS.md.template` -> `AGENTS.md`.
  2. Run `graphify antigravity install`.
  3. This will create `.agents/rules` and `.agents/workflows`.
- **Usage**: Antigravity automatically detects the `.agents/` directory and uses the rules therein to guide its planning and execution phases.

### 2. Cursor + Claude Extension (IDE)
Cursor uses `.mdc` files for specific rules.
- **Setup**:
  1. Create the directory `.cursor/rules/` if it doesn't exist.
  2. Rename `CURSORRULES.template` -> `.cursor/rules/project.mdc`.
  3. Customize the `description` in the frontmatter so Cursor knows when to trigger it.
- **Integration**: Cursor will automatically index `AGENTS.md` and `HANDOVER.md` if they are in the root. Use `@AGENTS.md` in the chat to provide context.

### 3. Cursor and Codex (Bridge)
When using Cursor with a bridge tool like Codex/OpenCode:
- **Setup**:
  1. Rename `AGENTS.md.template` -> `AGENTS.md`.
  2. In your Codex config, point the "System Prompt" or "Context Files" to `AGENTS.md`.
  3. Use the `.cursorrules` (legacy) or `.mdc` files to reinforce that Codex is the primary execution engine.

### 4. Claude Code (Terminal)
Claude Code looks specifically for `CLAUDE.md`.
- **Setup**:
  1. Rename `GUIDELINES.md.template` -> `CLAUDE.md`.
  2. Run `graphify claude install` to add the graphify hook to `CLAUDE.md`.
- **Usage**: Claude Code reads `CLAUDE.md` on every startup and before using tools. It uses this for coding style and verification rules (e.g., the "Live Test" rule).

### 5. Codex / OpenClaw / OpenCode (Terminal)
These tools often rely on a central "Instructions" file.
- **Setup**:
  1. Rename `AGENTS.md.template` -> `AGENTS.md`.
  2. Run `graphify codex install` (or `claw install`).
  3. This appends graphify context to `AGENTS.md`.
- **Usage**: When starting a session, tell the agent: "Read AGENTS.md for our core principles and architecture."

---

## Initialization Workflow
1. **Initialize Repo**: `git init`.
2. **Copy Templates**: Copy all `.template` files to the root.
3. **Customize**: Replace `{{PLACEHOLDERS}}` in all files.
4. **Rename**: Remove `.template` extensions and move files to locations specified in the table above.
5. **Graphify**: Run `graphify install --platform <your-tools>` to wire up the knowledge graph.
6. **Tasking**: Create `TASK.md` and `Lumi_Arquitectura_y_Decisiones.md` (or equivalent) for tracking.
