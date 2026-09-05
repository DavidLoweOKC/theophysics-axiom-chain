import Mathlib.Data.Finset.Sort
import Mathlib.Tactic.DeriveFintype

/-!
# Axiom Jenga Round 2: replacement and hidden-dependency controls

Round 1 showed that every proposed primitive is required by the original fixed
rules.  Round 2 asks the more informative question: can a modified rule registry
recover the targets after one visible primitive is removed?

Passing here does not validate a replacement.  It constructs a countermodel to
global uniqueness and exposes exactly which stronger bridge did the replacing.
-/

namespace Theophysics.AxiomJenga.Round2

inductive Node where
  | love | truth | personhood | agency | moralOrder | realViolation
  | externalSource | bindingDynamics | positiveMass
  | justice | mercy | grace | peace | joy
  deriving DecidableEq, Repr, Fintype

inductive Variant where
  | baseline
  | loveDerivesTruth
  | personhoodDerivesAgency
  | truthDerivesMoralOrder
  | orderAndAgencyProduceViolation
  | graceWithoutVisibleExternalSource
  | peaceWithoutVisibleBindingDynamics
  | joyWithoutVisiblePositiveMass
  deriving DecidableEq, Repr, Fintype

open Node Variant

def insertIf (condition : Bool) (node : Node) (known : Finset Node) : Finset Node :=
  if condition then insert node known else known

def isVariant (actual expected : Variant) : Bool := decide (actual = expected)

def step (variant : Variant) (known : Finset Node) : Finset Node :=
  let s1 := insertIf (love ∈ known) personhood known
  let s2 := insertIf
    (isVariant variant loveDerivesTruth && love ∈ s1)
    truth s1
  let s3 := insertIf
    (isVariant variant personhoodDerivesAgency && personhood ∈ s2)
    agency s2
  let s4 := insertIf
    (isVariant variant truthDerivesMoralOrder && truth ∈ s3)
    moralOrder s3
  let s5 := insertIf
    (isVariant variant orderAndAgencyProduceViolation &&
      moralOrder ∈ s4 && agency ∈ s4)
    realViolation s4
  let s6 := insertIf
    (love ∈ s5 && truth ∈ s5 && moralOrder ∈ s5 && realViolation ∈ s5)
    justice s5
  let s7 := insertIf
    (justice ∈ s6 && love ∈ s6 && agency ∈ s6)
    mercy s6
  let externalSatisfied :=
    externalSource ∈ s7 || isVariant variant graceWithoutVisibleExternalSource
  let s8 := insertIf
    (mercy ∈ s7 && externalSatisfied && agency ∈ s7)
    grace s7
  let bindingSatisfied :=
    bindingDynamics ∈ s8 || isVariant variant peaceWithoutVisibleBindingDynamics
  let s9 := insertIf
    (grace ∈ s8 && bindingSatisfied)
    peace s8
  let massSatisfied :=
    positiveMass ∈ s9 || isVariant variant joyWithoutVisiblePositiveMass
  insertIf (peace ∈ s9 && massSatisfied) joy s9

def closure (variant : Variant) (initial : Finset Node) : Finset Node :=
  Nat.iterate (step variant) 8 initial

def basis : Finset Node :=
  {love, truth, agency, moralOrder, realViolation, externalSource,
    bindingDynamics, positiveMass}

def targets : Finset Node := {justice, mercy, grace, peace, joy}

def succeeds (variant : Variant) (initial : Finset Node) : Bool :=
  targets ⊆ closure variant initial

theorem baseline_succeeds : succeeds baseline basis = true := by native_decide

/-! Each stronger registry recovers the chain after removing one visible input. -/

theorem love_bridge_replaces_truth_in_visible_basis :
    succeeds loveDerivesTruth (basis.erase truth) = true := by native_decide

theorem personhood_bridge_replaces_agency_in_visible_basis :
    succeeds personhoodDerivesAgency (basis.erase agency) = true := by native_decide

theorem truth_bridge_replaces_moral_order_in_visible_basis :
    succeeds truthDerivesMoralOrder (basis.erase moralOrder) = true := by native_decide

theorem production_bridge_replaces_real_violation_in_visible_basis :
    succeeds orderAndAgencyProduceViolation (basis.erase realViolation) = true := by
  native_decide

theorem bundled_grace_rule_hides_external_source_from_visible_basis :
    succeeds graceWithoutVisibleExternalSource (basis.erase externalSource) = true := by
  native_decide

theorem bundled_peace_rule_hides_binding_dynamics_from_visible_basis :
    succeeds peaceWithoutVisibleBindingDynamics (basis.erase bindingDynamics) = true := by
  native_decide

theorem bundled_joy_rule_hides_positive_mass_from_visible_basis :
    succeeds joyWithoutVisiblePositiveMass (basis.erase positiveMass) = true := by
  native_decide

/-! Controls: no replacement variant removes Love, and each variant is local. -/

theorem no_tested_variant_replaces_love :
    ∀ variant : Variant, succeeds variant (basis.erase love) = false := by
  native_decide

theorem love_to_truth_does_not_also_replace_external_source :
    succeeds loveDerivesTruth (basis.erase externalSource) = false := by native_decide

theorem personhood_to_agency_does_not_also_replace_positive_mass :
    succeeds personhoodDerivesAgency (basis.erase positiveMass) = false := by native_decide

#print axioms love_bridge_replaces_truth_in_visible_basis
#print axioms personhood_bridge_replaces_agency_in_visible_basis
#print axioms no_tested_variant_replaces_love

end Theophysics.AxiomJenga.Round2
