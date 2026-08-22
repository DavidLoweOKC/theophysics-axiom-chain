[CmdletBinding()]
param(
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

$canonicalRoot = Split-Path -Parent $PSCommandPath
$sourcePath = Join-Path $canonicalRoot 'AXIOMS_CANONICAL_ONLY.md'
$outputRoot = Join-Path $canonicalRoot 'SEQUENTIAL'
$indexPath = Join-Path $outputRoot 'INDEX.md'
$receiptPath = Join-Path $outputRoot '_BUILD_RECEIPT.md'

function Get-Sha256([string]$Text) {
    $sha = New-Object System.Security.Cryptography.SHA256Managed
    try {
        return (($sha.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Text)) |
            ForEach-Object { $_.ToString('x2') }) -join '')
    }
    finally {
        $sha.Dispose()
    }
}

function Get-SafeFilePart([string]$Value) {
    return (($Value -replace '[^A-Za-z0-9._-]', '_') -replace '_+', '_').Trim('_')
}

if (-not (Test-Path -LiteralPath $sourcePath)) {
    throw "Canonical source assembly not found: $sourcePath"
}

if (Test-Path -LiteralPath $outputRoot) {
    $existing = @(Get-ChildItem -LiteralPath $outputRoot -Force)
    if ($existing.Count -gt 0 -and -not $Force) {
        throw "Refusing to overwrite existing sequential output. Review it, then rerun with -Force: $outputRoot"
    }
}
else {
    New-Item -ItemType Directory -Path $outputRoot | Out-Null
}

$utf8NoBom = New-Object System.Text.UTF8Encoding($false)
$sourceText = [System.IO.File]::ReadAllText($sourcePath)
$sourceHash = (Get-FileHash -LiteralPath $sourcePath -Algorithm SHA256).Hash.ToLower()
$boundaryPattern = '(?ms)^<!-- SOURCE_BOUNDARY index=(?<index>\d+) id=(?<id>[^ ]+) mode=(?<mode>[^ ]+) file=(?<sourceFile>[^ ]+) sha256=(?<hash>[0-9a-f]{64}) -->\r?\n(?<body>.*?)(?=^<!-- SOURCE_BOUNDARY index=|\z)'
$matches = [regex]::Matches($sourceText, $boundaryPattern)

if ($matches.Count -ne 191) {
    throw "Expected 191 SOURCE_BOUNDARY records; found $($matches.Count). No output was written."
}

$records = foreach ($match in $matches) {
    # Assembly adds one blank line before each source and a divider after it.
    # Removing only those assembly wrappers restores the original source bytes/text.
    $payload = $match.Groups['body'].Value -replace '^\r?\n', ''
    $payload = $payload -replace '\r?\n---\r?\n\r?\n$', ''
    $actualHash = Get-Sha256 $payload
    $expectedHash = $match.Groups['hash'].Value
    if ($actualHash -ne $expectedHash) {
        throw "Payload hash mismatch for registry record $($match.Groups['index'].Value) / $($match.Groups['id'].Value). Expected $expectedHash; got $actualHash."
    }
    $frontMatterMatch = [regex]::Match($payload, '(?ms)^---\r?\n(?<front>.*?)\r?\n---')
    $titleMatch = [regex]::Match($frontMatterMatch.Groups['front'].Value, '(?m)^title:\s*"(?<title>[^"]+)"')
    $depsMatch = [regex]::Match($frontMatterMatch.Groups['front'].Value, '(?m)^depends_on:\s*"(?<deps>[^"]*)"')
    [pscustomobject]@{
        Index = [int]$match.Groups['index'].Value
        Id = $match.Groups['id'].Value
        Mode = $match.Groups['mode'].Value
        SourceFile = $match.Groups['sourceFile'].Value
        SourceHash = $expectedHash
        Title = if ($titleMatch.Success) { $titleMatch.Groups['title'].Value } else { $match.Groups['id'].Value }
        DependsOn = if ($depsMatch.Success) { $depsMatch.Groups['deps'].Value } else { '' }
        Payload = $payload
    }
}

