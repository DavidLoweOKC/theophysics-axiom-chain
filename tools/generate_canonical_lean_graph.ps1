[CmdletBinding()]
param(
  [string]$AuditPath = (Join-Path $PSScriptRoot '..\docs\canonical\axiom_chain_v3_audit.csv'),
  [string]$OutputPath = (Join-Path $PSScriptRoot '..\lean\CanonicalGraph.lean')
)

$ErrorActionPreference = 'Stop'
$audit = @(Import-Csv -LiteralPath $AuditPath)
if ($audit.Count -ne 191) { throw "Expected 191 parsed v3 audit rows; found $($audit.Count)." }
if (($audit.id | Sort-Object -Unique).Count -ne 191) { throw 'Audit IDs are not unique.' }

# SC-* is one compact row in the audit but six concrete records in the source.
$scaleIds = @('SC-QUANTUM', 'SC-PHYSICAL', 'SC-NEURAL', 'SC-INDIVIDUAL', 'SC-SOCIAL', 'SC-COSMIC')
$records = [System.Collections.Generic.List[object]]::new()
foreach ($row in $audit) {
  if ($row.id -eq 'SC-*') {
    foreach ($scaleId in $scaleIds) {
      $records.Add([pscustomobject]@{
        id = $scaleId; mode = 'FW_EXTENDED'; tier = $row.tier
        edge_type = 'depends_on'; depends_on_or_tests = 'A2.2'
      })
    }
    continue
  }

  $id = if ($row.id -eq 'PERSONHOOD') { 'ID7.2' } else { $row.id }
  $mode = if ($id -in @('T3.1', 'BC2', 'BC7', 'BC8', 'D11.1')) { 'FW_EXTENDED' } else { $row.mode }
  $records.Add([pscustomobject]@{
    id = $id; mode = $mode; tier = $row.tier
    edge_type = $row.edge_type; depends_on_or_tests = $row.depends_on_or_tests
  })
}

if ($records.Count -ne 196) { throw "Expected 196 kept v3 records after SC expansion; found $($records.Count)." }
if (($records.id | Sort-Object -Unique).Count -ne 196) { throw 'Expanded canonical IDs are not unique.' }

function Lean-Name([string]$id) {
  'claim_' + (($id -replace '[^A-Za-z0-9_]', '_') -replace '_+', '_')
}

function Claim-Kind([string]$mode) {
  switch ($mode) {
    'AX_CORE' { 'strictDerivation' }
    'AX_DERIVED' { 'strictDerivation' }
    'AX_SCAFFOLD' { 'definition' }
    'FW_EXTENDED' { 'bridge' }
    'HY_EVIDENCE' { 'empirical' }
    default { 'openProblem' }
  }
}

function Dependency-Edge-Kind([string]$mode) {
  switch ($mode) {
    'AX_CORE' { 'entails' }
    'AX_DERIVED' { 'entails' }
    'AX_SCAFFOLD' { 'defines' }
    'FW_EXTENDED' { 'assumes' }
    'HY_EVIDENCE' { 'contextualizes' }
    default { 'contextualizes' }
  }
}

$names = @{}
foreach ($record in $records) { $names[$record.id] = Lean-Name $record.id }

