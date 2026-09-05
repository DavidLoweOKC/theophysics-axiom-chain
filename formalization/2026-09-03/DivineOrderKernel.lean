import Mathlib.Data.Real.Basic

/-!
# Divine Order Kernel — semantic checkpoint

This file contains data structures only for the first semantic review. It does
not identify the structures with theological terms and does not claim a
derivation. The intended labels `Peace`, `Joy`, `Justice`, `Mercy`, and `Cross`
remain bridge-level candidates until the structures are approved.
-/

namespace Theophysics.DivineOrderKernel

/-! ## Local equilibrium data -/

/-- Local data for a one-dimensional effective potential at a candidate radius. -/
structure LocalPotentialData where
  radius : ℝ
  potentialValue : ℝ
  firstDerivative : ℝ
  secondDerivative : ℝ
  reducedMass : ℝ
  radiusPositive : 0 < radius
  reducedMassPositive : 0 < reducedMass

/-- A stationary point records the actual vanishing first derivative. -/
structure StationaryPoint extends LocalPotentialData where
  stationary : firstDerivative = 0

/-- A stable local equilibrium is stationary and has positive curvature. -/
structure StableEquilibrium extends StationaryPoint where
  positiveCurvature : 0 < secondDerivative

/-- The squared small-oscillation frequency supplied by an equilibrium model. -/
noncomputable def frequencySquared (e : StableEquilibrium) : ℝ :=
  e.secondDerivative / e.reducedMass

/-- A real normal mode is witnessed by an actual nonnegative real frequency. -/
structure RealNormalMode (e : StableEquilibrium) where
  omega : ℝ
  omegaPositive : 0 < omega
  square_eq_frequencySquared : omega ^ 2 = frequencySquared e

/-- Stationarity without positive curvature; a candidate for apparent calm. -/
structure NonstableStationaryPoint extends StationaryPoint where
  nonpositiveCurvature : secondDerivative ≤ 0

/-! ## Violation and payment ledger -/

/-- A concrete moral-accounting event involving distinguishable persons. -/
structure ViolationEvent (Person : Type*) where
  offender : Person
  injuredParty : Person
  judge : Person
  offender_ne_injured : offender ≠ injuredParty

/--
Payment allocation for a real positive cost.

`alpha` is the offender-paid fraction. The two endpoint candidates are:
* `alpha = 1`: offender bears the whole cost;
* `alpha = 0`: another bearer bears the whole cost.

The ledger does not yet call either endpoint Justice or Mercy.
-/
structure ResponseLedger (Person : Type*) where
  event : ViolationEvent Person
  cost : ℝ
  costPositive : 0 < cost
  alpha : ℝ
  alphaNonnegative : 0 ≤ alpha
  offenderPayment : ℝ
  otherPayment : ℝ
  offenderPayment_eq : offenderPayment = alpha * cost
  otherPayment_eq : otherPayment = (1 - alpha) * cost
  paymentConserved : offenderPayment + otherPayment = cost
  otherPayer : Person

/-- The non-vengeful restoration range restricts the offender fraction to at most one. -/
structure ViolationLedger (Person : Type*) extends ResponseLedger Person where
  alphaAtMostOne : alpha ≤ 1

/-- Candidate endpoint corresponding to full offender payment. -/
def OffenderPaysInFull {Person : Type*} (ledger : ViolationLedger Person) : Prop :=
  ledger.alpha = 1

/-- Candidate endpoint corresponding to full payment by another bearer. -/
def OtherPaysInFull {Person : Type*} (ledger : ViolationLedger Person) : Prop :=
  ledger.alpha = 0 ∧ ledger.otherPayer ≠ ledger.event.offender

/-- Vengeance is representable outside the restorative interval. -/
def Vengeance {Person : Type*} (ledger : ResponseLedger Person) : Prop :=
  1 < ledger.alpha

/--
Relational predicates are parameters, not `True` placeholders. Their theological
adequacy must be supplied and reviewed outside this kernel.
-/
structure RepairContext (Person : Type*) where
  authorizedToJudge : Person → ViolationEvent Person → Prop
  paysVoluntarily : Person → ViolationEvent Person → Prop
  truthfullyNames : ViolationEvent Person → Prop
  adjudicatesImpartially : Person → ViolationEvent Person → Prop
  restoresInjuredParty : ResponseLedger Person → Prop

/-- The shared substantive requirements for a closed restoration ledger. -/
def AdequateRestoration {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  context.truthfullyNames ledger.event ∧
    context.adjudicatesImpartially ledger.event.judge ledger.event ∧
    context.restoresInjuredParty ledger.toResponseLedger

/-- Candidate Justice endpoint, not yet a theological identification. -/
def JusticeCandidate {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  AdequateRestoration context ledger ∧ OffenderPaysInFull ledger

/-- Candidate Mercy endpoint, including a willing authorized third-party payer. -/
def MercyCandidate {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  AdequateRestoration context ledger ∧
    OtherPaysInFull ledger ∧
    context.paysVoluntarily ledger.otherPayer ledger.event

/-- Candidate cost-bearing-judge configuration; no uniqueness is claimed. -/
def CostBearingJudge {Person : Type*}
    (context : RepairContext Person) (ledger : ViolationLedger Person) : Prop :=
  OtherPaysInFull ledger ∧
    ledger.otherPayer = ledger.event.judge ∧
    context.authorizedToJudge ledger.event.judge ledger.event ∧
    context.paysVoluntarily ledger.otherPayer ledger.event

end Theophysics.DivineOrderKernel
