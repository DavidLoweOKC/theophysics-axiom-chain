# Count Reconciliation — 2026-08-22

## Result

The count gate is open. The currently reproducible sources do not support a
claim that all 198 master entries have been enumerated in Lean.

| Artifact | Count | Meaning |
|---|---:|---|
| `AXIOMS_PART1_MODE_CLASSIFICATION.md` | 192 | 191 kept rows plus one `DROP_DUPLICATE` row |
| `AXIOMS_CANONICAL_ONLY.md` | 191 | Enumerable kept source records |
| `CanonicalGraph.lean` | 192 | Synthetic `A0` plus 191 source records |
| `AXIOM CHAIN MASTER v3.md` | 198 declared | Narrative summary; not an enumerable 198-row registry |

## Explicitly identifiable v3 changes absent from the 191-row assembly

- `A1.0` is added.
- `T3.2` is added.
- `BC4` is replaced by `BC4a` and `BC4b` (net one additional record).
- The duplicate row is deliberately absent from the canonical-only assembly.

These facts explain part, but not all, of the declared difference. The master
does not provide a unique 198-row ledger from which the remaining delta can be
named without inference. No missing IDs are invented here.

## Lock condition

Canon lock requires either an authoritative 198-row registry with unique IDs,
or a corrected master count with written delta accounting. The generator must
then consume that registry directly and prove the resulting claim count.
