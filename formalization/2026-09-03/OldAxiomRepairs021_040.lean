import Mathlib.Data.NNReal.Basic
import Mathlib.Algebra.Order.Ring.Defs
import Mathlib.Algebra.BigOperators.Group.Finset.Basic

/-!
# Old Axiom Repairs 021-040

Mathematical-only successor definitions for the second legacy tranche.
These declarations repair types and expose assumptions. They do not establish
physical instantiation, consciousness, theology, or cross-domain identity.
-/

namespace Theophysics.OldAxiom.Repairs021_040

/-! ## 021: a typed finite coherence-functional core -/

def CoherenceFunctional {Index : Type}
    (region : Finset Index)
    (measure kinetic potential interaction : Index → ℝ) : ℝ :=
  region.sum fun x => measure x * (kinetic x - potential x + interaction x)

/-! ## 023: nonnegativity is an additional property, not a consequence of 021 -/

def IsNonnegativeCoherence {State : Type} (C : State → ℝ) : Prop :=
  ∀ s, 0 ≤ C s

theorem arbitrary_real_coherence_need_not_be_nonnegative :
    ∃ (C : Unit → ℝ), ¬ IsNonnegativeCoherence C := by
  refine ⟨fun _ => -1, ?_⟩
  intro h
  have := h ()
  norm_num at this

theorem nnreal_coherence_is_nonnegative {State : Type} (C : State → NNReal) :
    ∀ s, 0 ≤ (C s : ℝ) := by
  intro s
  exact (C s).property

/-! ## 024: conservation must name an evolution and an invariant -/

def Preserves {State Value : Type}
    (evolve : State → State) (quantity : State → Value) : Prop :=
  ∀ s, quantity (evolve s) = quantity s

theorem identity_preserves_every_quantity {State Value : Type}
    (quantity : State → Value) : Preserves id quantity := by
  intro s
  rfl

/-! ## 025: closed-system nonincrease is a predicate on an update -/

def NonincreasingUnder {State : Type}
    (C : State → ℝ) (update : State → State) : Prop :=
  ∀ s, C (update s) ≤ C s

theorem conservation_implies_nonincrease {State : Type}
    (C : State → ℝ) (update : State → State)
    (h : Preserves update C) : NonincreasingUnder C update := by
  intro s
  rw [h s]

/-! ## 026: meaningfulness requires a classifier or score criterion -/

structure MeaningCriterion (Configuration : Type) where
  meaningful : Configuration → Prop

def DistinguishesMeaning {Configuration : Type}
    (criterion : MeaningCriterion Configuration) : Prop :=
  (∃ x, criterion.meaningful x) ∧ (∃ y, ¬ criterion.meaningful y)

/-! ## 027: parsimony is explicit minimization relative to a cost -/

def IsCostMinimal {Description : Type}
    (cost : Description → ℕ) (candidate : Description) : Prop :=
  ∀ rival, cost candidate ≤ cost rival

theorem constant_cost_makes_every_description_minimal {Description : Type}
    (d : Description) : IsCostMinimal (fun _ => 0) d := by
  intro rival
  exact Nat.le_refl 0

/-! ## 029: a typed program-length definition schema -/

structure ProgramModel (Program Output : Type) where
  runsTo : Program → Output → Prop
  length : Program → ℕ

def ProgramProduces {Program Output : Type}
    (model : ProgramModel Program Output) (p : Program) (x : Output) : Prop :=
  model.runsTo p x

def IsShortestProgramFor {Program Output : Type}
    (model : ProgramModel Program Output) (p : Program) (x : Output) : Prop :=
  ProgramProduces model p x ∧
    ∀ q, ProgramProduces model q x → model.length p ≤ model.length q

/-! ## 030: compression ratio requires a nonzero source length -/

noncomputable def CompressionRatio (compressedLength sourceLength : ℝ)
    (_hSource : sourceLength ≠ 0) : ℝ :=
  compressedLength / sourceLength

theorem compressionRatio_self (n : ℝ) (hn : n ≠ 0) :
    CompressionRatio n n hn = 1 := by
  simp [CompressionRatio, hn]

/-! ## 031: algebraic rate core for dK/dt = -alpha * chi -/

def ComplexityRate (alpha chi : ℝ) : ℝ := -alpha * chi

theorem complexityRate_nonpositive
    (alpha chi : ℝ) (hAlpha : 0 ≤ alpha) (hChi : 0 ≤ chi) :
    ComplexityRate alpha chi ≤ 0 := by
  unfold ComplexityRate
  nlinarith [mul_nonneg hAlpha hChi]

theorem complexityRate_can_be_positive_without_chi_sign
    (alpha : ℝ) (hAlpha : 0 < alpha) :
    0 < ComplexityRate alpha (-1) := by
  unfold ComplexityRate
  nlinarith

/-! ## 032: low-description-cost is a model-relative predicate -/

def IsLowDescription {Law : Type}
    (cost : Law → ℕ) (threshold : ℕ) (law : Law) : Prop :=
  cost law ≤ threshold

/-! ## 033: action/minimal-cost correspondence must be asserted as a bridge -/

def ActionCostAgreeOnMinimizers {Path : Type}
    (action algorithmicCost : Path → ℝ) : Prop :=
  ∀ p,
    (∀ q, action p ≤ action q) ↔
    (∀ q, algorithmicCost p ≤ algorithmicCost q)

/-! ## 035-037: observation and registration cores -/

structure ObservationSystem (State Record : Type) where
  register : State → Record

def OutcomeAttributable {State Record : Type}
    (observer : ObservationSystem State Record)
    (state : State) (record : Record) : Prop :=
  observer.register state = record

def RegistersDistinctions {State Record : Type}
    (observer : ObservationSystem State Record) : Prop :=
  ∃ x y, x ≠ y ∧ observer.register x ≠ observer.register y

/-! ## 036: participation is an explicitly supplied transition relation -/

structure ParticipatoryTransition (Possibility Observer Actuality : Type) where
  actualize : Possibility → Observer → Actuality

/-! ## 038 and 040: a capacity measure and what it means to admit degrees -/

def CapacityMeasure (System : Type) := System → NNReal

def AdmitsDegrees {System : Type} (capacity : CapacityMeasure System) : Prop :=
  ∃ low high, capacity low < capacity high

theorem constant_capacity_does_not_admit_degrees {System : Type} [Nonempty System]
    (value : NNReal) : ¬ AdmitsDegrees (fun _ : System => value) := by
  rintro ⟨low, high, h⟩
  exact (lt_irrefl value) h

/-! ## 039: a witness operator needs only source and target types -/

def WitnessOperator (Potential Actualized : Type) := Potential → Actualized

end Theophysics.OldAxiom.Repairs021_040
