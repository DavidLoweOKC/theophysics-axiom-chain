# Old Axiom Mathematical Audit 021-040

**Date:** 2026-09-03  
**Status:** `FORMAL REPAIR WORKING RECORD — NOT CANON ADMISSION`  
**Source:** `C:\theophysics\OPUS\AXIOMS\OLD AXIOM`  
**Lean successor:** `OldAxiomRepairs021_040.lean`

This audit evaluates one primary mathematical or structural statement per legacy record. It preserves the legacy sources and separates a typed definition, a conditional theorem, a physical interpretation, and a theological bridge.

| Seq | Legacy record | Ruling | Exact boundary / repair |
|---:|---|---|---|
| 021 | Master Coherence Equation | REPAIRED MODEL CORE | The continuum expression lacks a declared manifold, metric, measure, fields, regularity, and integrability assumptions. A typed finite functional preserves the algebraic integrand only. |
| 022 | Universal Coherence Definition | DEFINITION OWED | The file names a definition but supplies no mathematical definition. |
| 023 | Coherence Non-Negativity | CONDITIONAL / REPAIRED | An arbitrary real-valued functional may be negative. Nonnegativity follows if the codomain is `NNReal`, or from separately proved bounds on the functional. Lean retains both the countermodel and the repaired sufficient condition. |
| 024 | Coherence Conservation | CONDITIONAL | Conservation must name an evolution and a quantity invariant under it. Unitary evolution preserves specified quantum invariants; it does not automatically preserve every object called coherence. |
| 025 | Coherence Cannot Self-Increase | REPAIRED PREDICATE | Replaced an unrestricted physical necessity claim with a typed nonincrease predicate. Conservation entails nonincrease, but “requires external input” is not obtained from that order fact alone. |
| 026 | Meaningful Configuration Necessity | REPAIRED DEFINITION | Meaning versus nonmeaning requires an explicit classifier, score, or criterion. Lean defines the minimum discriminating structure; it does not choose the semantic criterion. |
| 027 | Parsimony | MODEL/SELECTION PRINCIPLE | “Nature prefers” is not a mathematical proposition until alternatives and a cost functional are declared. Lean defines cost minimality and shows minimality alone need not select uniquely. |
| 028 | Algorithmic Depth | DEFINITION OWED | Requires a computational model, significance parameter, and runtime-based depth definition. “Output complexity relative to input” is insufficient. |
| 029 | Kolmogorov Complexity | REPAIRED DEFINITION SCHEMA | Requires a fixed universal machine/program model. Lean supplies the shortest-program predicate; no computability claim is smuggled in. |
| 030 | Compression Ratio | REPAIRED DEFINITION | Division requires a nonzero source length. The ratio is a chosen normalized complexity measure, not automatically the ordinary engineering compression ratio. |
| 031 | Complexity Decrease Under Chi | CONDITIONAL MODEL | The differential equation is a proposed dynamics, not derived here. Its algebraic rate is nonpositive only when `alpha ≥ 0` and `chi ≥ 0`; Lean supplies a negative control when the sign condition is removed. |
| 032 | Laws Are Low-K Descriptions | RECLASSIFY AS EMPIRICAL/MODEL CLAIM | “Low” is relative to a language, encoding, comparison set, and threshold. Lean defines the predicate; history of physics must supply evidence. |
| 033 | Action Principle As Minimal-K | BRIDGE OWED | Least action and least description length optimize different declared functionals. Their minimizers coincide only under an explicit bridge; Lean makes that bridge a visible proposition. |
| 034 | Universe As Compression Algorithm | HELD OPEN | No algorithm, input/output types, operational semantics, or equivalence to GR/QM is supplied. This remains a framework interpretation, not a theorem. |
| 035 | Observation Requirement | PHILOSOPHICAL/EMPIRICAL BRIDGE | “Phenomenal appearance” is not forced by bare quantum formalism. Lean can type outcome attribution through a record function but cannot establish phenomenal consciousness from it. |
| 036 | Participatory Universe | REPAIRED FRAMEWORK SCHEMA | Participation can be typed as an observer-indexed actualization map. Physical instantiation and interpretation exclusivity remain unproved. |
| 037 | Observer Definition | REPAIRED DEFINITION | An observer that registers distinctions is modeled by a nonconstant registration map. This does not entail consciousness. |
| 038 | Integrated Information Phi | REPAIRED TYPE / IDENTIFICATION OPEN | A nonnegative capacity measure is typed. Identifying it with IIT Phi or general observer capacity requires an independent definition and evidence. |
| 039 | Witness Field Operator | REPAIRED TYPE / PHYSICS OPEN | `Potential → Actualized` is a well-typed operator signature. It does not establish a linear operator, Hilbert-space map, measurement mechanism, or witness field. |
| 040 | Phi Admits Degrees | REPAIRED PROPERTY / NUMBERS UNSUPPORTED | “Admits degrees” means at least two systems receive strictly ordered values. Lean shows a constant measure fails. The electron/bacterium/mouse/human numbers are not established by this property. |

## Tranche ruling

- Typed or minimally repaired cores suitable for Lean: **16** (`021`, `023`-`027`, `029`-`033`, `035`-`040`).
- Definition still owed: **2** (`022`, `028`).
- Held as unresolved physical/framework claims: **2** (`034`, plus the physical necessity portion of `035`).
- Original legacy files changed: **0**.

“Lean-checkable core” means the repaired mathematical object is well typed and its displayed conditional results compile. It does not mean Lean verified the physical, conscious, or theological interpretation.
