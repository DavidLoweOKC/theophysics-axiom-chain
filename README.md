# Theophysics Axiom Chain

This repository contains the canonical Axiom Chain source and the tools used to reconcile and sequence its dependency structure.

The project tests the internal precision of the framework. Formal checks evaluate whether declared conclusions follow from declared premises; they do not make God's reality depend on the success of any particular human formulation.

## Canonical sources

- `docs/canonical/AXIOM_CHAIN_MASTER_v3.md` — active master
- `docs/canonical/AXIOMS_CANONICAL_ONLY.md` — preserved 2026-08-20 source assembly; its embedded registry grades are historical, not the current v3 audit rulings
- `docs/canonical/AXIOM_CHAIN_CANONICAL_WORKBOOK.xlsx` — synchronized Lean ledger workbook
- `docs/canonical/COUNT_RECONCILIATION_2026-08-22.md` — resolved count reconciliation
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

The corrected structural gate passes on Lean 4.33.0: 197 formal claims, 262
declared typed edges, one designated root, resolved endpoints, acyclic
entailment, and weakest-premise propagation. `AX_DERIVED` remains a live grade
with zero current members; T3.1, BC2, BC7, and BC8 are framework-grade. The BC2
semantic module proves that the current T3 premises are insufficient, then
proves the weaker external-restorer conclusion once causal exhaustiveness is
supplied. Identifying that restorer as Grace remains an explicit bridge. Final
version seal is pending because no authoritative `VERSION_REGISTRY.yaml` was
located.

## Preservation boundary

The Obsidian vault remains the working environment and canonical human-readable source. This repository is a clean publication and formal-testing surface. Generated API reviews, local plugin state, media, and unrelated vault material are intentionally excluded.
