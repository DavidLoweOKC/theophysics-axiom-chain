# Axiom Jenga — Round 1 Receipt

## Verdict first

The declared generator chain survives its positive control and fails its empty
negative control.  Every one of the eight proposed primitive inputs is
load-bearing for deriving the five downstream targets **within this exact rule
registry**.  One bridge, `Love -> Personhood`, is not load-bearing for those
targets because no downstream rule consumes `Personhood`.

## Compile receipt

- Command: `lake env lean .\AXIOM_JENGA\AxiomJengaRound1.lean`
- Exit: `0`
- Date: 2026-08-25
- `sorry` accepted: none
- Proof mechanism: finite evaluation with `native_decide`
- Printed footprint includes `propext`, `Classical.choice`, `Quot.sound`, and a
  theorem-specific `native_decide` execution axiom.

## Single-premise damage map

| Removed primitive | Derived targets lost |
|---|---|
| Love | Justice, Mercy, Grace, Peace, Joy |
| Truth | Justice, Mercy, Grace, Peace, Joy |
| Agency | Mercy, Grace, Peace, Joy |
| Moral order | Justice, Mercy, Grace, Peace, Joy |
| Real violation | Justice, Mercy, Grace, Peace, Joy |
| External restorative source | Grace, Peace, Joy |
| Binding dynamics | Peace, Joy |
| Positive reduced mass | Joy |

## Rule-removal result

- Disable `Love -> Personhood`: all five declared derived targets remain.
- Disable any of the other five bridges: derived coverage fails.

## What we got right

- The graph is a genuine dependency cascade rather than seven synonymous
  definitions.
- The full proposed input set reaches all declared targets.
- Each of the eight proposed inputs participates in at least one load-bearing
  antecedent for the five derived targets.
- The later premises have localized blast radii instead of destroying earlier
  results retroactively.

## What we got wrong or had not yet earned

- The earlier phrase "unique minimum" was only relative to the declared
  candidate universe and fixed rules.
- Counting Love and Truth among the targets made part of the old success
  immediate because both were supplied initially.  Round 1 therefore separated
  the five genuinely derived targets.
- The Personhood branch currently does no work in the derivation.  Its semantic
  importance is not represented by downstream dependency.

## What would be overstated

- "Lean proved these are the unique theological axioms."
- "Lean derived the bridge rules from mathematics."
- "Personhood is formally necessary to the present Justice-to-Joy chain."
- "Removing an axiom from reality would cause these spiritual properties to
  disappear."

## Defensible version

> In a preregistered finite dependency model containing six explicit bridge
> rules, Lean-checked computation shows that all eight proposed primitive inputs
> are necessary for reaching Justice, Mercy, Grace, Peace, and Joy.  The exact
> loss cascade is recorded.  The Love-to-Personhood rule is not necessary for
> those targets in the current graph, revealing an unused semantic branch.  The
> result establishes nonredundancy only within this declared model; alternative
> rules, primitives, and theological interpretations remain to be tested.

## Next attack

Round 2 should not merely remove pairs—single failure already guarantees every
pair containing a tested primitive fails.  The informative next test is
**replacement**: introduce the strongest plausible alternative bridge or
primitive for each load-bearing item and ask whether the same closure can be
recovered.  Pair ablation may still be retained as a completeness receipt, but
it cannot add much logical information here.
