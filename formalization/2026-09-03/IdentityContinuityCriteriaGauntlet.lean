/-!
# Identity Continuity Criteria Gauntlet

This abstract model distinguishes identifier, memory, character, and causal
continuity. It tests what follows from individual and combined criteria without
claiming that these are the true metaphysical conditions for resurrection.
-/

namespace IdentityContinuityCriteriaGauntlet

structure State where
  id : Nat
  memory : Nat
  character : Nat
  causalHistory : Nat
  deriving DecidableEq, Repr

def StrongContinuity (a b : State) : Prop :=
  a.id = b.id ∧
  a.memory = b.memory ∧
  a.character = b.character ∧
  a.causalHistory = b.causalHistory

theorem strong_continuity_is_symmetric (a b : State)
    (h : StrongContinuity a b) : StrongContinuity b a := by
  exact ⟨h.1.symm, h.2.1.symm, h.2.2.1.symm, h.2.2.2.symm⟩

theorem strong_continuity_is_transitive (a b c : State)
    (hab : StrongContinuity a b) (hbc : StrongContinuity b c) :
    StrongContinuity a c := by
  exact ⟨hab.1.trans hbc.1,
    hab.2.1.trans hbc.2.1,
    hab.2.2.1.trans hbc.2.2.1,
    hab.2.2.2.trans hbc.2.2.2⟩

def base : State := ⟨1, 10, 20, 30⟩
def sameIdOnly : State := ⟨1, 99, 88, 77⟩
def sameMemoryOnly : State := ⟨2, 10, 88, 77⟩
def sameCharacterOnly : State := ⟨2, 99, 20, 77⟩
def sameCausalOnly : State := ⟨2, 99, 88, 30⟩

theorem identifier_alone_is_insufficient :
    base.id = sameIdOnly.id ∧ ¬ StrongContinuity base sameIdOnly := by
  refine ⟨rfl, ?_⟩
  intro h; cases h.2.1

theorem memory_alone_is_insufficient :
    base.memory = sameMemoryOnly.memory ∧ ¬ StrongContinuity base sameMemoryOnly := by
  refine ⟨rfl, ?_⟩
  intro h; cases h.1

theorem character_alone_is_insufficient :
    base.character = sameCharacterOnly.character ∧
    ¬ StrongContinuity base sameCharacterOnly := by
  refine ⟨rfl, ?_⟩
  intro h; cases h.1

theorem causal_history_alone_is_insufficient :
    base.causalHistory = sameCausalOnly.causalHistory ∧
    ¬ StrongContinuity base sameCausalOnly := by
  refine ⟨rfl, ?_⟩
  intro h; cases h.1

#print axioms strong_continuity_is_symmetric
#print axioms strong_continuity_is_transitive
#print axioms identifier_alone_is_insufficient
#print axioms memory_alone_is_insufficient
#print axioms character_alone_is_insufficient
#print axioms causal_history_alone_is_insufficient

end IdentityContinuityCriteriaGauntlet
