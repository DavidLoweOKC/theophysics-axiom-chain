from __future__ import annotations

from itertools import combinations

PRIMITIVES = (
    "love",
    "truth",
    "agency",
    "moral_order",
    "real_violation",
    "external_source",
    "binding_dynamics",
    "positive_mass",
)
TARGETS = {"love", "truth", "justice", "mercy", "grace", "peace", "joy"}


def closure(initial: set[str]) -> set[str]:
    known = set(initial)
    while True:
        before = set(known)
        if "love" in known:
            known.add("personhood")
        if {"love", "truth", "moral_order", "real_violation"} <= known:
            known.add("justice")
        if {"justice", "love", "agency"} <= known:
            known.add("mercy")
        if {"mercy", "external_source", "agency"} <= known:
            known.add("grace")
        if {"grace", "binding_dynamics"} <= known:
            known.add("peace")
        if {"peace", "positive_mass"} <= known:
            known.add("joy")
        if known == before:
            return known


def main() -> None:
    generators: list[set[str]] = []
    tested = 0
    for size in range(len(PRIMITIVES) + 1):
        for items in combinations(PRIMITIVES, size):
            tested += 1
            candidate = set(items)
            if TARGETS <= closure(candidate):
                generators.append(candidate)
        if generators:
            break

    print(f"subsets_tested={tested}")
    print(f"minimum_size={len(generators[0]) if generators else 'NONE'}")
    print(f"minimum_generators={len(generators)}")
    for generator in generators:
        print("generator=" + ",".join(sorted(generator)))
    if generators:
        basis = generators[0]
        for primitive in sorted(basis):
            missing = sorted(TARGETS - closure(basis - {primitive}))
            print(f"ablate={primitive};missing={','.join(missing)}")


if __name__ == "__main__":
    main()
