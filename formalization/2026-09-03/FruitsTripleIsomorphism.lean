import Mathlib.Data.Fin.Basic
import PhaseStructure
import PhaseStructureMinimality

/-!
# Fruits Triple-Isomorphism Candidate

This file tests one four-role relational pattern in three independently named
finite vocabularies: physical, human-relational, and biblical-Fruits.

The tested pattern is:

* binding plus restoration enables stable organization;
* stable organization and living expression diagnose one another;
* stable organization does not by itself diagnose binding.

Lean checks only the declared finite structures.  It does not establish that
the human predicates are empirically adequate or that the biblical labels are
theologically exhaustive.  The unrelated traffic-light control at the end
shows why those bridge obligations remain external to this formal result.
-/

namespace Theophysics.FruitsTripleIsomorphism

/-! ## Physical certificates imported from the independently tested kernels -/

theorem physical_mode_forces_positive_curvature
    (κ μ ω : ℝ)
    (hMass : 0 ≤ μ)
    (hMode : ω ≠ 0)
    (hDispersion : PhaseStructureMinimality.Dispersion κ μ ω) :
    0 < κ :=
  PhaseStructureMinimality.positive_curvature_of_nonzero_mode_and_nonnegative_mass
    κ μ ω hMass hMode hDispersion

theorem physical_peace_joy_equivalence_in_packaged_model
    (s : PhaseStructure.OscillationData) :
    PhaseStructure.RealNonzeroOscillation s ↔ 0 < s.curvature :=
  PhaseStructure.real_nonzero_oscillation_iff_positive_curvature s

structure RelationalModel where
  Carrier : Type
  binding : Carrier
  restoration : Carrier
  stability : Carrier
  expression : Carrier
  enables : Carrier → Carrier → Carrier → Prop
  diagnoses : Carrier → Carrier → Prop

structure RelationalIso (X Y : RelationalModel) where
  toFun : X.Carrier → Y.Carrier
  invFun : Y.Carrier → X.Carrier
  leftInv : ∀ x, invFun (toFun x) = x
  rightInv : ∀ y, toFun (invFun y) = y
  mapsBinding : toFun X.binding = Y.binding
  mapsRestoration : toFun X.restoration = Y.restoration
  mapsStability : toFun X.stability = Y.stability
  mapsExpression : toFun X.expression = Y.expression
  preservesEnables : ∀ a b c,
    X.enables a b c ↔ Y.enables (toFun a) (toFun b) (toFun c)
  preservesDiagnoses : ∀ a b,
    X.diagnoses a b ↔ Y.diagnoses (toFun a) (toFun b)

inductive PhysicalRole where
  | boundContext | restorativeCondition | stableOrganization | oscillatoryMode
deriving DecidableEq

inductive HumanRole where
  | secureAttachment | restorativeRegulation | regulatedEquilibrium | livingJoy
deriving DecidableEq

inductive FruitRole where
  | love | restoration | peace | joy
deriving DecidableEq

def physicalEnables (a b c : PhysicalRole) : Prop :=
  a = .boundContext ∧ b = .restorativeCondition ∧ c = .stableOrganization

def physicalDiagnoses (a b : PhysicalRole) : Prop :=
  (a = .stableOrganization ∧ b = .oscillatoryMode) ∨
  (a = .oscillatoryMode ∧ b = .stableOrganization)

def humanEnables (a b c : HumanRole) : Prop :=
  a = .secureAttachment ∧ b = .restorativeRegulation ∧ c = .regulatedEquilibrium

def humanDiagnoses (a b : HumanRole) : Prop :=
  (a = .regulatedEquilibrium ∧ b = .livingJoy) ∨
  (a = .livingJoy ∧ b = .regulatedEquilibrium)

def fruitEnables (a b c : FruitRole) : Prop :=
  a = .love ∧ b = .restoration ∧ c = .peace

def fruitDiagnoses (a b : FruitRole) : Prop :=
  (a = .peace ∧ b = .joy) ∨ (a = .joy ∧ b = .peace)

def physicalModel : RelationalModel where
  Carrier := PhysicalRole
  binding := .boundContext
  restoration := .restorativeCondition
  stability := .stableOrganization
  expression := .oscillatoryMode
  enables := physicalEnables
  diagnoses := physicalDiagnoses

def humanModel : RelationalModel where
  Carrier := HumanRole
  binding := .secureAttachment
  restoration := .restorativeRegulation
  stability := .regulatedEquilibrium
  expression := .livingJoy
  enables := humanEnables
  diagnoses := humanDiagnoses

