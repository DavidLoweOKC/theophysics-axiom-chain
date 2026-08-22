/-!
# T3 / BC2 semantic boundary

This file formalizes the content-level inference separately from the graph.
It proves that non-self-restoration plus restoration does not by itself imply
an external restorer. A causal-exhaustiveness premise is required. Identifying
that external restorer with Grace remains a separate bridge.
-/

set_option autoImplicit false

namespace Theophysics.T3GraceSemantics

structure Scenario where
  restorationOccurs : Prop
  hasInternalRestorer : Prop
  hasExternalRestorer : Prop

def T3_1 (s : Scenario) : Prop :=
  s.restorationOccurs -> Not s.hasInternalRestorer

def T3_2 (s : Scenario) : Prop :=
  s.restorationOccurs

def ExternalRestoration (s : Scenario) : Prop :=
  s.hasExternalRestorer

def causalExhaustiveness (s : Scenario) : Prop :=
  s.restorationOccurs -> s.hasInternalRestorer \/ s.hasExternalRestorer

/-- Concrete countermodel: restoration occurs, but neither kind of restorer is
represented. T3.1 and T3.2 hold while the BC2-style conclusion fails. -/
def insufficientPremisesCountermodel : Scenario :=
  { restorationOccurs := True
    hasInternalRestorer := False
    hasExternalRestorer := False }

theorem t3_1_holds_in_countermodel :
    T3_1 insufficientPremisesCountermodel := by
  intro _ restoration
  exact restoration

theorem t3_2_holds_in_countermodel :
    T3_2 insufficientPremisesCountermodel := by
  trivial

theorem external_restoration_fails_in_countermodel :
    Not (ExternalRestoration insufficientPremisesCountermodel) := by
  exact id

theorem t3_1_and_t3_2_do_not_entail_external_restoration :
    Not (forall s : Scenario, T3_1 s -> T3_2 s -> ExternalRestoration s) := by
  intro claimed
  exact external_restoration_fails_in_countermodel
    (claimed insufficientPremisesCountermodel
      t3_1_holds_in_countermodel t3_2_holds_in_countermodel)

/-- With the missing exhaustive causal alternative, an external restorer does
follow. This conclusion is deliberately not yet called Grace. -/
theorem external_restorer_follows_with_causal_exhaustiveness
    (s : Scenario)
    (noSelfRestoration : T3_1 s)
    (restoration : T3_2 s)
    (causesExhaustive : causalExhaustiveness s) :
    ExternalRestoration s := by
  rcases causesExhaustive restoration with internal | external
  · exact False.elim (noSelfRestoration restoration internal)
  · exact external

/-- The theological identification is an explicit bridge premise. -/
theorem grace_follows_only_after_identification
    (s : Scenario)
    (Grace : Prop)
    (external : ExternalRestoration s)
    (identifyExternalAsGrace : ExternalRestoration s -> Grace) : Grace := by
  exact identifyExternalAsGrace external

#print axioms t3_1_holds_in_countermodel
#print axioms t3_2_holds_in_countermodel
#print axioms external_restoration_fails_in_countermodel
#print axioms t3_1_and_t3_2_do_not_entail_external_restoration
#print axioms external_restorer_follows_with_causal_exhaustiveness
#print axioms grace_follows_only_after_identification

end Theophysics.T3GraceSemantics
