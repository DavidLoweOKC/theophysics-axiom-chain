# Axiom Jenga — Round 6 Receipt

## Verdict first

Justice and Mercy can coexist once Justice is defined as satisfaction of the
standard and conservation/restoration, while alpha is reserved for cost
allocation.  Under the reconstructed contracts, Mercy presupposes Justice
fulfilled; Justice fulfilled does not force Mercy.

## Compile receipt

- Command: `lake env lean .\AXIOM_JENGA\AxiomJengaRound6.lean`
- Exit: `0`
- Date: 2026-08-26
- `sorry`: none
- Printed footprint: `propext`, `Classical.choice`, `Quot.sound`

## Surviving structure

```text
Truthful naming
+ impartial adjudication
+ restoration
+ conserved full payment
= candidate Justice fulfilled

Candidate Justice fulfilled
+ alpha = 0
+ distinct other payer
+ voluntary payment
= candidate Mercy shown
```

Lean verifies that the existing `MercyCandidate` is definitionally equivalent
to `JusticeFulfilled AND MercyShown` under these reconstructed names.

## Two witnesses

1. An `alpha = 0` ledger has zero offender payment, full other payment, conserved
   total cost, Justice fulfilled, and Mercy shown.
2. An `alpha = 1` ledger has Justice fulfilled but not Mercy shown.

Therefore:

- Mercy presupposes Justice fulfilled.
- Justice fulfillment does not entail Mercy.
- Justice and Mercy are neither synonyms nor incompatible once the standard and
  allocation roles are separated.

## What this earns

It earns a consistent formal architecture for the sentence:

> Mercy does not erase or defeat justice.  Mercy is a cost allocation in which
> justice remains fulfilled while another voluntarily bears the conserved cost.

## What remains open

- why moral cost must obey this ledger;
- why self-payment is insufficient;
- why an arbitrary third party is insufficient;
- why the payer must be the judge or standard-setter;
- payer debtlessness and sufficient capacity;
- recipient consent;
- historical preservation and append-only behavior;
- identification of the payer with Christ;
- uniqueness of the Cross.

The Bool witness uses trivially true relational predicates.  It establishes
logical consistency and dependency direction only, not real-world necessity.