def fruitModel : RelationalModel where
  Carrier := FruitRole
  binding := .love
  restoration := .restoration
  stability := .peace
  expression := .joy
  enables := fruitEnables
  diagnoses := fruitDiagnoses

def physicalToHuman : PhysicalRole → HumanRole
  | .boundContext => .secureAttachment
  | .restorativeCondition => .restorativeRegulation
  | .stableOrganization => .regulatedEquilibrium
  | .oscillatoryMode => .livingJoy

def humanToPhysical : HumanRole → PhysicalRole
  | .secureAttachment => .boundContext
  | .restorativeRegulation => .restorativeCondition
  | .regulatedEquilibrium => .stableOrganization
  | .livingJoy => .oscillatoryMode

def humanToFruit : HumanRole → FruitRole
  | .secureAttachment => .love
  | .restorativeRegulation => .restoration
  | .regulatedEquilibrium => .peace
  | .livingJoy => .joy

def fruitToHuman : FruitRole → HumanRole
  | .love => .secureAttachment
  | .restoration => .restorativeRegulation
  | .peace => .regulatedEquilibrium
  | .joy => .livingJoy

def physicalToFruit : PhysicalRole → FruitRole
  | .boundContext => .love
  | .restorativeCondition => .restoration
  | .stableOrganization => .peace
  | .oscillatoryMode => .joy

def fruitToPhysical : FruitRole → PhysicalRole
  | .love => .boundContext
  | .restoration => .restorativeCondition
  | .peace => .stableOrganization
  | .joy => .oscillatoryMode

def physicalHumanIso : RelationalIso physicalModel humanModel where
  toFun := physicalToHuman
  invFun := humanToPhysical
  leftInv := by intro x; cases x <;> rfl
  rightInv := by intro x; cases x <;> rfl
  mapsBinding := rfl
  mapsRestoration := rfl
  mapsStability := rfl
  mapsExpression := rfl
  preservesEnables := by intro a b c; cases a <;> cases b <;> cases c <;> simp [physicalModel, humanModel, physicalEnables, humanEnables, physicalToHuman]
  preservesDiagnoses := by intro a b; cases a <;> cases b <;> simp [physicalModel, humanModel, physicalDiagnoses, humanDiagnoses, physicalToHuman]

def humanFruitIso : RelationalIso humanModel fruitModel where
  toFun := humanToFruit
  invFun := fruitToHuman
  leftInv := by intro x; cases x <;> rfl
  rightInv := by intro x; cases x <;> rfl
  mapsBinding := rfl
  mapsRestoration := rfl
  mapsStability := rfl
  mapsExpression := rfl
  preservesEnables := by intro a b c; cases a <;> cases b <;> cases c <;> simp [humanModel, fruitModel, humanEnables, fruitEnables, humanToFruit]
  preservesDiagnoses := by intro a b; cases a <;> cases b <;> simp [humanModel, fruitModel, humanDiagnoses, fruitDiagnoses, humanToFruit]

def physicalFruitIso : RelationalIso physicalModel fruitModel where
  toFun := physicalToFruit
  invFun := fruitToPhysical
  leftInv := by intro x; cases x <;> rfl
  rightInv := by intro x; cases x <;> rfl
  mapsBinding := rfl
  mapsRestoration := rfl
  mapsStability := rfl
  mapsExpression := rfl
  preservesEnables := by intro a b c; cases a <;> cases b <;> cases c <;> simp [physicalModel, fruitModel, physicalEnables, fruitEnables, physicalToFruit]
  preservesDiagnoses := by intro a b; cases a <;> cases b <;> simp [physicalModel, fruitModel, physicalDiagnoses, fruitDiagnoses, physicalToFruit]

theorem triple_candidate_exists :
    Nonempty (RelationalIso physicalModel humanModel) ∧
    Nonempty (RelationalIso humanModel fruitModel) ∧
    Nonempty (RelationalIso physicalModel fruitModel) :=
  ⟨⟨physicalHumanIso⟩, ⟨humanFruitIso⟩, ⟨physicalFruitIso⟩⟩

theorem triangle_commutes (x : PhysicalRole) :
    humanToFruit (physicalToHuman x) = physicalToFruit x := by
  cases x <;> rfl

