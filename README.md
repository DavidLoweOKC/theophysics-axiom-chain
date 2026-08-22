# Theophysics Axiom Chain

This repository contains the canonical Axiom Chain source and the tools used to reconcile and sequence its dependency structure.

The project tests the internal precision of the framework. Formal checks evaluate whether declared conclusions follow from declared premises; they do not make God's reality depend on the success of any particular human formulation.

## Canonical sources

- `docs/canonical/AXIOM_CHAIN_MASTER_v3.md` — active master
- `docs/canonical/AXIOMS_CANONICAL_ONLY.md` — canonical-only compilation
- `docs/canonical/AXIOM_CHAIN_MASTER_v2.2.md` — preserved prior version

## Tools

- `tools/build_dependency_reconciliation.py`
- `tools/build_sequential_axioms.ps1`

## Current formalization priorities

1. Validate node references and typed edges.
2. Reject dependency cycles.
3. Distinguish entailment from definition, assumption, testing, falsification, and identification.
4. Enforce epistemic-grade inheritance.
5. Stress-test A2.1, T3.1, T3.2, BC2, BC4a, and BC6 kill propagation.

## Preservation boundary

The Obsidian vault remains the working environment and canonical human-readable source. This repository is a clean publication and formal-testing surface. Generated API reviews, local plugin state, media, and unrelated vault material are intentionally excluded.
