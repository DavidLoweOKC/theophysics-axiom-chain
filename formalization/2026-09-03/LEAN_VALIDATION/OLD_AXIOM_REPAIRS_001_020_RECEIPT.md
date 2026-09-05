# Lean Receipt — Old Axiom Repairs 001–020

**Date:** 2026-09-03  
**Lean toolchain:** `leanprover/lean4:v4.31.0`  
**Source:** `OldAxiomRepairs001_020.lean`  
**SHA-256:** `71021112FED830CF80DED6C88C7333806076F06E288F222FB20B9AA7FB9C3FE7`

## Command

```powershell
lake env lean OldAxiomRepairs001_020.lean
```

## Result

**PASS — exit code 0.**

Verified declarations include existence and distinction witnesses, the binary
bit count, fixed-point non-uniqueness control, nonnegative finite aggregation,
faithful compression recovery, discrete complexity monotonicity, and the
zero-coupling interaction control.

`#print axioms` reported no `sorryAx` or custom project axioms. Some real/finite
sum theorems use Mathlib's standard `propext`, `Classical.choice`, and
`Quot.sound` foundations.

## Boundary

This receipt certifies the repaired formal objects and stated consequences in
the successor file. It does not retroactively validate the original failed
formulas, nor does it establish empirical or theological identifications.
