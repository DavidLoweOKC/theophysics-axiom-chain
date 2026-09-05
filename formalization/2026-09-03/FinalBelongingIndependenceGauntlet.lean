import LiabilityForgivenessSeparationGauntlet
import RestorationReconciliationGauntlet

/-!
# Final-Belonging Independence Gauntlet

This file tests whether deed history, forgiveness, and relational restoration
mathematically determine final belonging. They do not unless an additional
membership rule is declared. This is a theological-model boundary theorem, not
a derivation of doctrine.
-/

namespace FinalBelongingIndependenceGauntlet

open LiabilityForgivenessSeparationGauntlet
open RestorationReconciliationGauntlet

structure CompleteCase where
  account : Account
  relation : RelationalState
  belongs : Person → Bool

def belongsYes : Person → Bool := fun _ => true
def belongsNo : Person → Bool := fun _ => false

def sameAccount : Account := forgive initial .a
def sameRelation : RelationalState := fullRestoration

def positiveCase : CompleteCase := ⟨sameAccount, sameRelation, belongsYes⟩
def negativeCase : CompleteCase := ⟨sameAccount, sameRelation, belongsNo⟩

theorem same_history_forgiveness_and_restoration_allow_opposite_belonging :
    positiveCase.account = negativeCase.account ∧
    positiveCase.relation = negativeCase.relation ∧
    positiveCase.belongs .a ≠ negativeCase.belongs .a := by
  exact ⟨rfl, rfl, by decide⟩

theorem deed_history_does_not_determine_belonging :
    positiveCase.account.history = negativeCase.account.history ∧
    positiveCase.belongs .a ≠ negativeCase.belongs .a := by
  exact ⟨rfl, by decide⟩

theorem forgiveness_status_does_not_determine_belonging :
    positiveCase.account.forgiven .a = negativeCase.account.forgiven .a ∧
    positiveCase.belongs .a ≠ negativeCase.belongs .a := by
  exact ⟨rfl, by decide⟩

theorem restored_relation_does_not_determine_belonging :
    positiveCase.relation = negativeCase.relation ∧
    positiveCase.belongs .a ≠ negativeCase.belongs .a := by
  exact ⟨rfl, by decide⟩

/- Once a membership rule is explicitly supplied, final status is determinate
   relative to that rule. -/
inductive FinalStatus where | included | excluded deriving DecidableEq, Repr

def finalStatus (c : CompleteCase) (p : Person) : FinalStatus :=
  if c.belongs p then .included else .excluded

theorem declared_belonging_yields_included :
    finalStatus positiveCase .a = .included := by rfl

theorem declared_nonbelonging_yields_excluded :
    finalStatus negativeCase .a = .excluded := by rfl

theorem fixed_case_final_status_is_determinate
    (c : CompleteCase) (p : Person) (s₁ s₂ : FinalStatus)
    (h₁ : finalStatus c p = s₁) (h₂ : finalStatus c p = s₂) : s₁ = s₂ := by
  rw [← h₁, ← h₂]

#print axioms same_history_forgiveness_and_restoration_allow_opposite_belonging
#print axioms deed_history_does_not_determine_belonging
#print axioms forgiveness_status_does_not_determine_belonging
#print axioms restored_relation_does_not_determine_belonging
#print axioms declared_belonging_yields_included
#print axioms declared_nonbelonging_yields_excluded
#print axioms fixed_case_final_status_is_determinate

end FinalBelongingIndependenceGauntlet
