/-!
# Grace–Justice Compatibility Gauntlet

This ledger model distinguishes arbitrary cancellation from release grounded in
an adequate settlement. It tests internal compatibility only.
-/

namespace GraceJusticeCompatibilityGauntlet

structure Case where
  debt : Nat
  paid : Nat
  truthPreserved : Bool
  debtorCondemned : Bool
  deriving DecidableEq, Repr

def JusticeSatisfied (c : Case) : Prop :=
  c.truthPreserved = true ∧ c.paid ≥ c.debt

def GraceToDebtor (c : Case) : Prop := c.debtorCondemned = false

def settledGrace : Case := ⟨10, 10, true, false⟩
def arbitraryRelease : Case := ⟨10, 0, true, false⟩
def concealedRelease : Case := ⟨10, 0, false, false⟩
def justCondemnation : Case := ⟨10, 10, true, true⟩

theorem grace_and_justice_are_jointly_satisfiable :
    GraceToDebtor settledGrace ∧ JusticeSatisfied settledGrace := by
  exact ⟨rfl, ⟨rfl, by decide⟩⟩

theorem arbitrary_release_does_not_satisfy_justice :
    GraceToDebtor arbitraryRelease ∧ ¬ JusticeSatisfied arbitraryRelease := by
  refine ⟨rfl, ?_⟩
  intro h
  exact (by decide : ¬ ((0 : Nat) ≥ 10)) h.2

theorem concealment_is_neither_truthful_justice_nor_payment :
    GraceToDebtor concealedRelease ∧ ¬ JusticeSatisfied concealedRelease := by
  refine ⟨rfl, ?_⟩
  intro h; cases h.1

theorem justice_satisfaction_alone_does_not_force_grace :
    JusticeSatisfied justCondemnation ∧ ¬ GraceToDebtor justCondemnation := by
  refine ⟨⟨rfl, by decide⟩, ?_⟩
  intro h; cases h

theorem same_debt_and_payment_allow_opposite_condemnation_status :
    settledGrace.debt = justCondemnation.debt ∧
    settledGrace.paid = justCondemnation.paid ∧
    settledGrace.truthPreserved = justCondemnation.truthPreserved ∧
    settledGrace.debtorCondemned ≠ justCondemnation.debtorCondemned := by
  exact ⟨rfl, rfl, rfl, by decide⟩

#print axioms grace_and_justice_are_jointly_satisfiable
#print axioms arbitrary_release_does_not_satisfy_justice
#print axioms concealment_is_neither_truthful_justice_nor_payment
#print axioms justice_satisfaction_alone_does_not_force_grace
#print axioms same_debt_and_payment_allow_opposite_condemnation_status

end GraceJusticeCompatibilityGauntlet
