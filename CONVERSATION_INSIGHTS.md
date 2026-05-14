# Architectural Insights (Lumi)

Ref: Conv `84157408-e1db-4fc3-a49a-932ea28ce94c`.

## 1. Human Source of Truth
- **Pattern:** Markdown = Origin. DB/Indexes = Derived state.
- **Why:** Future-proof, no lock-in, human-editable.

## 2. Security Boundary
- **Pattern:** API-First. All integrations use central Memory API.
- **Why:** Central validation, multitenancy (`tenant_id`), path safety. No raw FS access for agents.

## 3. Strict Multitenancy
- **Pattern:** `tenant_id` mandatory for ALL operations.
- **Why:** Isolation & scalability by design.

## 4. Intent-First Routing
- **Pattern:** Heuristic + LLM action-parser before execution.
- **Why:** Prevents tool-call hallucinations; maps NL to system constraints.

## 5. Conflict Detection
- **Pattern:** Hash-based check for AI instruction installers.
- **Why:** Prevents automation from overwriting manual improvements.

## 6. Live Test Rule
- **Pattern:** Unit Tests != Done. 
- **Policy:** Mandatory verification in live environment (e.g., real API interaction).
