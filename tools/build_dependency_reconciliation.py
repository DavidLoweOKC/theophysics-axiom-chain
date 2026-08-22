#!/usr/bin/env python3
"""Build a validated dependency projection from the sequential canon and API reviews.

Declared frontmatter remains the canonical dependency spine.  DG1 API output is
only a reconciliation signal: exact matches confirm the spine; extra/missing
IDs remain review candidates and never overwrite source Markdown.
"""
from __future__ import annotations

import csv
import json
import re
from collections import Counter
from datetime import datetime, timezone
from pathlib import Path


ROOT = Path(__file__).resolve().parent
SEQUENTIAL = ROOT / "SEQUENTIAL"
REVIEWS = ROOT / "API_REVIEWS"
OUTPUT = SEQUENTIAL / "DEPENDENCY_GRAPH"


def frontmatter_from_projection(path: Path) -> dict[str, str]:
    text = path.read_text(encoding="utf-8")
    match = re.search(r"(?ms)^## Canonical Source Text\s*\n\s*---\s*\n(?P<fm>.*?)\n---", text)
    if not match:
        raise ValueError(f"Cannot find canonical source frontmatter in {path}")
    return {
        key: value
        for key, value in re.findall(r'(?m)^([A-Za-z_][A-Za-z0-9_]*):\s*"([^"]*)"', match.group("fm"))
    }


def newest_review_csv() -> Path:
    candidates = sorted(REVIEWS.glob("*/canonical_node_rows.csv"), key=lambda p: p.stat().st_mtime, reverse=True)
    if not candidates:
        raise FileNotFoundError(f"No canonical_node_rows.csv found below {REVIEWS}")
    return candidates[0]