$idToRecord = @{}
foreach ($record in $records) {
    if ($idToRecord.ContainsKey($record.Id)) { throw "Duplicate canonical ID: $($record.Id)" }
    $idToRecord[$record.Id] = $record
}
foreach ($record in $records) {
    $record | Add-Member -NotePropertyName FileName -NotePropertyValue ('{0:D4}_{1}_{2}.md' -f $record.Index, (Get-SafeFilePart $record.Id), (Get-SafeFilePart ([IO.Path]::GetFileNameWithoutExtension($record.SourceFile))))
}

foreach ($record in $records) {
    $previous = if ($record.Index -gt 1) { $records[$record.Index - 2] } else { $null }
    $next = if ($record.Index -lt $records.Count) { $records[$record.Index] } else { $null }
    $dependencyLinks = @()
    foreach ($candidateId in $idToRecord.Keys) {
        if ($record.DependsOn -match ('(?<![A-Za-z0-9_.-])' + [regex]::Escape($candidateId) + '(?![A-Za-z0-9_.-])')) {
            $target = $idToRecord[$candidateId]
            $dependencyLinks += "[$($target.Id) - $($target.Title)]($($target.FileName))"
        }
    }
    $dependencyBlock = if ($dependencyLinks.Count) { $dependencyLinks -join '; ' } else { '_No registered canonical dependency link extracted._' }
    $previousLink = if ($null -ne $previous) { "[$('{0:D4}' -f $previous.Index) - $($previous.Id) - $($previous.Title)]($($previous.FileName))" } else { '_Start of sequence_' }
    $nextLink = if ($null -ne $next) { "[$('{0:D4}' -f $next.Index) - $($next.Id) - $($next.Title)]($($next.FileName))" } else { '_End of sequence_' }
    $document = @"
<!-- GENERATED FROM AXIOMS_CANONICAL_ONLY.md; do not edit this projection by hand. -->

# Canonical Sequential Record $($record.Index.ToString('D4')): $($record.Id)

| Field | Value |
|---|---|
| Registry position | $($record.Index) of $($records.Count) |
| Canonical ID | ``$($record.Id)`` |
| Mode | ``$($record.Mode)`` |
| Canonical source filename | ``$($record.SourceFile)`` |
| Source SHA-256 | ``$($record.SourceHash)`` |

## Sequence Navigation

Previous: $previousLink  
Index: [all canonical sequential records](INDEX.md)  
Next: $nextLink

## Registered Dependency Links

$dependencyBlock

## Canonical Source Text

$($record.Payload)
"@
    [System.IO.File]::WriteAllText((Join-Path $outputRoot $record.FileName), $document, $utf8NoBom)
}

$indexRows = foreach ($record in $records) {
    "| $($record.Index.ToString('D4')) | [$($record.Id) - $($record.Title)]($($record.FileName)) | ``$($record.Mode)`` | ``$($record.SourceFile)`` |"
}
$indexDocument = @"
# Canonical Axiom Chain - Sequential Records

See the [validated dependency graph](DEPENDENCY_GRAPH/README.md) for typed declared edges and API reconciliation candidates.

This is a navigable, lossless projection of [AXIOMS_CANONICAL_ONLY.md](../AXIOMS_CANONICAL_ONLY.md), in its existing registry order. Each record has its own file, previous/next sequence links, and links to any registered canonical dependencies recognized from its `depends_on` field.

**Record count:** $($records.Count)  
**Source SHA-256:** ``$sourceHash``  
**Generation rule:** source payload SHA-256 must match the `SOURCE_BOUNDARY` receipt before a file is created.

| Sequence | Canonical record | Mode | Original source file |
|---:|---|---|---|
$($indexRows -join "`n")
"@
[System.IO.File]::WriteAllText($indexPath, $indexDocument, $utf8NoBom)

$receipt = @"
# Sequential Build Receipt

- Source: `AXIOMS_CANONICAL_ONLY.md`
- Source SHA-256: ``$sourceHash``
- Records extracted: $($records.Count)
- Records written: $($records.Count)
- Validation: every extracted payload matched the SHA-256 supplied by its `SOURCE_BOUNDARY`.
- Generated: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')

The source assembly was not changed. Re-run ``build_sequential_axioms.ps1 -Force`` only after deliberately replacing this generated projection.
"@
[System.IO.File]::WriteAllText($receiptPath, $receipt, $utf8NoBom)

Write-Host "Created $($records.Count) linked canonical sequential records in $outputRoot"