$definitions = [System.Collections.Generic.List[string]]::new()
foreach ($record in $records) {
  $kind = Claim-Kind $record.mode
  $definitions.Add("def $($names[$record.id]) : Claim := { id := `"$($record.id)`", kind := .$kind, status := .candidate }")
}

$claimLines = [System.Collections.Generic.List[string]]::new()
$claimLines.Add('  [ A0')
foreach ($record in $records) { $claimLines.Add("  , $($names[$record.id])") }
$claimLines.Add('  ]')

$edgeLines = [System.Collections.Generic.List[string]]::new()
$edgeLines.Add("  [ { source := A0, target := $($names['A1.0']), kind := .entails }")
$edgeLines.Add("  , { source := A0, target := $($names['A1.1']), kind := .entails }")
$edgeLines.Add("  , { source := A0, target := $($names['A1.2']), kind := .entails }")
$edgeCount = 3

foreach ($record in $records) {
  $dependencies = @($record.depends_on_or_tests -split '\|' | Where-Object { $_ })
  foreach ($dependency in $dependencies) {
    if ($dependency -eq 'PERSONHOOD') { $dependency = 'ID7.2' }
    if (-not $names.ContainsKey($dependency)) { throw "Unresolved edge endpoint '$dependency' for '$($record.id)'." }
    switch ($record.edge_type) {
      'tests' {
        $edgeLines.Add("  , { source := $($names[$record.id]), target := $($names[$dependency]), kind := .tests }")
      }
      'kill_condition_for' {
        $edgeLines.Add("  , { source := $($names[$record.id]), target := $($names[$dependency]), kind := .falsifies }")
      }
      default {
        $kind = Dependency-Edge-Kind $record.mode
        $edgeLines.Add("  , { source := $($names[$dependency]), target := $($names[$record.id]), kind := .$kind }")
      }
    }
    $edgeCount++
  }
}
$edgeLines.Add('  ]')

$auditHash = (Get-FileHash -LiteralPath $AuditPath -Algorithm SHA256).Hash.ToLower()
$out = @(
  'import EpistemicFirewall'
  ''
  'set_option autoImplicit false'
  'set_option maxRecDepth 30000'
  ''
  'namespace Theophysics.CanonicalGraph'
  'open Theophysics.EpistemicFirewall'
  ''
  "/-- v3 graph-audit CSV SHA-256: $auditHash -/"
) + $definitions + @(
  ''
  'def canonicalClaims : List Claim :='
) + $claimLines + @(
  ''
  'def canonicalEdges : List Edge :='
) + $edgeLines + @(
  ''
  '/-- AX_DERIVED remains a live grade with no current members. -/'
  'def canonicalDerivedClaims : List Claim := []'
  ''
  'theorem claim_count : canonicalClaims.length = 197 := by decide'
  'theorem core_grade_count : claimKindCount canonicalClaims .strictDerivation = 4 := by decide'
  'theorem derived_grade_count : canonicalDerivedClaims.length = 0 := by decide'
  'theorem scaffold_grade_count : claimKindCount canonicalClaims .definition = 43 := by decide'
  'theorem framework_grade_count : claimKindCount canonicalClaims .bridge = 114 := by decide'
  'theorem evidence_grade_count : claimKindCount canonicalClaims .empirical = 35 := by decide'
  "theorem declared_edge_count : canonicalEdges.length = $edgeCount := by decide"
  'theorem exactly_one_root : hasExactlyA0AsRoot canonicalClaims = true := by decide'
  'theorem endpoints_exist : allEdgeEndpointsExist canonicalClaims canonicalEdges = true := by decide'
  'theorem entailment_graph_is_acyclic : entailmentAcyclic canonicalClaims canonicalEdges = true := by decide'
  'theorem grade_propagation_passes : gradePropagationValid canonicalEdges = true := by decide'
  'theorem strict_chain_fully_traces_to_A0 : strictClaimsTraceToA0 canonicalClaims canonicalEdges = true := by decide'
  'theorem bc6_ceiling_has_no_strict_descendants : strictDescendantsOf canonicalClaims canonicalEdges claim_BC6 = [] := by decide'
  'theorem canon_lock_structural_gate_passes : canonReady canonicalClaims canonicalEdges = true := by decide'
  ''
  '#eval (unrootedStrictClaims canonicalClaims canonicalEdges).map (fun claim => claim.id)'
  '#eval (gradeViolations canonicalEdges).map (fun edge => (edge.source.id, edge.target.id))'
  '#eval (strictDescendantsOf canonicalClaims canonicalEdges claim_BC6).map (fun claim => claim.id)'
  ''
  '#print axioms claim_count'
  '#print axioms core_grade_count'
  '#print axioms derived_grade_count'
  '#print axioms scaffold_grade_count'
  '#print axioms framework_grade_count'
  '#print axioms evidence_grade_count'
  '#print axioms declared_edge_count'
  '#print axioms exactly_one_root'
  '#print axioms endpoints_exist'
  '#print axioms entailment_graph_is_acyclic'
  '#print axioms grade_propagation_passes'
  '#print axioms strict_chain_fully_traces_to_A0'
  '#print axioms bc6_ceiling_has_no_strict_descendants'
  '#print axioms canon_lock_structural_gate_passes'
  ''
  'end Theophysics.CanonicalGraph'
)

[System.IO.File]::WriteAllLines([System.IO.Path]::GetFullPath($OutputPath), $out, [System.Text.UTF8Encoding]::new($false))
Write-Output "Generated $OutputPath from 196 kept v3 records plus A0 with $edgeCount typed edges."
