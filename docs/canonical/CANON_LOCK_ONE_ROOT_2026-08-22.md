# One-Root Canon Audit — 2026-08-22

## Status: STRUCTURAL GATE PASSES; VERSION SEAL PENDING

Lean 4.33.0 verifies the corrected graph projection from the per-entry v3 audit.

- Parsed audit rows: `191` (`SC-*` collapsed)
- Kept entries after six-scale expansion: `196`
- Formal claims: `197` (synthetic `A0` plus 196 kept entries)
- Typed declared edges: `262`
- `AX_CORE / AX_DERIVED / AX_SCAFFOLD / FW_EXTENDED / HY_EVIDENCE`:
  `4 / 0 / 43 / 114 / 35`
- One designated graph root: pass (`A0 — God is`)
- All edge endpoints resolve: pass
- Entailment graph acyclic: pass
- Weakest-premise grade propagation: pass
- All strict claims trace to A0: pass
- BC6 strict descendants: `[]`
- `sorry` / `admit` / declared Lean `axiom`: none
- Printed theorem axiom dependencies: none

## Semantic boundary

The structural gate does not make BC2 a strict semantic theorem. The separate
Lean module verifies a countermodel to `T3.1 + T3.2 → external restorer` under
the current meanings. An external restorer follows only after adding causal
exhaustiveness. Identifying that restorer as Grace remains a theological bridge.

## Version boundary

No authoritative `VERSION_REGISTRY.yaml` was found in the canonical repository,
OPUS tree, Z tree, or bounded canon locations. The corrected active document
remains v3; it is not falsely stamped v2.3 or v3.1. Final version seal requires
locating or reconstructing the authoritative registry through an explicit
version ruling.
