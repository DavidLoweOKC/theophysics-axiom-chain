import MoralAssessmentBridgeGauntlet

/-!
# Temporal Final-Accounting Gauntlet

This file asks what is required for a morally assessed record present at one
epoch to remain available at a later accounting epoch. It proves conditional
retention results and countermodels. It does not prove physical permanence,
divine judgment, or the identity of any ledger with a biblical book.
-/

namespace TemporalFinalAccountingGauntlet

open MoralAssessmentBridgeGauntlet

abbrev Epoch := Nat

structure AssessmentRecord where
  eventId : Nat
  agent : Agent
  verdict : Verdict
  deriving DecidableEq, Repr

structure TemporalLedger where
  recordsAt : Epoch → List AssessmentRecord

def PresentAt (ledger : TemporalLedger) (epoch : Epoch)
    (record : AssessmentRecord) : Prop :=
  record ∈ ledger.recordsAt epoch

def RetainedFromTo (ledger : TemporalLedger) (start finish : Epoch) : Prop :=
  ∀ record, PresentAt ledger start record → PresentAt ledger finish record

def CompleteAtFinalFor (ledger : TemporalLedger) (start final : Epoch) : Prop :=
  ∀ record, PresentAt ledger start record → PresentAt ledger final record

theorem explicit_retention_is_sufficient_for_final_availability
    (ledger : TemporalLedger) (start final : Epoch)
    (retained : RetainedFromTo ledger start final) :
    CompleteAtFinalFor ledger start final := by
  exact retained

def record0 : AssessmentRecord := ⟨0, .a, .forbidden⟩

/- The record exists at epoch zero and is absent at epoch one. -/
def erasedLedger : TemporalLedger where
  recordsAt := fun epoch => if epoch = 0 then [record0] else []

theorem initial_assessment_does_not_entail_later_availability :
    PresentAt erasedLedger 0 record0 ∧
    ¬ PresentAt erasedLedger 1 record0 := by
  constructor
  · simp [PresentAt, erasedLedger]
  · simp [PresentAt, erasedLedger]

theorem temporal_order_does_not_entail_retention :
    (0 : Epoch) < 1 ∧
    ¬ RetainedFromTo erasedLedger 0 1 := by
  constructor
  · decide
  · intro retained
    have atZero : PresentAt erasedLedger 0 record0 := by
      simp [PresentAt, erasedLedger]
    have atOne := retained record0 atZero
    have notAtOne : ¬ PresentAt erasedLedger 1 record0 := by
      simp [PresentAt, erasedLedger]
    exact notAtOne atOne

/- Finite duplication at one epoch is still not temporal permanence. -/
structure RedundantRecord where
  record : AssessmentRecord
  copies : Nat

def manyCopiesNow : RedundantRecord := ⟨record0, 1000⟩

theorem snapshot_redundancy_does_not_entail_future_record :
    manyCopiesNow.copies > 0 ∧
    PresentAt erasedLedger 0 manyCopiesNow.record ∧
    ¬ PresentAt erasedLedger 1 manyCopiesNow.record := by
  constructor
  · decide
  · constructor
    · simp [manyCopiesNow, PresentAt, erasedLedger]
    · simp [manyCopiesNow, PresentAt, erasedLedger]

/- A monotone-retention law is strong enough to preserve every earlier record
   at every later epoch. -/
def MonotoneRetention (ledger : TemporalLedger) : Prop :=
  ∀ record start finish,
    start ≤ finish →
    PresentAt ledger start record →
    PresentAt ledger finish record

theorem monotone_retention_yields_final_completeness
    (ledger : TemporalLedger)
    (law : MonotoneRetention ledger)
    (start final : Epoch)
    (ordered : start ≤ final) :
    CompleteAtFinalFor ledger start final := by
  intro record present
  exact law record start final ordered present

/- Perfect retention preserves whatever verdict was recorded; it does not prove
   that the original moral standard was true. -/
def wrongStandardRecord : AssessmentRecord := ⟨0, .a, .permitted⟩

def permanentWrongLedger : TemporalLedger where
  recordsAt := fun _ => [wrongStandardRecord]

theorem permanence_does_not_validate_verdict :
    MonotoneRetention permanentWrongLedger ∧
    (wrongStandardRecord.verdict = .permitted) := by
  constructor
  · intro record start finish ordered present
    simpa [PresentAt, permanentWrongLedger] using present
  · rfl

#print axioms explicit_retention_is_sufficient_for_final_availability
#print axioms initial_assessment_does_not_entail_later_availability
#print axioms temporal_order_does_not_entail_retention
#print axioms snapshot_redundancy_does_not_entail_future_record
#print axioms monotone_retention_yields_final_completeness
#print axioms permanence_does_not_validate_verdict

end TemporalFinalAccountingGauntlet
