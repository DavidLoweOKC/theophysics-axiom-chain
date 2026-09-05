import LiabilityForgivenessSeparationGauntlet

/-!
# Restoration–Reconciliation Gauntlet

Forgiveness, repaired relationship, and restored participation are modeled as
different state variables. The file tests which implications fail without an
explicit reconciliation bridge.
-/

namespace RestorationReconciliationGauntlet

open LiabilityForgivenessSeparationGauntlet

structure RelationalState where
  forgiven : Bool
  truthAcknowledged : Bool
  repairAccepted : Bool
  communionRestored : Bool
  deriving DecidableEq, Repr

def Reconciled (s : RelationalState) : Prop :=
  s.forgiven = true ∧
  s.truthAcknowledged = true ∧
  s.repairAccepted = true ∧
  s.communionRestored = true

def forgivenOnly : RelationalState := ⟨true, false, false, false⟩
def truthWithoutForgiveness : RelationalState := ⟨false, true, true, false⟩
def fullRestoration : RelationalState := ⟨true, true, true, true⟩

theorem forgiveness_alone_does_not_entail_reconciliation :
    forgivenOnly.forgiven = true ∧ ¬ Reconciled forgivenOnly := by
  simp [forgivenOnly, Reconciled]

theorem truth_and_repair_without_forgiveness_do_not_entail_reconciliation :
    truthWithoutForgiveness.truthAcknowledged = true ∧
    truthWithoutForgiveness.repairAccepted = true ∧
    ¬ Reconciled truthWithoutForgiveness := by
  simp [truthWithoutForgiveness, Reconciled]

theorem full_restoration_is_reconciled : Reconciled fullRestoration := by
  exact ⟨rfl, rfl, rfl, rfl⟩

theorem reconciliation_implies_forgiveness (s : RelationalState)
    (h : Reconciled s) : s.forgiven = true := h.1

theorem reconciliation_implies_truth_acknowledged (s : RelationalState)
    (h : Reconciled s) : s.truthAcknowledged = true := h.2.1

/- Reconciliation does not erase historical identity. -/
structure RestoredHistory where
  deeds : List Deed
  relation : RelationalState

def restoreRelation (h : RestoredHistory) : RestoredHistory :=
  { deeds := h.deeds, relation := fullRestoration }

theorem restoration_preserves_historical_deeds (h : RestoredHistory) :
    (restoreRelation h).deeds = h.deeds := by rfl

#print axioms forgiveness_alone_does_not_entail_reconciliation
#print axioms truth_and_repair_without_forgiveness_do_not_entail_reconciliation
#print axioms full_restoration_is_reconciled
#print axioms reconciliation_implies_forgiveness
#print axioms reconciliation_implies_truth_acknowledged
#print axioms restoration_preserves_historical_deeds

end RestorationReconciliationGauntlet
