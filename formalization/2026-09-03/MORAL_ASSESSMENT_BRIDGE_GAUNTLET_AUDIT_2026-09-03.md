# Moral Assessment Bridge Gauntlet — Audit

**Date:** 2026-09-03  
**Lean source:** `MoralAssessmentBridgeGauntlet.lean`  
**Compile receipt:** `MoralAssessmentBridgeGauntlet.compile.txt`  
**Result:** PASS (`lake env lean MoralAssessmentBridgeGauntlet.lean`, exit code 0)

## Question tested

What is the smallest declared bridge by which a physically recorded event becomes morally assessable?

## Result

The tested bridge requires:

1. correct event identity;
2. correct agent attribution;
3. awareness;
4. norm understanding;
5. a meaningful alternative;
6. relevant control;
7. an independently supplied moral standard.

Lean verified one positive case, six premise-removal controls, a standard-underdetermination countermodel, and determinacy relative to a fixed standard and fixed case. All nine reported theorems are axiom-free in the successful compiler output.

## Central negative result

The same event, trace, attribution, and capacity profile can receive opposite verdicts when opposite moral standards are supplied. Therefore physical description plus responsible agency does not uniquely derive moral valence.

## Central positive result

Once a moral standard is fixed, the complete matching case produces a determinate verdict. Two successful evaluations of the same fixed case under the same fixed standard cannot disagree.

## Ruling

The is–ought boundary is not a dead end, but it is a typed interface. Physics supplies facts and traces; a capacity model determines whether the agent is eligible for assessment; a normative standard supplies the verdict. Lean can verify the composition and its failure modes. Lean does not choose or prove the normative standard merely by formalizing it.

## Strongest statement earned

> A correctly attributed physical record, joined to an accountable agent profile and an independently justified moral standard, is sufficient for a determinate moral assessment within the declared model.

The identification of that standard with God's nature or command is theological and philosophical work outside this theorem.
