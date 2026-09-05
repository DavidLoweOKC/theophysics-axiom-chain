"""Bounded retest of the old Love score and the four-term composition proposal.

This file tests mathematical consequences only.  Names such as Love and Creation
remain semantic/theological interpretations unless independently justified.
"""

from z3 import And, Not, Real, Solver, sat, unsat


def check(label, assumptions, target, expected):
    solver = Solver()
    solver.add(*assumptions)
    solver.add(target)
    result = solver.check()
    print(f"{label}: {result} (expected {expected})")
    if result == sat:
        print(f"  witness: {solver.model()}")
    assert str(result) == expected


I, D, epsilon = Real("I"), Real("D"), Real("epsilon")
score = I - epsilon * D

# OLD CLAIM: I >= 0, D >= 0, epsilon > 0 implies LoveScore >= 0.
# Counterexample exists: subtraction can push the score below zero.
check(
    "OLD-LOVE-01 nonnegativity is not entailed",
    [I >= 0, D >= 0, epsilon > 0],
    score < 0,
    "sat",
)

D_ab, D_ba = Real("D_ab"), Real("D_ba")
score_ab = I - epsilon * D_ab
score_ba = I - epsilon * D_ba

# OLD CLAIM: the score is symmetric.  Directional divergence need not be.
check(
    "OLD-LOVE-02 symmetry is not entailed",
    [I >= 0, D_ab >= 0, D_ba >= 0, epsilon > 0],
    score_ab != score_ba,
    "sat",
)

# A repaired score may be required to preserve four independent conditions.
created, distinct, forward, backward, loving = (
    Real("created"), Real("distinct"), Real("forward"),
    Real("backward"), Real("loving")
)
binary = [
    And(created >= 0, created <= 1),
    And(distinct >= 0, distinct <= 1),
    And(forward >= 0, forward <= 1),
    And(backward >= 0, backward <= 1),
    And(loving >= 0, loving <= 1),
]
complete = And(created == 1, distinct == 1, forward == 1,
               backward == 1, loving == 1)

# Without an explicit bridge, merely naming the five inputs does not entail
# the complete state.  This is the expected negative control.
check(
    "COMPOSITION-01 labels alone do not entail communion",
    binary,
    Not(complete),
    "sat",
)

# Under an explicit conjunctive specification, its negation is impossible.
check(
    "COMPOSITION-02 declared full specification is internally consistent",
    binary + [complete],
    Not(complete),
    "unsat",
)

print("4/4 expected outcomes passed")
