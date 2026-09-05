import Mathlib.Data.NNReal.Basic
import Mathlib.Data.Nat.Log
import Mathlib.Algebra.BigOperators.Group.Finset.Basic
import Mathlib.Analysis.InnerProductSpace.Basic
import Mathlib.Analysis.SpecialFunctions.Log.Basic

/-!
# Old Axiom Repairs 001-020

Mathematical-only successor definitions for the first legacy tranche.
These declarations repair typing/domain defects; they do not assert that the
objects model physics, theology, or semantics.
-/

namespace Theophysics.OldAxiom.Repairs001_020

/-! ## 001: existence -/

def HasExistence (alpha : Type) : Prop := Nonempty alpha

theorem unit_has_existence : HasExistence Unit := Nonempty.intro ()

/-! ## 002: distinction -/

def HasDistinction (alpha : Type) : Prop := Exists fun a : alpha => Exists fun b : alpha => a ≠ b

theorem bool_has_distinction : HasDistinction Bool := by
  exact Exists.intro false (Exists.intro true (by decide))

theorem unit_has_no_distinction : Not (HasDistinction Unit) := by
  rintro ⟨a, b, hab⟩
  exact hab (Subsingleton.elim a b)

/-! ## 005: one binary choice is one bit -/

def BinaryBitCount : Nat := Nat.log 2 2

theorem binary_bit_count_is_one : BinaryBitCount = 1 := by decide

/-! ## 009: fixed-point condition -/

def IsFixedPoint {alpha : Type} (f : alpha -> alpha) (x : alpha) : Prop := f x = x

theorem identity_fixes_everything {alpha : Type} (x : alpha) : IsFixedPoint id x := rfl

theorem fixed_point_condition_does_not_imply_uniqueness :
    Exists fun f : Bool -> Bool =>
      IsFixedPoint f false ∧ IsFixedPoint f true ∧ false ≠ true := by
  exact Exists.intro id ⟨rfl, rfl, by decide⟩

/-! ## 010-012: typed nonnegative fields and finite aggregation kernels -/

def NonnegativeField (spaceTime : Type) := spaceTime -> NNReal

def CausalAggregate {index : Type}
    (past : Finset index) (kernel factor : index -> Real) : Real :=
  past.sum (fun x => kernel x * factor x)

theorem causalAggregate_nonnegative {index : Type}
    (past : Finset index) (kernel factor : index -> Real)
    (hKernel : forall x, x ∈ past -> 0 <= kernel x)
    (hFactor : forall x, x ∈ past -> 0 <= factor x) :
    0 <= CausalAggregate past kernel factor := by
  unfold CausalAggregate
  apply Finset.sum_nonneg
  intro x hx
  exact mul_nonneg (hKernel x hx) (hFactor x hx)

def WeightedAggregate {index : Type}
    (domain : Finset index) (grounding knowledge : index -> Real) : Real :=
  domain.sum (fun x => grounding x * knowledge x)

/-! ## 013: a typed scalar-tensor action density (pointwise core only) -/

noncomputable def ScalarTensorDensity
    (piConstant chi scalarCurvature matterDensity effectiveG : Real) : Real :=
  chi / (16 * piConstant * effectiveG) * scalarCurvature + matterDensity

theorem scalarTensorDensity_defined_when_effectiveG_nonzero
    (piConstant chi scalarCurvature matterDensity effectiveG : Real)
    (_hG : effectiveG ≠ 0) :
    Exists fun value : Real =>
      value = ScalarTensorDensity piConstant chi scalarCurvature matterDensity effectiveG := by
  exact Exists.intro _ rfl

/-! ## 014: typed semantic-score candidate -/

def SemanticScore
    {vector : Type}
    (pairing : vector -> vector -> Real)
    (grounding knowledge orientation : Real) (manifestation relation : vector) : Real :=
  grounding * knowledge * orientation * pairing manifestation relation

/-! ## 016: faithful compression, not mere existence of a short code -/

structure Encoding (source code : Type) where
  encode : source -> code
  decode : code -> source
  faithful : Function.LeftInverse decode encode

def Compresses {source code : Type}
    (E : Encoding source code)
    (sourceSize : source -> Nat) (codeSize : code -> Nat) (x : source) : Prop :=
  codeSize (E.encode x) < sourceSize x

theorem compression_preserves_source {source code : Type}
    (E : Encoding source code) (x : source) : E.decode (E.encode x) = x :=
  E.faithful x

/-! ## 017: discrete monotonicity replaces an undefined derivative of K -/

def ComplexityNonincreasing {state : Type}
    (complexity : state -> Nat) (update : state -> state) : Prop :=
  forall s, complexity (update s) <= complexity s

theorem complexity_step_bound {state : Type}
    (complexity : state -> Nat) (update : state -> state)
    (h : ComplexityNonincreasing complexity update) (s : state) :
    complexity (update s) <= complexity s := h s

/-! ## 018: finite relative-entropy candidate with explicit zero convention -/

noncomputable def KLTerm (p q : Real) : Real :=
  if p = 0 then 0 else p * Real.log (p / q)

noncomputable def FiniteRelativeEntropy {index : Type}
    (domain : Finset index) (p q : index -> Real) : Real :=
  domain.sum (fun x => KLTerm (p x) (q x))

/-! ## 019: finite self-interaction potential (no ellipsis) -/

noncomputable def SelfInteractionPotential
    (muSq lambda nu chi : Real) : Real :=
  -(muSq / 2) * chi ^ 2 + (lambda / 24) * chi ^ 4 + (nu / 720) * chi ^ 6

/-! ## 020: pointwise algebraic core of a scalar-fermion interaction -/

def InteractionCore (lambda chi psiBarPsi : Real) : Real :=
  lambda * chi * psiBarPsi

theorem interaction_core_zero_without_coupling (chi psiBarPsi : Real) :
    InteractionCore 0 chi psiBarPsi = 0 := by simp [InteractionCore]

#print axioms unit_has_existence
#print axioms bool_has_distinction
#print axioms unit_has_no_distinction
#print axioms binary_bit_count_is_one
#print axioms identity_fixes_everything
#print axioms fixed_point_condition_does_not_imply_uniqueness
#print axioms causalAggregate_nonnegative
#print axioms compression_preserves_source
#print axioms complexity_step_bound
#print axioms interaction_core_zero_without_coupling

end Theophysics.OldAxiom.Repairs001_020
