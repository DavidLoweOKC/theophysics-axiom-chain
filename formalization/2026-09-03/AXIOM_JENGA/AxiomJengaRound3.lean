import Mathlib.Data.Finset.Sort
import Mathlib.Tactic.DeriveFintype

/-!
# Axiom Jenga Round 3: Love and Truth priority contest

Four architectures share the same downstream Justice-to-Joy rules:

1. Love and Truth are co-primitives.
2. Love is primitive and a bridge derives Truth.
3. Truth is primitive and a bridge derives Love.
4. A neutral common ground derives both Love and Truth.

Finite closure tests structural sufficiency.  Separate propositional
countermodels test whether either one-way bridge follows from bare logic.
-/

namespace Theophysics.AxiomJenga.Round3

inductive Node where
  | ground | love | truth | agency | moralOrder | realViolation
  | externalSource | bindingDynamics | positiveMass
  | justice | mercy | grace | peace | joy
  deriving DecidableEq, Repr, Fintype

inductive Architecture where
  | coPrimitive | loveFirst | truthFirst | commonGround
  deriving DecidableEq, Repr, Fintype

open Node Architecture

def insertIf (condition : Bool) (node : Node) (known : Finset Node) : Finset Node :=
  if condition then insert node known else known

def selected (actual expected : Architecture) : Bool := decide (actual = expected)

def step (architecture : Architecture) (known : Finset Node) : Finset Node :=
  let s1 := insertIf
    (selected architecture loveFirst && love ∈ known)
    truth known
  let s2 := insertIf
    (selected architecture truthFirst && truth ∈ s1)
    love s1
  let common := selected architecture commonGround && ground ∈ s2
  let s3 := insertIf common love s2
  let s4 := insertIf common truth s3
  let s5 := insertIf
    (love ∈ s4 && truth ∈ s4 && moralOrder ∈ s4 && realViolation ∈ s4)
    justice s4
  let s6 := insertIf
    (justice ∈ s5 && love ∈ s5 && agency ∈ s5)
    mercy s5
  let s7 := insertIf
    (mercy ∈ s6 && externalSource ∈ s6 && agency ∈ s6)
    grace s6
  let s8 := insertIf
    (grace ∈ s7 && bindingDynamics ∈ s7)
    peace s7
  insertIf
    (peace ∈ s8 && positiveMass ∈ s8)
    joy s8

def closure (architecture : Architecture) (initial : Finset Node) : Finset Node :=
  Nat.iterate (step architecture) 7 initial

def sharedInputs : Finset Node :=
  {agency, moralOrder, realViolation, externalSource, bindingDynamics, positiveMass}

def basis : Architecture → Finset Node
  | coPrimitive => insert love (insert truth sharedInputs)
  | loveFirst => insert love sharedInputs
  | truthFirst => insert truth sharedInputs
  | commonGround => insert ground sharedInputs

def spiritualTargets : Finset Node :=
  {love, truth, justice, mercy, grace, peace, joy}

def succeeds (architecture : Architecture) : Bool :=
  spiritualTargets ⊆ closure architecture (basis architecture)

theorem all_four_architectures_reach_the_same_targets :
    ∀ architecture : Architecture, succeeds architecture = true := by
  native_decide

theorem co_primitive_uses_two_visible_love_truth_inputs :
    (basis coPrimitive).card = sharedInputs.card + 2 := by native_decide

theorem each_directional_or_ground_model_uses_one_visible_root :
    ∀ architecture ∈ ({loveFirst, truthFirst, commonGround} : Finset Architecture),
      (basis architecture).card = sharedInputs.card + 1 := by
  native_decide

/-! Bare logic does not select either directional bridge. -/

abbrev Interpretation := Node → Prop

def loveWithoutTruth : Interpretation
  | love => True
  | _ => False

def truthWithoutLove : Interpretation
  | truth => True
  | _ => False

theorem love_does_not_logically_entail_truth_without_a_bridge :
    ¬ ∀ holds : Interpretation, holds love → holds truth := by
  intro alleged
  exact alleged loveWithoutTruth trivial

theorem truth_does_not_logically_entail_love_without_a_bridge :
    ¬ ∀ holds : Interpretation, holds truth → holds love := by
  intro alleged
  exact alleged truthWithoutLove trivial

/-! A common-source model needs two bridge commitments, not zero. -/

structure CommonGroundBridges (holds : Interpretation) : Prop where
  ground_to_love : holds ground → holds love
  ground_to_truth : holds ground → holds truth

theorem common_ground_yields_both_given_both_bridges
    (holds : Interpretation) (bridges : CommonGroundBridges holds)
    (hGround : holds ground) : holds love ∧ holds truth := by
  exact ⟨bridges.ground_to_love hGround, bridges.ground_to_truth hGround⟩

/-! Removing the selected root breaks each architecture under its own registry. -/

def root : Architecture → Node
  | coPrimitive => love
  | loveFirst => love
  | truthFirst => truth
  | commonGround => ground

theorem selected_root_is_load_bearing_in_each_architecture :
    ∀ architecture : Architecture,
      spiritualTargets ⊆
        closure architecture ((basis architecture).erase (root architecture)) = false := by
  native_decide

#print axioms all_four_architectures_reach_the_same_targets
#print axioms love_does_not_logically_entail_truth_without_a_bridge
#print axioms truth_does_not_logically_entail_love_without_a_bridge
#print axioms common_ground_yields_both_given_both_bridges

end Theophysics.AxiomJenga.Round3
