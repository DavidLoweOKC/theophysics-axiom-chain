# One-Root Canon Lock — 2026-08-22

## Locked result

The canonical projection passes the Lean 4 one-root epistemic firewall.

- Governing root: `A0 — God is`
- Canonical source records: `191`
- Formal claims: `192` (`A0` plus 191 records)
- Typed edges: `300`
- Unrooted strict claims: `[]`
- Lean: `4.31.0`
- Compile exit: `0`
- `sorry` / `admit` / declared `axiom` / `opaque`: none
- Printed theorem axiom dependencies: none

## Conservative one-root ruling

The source assembly retained five legacy multi-root classifications. The formal projection preserves their records but classifies them as candidate bridges rather than independent strict axioms:

- `A5.1`
- `BC4`
- `BC6`
- `BC7`
- `BC8`

No claim was deleted, admitted, or promoted by this ruling.

## Gates passed

1. Exactly one root exists and it is `A0`.
2. Every typed edge endpoint exists.
3. The entailment subgraph is acyclic.
4. Every strict derivation has an A0 path.
5. Disclosures, bridges, convergence claims, evidence, and open problems cannot masquerade as strict premises.
6. Candidate-to-candidate support is recordable without automatic admission.
7. The combined `canonReady` executable gate evaluates to `true`.

## Reproduction

```powershell
& .\tools\generate_canonical_lean_graph.ps1
Set-Location .\lean
lean -o EpistemicFirewall.olean .\EpistemicFirewall.lean
$env:LEAN_PATH = (Get-Location).Path
lean .\CanonicalGraph.lean
```

The machine-readable hashes and validation result are recorded in `CANON_LOCK_ONE_ROOT_2026-08-22.json`.

## Boundary

This lock certifies the graph architecture, typed epistemic lanes, source provenance, and executable Lean invariants. Candidate claims remain candidates. The lock does not transform theological disclosures, empirical claims, bridges, identifications, or model results into strict proofs.
