[CmdletBinding()]
param(
  [string]$SourcePath = (Join-Path $PSScriptRoot '..\docs\canonical\AXIOMS_CANONICAL_ONLY.md'),
  [string]$OutputPath = (Join-Path $PSScriptRoot '..\lean\CanonicalGraph.lean')
)

$ErrorActionPreference = 'Stop'
$source = [System.IO.File]::ReadAllText((Resolve-Path -LiteralPath $SourcePath))
$boundaryPattern = '(?ms)^<!-- SOURCE_BOUNDARY index=(?<index>\d+) id=(?<id>[^ ]+) mode=(?<mode>[^ ]+) file=(?<file>[^ ]+) sha256=(?<hash>[0-9a-f]{64}) -->\r?\n(?<body>.*?)(?=^<!-- SOURCE_BOUNDARY index=|\z)'
$matches = [regex]::Matches($source, $boundaryPattern)
if ($matches.Count -ne 191) { throw "Expected 191 records; found $($matches.Count)." }

function Escape-Lean([string]$value) {
  $value.Replace('\', '\\').Replace('"', '\"').Replace("`r", '').Replace("`n", '\n')
}

$records = foreach ($match in $matches) {
  $body = $match.Groups['body'].Value
  $front = [regex]::Match($body, '(?ms)^\s*---\r?\n(?<fm>.*?)\r?\n---').Groups['fm'].Value
  $depsMatch = [regex]::Match($front, '(?m)^depends_on:\s*"(?<v>[^"]*)"')
  $titleMatch = [regex]::Match($front, '(?m)^title:\s*"(?<v>[^"]*)"')
  [pscustomobject]@{
    Index = [int]$match.Groups['index'].Value
    Id = $match.Groups['id'].Value
    Mode = $match.Groups['mode'].Value
    Title = if ($titleMatch.Success) { $titleMatch.Groups['v'].Value } else { $match.Groups['id'].Value }
    DependsOn = if ($depsMatch.Success) { $depsMatch.Groups['v'].Value } else { '' }
  }
}

if (($records.Id | Sort-Object -Unique).Count -ne 191) { throw 'Canonical IDs are not unique.' }
$ids = @($records.Id)
$idPattern = '(?<![A-Za-z0-9_.-])(' + (($ids | Sort-Object Length -Descending | ForEach-Object { [regex]::Escape($_) }) -join '|') + ')(?![A-Za-z0-9_.-])'

function Claim-Kind([string]$id, [string]$mode) {
  if ($id -eq 'A1.1') { return 'strictDerivation' }
  # One-root canon override: these legacy multi-root rows remain visible as
  # candidates, but they are bridges rather than independent strict axioms.
  if ($id -in @('A5.1', 'BC4', 'BC6', 'BC7', 'BC8')) { return 'bridge' }
  switch ($mode) {
    'AX_CORE' { 'strictDerivation' }
    'AX_DERIVED' { 'strictDerivation' }
    'AX_SCAFFOLD' { 'definition' }
    'FW_EXTENDED' { 'bridge' }
    'HY_EVIDENCE' { 'empirical' }
    default { 'openProblem' }
  }
}

function Edge-Kind([string]$id, [string]$mode) {
  if ($id -in @('A5.1', 'BC4', 'BC6', 'BC7', 'BC8')) { return 'assumes' }
  switch ($mode) {
    'AX_CORE' { 'entails' }
    'AX_DERIVED' { 'entails' }
    'AX_SCAFFOLD' { 'defines' }
    'FW_EXTENDED' { 'assumes' }
    'HY_EVIDENCE' { 'tests' }
    default { 'contextualizes' }
  }
}

$claimNames = @{}
$claimLines = [System.Collections.Generic.List[string]]::new()
$claimNames['A0'] = 'claim_A0'
$claimLines.Add('  [ A0')
foreach ($record in $records) {
  $name = 'claim_' + (($record.Id -replace '[^A-Za-z0-9_]', '_') -replace '_+', '_')
  if ($claimNames.Values -contains $name) { $name += "_$($record.Index)" }
  $claimNames[$record.Id] = $name
  $kind = Claim-Kind $record.Id $record.Mode
  $id = Escape-Lean $record.Id
  $claimLines.Add("  , { id := `"$id`", kind := .$kind, status := .candidate }")
}
$claimLines.Add('  ]')

$edgeLines = [System.Collections.Generic.List[string]]::new()
$edgeLines.Add('  [ { source := A0, target := ' + $claimNames['A1.1'] + ', kind := .entails }')
$edgeCount = 1
foreach ($record in $records) {
  $declared = @([regex]::Matches($record.DependsOn, $idPattern) | ForEach-Object Value | Sort-Object -Unique)
  if ($record.DependsOn -match '(?i)foundational|core root|empty-set') { $declared = @() }
  foreach ($dependency in $declared) {
    $kind = Edge-Kind $record.Id $record.Mode
    if ($record.Mode -eq 'HY_EVIDENCE') {
      $edgeLines.Add("  , { source := $($claimNames[$record.Id]), target := $($claimNames[$dependency]), kind := .$kind }")
    } else {
      $edgeLines.Add("  , { source := $($claimNames[$dependency]), target := $($claimNames[$record.Id]), kind := .$kind }")
    }
    $edgeCount++
  }
}
$edgeLines.Add('  ]')

$definitions = [System.Collections.Generic.List[string]]::new()
foreach ($record in $records) {
  $name = $claimNames[$record.Id]
  $id = Escape-Lean $record.Id
  $kind = Claim-Kind $record.Id $record.Mode
  $definitions.Add("def $name : Claim := { id := `"$id`", kind := .$kind, status := .candidate }")
}

$sourceHash = (Get-FileHash -LiteralPath $SourcePath -Algorithm SHA256).Hash.ToLower()
$out = @(
  'import EpistemicFirewall'
  ''
  'set_option autoImplicit false'
  'set_option maxRecDepth 20000'
  ''
  'namespace Theophysics.CanonicalGraph'
  'open Theophysics.EpistemicFirewall'
  ''
  "/-- Source SHA-256: $sourceHash -/"
) + $definitions + @(
  ''
  'def canonicalClaims : List Claim :='
) + $claimLines + @(
  ''
  'def canonicalEdges : List Edge :='
) + $edgeLines + @(
  ''
  "theorem claim_count : canonicalClaims.length = 192 := by decide"
  "theorem declared_edge_count : canonicalEdges.length = $edgeCount := by decide"
  'theorem exactly_one_root : hasExactlyA0AsRoot canonicalClaims = true := by decide'
  'theorem endpoints_exist : allEdgeEndpointsExist canonicalClaims canonicalEdges = true := by decide'
  'theorem entailment_graph_is_acyclic : entailmentAcyclic canonicalClaims canonicalEdges = true := by decide'
  'theorem strict_chain_fully_traces_to_A0 : strictClaimsTraceToA0 canonicalClaims canonicalEdges = true := by decide'
  'theorem current_projection_is_canon_ready : canonReady canonicalClaims canonicalEdges = true := by decide'
  ''
  '#eval (unrootedStrictClaims canonicalClaims canonicalEdges).map (fun claim => claim.id)'
  ''
  '#print axioms claim_count'
  '#print axioms declared_edge_count'
  '#print axioms exactly_one_root'
  '#print axioms endpoints_exist'
  '#print axioms entailment_graph_is_acyclic'
  '#print axioms strict_chain_fully_traces_to_A0'
  '#print axioms current_projection_is_canon_ready'
  ''
  'end Theophysics.CanonicalGraph'
)

[System.IO.File]::WriteAllLines([System.IO.Path]::GetFullPath($OutputPath), $out, [System.Text.UTF8Encoding]::new($false))
Write-Output "Generated $OutputPath from 191 records with $edgeCount typed edges."
