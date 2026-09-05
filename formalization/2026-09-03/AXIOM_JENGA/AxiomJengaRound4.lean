import Mathlib.Data.Finset.Sort
import Mathlib.Tactic.DeriveFintype

/-!
# Axiom Jenga Round 4: order, fusion, and label controls

These controls ask which conclusions belong to the dependency relation and
which are artifacts of presentation.
-/

namespace Theophysics.AxiomJenga.Round4

inductive Node where
  | love | truth | agency | moralOrder | realViolation
  | externalSource | bindingDynamics | positiveMass
  | justice | mercy | grace | peace | joy
  deriving DecidableEq, Repr, Fintype

open Node

def insertIf (condition : Bool) (node : Node) (known : Finset Node) : Finset Node :=
  if condition then insert node known else known

def forwardStep (known : Finset Node) : Finset Node :=
  let s1 := insertIf
    (love ∈ known && truth ∈ known && moralOrder ∈ known && realViolation ∈ known)
    justice known
  let s2 := insertIf (justice ∈ s1 && love ∈ s1 && agency ∈ s1) mercy s1
  let s3 := insertIf (mercy ∈ s2 && externalSource ∈ s2 && agency ∈ s2) grace s2
  let s4 := insertIf (grace ∈ s3 && bindingDynamics ∈ s3) peace s3
  insertIf (peace ∈ s4 && positiveMass ∈ s4) joy s4

/-- Same rules evaluated in reverse presentation order. -/
def reverseStep (known : Finset Node) : Finset Node :=
  let s1 := insertIf (peace ∈ known && positiveMass ∈ known) joy known
  let s2 := insertIf (grace ∈ s1 && bindingDynamics ∈ s1) peace s1
  let s3 := insertIf (mercy ∈ s2 && externalSource ∈ s2 && agency ∈ s2) grace s2
  let s4 := insertIf (justice ∈ s3 && love ∈ s3 && agency ∈ s3) mercy s3
  insertIf
    (love ∈ s4 && truth ∈ s4 && moralOrder ∈ s4 && realViolation ∈ s4)
    justice s4

def forwardClosure (initial : Finset Node) := Nat.iterate forwardStep 6 initial
def reverseClosure (initial : Finset Node) := Nat.iterate reverseStep 6 initial

def basis : Finset Node :=
  {love, truth, agency, moralOrder, realViolation, externalSource,
    bindingDynamics, positiveMass}

def targets : Finset Node := {justice, mercy, grace, peace, joy}

theorem reversing_rule_presentation_preserves_final_closure :
    reverseClosure basis = forwardClosure basis := by native_decide

/-! A fused rule packages the complete chain into one function. -/

def allInputsPresent (known : Finset Node) : Bool := basis ⊆ known

def fusedStep (known : Finset Node) : Finset Node :=
  if allInputsPresent known then known ∪ targets else known

def fusedClosure (initial : Finset Node) := Nat.iterate fusedStep 6 initial

theorem fusion_preserves_full_basis_target_coverage :
    targets ⊆ fusedClosure basis := by native_decide

theorem fusion_does_not_preserve_the_ablation_damage_profile :
    targets \ fusedClosure (basis.erase positiveMass) = targets ∧
    targets \ forwardClosure (basis.erase positiveMass) = {joy} := by
  native_decide

/-! Full label conjugation: swap Love and PositiveMass everywhere. -/

def swapLabel : Node → Node
  | love => positiveMass
  | positiveMass => love
  | n => n

def relabel (nodes : Finset Node) : Finset Node := nodes.image swapLabel

def shuffledStep (known : Finset Node) : Finset Node :=
  relabel (forwardStep (relabel known))

def shuffledClosure (initial : Finset Node) := Nat.iterate shuffledStep 6 initial

theorem swap_label_is_involutive (n : Node) : swapLabel (swapLabel n) = n := by
  cases n <;> rfl

theorem fully_relabelled_graph_preserves_success :
    relabel targets ⊆ shuffledClosure (relabel basis) := by
  native_decide

/-!
The preregistered expectation was that unchanged semantic targets would fail.
It was false: saturation makes this coverage predicate unable to detect the
nonsemantic shuffle.
-/
theorem unchanged_semantic_targets_still_pass_under_nonsemantic_shuffle :
    targets ⊆ shuffledClosure (relabel basis) := by
  native_decide

#print axioms reversing_rule_presentation_preserves_final_closure
#print axioms fusion_preserves_full_basis_target_coverage
#print axioms fusion_does_not_preserve_the_ablation_damage_profile
#print axioms fully_relabelled_graph_preserves_success

end Theophysics.AxiomJenga.Round4