def main() -> None:
    files = sorted(SEQUENTIAL.glob("[0-9][0-9][0-9][0-9]_*.md"))
    if len(files) != 191:
        raise SystemExit(f"Expected 191 sequential records; found {len(files)}")

    records = []
    for sequence, path in enumerate(files, start=1):
        fm = frontmatter_from_projection(path)
        records.append({
            "sequence": sequence,
            "id": fm["id"],
            "title": fm.get("title", fm["id"]),
            "mode": fm.get("mode", ""),
            "declared_text": fm.get("depends_on", ""),
            "source_file": path.name,
        })
    ids = {record["id"] for record in records}
    if len(ids) != len(records):
        raise SystemExit("Canonical IDs are not unique.")
    id_pattern = re.compile(r"(?<![A-Za-z0-9_.-])(" + "|".join(re.escape(i) for i in sorted(ids, key=len, reverse=True)) + r")(?![A-Za-z0-9_.-])")

    review_csv = newest_review_csv()
    with review_csv.open(encoding="utf-8-sig", newline="") as handle:
        reviews = {row["source_file"]: row for row in csv.DictReader(handle)}
    if set(reviews) != {record["source_file"] for record in records}:
        raise SystemExit("API review files do not exactly match sequential canonical records.")

    nodes = []
    declared_edges = []
    candidate_edges = []
    reconciliation = []
    for record in records:
        declared = set(id_pattern.findall(record["declared_text"]))
        # The explicit root spellings are declarations of no upstream record.
        if "foundational" in record["declared_text"].lower() or "empty-set" in record["declared_text"].lower():
            declared = set()
        api_text = reviews[record["source_file"]].get("dg1_dependencies", "")
        api = set(id_pattern.findall(api_text))
        nodes.append({
            "id": f"canonical:axiom/{record['id']}",
            "canonical_id": record["id"],
            "sequence": record["sequence"],
            "title": record["title"],
            "mode": record["mode"],
            "source_file": record["source_file"],
        })
        for target in sorted(declared):
            declared_edges.append({
                "type": "dependsOn",
                "source": f"canonical:axiom/{record['id']}",
                "target": f"canonical:axiom/{target}",
                "propagates": True,
                "status": "declared_canonical",
                "provenance": {
                    "field": "depends_on",
                    "source_file": record["source_file"],
                    "declared_text": record["declared_text"],
                },
            })
        for target in sorted(api - declared):
            candidate_edges.append({
                "type": "dependsOn",
                "source": f"canonical:axiom/{record['id']}",
                "target": f"canonical:axiom/{target}",
                "propagates": False,
                "status": "candidate_requires_human_review",
                "provenance": {
                    "review_csv": str(review_csv),
                    "api_field": "dg1_dependencies",
                    "api_text": api_text,
                },
            })
        reconciliation.append({
            "canonical_id": record["id"],
            "source_file": record["source_file"],
            "declared_dependency_ids": sorted(declared),
            "api_dg1_dependency_ids": sorted(api),
            "api_dg1_text": api_text,
            "result": "exact_match" if declared == api else "review_required",
            "candidate_extra_ids": sorted(api - declared),
            "candidate_missing_ids": sorted(declared - api),
        })

    adjacency = {node["id"]: [] for node in nodes}
    for edge in declared_edges:
        adjacency[edge["source"]].append(edge["target"])
    visiting, visited = set(), set()
    def visit(node: str) -> None:
        if node in visiting:
            raise ValueError(f"Declared dependency cycle detected at {node}")
        if node in visited:
            return
        visiting.add(node)
        for target in adjacency[node]:
            visit(target)
        visiting.remove(node)
        visited.add(node)
    for node in adjacency:
        visit(node)

    OUTPUT.mkdir(parents=True, exist_ok=True)
    manifest = {
        "schema_version": "1.0.0",
        "generated_at": datetime.now(timezone.utc).isoformat(),
        "canonical_source": "../INDEX.md",
        "api_review_csv": str(review_csv),
        "policy": {
            "declared_depends_on": "canonical and propagating",
            "api_dg1": "review signal only; extra edges do not propagate or alter canon",
            "inverse_edges": "enabledBy is derived from declared dependsOn at query time",
        },
        "validation": {
            "node_count": len(nodes),
            "declared_edge_count": len(declared_edges),
            "candidate_edge_count": len(candidate_edges),
            "declared_graph_acyclic": True,
            "exact_api_matches": sum(row["result"] == "exact_match" for row in reconciliation),
            "review_required": sum(row["result"] == "review_required" for row in reconciliation),
        },
        "nodes": nodes,
        "declared_edges": declared_edges,
        "candidate_edges": candidate_edges,
        "reconciliation": reconciliation,
    }
    (OUTPUT / "dependency-edge-manifest.json").write_text(json.dumps(manifest, ensure_ascii=False, indent=2) + "\n", encoding="utf-8")

    review_rows = [row for row in reconciliation if row["result"] != "exact_match"]
    report = [
        "# Canonical Dependency Reconciliation",
        "",
        "Declared `depends_on` is the canonical, propagating spine. The API is a review layer only.",
        "",
        f"- Canonical records: `{len(nodes)}`",
        f"- Declared `dependsOn` edges: `{len(declared_edges)}`",
        f"- Exact API/DG1 matches: `{len(reconciliation) - len(review_rows)}`",
        f"- Review-only candidate differences: `{len(review_rows)}`",
        "- Declared graph cycle check: `PASS`",
        "",
        "## Review-only differences",
        "",
    ]
    if review_rows:
        for row in review_rows:
            report += [
                f"### {row['canonical_id']}",
                f"- Declared: `{', '.join(row['declared_dependency_ids']) or 'none'}`",
                f"- API DG1: `{', '.join(row['api_dg1_dependency_ids']) or 'no canonical ID resolved'}`",
                f"- Extra candidate: `{', '.join(row['candidate_extra_ids']) or 'none'}`",
                f"- Missing candidate: `{', '.join(row['candidate_missing_ids']) or 'none'}`",
                f"- API wording: {row['api_dg1_text']}",
                "",
            ]
    else:
        report.append("No differences.")
    report += [
        "## Use",
        "",
        "Consumers should use `declared_edges` for dependency navigation, status ceilings, and blast-radius views. `candidate_edges` require human adjudication before promotion.",
    ]
    (OUTPUT / "README.md").write_text("\n".join(report) + "\n", encoding="utf-8")
    print(json.dumps(manifest["validation"], indent=2))


if __name__ == "__main__":
    main()
