/-!
# Liability–Forgiveness Separation Gauntlet

This is a declared accounting model. It tests whether historical occurrence,
present liability, and forgiveness can remain formally distinct.
-/

namespace LiabilityForgivenessSeparationGauntlet

inductive Person where | a | b deriving DecidableEq, Repr
inductive MoralKind where | faithful | harmful deriving DecidableEq, Repr

structure Deed where
  id : Nat
  person : Person
  kind : MoralKind
  deriving DecidableEq, Repr

structure Account where
  history : List Deed
  forgiven : Person → Bool

def deedsFor (a : Account) (p : Person) : List Deed :=
  a.history.filter fun d => d.person == p

def Liable (a : Account) (p : Person) : Prop :=
  a.forgiven p = false ∧ ∃ d, d ∈ deedsFor a p ∧ d.kind = .harmful

def forgive (a : Account) (p : Person) : Account :=
  { history := a.history
    forgiven := fun q => if q == p then true else a.forgiven q }

theorem forgiveness_preserves_history (a : Account) (p : Person) :
    (forgive a p).history = a.history := by rfl

theorem forgiveness_preserves_deed_queries (a : Account) (p q : Person) :
    deedsFor (forgive a p) q = deedsFor a q := by rfl

theorem forgiveness_sets_target_status (a : Account) (p : Person) :
    (forgive a p).forgiven p = true := by
  simp [forgive]

def harmful0 : Deed := ⟨0, .a, .harmful⟩
def initial : Account := ⟨[harmful0], fun _ => false⟩

theorem initially_liable : Liable initial .a := by
  refine ⟨rfl, harmful0, ?_, rfl⟩
  simp [deedsFor, initial, harmful0]

theorem forgiven_person_not_liable : ¬ Liable (forgive initial .a) .a := by
  intro h
  have hf := h.1
  simp [forgive] at hf

theorem forgiven_history_still_contains_harmful_deed :
    harmful0 ∈ deedsFor (forgive initial .a) .a := by
  simp [deedsFor, forgive, initial, harmful0]

/- Deleting a record and forgiving liability are not the same operation. -/
def eraseHistory (a : Account) : Account := { a with history := [] }

theorem erasure_is_not_forgiveness :
    (eraseHistory initial).forgiven .a = false ∧
    (eraseHistory initial).history = [] := by
  exact ⟨rfl, rfl⟩

#print axioms forgiveness_preserves_history
#print axioms forgiveness_preserves_deed_queries
#print axioms forgiveness_sets_target_status
#print axioms initially_liable
#print axioms forgiven_person_not_liable
#print axioms forgiven_history_still_contains_harmful_deed
#print axioms erasure_is_not_forgiveness

end LiabilityForgivenessSeparationGauntlet
