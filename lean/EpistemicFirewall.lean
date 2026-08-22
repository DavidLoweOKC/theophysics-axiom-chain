/-!
# Theophysics epistemic firewall

This module checks the grammar of the one-root architecture. It does not
pretend that disclosures, bridges, evidence, or identifications are strict
deductions from A0.
-/

namespace Theophysics.EpistemicFirewall

inductive ClaimKind where
  | root
  | disclosure
  | definition
  | strictDerivation
  | bridge
  | convergence
  | identification
  | empirical
  | openProblem
  deriving DecidableEq, Repr

inductive Status where
  | admitted
  | candidate
  | open
  | rejected
  deriving DecidableEq, Repr

structure Claim where
  id : String
  kind : ClaimKind
  status : Status
  deriving DecidableEq, Repr

inductive EdgeKind where
  | entails
  | contextualizes
  | defines
  | assumes
  | identifies
  | tests
  | falsifies
  deriving DecidableEq, Repr

structure Edge where
  source : Claim
  target : Claim
  kind : EdgeKind
  deriving DecidableEq, Repr

def A0 : Claim :=
  { id := "A0", kind := .root, status := .admitted }

def existence : Claim :=
  { id := "A1.1", kind := .strictDerivation, status := .candidate }

def trinityDisclosure : Claim :=
  { id := "DISC-TRINITY", kind := .disclosure, status := .admitted }

def maxwellConvergence : Claim :=
  { id := "CONV-MAXWELL", kind := .convergence, status := .candidate }

def openLaw10 : Claim :=
  { id := "OPEN-LAW10", kind := .openProblem, status := .open }

def eligibleStrictKind (claim : Claim) : Bool :=
  claim.kind == .root || claim.kind == .strictDerivation || claim.kind == .definition

def statusCanSupport (source target : Claim) : Bool :=
  if target.status == .admitted then source.status == .admitted else true

def isStrictPremiseFor (source target : Claim) : Bool :=
  eligibleStrictKind source && statusCanSupport source target

def validStrictEdge (edge : Edge) : Bool :=
  if edge.kind == .entails && edge.target.kind == .strictDerivation then
    isStrictPremiseFor edge.source edge.target
  else true

def noReverseFlowIntoRoot (edge : Edge) : Bool :=
  if edge.target.kind == .root then edge.source.kind == .root
  else true

def validFirewallEdge (edge : Edge) : Bool :=
  validStrictEdge edge && noReverseFlowIntoRoot edge

def validGraph (edges : List Edge) : Bool :=
  edges.all validFirewallEdge

/-- Every strict entailment must respect the weakest-premise ceiling. -/
def gradePropagationValid (edges : List Edge) : Bool :=
  edges.all fun edge =>
    if edge.kind == .entails && edge.target.kind == .strictDerivation then
      eligibleStrictKind edge.source && statusCanSupport edge.source edge.target
    else true

def gradeViolations (edges : List Edge) : List Edge :=
  edges.filter fun edge =>
    edge.kind == .entails && edge.target.kind == .strictDerivation &&
    !(eligibleStrictKind edge.source && statusCanSupport edge.source edge.target)

def hasClaim (claims : List Claim) (claim : Claim) : Bool :=
  claims.contains claim

def allEdgeEndpointsExist (claims : List Claim) (edges : List Edge) : Bool :=
  edges.all fun edge => hasClaim claims edge.source && hasClaim claims edge.target

def rootCount (claims : List Claim) : Nat :=
  (claims.filter fun claim => claim.kind == .root).length

def hasExactlyA0AsRoot (claims : List Claim) : Bool :=
  rootCount claims == 1 && claims.any fun claim => claim == A0

def strictRootEdge : Edge := { source := A0, target := existence, kind := .entails }
def disclosureSmuggling : Edge :=
  { source := trinityDisclosure, target := existence, kind := .entails }
def convergenceSmuggling : Edge :=
  { source := maxwellConvergence, target := existence, kind := .entails }
def openClaimSmuggling : Edge :=
  { source := openLaw10, target := existence, kind := .entails }
def reverseBridgeIntoRoot : Edge :=
  { source := maxwellConvergence, target := A0, kind := .identifies }

/-- Disclosure may contextualize a strict claim; it may not entail one. -/
def disclosureContext : Edge :=
  { source := trinityDisclosure, target := existence, kind := .contextualizes }

theorem root_may_support_strict_chain :
    validFirewallEdge strictRootEdge = true := by
  decide

theorem disclosure_cannot_masquerade_as_derivation :
    validFirewallEdge disclosureSmuggling = false := by
  decide

theorem convergence_cannot_masquerade_as_derivation :
    validFirewallEdge convergenceSmuggling = false := by
  decide

theorem open_claim_cannot_support_strict_chain :
    validFirewallEdge openClaimSmuggling = false := by
  decide

theorem convergence_cannot_rewrite_A0 :
    validFirewallEdge reverseBridgeIntoRoot = false := by
  decide

theorem disclosure_may_contextualize_without_becoming_a_premise :
    validFirewallEdge disclosureContext = true := by
  decide

/-! ## T3.1 / T3.2 / BC2 stress test -/

def coherenceMeasure : Claim :=
  { id := "A3.2", kind := .definition, status := .admitted }

