# Old Axiom Mathematical Audit — 001–020

**Scope:** Mathematical formulations only. Theology, empirical truth, and
cross-domain identifications are excluded from these rulings.

## Verdict meanings

- **PASS:** correct as written for its declared mathematical role.
- **CONDITIONAL:** coherent after explicit domain/type/regularity assumptions.
- **FAIL AS WRITTEN:** a stated property is false, ill-typed, or the formula
  does not establish the advertised conclusion.
- **NO FORMULATION:** no primary mathematical formulation is present to test.

## Tranche ledger

| # | Axiom | Kind | Mathematical verdict | Core reason |
|---:|---|---|---|---|
| 001 | A1.1 Existence | Axiom | NO FORMULATION | “Something exists” is a logical axiom; no mathematical object is supplied. |
| 002 | A1.2 Distinction | Axiom | CONDITIONAL | Shannon entropy is valid for a probability distribution, but `H(X)=0 iff |X|=1` is false when zero-probability states remain in the declared state space. The correct condition is a degenerate distribution/support of size one. |
| 003 | A1.3 Information Primacy | Axiom | FAIL AS WRITTEN | `It = ∮ Bit^n dΩ` has no defined types, measure, integrand, units, or mathematical meaning for `It` and `Bit`. |
| 004 | D1.1 Information Definition | Definition | NO FORMULATION | The legacy file contains metadata/images but no primary mathematical definition. |
| 005 | D1.2 Bit Definition | Definition | PASS | `log₂(2)=1` is correct; one binary equiprobable choice carries one bit. |
| 006 | LN1.1 Matter–Energy Derivative | Claimed necessity | FAIL AS WRITTEN | `A1.3 ⇒ LN1.1` is a dependency label, not a formal implication with defined propositions or a derivation. |
| 007 | LN1.2 It From Bit | Claimed necessity | NO FORMULATION | A prose supervenience claim is present, but no primary mathematical formulation is supplied. |
| 008 | A2.1 Substrate Requirement | Axiom | CONDITIONAL | The normalized implication is satisfiable and type-correct as an explicit requirement. Information existence alone does not derive it. The displayed formula also omits the stated retrievability and dynamics requirements. |
| 009 | A2.2 Self-Grounding | Axiom | CONDITIONAL | `χ(χ)=χ` is a coherent fixed-point condition after typing `χ`, but it neither proves existence/uniqueness nor by itself expresses ontological self-grounding. |
| 010 | D2.1 Logos Field | Definition | FAIL AS WRITTEN | The scalar-field signature is repairable, but the displayed master integral mixes spatial integration with a dangling `dt`; integrating over all space also removes the stated local `r` dependence unless a causal/local kernel is supplied. |
| 011 | D2.2 Chi-Field Properties | Property family | CONDITIONAL | `χ : ℝ⁴ → [0,∞)` is a coherent nonnegative scalar-field type after representing the codomain as a subtype. Additional claimed properties require separate assumptions/tests. |
| 012 | E2.1 Master Equation First Form | Definition/equation | CONDITIONAL | `χ=∫Ω GK dΩ` is a coherent integral schema only after the domain, measure, codomains, units, and integrability of `G·K` are specified. It does not follow merely from the upstream labels. |
| 013 | P2.1 Chi Ontological Priority | Model/action | CONDITIONAL | The action has a recognizable scalar-tensor form if all fields and measures are typed and `G_eff(χ)≠0`. The equation does not prove ontological priority. |
| 014 | P2.2 Chi Semantic Content | Definition/model | CONDITIONAL | `Sem(χ)=G·K·Q·⟨M,R⟩` is algebraically coherent when the factors and inner-product spaces are specified. It defines a score; it does not prove that the score is semantic content. |
| 015 | LN2.1 Information Anchor Necessity | Claimed necessity | FAIL AS WRITTEN | The grounding dichotomy and rejection of regress/brute fact are not logical consequences of the displayed notation. Missing premises carry the conclusion. |
| 016 | A3.1 Order Requirement | Axiom/model | FAIL AS WRITTEN | `∃ code C : S_organized ↔ |C|<|S_random|` is ill-scoped and does not define the encoding/decoder or comparison objects. Organization is not equivalent to existence of an unspecified shorter code. |
| 017 | A3.2 Coherence Measure | Axiom/dynamics | FAIL AS WRITTEN | Ordinary Kolmogorov complexity is integer-valued, noncomputable, and not generally differentiable, so `dK/dt≤0` is not presently a well-defined universal dynamical law. |
| 018 | D3.1 Coherence Functional | Definition | FAIL AS WRITTEN | KL divergence takes probability measures/distributions, not the scalar values `χ(x)` and `χ₀` as written. Normalization, absolute continuity, and measure domains are missing. |
| 019 | D3.2 Self-Interaction Potential | Definition | CONDITIONAL | The even polynomial potential is mathematically coherent after choosing a finite truncation and declaring parameter/domain assumptions; the literal ellipsis prevents a complete formal definition. |
| 020 | D3.3 Interaction Lagrangian | Definition | CONDITIONAL | `L_int=λχ ψ̄ψ` is a standard scalar–fermion interaction term when `χ`, `ψ`, conjugation, spacetime dimension, and coupling dimensions are declared. |

## Machine receipts currently completed

### A2.1 Substrate Requirement

- Z3 positive model: satisfiable.
- Z3 missing-premise countermodel: satisfiable.
- Lean positive model: compiled.
- Lean empty-substrate countermodel: compiled.
- Lean conditional consequence: compiled.
- No `sorry`, `admit`, or custom axiom used in the Lean test.

Files:

- `OldAxiomSubstrateRequirement.lean`
- `Z3_VALIDATION/old_axiom_math_audit/test_A2_1_substrate_requirement.py`

## Repair rule

An original failure is never erased. A repaired successor must record:

1. the original formula;
2. the exact failure;
3. the minimum added or corrected assumptions;
4. the repaired theorem/definition;
5. a Lean receipt, plus a Z3 countermodel when applicable.

## Tranche ruling

These are mathematical-component rulings, not whole-paper or theological
rulings. `CONDITIONAL` is not a euphemism for failure: most legitimate analysis
and physics requires domains, regularity, and boundary assumptions. The repair
goal is to make those assumptions explicit and minimal.
