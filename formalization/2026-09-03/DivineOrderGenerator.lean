import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Sort
import Mathlib.Tactic.DeriveFintype

/-!
# Divine Order Generator Test

This finite dependency model tests a candidate semantic architecture. The rules
below are explicit bridge assumptions. Computation can establish their closure,
minimal generators, and ablation behavior; it cannot establish that the rules are
the uniquely correct theology.
-/

namespace Theophysics.DivineOrderGenerator

inductive Node where
  | love | truth | personhood | agency | moralOrder | realViolation
  | externalSource | bindingDynamics | positiveMass
  | justice | mercy | grace | peace | joy
  deriving DecidableEq, Repr, Fintype

open Node

def insertIf (condition : Bool) (node : Node) (known : Finset Node) : Finset Node :=
  if condition then insert node known else known

/-- One forward-chaining pass through the preregistered candidate rules. -/
def step (known : Finset Node) : Finset Node :=
  let s₁ := insertIf (love ∈ known) personhood known
  let s₂ := insertIf
    (love ∈ s₁ && truth ∈ s₁ && moralOrder ∈ s₁ && realViolation ∈ s₁)
    justice s₁
  let s₃ := insertIf (justice ∈ s₂ && love ∈ s₂ && agency ∈ s₂) mercy s₂
  let s₄ := insertIf (mercy ∈ s₃ && externalSource ∈ s₃ && agency ∈ s₃) grace s₃
  let s₅ := insertIf (grace ∈ s₄ && bindingDynamics ∈ s₄) peace s₄
  insertIf (peace ∈ s₅ && positiveMass ∈ s₅) joy s₅

/-- Six passes suffice for this acyclic rule set. -/
def closure (initial : Finset Node) : Finset Node :=
  Nat.iterate step 6 initial

def divineOrderTargets : Finset Node :=
  {love, truth, justice, mercy, grace, peace, joy}

def derivesAllTargets (initial : Finset Node) : Bool :=
  divineOrderTargets ⊆ closure initial

def candidatePrimitiveUniverse : Finset Node :=
  {love, truth, agency, moralOrder, realViolation, externalSource,
    bindingDynamics, positiveMass}

def proposedBasis : Finset Node := candidatePrimitiveUniverse

theorem proposed_basis_derives_all_targets :
    derivesAllTargets proposedBasis = true := by
  native_decide

theorem love_is_load_bearing :
    derivesAllTargets (proposedBasis.erase love) = false := by native_decide

theorem truth_is_load_bearing :
    derivesAllTargets (proposedBasis.erase truth) = false := by native_decide

theorem agency_is_load_bearing :
    derivesAllTargets (proposedBasis.erase agency) = false := by native_decide

theorem moral_order_is_load_bearing :
    derivesAllTargets (proposedBasis.erase moralOrder) = false := by native_decide

theorem real_violation_is_load_bearing :
    derivesAllTargets (proposedBasis.erase realViolation) = false := by native_decide

theorem external_source_is_load_bearing :
    derivesAllTargets (proposedBasis.erase externalSource) = false := by native_decide

theorem binding_dynamics_is_load_bearing :
    derivesAllTargets (proposedBasis.erase bindingDynamics) = false := by native_decide

theorem positive_mass_is_load_bearing :
    derivesAllTargets (proposedBasis.erase positiveMass) = false := by native_decide

/-- Every proper subset of the eight-node candidate universe fails. -/
theorem proposed_basis_is_unique_minimum_within_candidate_universe :
    ∀ s ∈ candidatePrimitiveUniverse.powerset,
      derivesAllTargets s = true ↔ s = proposedBasis := by
  native_decide

#eval closure proposedBasis
#print axioms proposed_basis_derives_all_targets
#print axioms proposed_basis_is_unique_minimum_within_candidate_universe

end Theophysics.DivineOrderGenerator
