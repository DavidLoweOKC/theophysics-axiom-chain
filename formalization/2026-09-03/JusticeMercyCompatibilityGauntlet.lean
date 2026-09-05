/-!
# Justice–Mercy Compatibility Gauntlet

This declared ledger model distinguishes truthful acknowledgment of a debt from
who bears its cost. It tests logical compatibility, not Christian doctrine.
-/

namespace JusticeMercyCompatibilityGauntlet

inductive Person where | debtor | substitute deriving DecidableEq, Repr

structure Debt where
  amount : Nat
  debtor : Person
  deriving DecidableEq, Repr

structure Settlement where
  debt : Debt
  truthPreserved : Bool
  paidAmount : Nat
  bearer : Person
  deriving DecidableEq, Repr

def JusticeSatisfied (s : Settlement) : Prop :=
  s.truthPreserved = true ∧ s.paidAmount = s.debt.amount

def MercyToDebtor (s : Settlement) : Prop :=
  s.bearer ≠ s.debt.debtor

def compatible : Settlement :=
  { debt := ⟨10, .debtor⟩
    truthPreserved := true
    paidAmount := 10
    bearer := .substitute }

theorem justice_and_mercy_are_jointly_satisfiable :
    JusticeSatisfied compatible ∧ MercyToDebtor compatible := by
  constructor
  · exact ⟨rfl, rfl⟩
  · intro h
    cases h

def denial : Settlement :=
  { debt := ⟨10, .debtor⟩, truthPreserved := false,
    paidAmount := 0, bearer := .debtor }

theorem denial_is_not_justice : ¬ JusticeSatisfied denial := by
  intro h
  cases h.1

def unpaidTransfer : Settlement :=
  { debt := ⟨10, .debtor⟩, truthPreserved := true,
    paidAmount := 0, bearer := .substitute }

theorem changing_bearer_without_payment_is_not_justice :
    MercyToDebtor unpaidTransfer ∧ ¬ JusticeSatisfied unpaidTransfer := by
  constructor
  · intro h
    cases h
  · intro h
    cases h.2

def paidByDebtor : Settlement :=
  { debt := ⟨10, .debtor⟩, truthPreserved := true,
    paidAmount := 10, bearer := .debtor }

theorem justice_does_not_by_itself_entail_mercy :
    JusticeSatisfied paidByDebtor ∧ ¬ MercyToDebtor paidByDebtor := by
  exact ⟨⟨rfl, rfl⟩, by simp [MercyToDebtor, paidByDebtor]⟩

#print axioms justice_and_mercy_are_jointly_satisfiable
#print axioms denial_is_not_justice
#print axioms changing_bearer_without_payment_is_not_justice
#print axioms justice_does_not_by_itself_entail_mercy

end JusticeMercyCompatibilityGauntlet
