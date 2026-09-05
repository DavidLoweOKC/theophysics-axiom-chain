/-!
# Accountability Boundary Gauntlet

This file tests a capacity-based accountability boundary. It does not derive
morality from physics, identify consciousness with a physical measurement, or
establish any theological doctrine.

The formal question is narrower: given a declared accountability rule, which
capacities are load-bearing, and can chronological age alone determine the
result?
-/

namespace AccountabilityBoundaryGauntlet

structure CapacityProfile where
  aware : Bool
  understandsNorm : Bool
  hasMeaningfulAlternative : Bool
  hasRelevantControl : Bool
  attributable : Bool
  deriving DecidableEq, Repr

def Accountable (p : CapacityProfile) : Prop :=
  p.aware = true ∧
  p.understandsNorm = true ∧
  p.hasMeaningfulAlternative = true ∧
  p.hasRelevantControl = true ∧
  p.attributable = true

theorem accountable_iff_all_declared_capacities (p : CapacityProfile) :
    Accountable p ↔
      p.aware = true ∧
      p.understandsNorm = true ∧
      p.hasMeaningfulAlternative = true ∧
      p.hasRelevantControl = true ∧
      p.attributable = true := by
  rfl

def full : CapacityProfile := ⟨true, true, true, true, true⟩
def noAwareness : CapacityProfile := ⟨false, true, true, true, true⟩
def noNormUnderstanding : CapacityProfile := ⟨true, false, true, true, true⟩
def noAlternative : CapacityProfile := ⟨true, true, false, true, true⟩
def noControl : CapacityProfile := ⟨true, true, true, false, true⟩
def noAttribution : CapacityProfile := ⟨true, true, true, true, false⟩

theorem full_profile_is_accountable : Accountable full := by
  simp [Accountable, full]
theorem awareness_is_load_bearing : ¬ Accountable noAwareness := by
  simp [Accountable, noAwareness]
theorem norm_understanding_is_load_bearing : ¬ Accountable noNormUnderstanding := by
  simp [Accountable, noNormUnderstanding]
theorem meaningful_alternative_is_load_bearing : ¬ Accountable noAlternative := by
  simp [Accountable, noAlternative]
theorem relevant_control_is_load_bearing : ¬ Accountable noControl := by
  simp [Accountable, noControl]
theorem attribution_is_load_bearing : ¬ Accountable noAttribution := by
  simp [Accountable, noAttribution]

/- A physical record can be present while the declared accountability
   capacities are absent. Record formation alone therefore does not entail
   moral accountability in this model. -/
structure RecordedCase where
  hasPhysicalRecord : Bool
  capacities : CapacityProfile
  deriving DecidableEq, Repr

def recordedButNotAccountable : RecordedCase :=
  { hasPhysicalRecord := true, capacities := noNormUnderstanding }

theorem physical_record_does_not_entail_accountability :
    recordedButNotAccountable.hasPhysicalRecord = true ∧
    ¬ Accountable recordedButNotAccountable.capacities := by
  simp [recordedButNotAccountable, noNormUnderstanding, Accountable]

/- Awareness is necessary in the declared rule but is not sufficient. -/
def awareButNotAccountable : CapacityProfile :=
  ⟨true, false, false, false, true⟩

theorem awareness_alone_is_insufficient :
    awareButNotAccountable.aware = true ∧
    ¬ Accountable awareButNotAccountable := by
  simp [awareButNotAccountable, Accountable]

/- Chronological age is metadata, not the accountability rule. These witnesses
   show that a single age does not settle capacity, and different ages can
   share the same accountable profile. -/
structure PersonState where
  age : Nat
  capacities : CapacityProfile
  deriving DecidableEq, Repr

def sameAgeReady : PersonState := ⟨12, full⟩
def sameAgeNotReady : PersonState := ⟨12, noNormUnderstanding⟩
def youngerReady : PersonState := ⟨10, full⟩
def olderReady : PersonState := ⟨40, full⟩

theorem same_age_can_have_opposite_accountability_status :
    sameAgeReady.age = sameAgeNotReady.age ∧
    Accountable sameAgeReady.capacities ∧
    ¬ Accountable sameAgeNotReady.capacities := by
  simp [sameAgeReady, sameAgeNotReady, full, noNormUnderstanding, Accountable]

theorem different_ages_can_share_accountability_status :
    youngerReady.age ≠ olderReady.age ∧
    Accountable youngerReady.capacities ∧
    Accountable olderReady.capacities := by
  simp [youngerReady, olderReady, full, Accountable]

/- Even a perfect event ledger cannot manufacture a normative classification.
   The same recorded event may receive different classifications unless a
   moral reader is independently supplied. -/
inductive MoralClass where
  | permitted
  | forbidden
  deriving DecidableEq, Repr

abbrev EventId := Nat
abbrev MoralReader := EventId → MoralClass

def permissiveReader : MoralReader := fun _ => .permitted
def prohibitiveReader : MoralReader := fun _ => .forbidden

theorem same_event_record_allows_opposite_moral_readings :
    permissiveReader 7 ≠ prohibitiveReader 7 := by
  decide

#print axioms accountable_iff_all_declared_capacities
#print axioms full_profile_is_accountable
#print axioms awareness_is_load_bearing
#print axioms norm_understanding_is_load_bearing
#print axioms meaningful_alternative_is_load_bearing
#print axioms relevant_control_is_load_bearing
#print axioms attribution_is_load_bearing
#print axioms physical_record_does_not_entail_accountability
#print axioms awareness_alone_is_insufficient
#print axioms same_age_can_have_opposite_accountability_status
#print axioms different_ages_can_share_accountability_status
#print axioms same_event_record_allows_opposite_moral_readings

end AccountabilityBoundaryGauntlet
