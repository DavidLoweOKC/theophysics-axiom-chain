import Mathlib.Data.Finset.Powerset
import Mathlib.Data.Finset.Sort
import Mathlib.Tactic.DeriveFintype

/-!
# Axiom Jenga Round 1

This file does not alter the locked Divine Order generator.  It reconstructs
the declared dependency graph in an isolated lane and separates:

* primitive ablation: remove one proposed input;
* rule ablation: remove one proposed bridge;
* seven-term coverage: count Love and Truth as targets;
* derived coverage: test only Justice through Joy.

All semantic and theological adequacy questions remain outside this finite
computation.  `native_decide` checks this declared graph, not reality.
-/

namespace Theophysics.AxiomJenga.Round1

inductive Node where
  | love | truth | personhood | agency | moralOrder | realViolation
  | externalSource | bindingDynamics | positiveMass
  | justice | mercy | grace | peace | joy
  deriving DecidableEq, Repr, Fintype

inductive RuleId where
  | loveToPersonhood
  | justiceBridge
  | mercyBridge
  | graceBridge
  | peaceBridge
  | joyBridge
  deriving DecidableEq, Repr, Fintype

open Node RuleId

def allRules : Finset RuleId := Finset.univ

def insertIf (condition : Bool) (node : Node) (known : Finset Node) : Finset Node :=
  if condition then insert node known else known

def stepWith (enabled : Finset RuleId) (known : Finset Node) : Finset Node :=
  let s1 := insertIf
    (loveToPersonhood ∈ enabled && love ∈ known)
    personhood known
  let s2 := insertIf
    (justiceBridge ∈ enabled && love ∈ s1 && truth ∈ s1 &&
      moralOrder ∈ s1 && realViolation ∈ s1)
    justice s1
  let s3 := insertIf
    (mercyBridge ∈ enabled && justice ∈ s2 && love ∈ s2 && agency ∈ s2)
    mercy s2
  let s4 := insertIf
    (graceBridge ∈ enabled && mercy ∈ s3 && externalSource ∈ s3 && agency ∈ s3)
    grace s3
  let s5 := insertIf
    (peaceBridge ∈ enabled && grace ∈ s4 && bindingDynamics ∈ s4)
    peace s4
  insertIf
    (joyBridge ∈ enabled && peace ∈ s5 && positiveMass ∈ s5)
    joy s5

def closureWith (enabled : Finset RuleId) (initial : Finset Node) : Finset Node :=
  Nat.iterate (stepWith enabled) 6 initial

def candidateBasis : Finset Node :=
  {love, truth, agency, moralOrder, realViolation, externalSource,
    bindingDynamics, positiveMass}

def sevenTargets : Finset Node := {love, truth, justice, mercy, grace, peace, joy}

def derivedTargets : Finset Node := {justice, mercy, grace, peace, joy}

def covers (targets initial : Finset Node) : Bool :=
  targets ⊆ closureWith allRules initial

def coversWith (enabled : Finset RuleId) (targets initial : Finset Node) : Bool :=
  targets ⊆ closureWith enabled initial

/-! Baseline and negative control. -/

theorem baseline_covers_seven : covers sevenTargets candidateBasis = true := by
  native_decide

theorem baseline_covers_derived : covers derivedTargets candidateBasis = true := by
  native_decide

theorem empty_basis_fails_derived : covers derivedTargets ∅ = false := by
  native_decide

/-! Every declared primitive is necessary for all five derived targets in this graph. -/

theorem every_single_primitive_ablation_breaks_derived_coverage :
    ∀ p ∈ candidateBasis, covers derivedTargets (candidateBasis.erase p) = false := by
  native_decide

/-! Exact cascade receipts for single-premise removal. -/

def missingDerivedAfterRemoving (p : Node) : Finset Node :=
  derivedTargets \ closureWith allRules (candidateBasis.erase p)

theorem remove_love_loses_all_derived :
    missingDerivedAfterRemoving love = derivedTargets := by native_decide

theorem remove_truth_loses_all_derived :
    missingDerivedAfterRemoving truth = derivedTargets := by native_decide

theorem remove_agency_loses_mercy_onward :
    missingDerivedAfterRemoving agency = {mercy, grace, peace, joy} := by native_decide

theorem remove_moral_order_loses_all_derived :
    missingDerivedAfterRemoving moralOrder = derivedTargets := by native_decide

theorem remove_real_violation_loses_all_derived :
    missingDerivedAfterRemoving realViolation = derivedTargets := by native_decide

theorem remove_external_source_loses_grace_onward :
    missingDerivedAfterRemoving externalSource = {grace, peace, joy} := by native_decide

theorem remove_binding_dynamics_loses_peace_and_joy :
    missingDerivedAfterRemoving bindingDynamics = {peace, joy} := by native_decide

theorem remove_positive_mass_loses_only_joy :
    missingDerivedAfterRemoving positiveMass = {joy} := by native_decide

/-! Rule ablation distinguishes the ornamental branch from the load-bearing chain. -/

def derivedCoverageWithoutRule (r : RuleId) : Bool :=
  coversWith (allRules.erase r) derivedTargets candidateBasis

theorem personhood_rule_is_not_load_bearing_for_declared_targets :
    derivedCoverageWithoutRule loveToPersonhood = true := by native_decide

theorem every_other_rule_is_load_bearing_for_derived_coverage :
    ∀ r ∈ allRules, r ≠ loveToPersonhood → derivedCoverageWithoutRule r = false := by
  native_decide

/-! The personhood node is produced, but no present rule consumes it. -/

theorem disabling_personhood_rule_changes_no_derived_target :
    derivedTargets ∩ closureWith (allRules.erase loveToPersonhood) candidateBasis =
      derivedTargets ∩ closureWith allRules candidateBasis := by
  native_decide

#print axioms baseline_covers_derived
#print axioms every_single_primitive_ablation_breaks_derived_coverage
#print axioms personhood_rule_is_not_load_bearing_for_declared_targets
#print axioms every_other_rule_is_load_bearing_for_derived_coverage

end Theophysics.AxiomJenga.Round1
