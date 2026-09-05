# Accountability Boundary Gauntlet — Audit

**Date:** 2026-09-03  
**Lean source:** `AccountabilityBoundaryGauntlet.lean`  
**Compile receipt:** `AccountabilityBoundaryGauntlet.compile.txt`  
**Result:** PASS (`lake env lean AccountabilityBoundaryGauntlet.lean`, exit code 0)

## Question tested

Can physical record formation, awareness, or chronological age independently establish moral accountability?

## Declared model

The model treats accountability as requiring five distinct predicates:

1. awareness;
2. understanding of the relevant norm;
3. a meaningful alternative;
4. relevant control;
5. correct attribution of the event to the agent.

These are model assumptions, not discoveries made by Lean. Lean tests their consequences and exposes which conclusions fail when they are absent.

## Verified results

- The full declared capacity profile satisfies the accountability predicate.
- Removing any one of the five declared capacities defeats accountability.
- A physical record can exist while accountability fails.
- Awareness can be present while accountability fails.
- Equal chronological age is compatible with different accountability status.
- Different chronological ages are compatible with the same accountability status.
- The same physical event can receive opposite moral classifications when different moral readers are supplied.

## Ruling

The physical layer can preserve occurrence, identity, time, and trace. It cannot, by itself, supply norm understanding, meaningful alternatives, control, moral valence, or final theological status.

The result supports a capacity-triggered accountability boundary as a coherent formal model and rejects age-alone, record-alone, and awareness-alone sufficiency. It does **not** establish which human capacities God uses, when they emerge, whether consciousness causes quantum outcomes, or whether physical traces are the biblical books.

## Strongest bridge presently allowed

`physical event + attributable record + accountable capacity + independent moral standard → morally assessable recorded act`

The theological identification of divine judgment or the books of record remains a separately argued bridge.

## Process note

The first compile exposed a missing decidability mechanism in proof automation. The proofs were rewritten as transparent reductions; the second compile passed. The receipt retains the compiler's axiom report. Several `simp` proofs report Lean's standard `propext`; no theorem contains `sorryAx` after the successful compile.
