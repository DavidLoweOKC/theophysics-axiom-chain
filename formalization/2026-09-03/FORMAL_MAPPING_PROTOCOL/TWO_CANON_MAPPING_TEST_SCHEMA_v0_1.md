# Two-Canon Mapping Test Schema v0.1

**Status:** `NEUTRAL TEST PROTOCOL — NO PAIRINGS ASSIGNED`  
**Date:** 2026-09-03

This protocol governs the later comparison of a repaired Axiom Canon with an independently formalized Spiritual Canon. It grants no preferred mapping and permits `NO_RELATION` as a successful result.

## Stage A — Axiom object

Each axiom-side object must print:

- stable ID and name;
- native type/signature;
- strongest mathematical statement;
- exact assumptions;
- dependency and edge types;
- invariants;
- failure condition;
- ablation result;
- countermodel status;
- Lean/Z3 receipt or `FORMALIZATION_OWED`;
- maximum defensible wording.

No theological identification belongs in this stage.

## Stage B — Spiritual object

Each spiritual-side object must independently print:

- stable ID and name;
- theological meaning and warrant;
- proposed mathematical carrier;
- native dependencies;
- invariants;
- anti-state or corruption mode;
- restoration behavior;
- ablation result;
- rival formalizations;
- maximum defensible wording.

No axiom pairing belongs in this stage.

## Stage C — Candidate mapping

For each candidate map `f : A → S`, record:

1. intended map;
2. inverse candidate, if any;
3. preserved relations;
4. lost relations;
5. structure introduced by translation;
6. type compatibility;
7. composition behavior;
8. dependency preservation in both directions;
9. invariant preservation;
10. ablation behavior;
11. countermodels;
12. nearby plausible wrong mappings;
13. randomized/permuted controls;
14. score margin over the strongest rival.

## Result classes

- `NO_RELATION` — no nontrivial structure survives.
- `COMPATIBLE` — objects coexist without contradiction, but no informative preservation is established.
- `ANALOGY` — a limited likeness illuminates one side without a structure-preserving equivalence.
- `STRUCTURAL_CORRESPONDENCE` — specified nontrivial relations are preserved over a declared substructure.
- `FORMAL_ISOMORPHISM` — independently defined structures admit a bijection and inverse preserving every relation and operation in the declared signature.

`FORMAL_ISOMORPHISM` always names its signature and scope. It never automatically establishes physical identity, theological identity, causal identity, or empirical truth.

## Discrimination rule

Let `score(M)` be the preregistered structural score for mapping `M`. Report:

```text
delta = score(intended mapping) - score(strongest rival)
```

A high intended score with a small `delta` is nondiscriminatory. Missing or post-hoc rivals invalidate a uniqueness claim.

## Stop rules

Stop and assign `NO_RELATION`, `COMPATIBLE`, or `FORMALIZATION_OWED` when:

- either side lacks an independent definition;
- the mapping depends on shared labels alone;
- a required inverse cannot be defined;
- a load-bearing relation fails preservation;
- an ablation leaves the claimed structure unchanged;
- a rival mapping performs equally well;
- the desired conclusion was inserted as an assumption;
- the translation adds the very structure it claims to discover.

## Governance

Z3 searches for finite countermodels and consistency failures. Lean checks displayed formal consequences. Neither tool assigns theological meaning or canon status. Human interpretation occurs only after the native definitions, tests, controls, and receipts are frozen.
