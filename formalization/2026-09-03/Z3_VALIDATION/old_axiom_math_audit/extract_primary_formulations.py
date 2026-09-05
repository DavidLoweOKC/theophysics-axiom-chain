"""Extract one primary mathematical formulation per OLD AXIOM Markdown file."""

from __future__ import annotations

import hashlib
import re
from pathlib import Path


SOURCE = Path(r"C:\theophysics\OPUS\AXIOMS\OLD AXIOM")
OUTPUT = Path(
    r"C:\theophysics\OPUS\AXIOMS\OLD_AXIOM_PRIMARY_MATHEMATICAL_FORMULATIONS_2026-09-03.md"
)

ANCHORS = [
    ("MATHEMATICAL_FORMULATION", re.compile(r"(?im)^\s*\*\*Mathematical formulation:\*\*\s*")),
    ("FORMAL_DEFINITION_HEADING", re.compile(r"(?im)^#{2,4}\s+Formal Definition\s*$")),
    ("FORMAL_DEFINITION_LABEL", re.compile(r"(?im)^\s*\*\*Formal Definition:\*\*\s*")),
    ("CORE_EQUATIONS", re.compile(r"(?im)^#{2,5}\s+(?:Core\s+)?Equations?\s*$")),
    ("NUMBERED_EQUATION", re.compile(r"(?im)^#{2,5}\s+Equation\s+\d+[^\n]*$")),
    ("LAYER_ONE_EQUATION", re.compile(r"(?im)^#{2,5}\s+(?:LAYER\s+1:\s*)?The Equation[^\n]*$")),
    ("MASTER_EQUATION_HEADING", re.compile(r"(?im)^#{2,5}\s+The Master Equation[^\n]*$")),
    ("MATHEMATICAL_LAYER", re.compile(r"(?im)^#{2,4}\s+Mathematical Layer\s*$")),
    ("EQUATIONS_HEADING", re.compile(r"(?im)^#{2,4}\s+Equation\(s\)\s*$")),
    ("EQUATION_HEADING", re.compile(r"(?im)^#{2,4}\s+Equation\s*$")),
    ("DEFINITION_LABEL", re.compile(r"(?im)^\s*\*\*Definition:\*\*\s*")),
    ("FORMAL_STATEMENT", re.compile(r"(?im)^#{2,4}\s+Formal Statement\s*$")),
]

DISPLAY = re.compile(r"\$\$(.*?)\$\$", re.DOTALL)
INLINE = re.compile(r"(?<!\$)\$([^\n$]+?)\$(?!\$)")
CODE = re.compile(r"```(?:lean|text|math|latex|python)?\s*(.*?)```", re.DOTALL | re.IGNORECASE)


def title_of(raw: str, fallback: str) -> str:
    matches = re.findall(r"(?m)^#\s+(.+?)\s*$", raw)
    if not matches:
        return fallback
    title = re.sub(r"\[\[.*?\|(.+?)\]\]", r"\1", matches[0])
    return title.strip()


def line_number(raw: str, offset: int) -> int:
    return raw.count("\n", 0, offset) + 1


def candidate_after(raw: str, start: int) -> tuple[str | None, int | None]:
    # Stop at the next same-or-higher Markdown heading, with a generous ceiling.
    window = raw[start : start + 2500]
    heading = re.search(r"(?m)^#{1,3}\s+", window[1:])
    if heading:
        window = window[: heading.start() + 1]

    display = DISPLAY.search(window)
    if display:
        return display.group(1).strip(), start + display.start()

    inline = INLINE.search(window)
    if inline:
        return inline.group(1).strip(), start + inline.start()

    code = CODE.search(window)
    if code and any(token in code.group(1) for token in (":", "->", "→", "=", "forall", "exists")):
        return code.group(1).strip(), start + code.start()

    # Some legacy files lost LaTeX delimiters during encoding conversion but
    # retain an unmistakable equation in the first formal-statement paragraph.
    for paragraph in re.split(r"\n\s*\n", window):
        candidate = paragraph.strip().strip("*")
        if len(candidate) <= 500 and re.search(r"[=≤≥→⇒⇔∫∮Σ∑∏]|\\(?:frac|int|sum|prod|exists|forall)", candidate):
            return candidate, start + window.find(paragraph)

    return None, None


def extract(raw: str) -> tuple[str | None, str, int | None]:
    for label, pattern in ANCHORS:
        for match in pattern.finditer(raw):
            formula, offset = candidate_after(raw, match.end())
            if formula:
                return formula, label, line_number(raw, offset or match.start())
    return None, "NONE_FOUND", None


def main() -> None:
    files = sorted(SOURCE.glob("*.md"))
    found = 0
    lines = [
        "# Old Axiom Primary Mathematical Formulations",
        "",
        "**Source:** `C:\\theophysics\\OPUS\\AXIOMS\\OLD AXIOM`  ",
        "**Operation:** Extraction only; source files were not modified.  ",
        "**Scope:** One primary mathematical formulation per file, where explicitly present. No validation verdicts are assigned on this page.",
        "",
        "## Index",
        "",
        "| # | Axiom file | Primary formulation |",
        "|---:|---|---|",
    ]
    details: list[str] = []

    for number, path in enumerate(files, start=1):
        raw = path.read_text(encoding="utf-8", errors="replace")
        formula, method, source_line = extract(raw)
        title = title_of(raw, path.stem)
        digest = hashlib.sha256(path.read_bytes()).hexdigest()
        if formula:
            found += 1
            compact = " ".join(formula.split())
            preview = compact if len(compact) <= 90 else compact[:87] + "..."
            status = f"`{preview.replace('|', '&#124;')}`"
        else:
            status = "**NO PRIMARY MATHEMATICAL FORMULATION FOUND**"
        anchor = f"axiom-{number:03d}"
        lines.append(f"| {number} | [{path.name}](#{anchor}) | {status} |")

        details.extend(
            [
                "",
                f'<a id="{anchor}"></a>',
                f"## {number:03d} — {title}",
                "",
                f"**Source file:** `{path}`  ",
                f"**SHA-256:** `{digest}`  ",
                f"**Extraction route:** `{method}`  ",
            ]
        )
        if formula:
            details.append(f"**Source line:** {source_line}")
            details.extend(["", "### Primary mathematical formulation", "", "```text", formula, "```"])
        else:
            details.extend(["", "### Primary mathematical formulation", "", "**NO PRIMARY MATHEMATICAL FORMULATION FOUND**"])

    lines.extend(
        [
            "",
            "## Extraction summary",
            "",
            f"- Files inspected: **{len(files)}**",
            f"- Primary formulations extracted: **{found}**",
            f"- No primary formulation found: **{len(files) - found}**",
            "- Validation status: **NOT YET TESTED BY THIS EXTRACTION PASS**",
        ]
    )
    lines.extend(details)
    OUTPUT.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(f"Wrote {OUTPUT}")
    print(f"files={len(files)} found={found} none={len(files) - found}")


if __name__ == "__main__":
    main()
