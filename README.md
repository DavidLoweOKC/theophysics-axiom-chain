# Theophysics Axiom Chain

This repository contains the canonical Axiom Chain source and the tools used to reconcile and sequence its dependency structure.

The project tests the internal precision of the framework. Formal checks evaluate whether declared conclusions follow from declared premises; they do not make God's reality depend on the success of any particular human formulation.

## Canonical sources

- `docs/canonical/AXIOM_CHAIN_MASTER_v3.md` — active master
- `docs/canonical/AXIOMS_CANONICAL_ONLY.md` — canonical-only compilation
- `docs/canonical/AXIOM_CHAIN_CANONICAL_WORKBOOK.xlsx` — synchronized Lean ledger workbook
- `docs/canonical/COUNT_RECONCILIATION_2026-08-22.md` — open 198-versus-191 count audit
- `docs/canonical/AXIOM_CHAIN_MASTER_v2.2.md` — preserved prior version

## Tools

- `tools/build_dependency_reconciliation.py`
- `tools/build_sequential_axioms.ps1`
- `lean/EpistemicFirewall.lean` — executable claim-kind firewall for the one-root architecture
- `lean/T3GraceSemantics.lean` — BC2 countermodel and strengthened external-restorer theorem

## Epistemic firewall

The Lean firewall keeps the principal lanes distinct: root, disclosure,
definition, strict derivation, bridge, convergence, identification, empirical,
and open problem. Its regression checks reject disclosure or convergence as a
strict premise, reject open claims as proof support, and reject reverse flow
from convergence into A0.

## Current audit status

The canon lock is open. Lean 4.33.0 validates the one-root structure,
endpoints, and acyclicity, but the weakest-premise gate rejects
`A2.2 → T3.1`. The unresolved strict claims are `T3.1` and `BC2`.
The BC2 semantic module proves that the current T3 premises are insufficient,
then proves the weaker external-restorer conclusion once causal exhaustiveness
is supplied. Identifying that restorer as Grace remains an explicit bridge.

## Preservation boundary

The Obsidian vault remains the working environment and canonical human-readable source. This repository is a clean publication and formal-testing surface. Generated API reviews, local plugin state, media, and unrelated vault material are intentionally excluded.
