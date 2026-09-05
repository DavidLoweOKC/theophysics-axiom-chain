/-!
# Cost-Bearing Transfer Gauntlet

Transfer of cost is modeled as valid only when debt identity is preserved and
the substitute is authorized, willing, and adequate. These conditions are
declared for testing; Lean does not derive them from physics or theology.
-/

namespace CostBearingTransferGauntlet

structure Transfer where
  debt : Nat
  paid : Nat
  identityPreserved : Bool
  authorized : Bool
  willing : Bool
  deriving DecidableEq, Repr

def ValidTransfer (t : Transfer) : Prop :=
  t.identityPreserved = true ∧
  t.authorized = true ∧
  t.willing = true ∧
  t.paid ≥ t.debt

def valid : Transfer := ⟨10, 10, true, true, true⟩
def unauthorized : Transfer := ⟨10, 10, true, false, true⟩
def unwilling : Transfer := ⟨10, 10, true, true, false⟩
def inadequate : Transfer := ⟨10, 9, true, true, true⟩
def changedDebt : Transfer := ⟨10, 10, false, true, true⟩

theorem all_declared_conditions_suffice : ValidTransfer valid := by
  exact ⟨rfl, rfl, rfl, by decide⟩

theorem authorization_is_load_bearing : ¬ ValidTransfer unauthorized := by
  intro h
  cases h.2.1

theorem willingness_is_load_bearing : ¬ ValidTransfer unwilling := by
  intro h
  cases h.2.2.1

theorem adequacy_is_load_bearing : ¬ ValidTransfer inadequate := by
  intro h
  have impossible : (9 : Nat) ≥ 10 := h.2.2.2
  exact (by decide : ¬ ((9 : Nat) ≥ 10)) impossible

theorem debt_identity_is_load_bearing : ¬ ValidTransfer changedDebt := by
  intro h
  cases h.1

/- Overpayment is permitted by adequacy alone; exact equality would be an
   additional rule, not a consequence of sufficient payment. -/
def overpaid : Transfer := ⟨10, 11, true, true, true⟩

theorem adequacy_does_not_force_exact_payment :
    ValidTransfer overpaid ∧ overpaid.paid ≠ overpaid.debt := by
  exact ⟨⟨rfl, rfl, rfl, by decide⟩, by decide⟩

#print axioms all_declared_conditions_suffice
#print axioms authorization_is_load_bearing
#print axioms willingness_is_load_bearing
#print axioms adequacy_is_load_bearing
#print axioms debt_identity_is_load_bearing
#print axioms adequacy_does_not_force_exact_payment

end CostBearingTransferGauntlet
