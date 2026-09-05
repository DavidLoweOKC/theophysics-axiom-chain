import AccountabilityBoundaryGauntlet

/-!
# Moral Assessment Bridge Gauntlet

This file tests the smallest bridge from a physically recorded event to a
morally assessable act. Moral content is supplied by an independent standard;
it is not derived from the physical trace.
-/

namespace MoralAssessmentBridgeGauntlet

open AccountabilityBoundaryGauntlet

inductive Agent where
  | a | b
  deriving DecidableEq, Repr

structure Event where
  id : Nat
  agent : Agent
  deriving DecidableEq, Repr

structure Trace where
  eventId : Nat
  attributedAgent : Agent
  deriving DecidableEq, Repr

def TraceMatches (event : Event) (trace : Trace) : Prop :=
  trace.eventId = event.id ∧ trace.attributedAgent = event.agent

structure Case where
  event : Event
  trace : Trace
  capacities : CapacityProfile

def MorallyAssessable (c : Case) : Prop :=
  TraceMatches c.event c.trace ∧ Accountable c.capacities

inductive Verdict where
  | permitted
  | forbidden
  deriving DecidableEq, Repr

abbrev MoralStandard := Event → Verdict

def assess (standard : MoralStandard) (c : Case) : Option Verdict :=
  if c.trace.eventId = c.event.id &&
     c.trace.attributedAgent == c.event.agent &&
     c.capacities.aware &&
     c.capacities.understandsNorm &&
     c.capacities.hasMeaningfulAlternative &&
     c.capacities.hasRelevantControl &&
     c.capacities.attributable
  then some (standard c.event)
  else none

def event0 : Event := ⟨0, .a⟩
def trace0 : Trace := ⟨0, .a⟩
def fullCase : Case := ⟨event0, trace0, full⟩

def forbidAll : MoralStandard := fun _ => .forbidden
def permitAll : MoralStandard := fun _ => .permitted

theorem complete_bridge_yields_assessment :
    assess forbidAll fullCase = some .forbidden := by
  rfl

theorem same_fact_pattern_different_standards_yield_opposite_verdicts :
    assess forbidAll fullCase = some .forbidden ∧
    assess permitAll fullCase = some .permitted := by
  exact ⟨rfl, rfl⟩

/- Without a matching record, there is no assessment. -/
def wrongEventTrace : Trace := ⟨1, .a⟩
def wrongEventCase : Case := ⟨event0, wrongEventTrace, full⟩

theorem event_identity_is_load_bearing :
    assess forbidAll wrongEventCase = none := by
  rfl

/- A trace of the event attributed to the wrong agent is insufficient. -/
def wrongAgentTrace : Trace := ⟨0, .b⟩
def wrongAgentCase : Case := ⟨event0, wrongAgentTrace, full⟩

theorem agent_attribution_is_load_bearing :
    assess forbidAll wrongAgentCase = none := by
  rfl

def noAwarenessCase : Case := ⟨event0, trace0, noAwareness⟩
def noNormCase : Case := ⟨event0, trace0, noNormUnderstanding⟩
def noAlternativeCase : Case := ⟨event0, trace0, noAlternative⟩
def noControlCase : Case := ⟨event0, trace0, noControl⟩

theorem awareness_is_load_bearing : assess forbidAll noAwarenessCase = none := by rfl
theorem norm_understanding_is_load_bearing : assess forbidAll noNormCase = none := by rfl
theorem meaningful_alternative_is_load_bearing : assess forbidAll noAlternativeCase = none := by rfl
theorem relevant_control_is_load_bearing : assess forbidAll noControlCase = none := by rfl

/- The bridge produces an assessment only because a standard was passed in.
   Lean verifies determinacy relative to that standard, not the truth of the
   standard itself. -/
theorem fixed_standard_fixed_case_is_determinate
    (standard : MoralStandard) (c : Case) (v₁ v₂ : Verdict)
    (h₁ : assess standard c = some v₁)
    (h₂ : assess standard c = some v₂) :
    v₁ = v₂ := by
  rw [h₁] at h₂
  exact Option.some.inj h₂

#print axioms complete_bridge_yields_assessment
#print axioms same_fact_pattern_different_standards_yield_opposite_verdicts
#print axioms event_identity_is_load_bearing
#print axioms agent_attribution_is_load_bearing
#print axioms awareness_is_load_bearing
#print axioms norm_understanding_is_load_bearing
#print axioms meaningful_alternative_is_load_bearing
#print axioms relevant_control_is_load_bearing
#print axioms fixed_standard_fixed_case_is_determinate

end MoralAssessmentBridgeGauntlet