def coherenceFunctional : Claim :=
  { id := "D3.1", kind := .definition, status := .admitted }

def T3_1 : Claim :=
  { id := "T3.1", kind := .strictDerivation, status := .candidate }

def T3_2 : Claim :=
  { id := "T3.2", kind := .bridge, status := .candidate }

def BC2 : Claim :=
  { id := "BC2", kind := .strictDerivation, status := .candidate }

def a3_2_to_t3_1 : Edge :=
  { source := coherenceMeasure, target := T3_1, kind := .entails }

def d3_1_to_t3_1 : Edge :=
  { source := coherenceFunctional, target := T3_1, kind := .entails }

def t3_1_to_bc2 : Edge :=
  { source := T3_1, target := BC2, kind := .entails }

def t3_2_to_bc2 : Edge :=
  { source := T3_2, target := BC2, kind := .entails }

theorem repaired_t3_1_anchors_are_eligible_strict_support :
    validFirewallEdge a3_2_to_t3_1 = true ∧
    validFirewallEdge d3_1_to_t3_1 = true := by
  decide

theorem candidate_t3_1_may_support_candidate_bc2_without_promotion :
    validFirewallEdge t3_1_to_bc2 = true := by
  decide

theorem bridge_t3_2_cannot_masquerade_as_strict_bc2_premise :
    validFirewallEdge t3_2_to_bc2 = false := by
  decide

/-! ## Entailment-cycle check -/

def entailmentSuccessors (edges : List Edge) (claim : Claim) : List Claim :=
  (edges.filter fun edge => edge.source == claim && edge.kind == .entails).map (·.target)

def propagatesCeiling (kind : EdgeKind) : Bool :=
  kind == .entails || kind == .defines || kind == .assumes || kind == .identifies

def supportSuccessors (edges : List Edge) (claim : Claim) : List Claim :=
  (edges.filter fun edge => edge.source == claim && propagatesCeiling edge.kind).map (·.target)

def reachableWithin (edges : List Edge) : Nat → Claim → Claim → Bool
  | 0, _, _ => false
  | fuel + 1, source, target =>
      (entailmentSuccessors edges source).any fun next =>
        next == target || reachableWithin edges fuel next target

def supportReachableWithin (edges : List Edge) : Nat → Claim → Claim → Bool
  | 0, _, _ => false
  | fuel + 1, source, target =>
      (supportSuccessors edges source).any fun next =>
        next == target || supportReachableWithin edges fuel next target

def strictDescendantsOf (claims : List Claim) (edges : List Edge) (source : Claim) : List Claim :=
  claims.filter fun claim =>
    claim.kind == .strictDerivation &&
    supportReachableWithin edges claims.length source claim

def entailmentAcyclic (claims : List Claim) (edges : List Edge) : Bool :=
  claims.all fun claim => !reachableWithin edges claims.length claim claim

def strictClaimsTraceToA0 (claims : List Claim) (edges : List Edge) : Bool :=
  claims.all fun claim =>
    if claim.kind == .strictDerivation then
      reachableWithin edges claims.length A0 claim
    else true

def unrootedStrictClaims (claims : List Claim) (edges : List Edge) : List Claim :=
  claims.filter fun claim =>
    claim.kind == .strictDerivation &&
    !reachableWithin edges claims.length A0 claim

def canonReady (claims : List Claim) (edges : List Edge) : Bool :=
  hasExactlyA0AsRoot claims &&
  allEdgeEndpointsExist claims edges &&
  entailmentAcyclic claims edges &&
  strictClaimsTraceToA0 claims edges &&
  validGraph edges &&
  gradePropagationValid edges

def t3Claims : List Claim :=
  [coherenceMeasure, coherenceFunctional, T3_1, T3_2, BC2]

def t3DeclaredEdges : List Edge :=
  [a3_2_to_t3_1, d3_1_to_t3_1, t3_1_to_bc2, t3_2_to_bc2]

theorem t3_declared_entailment_shape_is_acyclic :
    entailmentAcyclic t3Claims t3DeclaredEdges = true := by
  decide

def acceptanceFixture : List Edge := [strictRootEdge]

def rejectionFixture : List Edge :=
  [strictRootEdge, disclosureSmuggling, convergenceSmuggling,
   openClaimSmuggling, reverseBridgeIntoRoot]

theorem clean_fixture_passes : validGraph acceptanceFixture = true := by
  decide

theorem smuggling_fixture_fails : validGraph rejectionFixture = false := by
  decide

#print axioms root_may_support_strict_chain
#print axioms disclosure_cannot_masquerade_as_derivation
#print axioms convergence_cannot_masquerade_as_derivation
#print axioms open_claim_cannot_support_strict_chain
#print axioms convergence_cannot_rewrite_A0
#print axioms disclosure_may_contextualize_without_becoming_a_premise
#print axioms repaired_t3_1_anchors_are_eligible_strict_support
#print axioms candidate_t3_1_may_support_candidate_bc2_without_promotion
#print axioms bridge_t3_2_cannot_masquerade_as_strict_bc2_premise
#print axioms t3_declared_entailment_shape_is_acyclic
#print axioms clean_fixture_passes
#print axioms smuggling_fixture_fails

end Theophysics.EpistemicFirewall
