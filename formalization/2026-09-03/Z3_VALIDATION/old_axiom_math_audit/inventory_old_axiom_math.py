"""Lossless inventory of explicit mathematical components in OLD AXIOM.

This script does not decide truth by keyword.  It extracts display equations
and nearby claimed properties so that each component can receive a later
formal, numerical, empirical, or definition-only ruling.
"""

from __future__ import annotations

import csv
import hashlib
import json
import re
from collections import defaultdict
from pathlib import Path


SOURCE = Path(r"C:\theophysics\OPUS\AXIOMS\OLD AXIOM")
OUTPUT = Path(r"C:\theophysics\OPUS\AXIOMS\OLD_AXIOM_MATH_VALIDATION_2026-09-03")

DISPLAY = re.compile(r"\$\$(.*?)\$\$", re.DOTALL)
FORMAL_WORDS = re.compile(
    r"\b(theorem|lemma|proposition|corollary|definition|identity|equation|"
    r"boundedness|symmetry|idempotence|invariance|conservation|uniqueness|"
    r"non[- ]?negativity|fixed point|eigenvalue|operator)\b",
    re.IGNORECASE,
)
EMPIRICAL_WORDS = re.compile(
    r"\b(data|experiment|measured|measurement protocol|sample|p[- ]?value|"
    r"sigma|correlation|prediction|observed)\b",
    re.IGNORECASE,
)


def clean(text: str) -> str:
    return " ".join(text.replace("\ufeff", "").split())


def equation_key(text: str) -> str:
    """Mechanical exact-form key; no semantic equivalence is inferred."""
    return re.sub(r"\s+", "", text).lower()


def route(equation: str, context: str) -> str:
    joined = equation + " " + context
    if EMPIRICAL_WORDS.search(joined):
        return "EMPIRICAL_OR_NUMERICAL"
    if re.search(r"\\(int|oint|sum|prod|partial|nabla|lim)|d/dt|\\frac", equation):
        return "LEAN_ANALYTIC_OR_NUMERICAL"
    if re.search(r"\\(forall|exists|land|lor|neg|Rightarrow|iff)|=>|<=>", joined):
        return "LEAN_OR_Z3_LOGIC"
    if re.search(r"\b(matrix|operator|eigen|group|set|map|function)\b", joined, re.I):
        return "LEAN_SPECIFICATION"
    return "MANUAL_NORMALIZATION_FIRST"


def main() -> None:
    OUTPUT.mkdir(parents=True, exist_ok=True)
    rows: list[dict[str, str | int]] = []
    file_rows: list[dict[str, str | int]] = []

    for path in sorted(SOURCE.glob("*.md")):
        raw = path.read_text(encoding="utf-8", errors="replace")
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        components = list(DISPLAY.finditer(raw))
        formal_hits = len(FORMAL_WORDS.findall(raw))
        file_rows.append(
            {
                "file": path.name,
                "display_equation_count": len(components),
                "formal_language_hits": formal_hits,
                "source_sha256": digest,
                "file_status": "INVENTORIED_NOT_YET_ADJUDICATED"
                if components or formal_hits
                else "NO_EXPLICIT_MATHEMATICAL_COMPONENT_FOUND",
            }
        )
        for number, match in enumerate(components, start=1):
            start = max(0, match.start() - 500)
            end = min(len(raw), match.end() + 700)
            context = clean(raw[start:end])[:1600]
            equation = clean(match.group(1))
            rows.append(
                {
                    "component_id": f"{path.stem}__EQ{number:03d}",
                    "file": path.name,
                    "equation": equation,
                    "nearby_claim_context": context,
                    "test_route": route(equation, context),
                    "ruling": "UNTESTED",
                    "ruling_reason": "",
                    "formal_receipt": "",
                    "source_sha256": digest,
                }
            )

    component_fields = list(rows[0]) if rows else []
    with (OUTPUT / "MATHEMATICAL_COMPONENT_LEDGER.csv").open(
        "w", newline="", encoding="utf-8-sig"
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=component_fields)
        writer.writeheader()
        writer.writerows(rows)

    file_fields = list(file_rows[0]) if file_rows else []
    with (OUTPUT / "FILE_INVENTORY.csv").open(
        "w", newline="", encoding="utf-8-sig"
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=file_fields)
        writer.writeheader()
        writer.writerows(file_rows)

    grouped: dict[str, list[dict[str, str | int]]] = defaultdict(list)
    for row in rows:
        grouped[equation_key(str(row["equation"]))].append(row)
    unique_rows = []
    for number, occurrences in enumerate(grouped.values(), start=1):
        representative = occurrences[0]
        unique_rows.append(
            {
                "unique_equation_id": f"OLD-MATH-{number:04d}",
                "equation": representative["equation"],
                "occurrence_count": len(occurrences),
                "files": " | ".join(sorted({str(x["file"]) for x in occurrences})),
                "component_ids": " | ".join(str(x["component_id"]) for x in occurrences),
                "initial_test_route": representative["test_route"],
                "ruling": "UNTESTED",
                "ruling_reason": "",
                "formal_receipt": "",
            }
        )
    unique_fields = list(unique_rows[0]) if unique_rows else []
    with (OUTPUT / "UNIQUE_EQUATION_LEDGER.csv").open(
        "w", newline="", encoding="utf-8-sig"
    ) as handle:
        writer = csv.DictWriter(handle, fieldnames=unique_fields)
        writer.writeheader()
        writer.writerows(unique_rows)

    summary = {
        "source": str(SOURCE),
        "output": str(OUTPUT),
        "files": len(file_rows),
        "display_equation_components": len(rows),
        "mechanically_unique_equation_forms": len(unique_rows),
        "files_with_display_equations": sum(
            int(row["display_equation_count"] > 0) for row in file_rows
        ),
        "source_files_modified": 0,
    }
    (OUTPUT / "INVENTORY_RECEIPT.json").write_text(
        json.dumps(summary, indent=2), encoding="utf-8"
    )
    print(json.dumps(summary, indent=2))


if __name__ == "__main__":
    main()
