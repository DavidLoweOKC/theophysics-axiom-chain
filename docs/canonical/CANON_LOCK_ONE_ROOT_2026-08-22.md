# One-Root Canon Audit — 2026-08-22

## Status: OPEN

The earlier lock result is revoked. It certified structural checks before the
weakest-premise grade rule was implemented.

## Reproduced result

- Lean: `4.33.0`
- Source records: `191`
- Formal graph claims: `192` (`A0` plus 191 source records)
- Typed edges: `300`
- Logical axiom dependencies printed by Lean: none
- `sorry` / `admit` / declared Lean `axiom`: none
- One designated graph root: pass (`A0 — God is`)
- Endpoints: pass
- Entailment acyclicity: pass
- Grade propagation: **fail as expected**
- Rejected grade edge: `A2.2 → T3.1`
- Unresolved strict claims: `T3.1`, `BC2`
- BC6 strict descendants under propagating dependency edges: `[]`
- Semantic `T3.1 + T3.2 → external restorer`: refuted by countermodel
- External restorer with causal exhaustiveness: proved
- External restorer = Grace: explicit bridge premise required
- Count reconciliation: open (`198` declared versus `191` enumerable records)

## BC6 ceiling ruling

BC6 remains framework-grade. The current projection contains no strict-derived
descendant of BC6 across entailment, definition, assumption, or identification
edges. Its downstream theology, soul, moral, eschatology, and unification lanes
therefore remain framework/candidate material rather than inherited strict
proofs.

## Lock conditions

The lock may close only after the grade edge, BC2 semantics/classification, and
record-count discrepancy are repaired and the full suite recompiles with the
grade gate returning true. Until then, Lean certifies detection of the open
gates—not passage of the full axiom chain.
