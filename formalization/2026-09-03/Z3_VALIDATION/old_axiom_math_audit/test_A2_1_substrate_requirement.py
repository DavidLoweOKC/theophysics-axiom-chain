"""Z3 checks for the normalized central claim of old axiom A2.1."""

from z3 import Bool, Implies, Not, Solver, sat


info_exists = Bool("info_exists")
substrate_instantiates_info = Bool("substrate_instantiates_info")
requirement = Implies(info_exists, substrate_instantiates_info)


def expect_sat(label, *constraints):
    solver = Solver()
    solver.add(*constraints)
    result = solver.check()
    print(f"{label}: {result}")
    assert result == sat
    print(f"  witness: {solver.model()}")


# The normalized requirement is coherent and has a non-vacuous model.
expect_sat(
    "A2.1-POS coherent non-vacuous model",
    info_exists,
    substrate_instantiates_info,
    requirement,
)

# Information existence alone does not entail instantiation.
expect_sat(
    "A2.1-NEG missing-premise countermodel",
    info_exists,
    Not(substrate_instantiates_info),
)

print("A2.1 ruling: CONDITIONAL - coherent as an explicit requirement; not derived from information existence alone")
