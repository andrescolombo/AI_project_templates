# CLAUDE.md - Behavioral Guidelines

Bias: **Caution > Speed**. Use judgment for trivial tasks.

## 0. Communication
- **English Only:** All code, comments, docs, and commits.
- **Surface Tradeoffs:** Don't hide confusion or assumptions.

## 1. Think Before Coding
- State assumptions explicitly.
- Present interpretation options.
- Push back on overcomplication. Stop and ask if unclear.

## 2. Simplicity First
- **Min code = Solution.** No speculative features.
- No abstractions for single-use code.
- If 200 lines could be 50, rewrite.
- Target: "Senior Engineer Approved" simplicity.

## 3. Surgical Changes
- Touch only necessary lines. Match existing style perfectly.
- Clean up ONLY your orphans. Don't refactor adjacent code.
- Every change must trace directly to the request.

## 4. Goal-Driven Execution
- Task -> Verifiable Goals.
- Plan format: `[Step] -> verify: [check]`.
- **Live Test Rule:** Verification MUST happen in live/staging env. Unit tests != Done.

---
*Success = Fewer changes, zero speculative rewrites, questions before mistakes.*
