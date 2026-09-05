/-!
# Substitution Legitimacy Gauntlet

Mathematical cost transfer is not automatically morally legitimate. This model
declares additional authorization, consent, adequacy, and non-duplication gates
and tests each independently.
-/

namespace SubstitutionLegitimacyGauntlet

structure Substitution where
  debt : Nat
  payment : Nat
  creditorAuthorizes : Bool
  substituteConsents : Bool
  debtorReleased : Bool
  debtorChargedAgain : Bool
  deriving DecidableEq, Repr

def Legitimate (s : Substitution) : Prop :=
  s.creditorAuthorizes = true ∧
  s.substituteConsents = true ∧
  s.payment ≥ s.debt ∧
  s.debtorReleased = true ∧
  s.debtorChargedAgain = false

def lawful : Substitution := ⟨10, 10, true, true, true, false⟩
def unauthorized : Substitution := ⟨10, 10, false, true, true, false⟩
def coerced : Substitution := ⟨10, 10, true, false, true, false⟩
def unpaid : Substitution := ⟨10, 0, true, true, true, false⟩
def unreleased : Substitution := ⟨10, 10, true, true, false, false⟩
def doubleCharged : Substitution := ⟨10, 10, true, true, true, true⟩

theorem declared_conditions_are_jointly_sufficient : Legitimate lawful := by
  exact ⟨rfl, rfl, by decide, rfl, rfl⟩

theorem creditor_authorization_is_load_bearing : ¬ Legitimate unauthorized := by
  intro h; cases h.1

theorem substitute_consent_is_load_bearing : ¬ Legitimate coerced := by
  intro h; cases h.2.1

theorem adequate_payment_is_load_bearing : ¬ Legitimate unpaid := by
  intro h
  exact (by decide : ¬ ((0 : Nat) ≥ 10)) h.2.2.1

theorem debtor_release_is_load_bearing : ¬ Legitimate unreleased := by
  intro h; cases h.2.2.2.1

theorem no_double_charge_is_load_bearing : ¬ Legitimate doubleCharged := by
  intro h; cases h.2.2.2.2

#print axioms declared_conditions_are_jointly_sufficient
#print axioms creditor_authorization_is_load_bearing
#print axioms substitute_consent_is_load_bearing
#print axioms adequate_payment_is_load_bearing
#print axioms debtor_release_is_load_bearing
#print axioms no_double_charge_is_load_bearing

end SubstitutionLegitimacyGauntlet
