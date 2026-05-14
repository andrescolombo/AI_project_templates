# AI Project Templates 🤖🚀

A professional suite of normalized templates and guidelines for initializing and maintaining AI-assisted coding projects. These templates are designed to provide consistent context, security rules, and behavioral guidelines across different AI agents (Claude, Gemini, Cursor, etc.).

## 📂 Repository Structure

- Root Directory: Contains the core template files and setup script.
- `setup-ai-templates.ps1`: A PowerShell script to quickly link or copy templates into a new project.
- `LICENSE`: MIT License.

## 📄 Templates Included

| Template | Purpose | Target Agent |
| :--- | :--- | :--- |
| **`AGENTS.md`** | Core principles, tech stack, and security rules. | All Agents |
| **`CLAUDE.md`** | Behavioral guidelines and project-specific instructions. | Claude Code / Desktop |
| **`GEMINI.md`** | Guidelines tailored for Gemini-based tools. | Gemini Pro / Advanced |
| **`CURSORRULES`** | Rules for Cursor IDE (`.cursorrules` or `.mdc`). | Cursor |
| **`HANDOVER.md`** | Standard format for context transfer between sessions. | Human / AI |
| **`HANDOVER_TASK.md`** | Prompt to generate a structured handover report. | All Agents |
| **`CONVERSATION_INSIGHTS.md`** | Logs key architectural decisions and insights. | All Agents |

## 🚀 Getting Started

### 1. Clone the repository
```bash
git clone https://github.com/andrescolombo/AI_project_templates.git D:\Desarrollo\.ai-templates
```

### 2. Initialize a new project
Navigate to your new project directory and run the setup script:

**Windows (Symlink - requires Admin):**
```powershell
& "D:\Desarrollo\.ai-templates\setup-ai-templates.ps1"
```

**Windows (Copy - no Admin required):**
```powershell
& "D:\Desarrollo\.ai-templates\setup-ai-templates.ps1" -Copy
```

**Linux/macOS:**
```bash
pwsh ~/Desarrollo/.ai-templates/setup-ai-templates.ps1
```

## 🛠️ Integration Workflows

### Antigravity & Advanced Agents
Antigravity automatically detects `AGENTS.md` and `HANDOVER.md` in the root. It uses these to guide planning and maintain state across turns.

### Claude Code
Claude Code looks for `CLAUDE.md`. This repo's template includes the **"Live Test Rule"**, ensuring no task is marked done without functional verification.

### Cursor IDE
Copy or link `CURSORRULES` to `.cursorrules` in your project root. For the newer `.mdc` format, place rules in `.cursor/rules/`.

## 🧠 Key Principles

1.  **Source of Truth**: Maintain markdown files as the human-readable source of truth for project state.
2.  **Live Test Rule**: Functional verification is mandatory. Unit tests are necessary but not sufficient.
3.  **API Boundaries**: Never allow AI agents to perform direct unsafe writes; use abstraction layers.
4.  **Context Hygiene**: Use `HANDOVER.md` to keep sessions clean and focused.

---

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request or open an issue for new template ideas or improvements.

## ⚖️ License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
