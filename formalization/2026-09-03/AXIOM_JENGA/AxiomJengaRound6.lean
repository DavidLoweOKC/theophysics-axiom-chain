import DivineOrderKernel

/-!
# Axiom Jenga Round 6: reconstructing Justice and Mercy

Round 5 showed that defining Justice as `alpha = 1` and Mercy as `alpha = 0`
makes them incompatible endpoints.  This round separates:

* fulfillment of the standard and conservation of the cost;
* allocation of the conserved cost;
* voluntary payment by another.

The names remain candidate theological identifications.
-/

namespace Theophysics.AxiomJenga.Round6

open Theophysics.DivineOrderKernel

/--
Candidate justice-as-satisfaction: the violation is truthfully named, impartially
adjudicated, and the injured party is restored.  Full cost conservation is
already enforced by the `ViolationLedger` type.
-/
def JusticeFulfilled {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  AdequateRestoration context ledger

/--
Candidate mercy-as-allocation: another person voluntarily bears the entire
conserved cost.  This does not waive or erase the underlying ledger.
-/
def MercyShown {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  OtherPaysInFull ledger ∧
    context.paysVoluntarily ledger.otherPayer ledger.event

theorem current_mercy_candidate_is_justice_fulfilled_and_mercy_shown
    {Person : Type*} (context : RepairContext Person)
    (ledger : ViolationLedger Person) :
    MercyCandidate context ledger ↔
      JusticeFulfilled context ledger ∧ MercyShown context ledger := by
  rfl

theorem mercy_candidate_presupposes_justice_fulfilled
    {Person : Type*} (context : RepairContext Person)
    (ledger : ViolationLedger Person)
    (hMercy : MercyCandidate context ledger) :
    JusticeFulfilled context ledger :=
  hMercy.1

/-! A concrete cost-bearing-other ledger where both candidate predicates hold. -/

def crossCandidateEvent : ViolationEvent Bool := {
  offender := false
  injuredParty := true
  judge := true
  offender_ne_injured := by decide
}

def crossCandidateLedger : ViolationLedger Bool := {
  event := crossCandidateEvent
  cost := 1
  costPositive := by norm_num
  alpha := 0
  alphaNonnegative := by norm_num
  offenderPayment := 0
  otherPayment := 1
  offenderPayment_eq := by norm_num
  otherPayment_eq := by norm_num
  paymentConserved := by norm_num
  otherPayer := true
  alphaAtMostOne := by norm_num
}

def crossCandidateContext : RepairContext Bool := {
  authorizedToJudge := fun _ _ => True
  paysVoluntarily := fun _ _ => True
  truthfullyNames := fun _ => True
  adjudicatesImpartially := fun _ _ => True
  restoresInjuredParty := fun _ => True
}

theorem justice_and_mercy_coexist_in_reconstructed_contract :
    JusticeFulfilled crossCandidateContext crossCandidateLedger ∧
      MercyShown crossCandidateContext crossCandidateLedger := by
  exact ⟨⟨trivial, trivial, trivial⟩, ⟨⟨rfl, by decide⟩, trivial⟩⟩

theorem the_conserved_cost_is_fully_paid_in_cross_candidate :
    crossCandidateLedger.offenderPayment + crossCandidateLedger.otherPayment =
      crossCandidateLedger.cost :=
  crossCandidateLedger.paymentConserved

theorem the_offender_pays_zero_in_cross_candidate :
    crossCandidateLedger.offenderPayment = 0 := by rfl

theorem the_other_payer_pays_the_full_cost_in_cross_candidate :
    crossCandidateLedger.otherPayment = crossCandidateLedger.cost := by rfl

/-!
Justice-as-satisfaction still does not entail Mercy: adequate restoration can
hold at the offender-pays endpoint.  Round 5's counterexample is imported in
concept but reconstructed here to keep this file independent of another Jenga
round.
-/

def offenderPaysEvent : ViolationEvent Bool := crossCandidateEvent

def offenderPaysLedger : ViolationLedger Bool := {
  event := offenderPaysEvent
  cost := 1
  costPositive := by norm_num
  alpha := 1
  alphaNonnegative := by norm_num
  offenderPayment := 1
  otherPayment := 0
  offenderPayment_eq := by norm_num
  otherPayment_eq := by norm_num
  paymentConserved := by norm_num
  otherPayer := true
  alphaAtMostOne := by norm_num
}

theorem justice_fulfilled_without_mercy_countermodel :
    JusticeFulfilled crossCandidateContext offenderPaysLedger ∧
      ¬ MercyShown crossCandidateContext offenderPaysLedger := by
  constructor
  · exact ⟨trivial, trivial, trivial⟩
  · intro hMercy
    exact one_ne_zero hMercy.1.1

#print axioms current_mercy_candidate_is_justice_fulfilled_and_mercy_shown
#print axioms mercy_candidate_presupposes_justice_fulfilled
#print axioms justice_and_mercy_coexist_in_reconstructed_contract
#print axioms justice_fulfilled_without_mercy_countermodel

end Theophysics.AxiomJenga.Round6
