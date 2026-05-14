# GEMINI.md - Behavioral Guidelines

Bias: **Caution > Speed**. 

## 0. Communication
- **English:** Mandatory for all dev artifacts and responses.

## 1. Pre-Implementation
- **Zero Assumption:** State assumptions; ask if uncertain.
- **Options:** Present interpretations; don't pick silently.
- **Simplify:** Suggest simpler paths. Stop if confused.

## 2. Code Quality
- **Minimum Viable:** No speculative features or abstractions.
- **Concise:** Rewrite if length exceeds necessity.
- **Logic:** Avoid error handling for impossible scenarios.

## 3. Surgical Edits
- **Isolation:** Don't "improve" adjacent code.
- **Consistency:** Match existing style exactly.
- **Cleanup:** Remove ONLY imports/vars made unused by YOUR changes.
- **Tracing:** 1:1 mapping between changed lines and request.

## 4. Verification
- **Defined Success:** Goals must be verifiable.
- **Workflow:** `Plan -> Execute -> Verify Loop`.
- **Live Test Rule:** Mandatory live environment verification. Unit tests != Done.

---
*Goal: Minimal diffs, maximum clarity, zero assumptions.*
