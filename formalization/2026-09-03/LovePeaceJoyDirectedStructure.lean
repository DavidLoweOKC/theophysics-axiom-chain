import Mathlib.Data.Real.Basic
import Mathlib.Analysis.Real.Sqrt

/-!
# Love, Peace, Joy: Directed Structural Test

This file repairs the proposed three-node test by distinguishing:

* a binding record carrying global energy data;
* a local-stability record carrying only the local stationary jet;
* a real nonzero oscillatory mode carrying curvature, mass, and frequency.

The formal labels are mnemonic only.  The results do not identify these
mathematical structures with Christian Love, Peace, or Joy.
-/

namespace Theophysics.LovePeaceJoyDirectedStructure

structure LocalStability where
  firstDerivative : ℝ
  curvature : ℝ
  stationary : firstDerivative = 0
  positiveCurvature : 0 < curvature

structure Binding where
  potentialValue : ℝ
  escapeThreshold : ℝ
  firstDerivative : ℝ
  curvature : ℝ
  belowEscape : potentialValue < escapeThreshold
  stationary : firstDerivative = 0
  positiveCurvature : 0 < curvature

structure RealOscillation where
  curvature : ℝ
  reducedMass : ℝ
  omega : ℝ
  massPositive : 0 < reducedMass
  modeNonzero : omega ≠ 0
  dispersion : omega ^ 2 = curvature / reducedMass

def Dispersion (κ μ ω : ℝ) : Prop :=
  ω ^ 2 = κ / μ

def forgetGlobalBinding (b : Binding) : LocalStability where
  firstDerivative := b.firstDerivative
  curvature := b.curvature
  stationary := b.stationary
  positiveCurvature := b.positiveCurvature

/-!
This projection is definitional: the present `Binding` contract explicitly
contains stationarity and positive curvature.  It is not a derivation of local
stability from the energy inequality alone.
-/
def binding_contract_supplies_local_stability (b : Binding) :
    LocalStability :=
  forgetGlobalBinding b

theorem oscillation_forces_positive_curvature (o : RealOscillation) :
    0 < o.curvature := by
  have hRatio : 0 < o.curvature / o.reducedMass := by
    rw [← o.dispersion]
    exact sq_pos_of_ne_zero o.modeNonzero
  rcases div_pos_iff.mp hRatio with hPositive | hNegative
  · exact hPositive.1
  · exact False.elim ((not_lt_of_ge (le_of_lt o.massPositive)) hNegative.2)

def localStabilityOfOscillation (o : RealOscillation) : LocalStability where
  firstDerivative := 0
  curvature := o.curvature
  stationary := rfl
  positiveCurvature := oscillation_forces_positive_curvature o

theorem positive_curvature_supplies_nonzero_mode
    (κ μ : ℝ) (hκ : 0 < κ) (hμ : 0 < μ) :
    ∃ ω : ℝ, ω ≠ 0 ∧ ω ^ 2 = κ / μ := by
  have hRatio : 0 < κ / μ := div_pos hκ hμ
  refine ⟨Real.sqrt (κ / μ), ?_, ?_⟩
  · exact ne_of_gt (Real.sqrt_pos.2 hRatio)
  · exact Real.sq_sqrt (le_of_lt hRatio)

theorem peace_joy_scalar_equivalence
    (κ μ : ℝ) (hμ : 0 < μ) :
    (∃ ω : ℝ, ω ≠ 0 ∧ Dispersion κ μ ω) ↔ 0 < κ := by
  constructor
  · rintro ⟨ω, hω, hDispersion⟩
    exact oscillation_forces_positive_curvature {
      curvature := κ
      reducedMass := μ
      omega := ω
      massPositive := hμ
      modeNonzero := hω
      dispersion := hDispersion
    }
  · intro hκ
    simpa [Dispersion] using
      (positive_curvature_supplies_nonzero_mode κ μ hκ hμ)

/-! Two globally different binding records can have identical local data. -/
def bindingBelow : Binding where
  potentialValue := -1
  escapeThreshold := 0
  firstDerivative := 0
  curvature := 1
  belowEscape := neg_one_lt_zero
  stationary := rfl
  positiveCurvature := zero_lt_one

def bindingFurtherBelow : Binding where
  potentialValue := -2
  escapeThreshold := 0
  firstDerivative := 0
  curvature := 1
  belowEscape := by norm_num
  stationary := rfl
  positiveCurvature := zero_lt_one

theorem distinct_bindings_have_identical_local_stability :
    bindingBelow ≠ bindingFurtherBelow ∧
    forgetGlobalBinding bindingBelow = forgetGlobalBinding bindingFurtherBelow := by
  constructor
  · intro h
    have hValue : bindingBelow.potentialValue = bindingFurtherBelow.potentialValue :=
      congrArg Binding.potentialValue h
    norm_num [bindingBelow, bindingFurtherBelow] at hValue
  · rfl

/-!
The canonical projection from global binding data to local stability has no
left inverse.  Local data cannot reconstruct which global binding record was
present, even though every binding record projects to local stability.
-/
theorem no_information_preserving_recovery_from_local_stability :
    ¬ ∃ recover : LocalStability → Binding,
        ∀ b : Binding, recover (forgetGlobalBinding b) = b := by
  rintro ⟨recover, hRecover⟩
  have h₁ := hRecover bindingBelow
  have h₂ := hRecover bindingFurtherBelow
  have hLocal : forgetGlobalBinding bindingBelow =
      forgetGlobalBinding bindingFurtherBelow := rfl
  have hBindings : bindingBelow = bindingFurtherBelow := by
    rw [← h₁, ← h₂, hLocal]
  exact distinct_bindings_have_identical_local_stability.1 hBindings

/-! A supplied global energy comparison extends local stability to binding. -/
def extendWithBindingCondition
    (s : LocalStability) (potentialValue escapeThreshold : ℝ)
    (hBelow : potentialValue < escapeThreshold) : Binding where
  potentialValue := potentialValue
  escapeThreshold := escapeThreshold
  firstDerivative := s.firstDerivative
  curvature := s.curvature
  belowEscape := hBelow
  stationary := s.stationary
  positiveCurvature := s.positiveCurvature

theorem local_stability_plus_global_condition_supplies_binding
    (s : LocalStability) (potentialValue escapeThreshold : ℝ)
    (hBelow : potentialValue < escapeThreshold) :
    ∃ b : Binding, forgetGlobalBinding b = s := by
  exact ⟨extendWithBindingCondition s potentialValue escapeThreshold hBelow, rfl⟩

#print axioms peace_joy_scalar_equivalence
#print axioms distinct_bindings_have_identical_local_stability
#print axioms no_information_preserving_recovery_from_local_stability
#print axioms local_stability_plus_global_condition_supplies_binding

end Theophysics.LovePeaceJoyDirectedStructure