theorem peace_joy_bidirectional_in_fruit_model :
    fruitModel.diagnoses fruitModel.stability fruitModel.expression ∧
    fruitModel.diagnoses fruitModel.expression fruitModel.stability := by
  constructor <;> simp [fruitModel, fruitDiagnoses]

theorem peace_does_not_diagnose_love_in_fruit_model :
    ¬ fruitModel.diagnoses fruitModel.stability fruitModel.binding := by
  simp [fruitModel, fruitDiagnoses]

/-! A wrong role assignment is rejected even though the carrier sizes match. -/
def wrongPhysicalToHuman : PhysicalRole → HumanRole
  | .boundContext => .secureAttachment
  | .restorativeCondition => .restorativeRegulation
  | .stableOrganization => .livingJoy
  | .oscillatoryMode => .regulatedEquilibrium

theorem wrong_role_map_rejected :
    ¬ ∃ iso : RelationalIso physicalModel humanModel,
        iso.toFun = wrongPhysicalToHuman := by
  rintro ⟨iso, hMap⟩
  have h := iso.mapsStability
  rw [hMap] at h
  cases h

/-! A same-cardinality structure with one extra diagnostic edge is rejected. -/
def brokenHumanDiagnoses (a b : HumanRole) : Prop :=
  humanDiagnoses a b ∨ (a = .livingJoy ∧ b = .secureAttachment)

def brokenHumanModel : RelationalModel :=
  { humanModel with diagnoses := brokenHumanDiagnoses }

theorem extra_relation_spoiler_rejected :
    ¬ ∃ iso : RelationalIso physicalModel brokenHumanModel,
        iso.toFun = physicalToHuman := by
  rintro ⟨iso, hMap⟩
  have h := iso.preservesDiagnoses PhysicalRole.oscillatoryMode PhysicalRole.boundContext
  rw [hMap] at h
  have bad : physicalDiagnoses .oscillatoryMode .boundContext := h.mpr (by
    right
    exact ⟨rfl, rfl⟩)
  simpa [physicalDiagnoses] using bad

/-!
Semantic false-positive boundary: an unrelated four-state traffic vocabulary
with the identical declared relation graph also passes.  Lean therefore proves
the structural isomorphism of the encodings, not the truth of their labels.
-/
inductive TrafficRole where
  | road | repairCrew | steadyFlow | movingCars
deriving DecidableEq

def trafficEnables (a b c : TrafficRole) : Prop :=
  a = .road ∧ b = .repairCrew ∧ c = .steadyFlow

def trafficDiagnoses (a b : TrafficRole) : Prop :=
  (a = .steadyFlow ∧ b = .movingCars) ∨
  (a = .movingCars ∧ b = .steadyFlow)

def trafficModel : RelationalModel where
  Carrier := TrafficRole
  binding := .road
  restoration := .repairCrew
  stability := .steadyFlow
  expression := .movingCars
  enables := trafficEnables
  diagnoses := trafficDiagnoses

def physicalToTraffic : PhysicalRole → TrafficRole
  | .boundContext => .road
  | .restorativeCondition => .repairCrew
  | .stableOrganization => .steadyFlow
  | .oscillatoryMode => .movingCars

def trafficToPhysical : TrafficRole → PhysicalRole
  | .road => .boundContext
  | .repairCrew => .restorativeCondition
  | .steadyFlow => .stableOrganization
  | .movingCars => .oscillatoryMode

def unrelated_clone_also_passes : RelationalIso physicalModel trafficModel where
  toFun := physicalToTraffic
  invFun := trafficToPhysical
  leftInv := by intro x; cases x <;> rfl
  rightInv := by intro x; cases x <;> rfl
  mapsBinding := rfl
  mapsRestoration := rfl
  mapsStability := rfl
  mapsExpression := rfl
  preservesEnables := by intro a b c; cases a <;> cases b <;> cases c <;> simp [physicalModel, trafficModel, physicalEnables, trafficEnables, physicalToTraffic]
  preservesDiagnoses := by intro a b; cases a <;> cases b <;> simp [physicalModel, trafficModel, physicalDiagnoses, trafficDiagnoses, physicalToTraffic]

#print axioms triple_candidate_exists
#print axioms physical_mode_forces_positive_curvature
#print axioms physical_peace_joy_equivalence_in_packaged_model
#print axioms triangle_commutes
#print axioms wrong_role_map_rejected
#print axioms extra_relation_spoiler_rejected
#print axioms unrelated_clone_also_passes

end Theophysics.FruitsTripleIsomorphism
