/-!
# Old Axiom A2.1: Substrate Requirement

Mathematical-only normalization of the central formula in
`008_A2.1_Substrate-Requirement.md`.  No theological or empirical
identification is asserted here.
-/

namespace Theophysics.OldAxiom.SubstrateRequirement

/-- Normalized form of the displayed legacy implication. -/
def Requirement
    (Info Substrate : Type)
    (InfoExists : Info -> Prop)
    (Instantiates : Substrate -> Info -> Prop) : Prop :=
  forall x, InfoExists x -> exists s, Instantiates s x

/-- Positive control: the requirement has a concrete non-vacuous model. -/
theorem requirement_is_satisfiable :
    Requirement Unit Unit (fun _ => True) (fun _ _ => True) := by
  intro x hx
  exact Exists.intro () trivial

/--
Negative control: existence of information alone does not derive the substrate
requirement.  An empty substrate type supplies the countermodel.
-/
theorem information_existence_alone_is_insufficient :
    Not (Requirement Unit Empty (fun _ => True) (fun s _ => nomatch s)) := by
  intro alleged
  obtain ⟨s, hs⟩ := alleged () trivial
  exact nomatch s

/-- Once the requirement is explicitly assumed, its advertised consequence follows. -/
theorem requirement_applies
    (Info Substrate : Type)
    (InfoExists : Info -> Prop)
    (Instantiates : Substrate -> Info -> Prop)
    (hRequirement : Requirement Info Substrate InfoExists Instantiates)
    (x : Info)
    (hx : InfoExists x) :
    exists s, Instantiates s x :=
  hRequirement x hx

#print axioms requirement_is_satisfiable
#print axioms information_existence_alone_is_insufficient
#print axioms requirement_applies

end Theophysics.OldAxiom.SubstrateRequirement
