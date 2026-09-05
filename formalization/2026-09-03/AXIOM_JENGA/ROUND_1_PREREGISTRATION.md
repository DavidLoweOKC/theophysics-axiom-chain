# Axiom Jenga — Round 1 Preregistration

## Locked baseline

The existing `DivineOrderGenerator.lean` remains unchanged by this experiment.
Its passing build is the comparison baseline.  Round 1 lives in
`AXIOM_JENGA/AxiomJengaRound1.lean` and is compiled separately.

## Question

Within the six declared bridge rules, which proposed primitives and which rules
are actually load-bearing for deriving Justice, Mercy, Grace, Peace, and Joy?

## Collapse criterion

A removal "breaks the house" only when at least one of the five **derived**
targets becomes unreachable after six closure passes.  Love and Truth are not
counted as successes merely because they were supplied as initial primitives.

## Controls

1. Positive control: the full proposed basis reaches all five derived targets.
2. Negative control: the empty basis does not.
3. Primitive ablation: remove exactly one proposed primitive.
4. Rule ablation: disable exactly one bridge while keeping all primitives.
5. Exact-damage receipt: record which targets disappear, not merely pass/fail.

## Kill conditions

- If removing a primitive leaves all derived targets reachable, it is not
  load-bearing in this graph.
- If disabling a rule changes no derived target, that rule is ornamental for
  the tested conclusion.
- No finite closure result establishes that the rule set is theologically true,
  physically instantiated, uniquely natural, or globally minimal across other
  formalizations.
- Results using `native_decide` must be reported as executable finite checks and
  retain the printed execution-axiom footprint.

## Deferred rounds

Round 1 does not yet test pair removals, substitute bridges, label shuffles,
rule ordering, fused rules, or alternative primitive universes.  Those tests
must be built only after the single-removal damage map is compiled and audited.
