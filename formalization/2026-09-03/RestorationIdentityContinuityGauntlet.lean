/-!
# Restoration–Identity Continuity Gauntlet

This abstract model tests whether substantial restoration can preserve personal
identity. It does not prove resurrection, consciousness continuity, or any
empirical criterion of personal identity.
-/

namespace RestorationIdentityContinuityGauntlet

abbrev PersonId := Nat

structure PersonState where
  id : PersonId
  integrity : Nat
  relationHealth : Nat
  alive : Bool
  deriving DecidableEq, Repr

def SamePerson (before after : PersonState) : Prop := before.id = after.id

def restore (s : PersonState) : PersonState :=
  { id := s.id
    integrity := 100
    relationHealth := 100
    alive := true }

theorem restoration_preserves_declared_identity (s : PersonState) :
    SamePerson s (restore s) := by rfl

def damaged : PersonState := ⟨7, 2, 1, true⟩

theorem restoration_can_change_properties_without_changing_identity :
    SamePerson damaged (restore damaged) ∧
    damaged.integrity ≠ (restore damaged).integrity ∧
    damaged.relationHealth ≠ (restore damaged).relationHealth := by
  exact ⟨rfl, by decide, by decide⟩

/- Matching restored properties do not establish identity. -/
def restoredOther : PersonState := ⟨8, 100, 100, true⟩

theorem property_equality_does_not_entail_personal_identity :
    restoredOther.integrity = (restore damaged).integrity ∧
    restoredOther.relationHealth = (restore damaged).relationHealth ∧
    restoredOther.alive = (restore damaged).alive ∧
    ¬ SamePerson damaged restoredOther := by
  refine ⟨rfl, rfl, rfl, ?_⟩
  intro h
  cases h

/- Identity equality alone does not preserve memory or every property. -/
structure RichState where
  id : PersonId
  memoryCode : Nat
  characterCode : Nat
  deriving DecidableEq, Repr

def sameIdDifferentMemory₁ : RichState := ⟨7, 10, 30⟩
def sameIdDifferentMemory₂ : RichState := ⟨7, 99, 30⟩

theorem identifier_continuity_alone_does_not_entail_memory_continuity :
    sameIdDifferentMemory₁.id = sameIdDifferentMemory₂.id ∧
    sameIdDifferentMemory₁.memoryCode ≠ sameIdDifferentMemory₂.memoryCode := by
  exact ⟨rfl, by decide⟩

#print axioms restoration_preserves_declared_identity
#print axioms restoration_can_change_properties_without_changing_identity
#print axioms property_equality_does_not_entail_personal_identity
#print axioms identifier_continuity_alone_does_not_entail_memory_continuity

end RestorationIdentityContinuityGauntlet
