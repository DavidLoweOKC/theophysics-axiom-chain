import EpistemicFirewall

set_option autoImplicit false
set_option maxRecDepth 30000

namespace Theophysics.CanonicalGraph
open Theophysics.EpistemicFirewall

/-- v3 graph-audit CSV SHA-256: 2c5449a71f59604e33a64acf267828edbb94ee170c029673e43cf69fdff775d3 -/
def claim_A1_0 : Claim := { id := "A1.0", kind := .strictDerivation, status := .candidate }
def claim_A1_1 : Claim := { id := "A1.1", kind := .strictDerivation, status := .candidate }
def claim_A1_2 : Claim := { id := "A1.2", kind := .strictDerivation, status := .candidate }
def claim_A1_3 : Claim := { id := "A1.3", kind := .definition, status := .candidate }
def claim_D1_1 : Claim := { id := "D1.1", kind := .definition, status := .candidate }
def claim_D1_2 : Claim := { id := "D1.2", kind := .definition, status := .candidate }
def claim_LN1_1 : Claim := { id := "LN1.1", kind := .bridge, status := .candidate }
def claim_LN1_2 : Claim := { id := "LN1.2", kind := .bridge, status := .candidate }
def claim_A2_1 : Claim := { id := "A2.1", kind := .strictDerivation, status := .candidate }
def claim_A2_2 : Claim := { id := "A2.2", kind := .bridge, status := .candidate }
def claim_D2_1 : Claim := { id := "D2.1", kind := .definition, status := .candidate }
def claim_D2_2 : Claim := { id := "D2.2", kind := .definition, status := .candidate }
def claim_E2_1 : Claim := { id := "E2.1", kind := .definition, status := .candidate }
def claim_P2_1 : Claim := { id := "P2.1", kind := .bridge, status := .candidate }
def claim_P2_2 : Claim := { id := "P2.2", kind := .bridge, status := .candidate }
def claim_LN2_1 : Claim := { id := "LN2.1", kind := .bridge, status := .candidate }
def claim_A3_1 : Claim := { id := "A3.1", kind := .bridge, status := .candidate }
def claim_A3_2 : Claim := { id := "A3.2", kind := .bridge, status := .candidate }
def claim_D3_1 : Claim := { id := "D3.1", kind := .definition, status := .candidate }
def claim_D3_2 : Claim := { id := "D3.2", kind := .definition, status := .candidate }
def claim_D3_3 : Claim := { id := "D3.3", kind := .definition, status := .candidate }
def claim_E3_1 : Claim := { id := "E3.1", kind := .definition, status := .candidate }
def claim_E3_2 : Claim := { id := "E3.2", kind := .definition, status := .candidate }
def claim_P3_1 : Claim := { id := "P3.1", kind := .bridge, status := .candidate }
def claim_P3_2 : Claim := { id := "P3.2", kind := .bridge, status := .candidate }
def claim_T3_1 : Claim := { id := "T3.1", kind := .bridge, status := .candidate }
def claim_T3_2 : Claim := { id := "T3.2", kind := .bridge, status := .candidate }
def claim_LN3_1 : Claim := { id := "LN3.1", kind := .bridge, status := .candidate }
def claim_A4_1 : Claim := { id := "A4.1", kind := .bridge, status := .candidate }
def claim_A4_2 : Claim := { id := "A4.2", kind := .bridge, status := .candidate }
def claim_D4_1 : Claim := { id := "D4.1", kind := .definition, status := .candidate }
def claim_D4_2 : Claim := { id := "D4.2", kind := .definition, status := .candidate }
def claim_E4_1 : Claim := { id := "E4.1", kind := .definition, status := .candidate }
def claim_T4_1 : Claim := { id := "T4.1", kind := .bridge, status := .candidate }
def claim_T4_2 : Claim := { id := "T4.2", kind := .bridge, status := .candidate }
def claim_LN4_1 : Claim := { id := "LN4.1", kind := .bridge, status := .candidate }
def claim_A5_1 : Claim := { id := "A5.1", kind := .bridge, status := .candidate }
def claim_A5_2 : Claim := { id := "A5.2", kind := .bridge, status := .candidate }
def claim_D5_1 : Claim := { id := "D5.1", kind := .definition, status := .candidate }
def claim_D5_2 : Claim := { id := "D5.2", kind := .definition, status := .candidate }
def claim_D5_3 : Claim := { id := "D5.3", kind := .definition, status := .candidate }
def claim_P5_1 : Claim := { id := "P5.1", kind := .bridge, status := .candidate }
def claim_P5_2 : Claim := { id := "P5.2", kind := .bridge, status := .candidate }
def claim_EXP5_1 : Claim := { id := "EXP5.1", kind := .empirical, status := .candidate }
def claim_EXP5_2 : Claim := { id := "EXP5.2", kind := .empirical, status := .candidate }
def claim_LN5_1 : Claim := { id := "LN5.1", kind := .bridge, status := .candidate }
def claim_A6_1 : Claim := { id := "A6.1", kind := .bridge, status := .candidate }
def claim_A6_2 : Claim := { id := "A6.2", kind := .bridge, status := .candidate }
def claim_A6_3 : Claim := { id := "A6.3", kind := .bridge, status := .candidate }
def claim_D6_1 : Claim := { id := "D6.1", kind := .definition, status := .candidate }
def claim_D6_2 : Claim := { id := "D6.2", kind := .definition, status := .candidate }
def claim_E6_1 : Claim := { id := "E6.1", kind := .bridge, status := .candidate }
def claim_E6_2 : Claim := { id := "E6.2", kind := .definition, status := .candidate }
def claim_P6_1 : Claim := { id := "P6.1", kind := .bridge, status := .candidate }
def claim_P6_2 : Claim := { id := "P6.2", kind := .bridge, status := .candidate }
def claim_T6_1 : Claim := { id := "T6.1", kind := .bridge, status := .candidate }
def claim_LN6_1 : Claim := { id := "LN6.1", kind := .bridge, status := .candidate }
def claim_A7_1 : Claim := { id := "A7.1", kind := .bridge, status := .candidate }
def claim_A7_2 : Claim := { id := "A7.2", kind := .bridge, status := .candidate }
def claim_BC1 : Claim := { id := "BC1", kind := .bridge, status := .candidate }
def claim_BC2 : Claim := { id := "BC2", kind := .bridge, status := .candidate }
def claim_BC3 : Claim := { id := "BC3", kind := .bridge, status := .candidate }
def claim_BC4a : Claim := { id := "BC4a", kind := .bridge, status := .candidate }
def claim_BC4b : Claim := { id := "BC4b", kind := .bridge, status := .candidate }
def claim_BC5 : Claim := { id := "BC5", kind := .bridge, status := .candidate }
def claim_BC6 : Claim := { id := "BC6", kind := .bridge, status := .candidate }
def claim_BC7 : Claim := { id := "BC7", kind := .bridge, status := .candidate }
def claim_BC8 : Claim := { id := "BC8", kind := .bridge, status := .candidate }
def claim_BC9 : Claim := { id := "BC9", kind := .bridge, status := .candidate }
def claim_ID7_1 : Claim := { id := "ID7.1", kind := .bridge, status := .candidate }
def claim_ID7_2 : Claim := { id := "ID7.2", kind := .bridge, status := .candidate }
def claim_A8_1 : Claim := { id := "A8.1", kind := .bridge, status := .candidate }
def claim_A8_2 : Claim := { id := "A8.2", kind := .bridge, status := .candidate }
def claim_D8_1 : Claim := { id := "D8.1", kind := .definition, status := .candidate }
def claim_T8_1 : Claim := { id := "T8.1", kind := .bridge, status := .candidate }
def claim_C8_1 : Claim := { id := "C8.1", kind := .bridge, status := .candidate }
def claim_C8_2 : Claim := { id := "C8.2", kind := .bridge, status := .candidate }
def claim_A9_1 : Claim := { id := "A9.1", kind := .bridge, status := .candidate }
def claim_A9_2 : Claim := { id := "A9.2", kind := .bridge, status := .candidate }
def claim_D9_1 : Claim := { id := "D9.1", kind := .definition, status := .candidate }
def claim_E9_1 : Claim := { id := "E9.1", kind := .definition, status := .candidate }
def claim_P9_1 : Claim := { id := "P9.1", kind := .bridge, status := .candidate }
def claim_P9_2 : Claim := { id := "P9.2", kind := .bridge, status := .candidate }
def claim_P9_3 : Claim := { id := "P9.3", kind := .bridge, status := .candidate }
def claim_P9_4 : Claim := { id := "P9.4", kind := .bridge, status := .candidate }
def claim_P9_5 : Claim := { id := "P9.5", kind := .bridge, status := .candidate }
def claim_A10_1 : Claim := { id := "A10.1", kind := .bridge, status := .candidate }
def claim_A10_2 : Claim := { id := "A10.2", kind := .bridge, status := .candidate }
def claim_D10_1 : Claim := { id := "D10.1", kind := .definition, status := .candidate }
def claim_E10_1 : Claim := { id := "E10.1", kind := .definition, status := .candidate }
def claim_P10_1 : Claim := { id := "P10.1", kind := .bridge, status := .candidate }
def claim_P10_2 : Claim := { id := "P10.2", kind := .bridge, status := .candidate }
def claim_A11_1 : Claim := { id := "A11.1", kind := .bridge, status := .candidate }
def claim_A11_2 : Claim := { id := "A11.2", kind := .bridge, status := .candidate }
def claim_D11_1 : Claim := { id := "D11.1", kind := .bridge, status := .candidate }
def claim_T11_1 : Claim := { id := "T11.1", kind := .bridge, status := .candidate }
def claim_T11_2 : Claim := { id := "T11.2", kind := .bridge, status := .candidate }
def claim_A12_1 : Claim := { id := "A12.1", kind := .bridge, status := .candidate }
def claim_A12_2 : Claim := { id := "A12.2", kind := .bridge, status := .candidate }
def claim_D12_1 : Claim := { id := "D12.1", kind := .definition, status := .candidate }
def claim_D12_2 : Claim := { id := "D12.2", kind := .definition, status := .candidate }
def claim_E12_1 : Claim := { id := "E12.1", kind := .definition, status := .candidate }
def claim_T12_1 : Claim := { id := "T12.1", kind := .bridge, status := .candidate }
def claim_T12_2 : Claim := { id := "T12.2", kind := .bridge, status := .candidate }
def claim_A13_1 : Claim := { id := "A13.1", kind := .bridge, status := .candidate }
def claim_A13_2 : Claim := { id := "A13.2", kind := .bridge, status := .candidate }
def claim_D13_1 : Claim := { id := "D13.1", kind := .definition, status := .candidate }
def claim_E13_1 : Claim := { id := "E13.1", kind := .definition, status := .candidate }
def claim_T13_1 : Claim := { id := "T13.1", kind := .bridge, status := .candidate }
def claim_A14_1 : Claim := { id := "A14.1", kind := .empirical, status := .candidate }
def claim_A14_2 : Claim := { id := "A14.2", kind := .empirical, status := .candidate }
def claim_D14_1 : Claim := { id := "D14.1", kind := .definition, status := .candidate }
def claim_E14_1 : Claim := { id := "E14.1", kind := .bridge, status := .candidate }
def claim_PRED14_1 : Claim := { id := "PRED14.1", kind := .empirical, status := .candidate }
def claim_D19_1 : Claim := { id := "D19.1", kind := .definition, status := .candidate }
def claim_D19_2 : Claim := { id := "D19.2", kind := .definition, status := .candidate }
def claim_D19_3 : Claim := { id := "D19.3", kind := .definition, status := .candidate }
def claim_D19_4 : Claim := { id := "D19.4", kind := .definition, status := .candidate }
def claim_D19_5 : Claim := { id := "D19.5", kind := .definition, status := .candidate }
def claim_D19_6 : Claim := { id := "D19.6", kind := .definition, status := .candidate }
def claim_D19_7 : Claim := { id := "D19.7", kind := .definition, status := .candidate }
def claim_D19_8 : Claim := { id := "D19.8", kind := .definition, status := .candidate }
def claim_D19_9 : Claim := { id := "D19.9", kind := .definition, status := .candidate }
def claim_D19_10 : Claim := { id := "D19.10", kind := .definition, status := .candidate }
def claim_E19_1 : Claim := { id := "E19.1", kind := .definition, status := .candidate }
def claim_T19_1 : Claim := { id := "T19.1", kind := .bridge, status := .candidate }
def claim_A19_1 : Claim := { id := "A19.1", kind := .empirical, status := .candidate }
def claim_T16_1 : Claim := { id := "T16.1", kind := .bridge, status := .candidate }
def claim_T16_2 : Claim := { id := "T16.2", kind := .bridge, status := .candidate }
def claim_T16_3 : Claim := { id := "T16.3", kind := .bridge, status := .candidate }
def claim_T16_4 : Claim := { id := "T16.4", kind := .bridge, status := .candidate }
def claim_T16_5 : Claim := { id := "T16.5", kind := .bridge, status := .candidate }
def claim_T16_6 : Claim := { id := "T16.6", kind := .bridge, status := .candidate }
def claim_A17_1 : Claim := { id := "A17.1", kind := .empirical, status := .candidate }
def claim_A17_2 : Claim := { id := "A17.2", kind := .bridge, status := .candidate }
def claim_D17_1 : Claim := { id := "D17.1", kind := .definition, status := .candidate }
def claim_T17_1 : Claim := { id := "T17.1", kind := .bridge, status := .candidate }
def claim_OPEN17_1 : Claim := { id := "OPEN17.1", kind := .empirical, status := .candidate }
def claim_EV15_1 : Claim := { id := "EV15.1", kind := .empirical, status := .candidate }
def claim_EV15_2 : Claim := { id := "EV15.2", kind := .empirical, status := .candidate }
def claim_EV15_3 : Claim := { id := "EV15.3", kind := .empirical, status := .candidate }
def claim_EV15_4 : Claim := { id := "EV15.4", kind := .empirical, status := .candidate }
def claim_PROT18_1 : Claim := { id := "PROT18.1", kind := .empirical, status := .candidate }
def claim_PROT18_2 : Claim := { id := "PROT18.2", kind := .empirical, status := .candidate }
def claim_PROT18_3 : Claim := { id := "PROT18.3", kind := .empirical, status := .candidate }
def claim_PROT18_4 : Claim := { id := "PROT18.4", kind := .empirical, status := .candidate }
def claim_PROT18_5 : Claim := { id := "PROT18.5", kind := .empirical, status := .candidate }
def claim_PRED18_1 : Claim := { id := "PRED18.1", kind := .empirical, status := .candidate }
def claim_PRED18_2 : Claim := { id := "PRED18.2", kind := .empirical, status := .candidate }
def claim_FALS18_1 : Claim := { id := "FALS18.1", kind := .empirical, status := .candidate }
def claim_FALS18_2 : Claim := { id := "FALS18.2", kind := .empirical, status := .candidate }
def claim_FALS18_3 : Claim := { id := "FALS18.3", kind := .empirical, status := .candidate }
def claim_U1 : Claim := { id := "U1", kind := .bridge, status := .candidate }
def claim_U2 : Claim := { id := "U2", kind := .bridge, status := .candidate }
def claim_U3 : Claim := { id := "U3", kind := .bridge, status := .candidate }
def claim_U4 : Claim := { id := "U4", kind := .empirical, status := .candidate }
def claim_LOVE_ROOT : Claim := { id := "LOVE-ROOT", kind := .bridge, status := .candidate }
def claim_FRUIT_GEN : Claim := { id := "FRUIT-GEN", kind := .bridge, status := .candidate }
def claim_F1 : Claim := { id := "F1", kind := .empirical, status := .candidate }
def claim_F2 : Claim := { id := "F2", kind := .empirical, status := .candidate }
def claim_F3 : Claim := { id := "F3", kind := .empirical, status := .candidate }
def claim_F4 : Claim := { id := "F4", kind := .empirical, status := .candidate }
def claim_F5 : Claim := { id := "F5", kind := .empirical, status := .candidate }
def claim_F6 : Claim := { id := "F6", kind := .empirical, status := .candidate }
def claim_F7 : Claim := { id := "F7", kind := .empirical, status := .candidate }
def claim_F8 : Claim := { id := "F8", kind := .empirical, status := .candidate }
def claim_F9 : Claim := { id := "F9", kind := .empirical, status := .candidate }
def claim_BRIDGE_PHY_THEO : Claim := { id := "BRIDGE-PHY-THEO", kind := .empirical, status := .candidate }
def claim_BRIDGE_INFO_MIND : Claim := { id := "BRIDGE-INFO-MIND", kind := .empirical, status := .candidate }
def claim_BRIDGE_PHI_CHI : Claim := { id := "BRIDGE-PHI-CHI", kind := .empirical, status := .candidate }
def claim_P0 : Claim := { id := "P0", kind := .bridge, status := .candidate }
def claim_P1 : Claim := { id := "P1", kind := .bridge, status := .candidate }
def claim_P2 : Claim := { id := "P2", kind := .bridge, status := .candidate }
def claim_P3 : Claim := { id := "P3", kind := .bridge, status := .candidate }
def claim_P4 : Claim := { id := "P4", kind := .bridge, status := .candidate }
def claim_P5 : Claim := { id := "P5", kind := .bridge, status := .candidate }
def claim_O1 : Claim := { id := "O1", kind := .bridge, status := .candidate }
def claim_O2 : Claim := { id := "O2", kind := .bridge, status := .candidate }
def claim_O3 : Claim := { id := "O3", kind := .bridge, status := .candidate }
def claim_O4 : Claim := { id := "O4", kind := .bridge, status := .candidate }
def claim_SC_QUANTUM : Claim := { id := "SC-QUANTUM", kind := .bridge, status := .candidate }
def claim_SC_PHYSICAL : Claim := { id := "SC-PHYSICAL", kind := .bridge, status := .candidate }
def claim_SC_NEURAL : Claim := { id := "SC-NEURAL", kind := .bridge, status := .candidate }
def claim_SC_INDIVIDUAL : Claim := { id := "SC-INDIVIDUAL", kind := .bridge, status := .candidate }
def claim_SC_SOCIAL : Claim := { id := "SC-SOCIAL", kind := .bridge, status := .candidate }
def claim_SC_COSMIC : Claim := { id := "SC-COSMIC", kind := .bridge, status := .candidate }
def claim_META_1 : Claim := { id := "META-1", kind := .bridge, status := .candidate }
def claim_META_2 : Claim := { id := "META-2", kind := .bridge, status := .candidate }
def claim_META_3 : Claim := { id := "META-3", kind := .bridge, status := .candidate }
def claim_FINAL_1 : Claim := { id := "FINAL-1", kind := .bridge, status := .candidate }
def claim_FINAL_2 : Claim := { id := "FINAL-2", kind := .bridge, status := .candidate }
def claim_FINAL_3 : Claim := { id := "FINAL-3", kind := .bridge, status := .candidate }
def claim_LAMBDA : Claim := { id := "LAMBDA", kind := .bridge, status := .candidate }
def claim_CLOSURE : Claim := { id := "CLOSURE", kind := .bridge, status := .candidate }
def claim_OMEGA : Claim := { id := "OMEGA", kind := .bridge, status := .candidate }
def claim_INV9 : Claim := { id := "INV9", kind := .bridge, status := .candidate }

def canonicalClaims : List Claim :=
  [ A0
  , claim_A1_0
  , claim_A1_1
  , claim_A1_2
  , claim_A1_3
  , claim_D1_1
  , claim_D1_2
  , claim_LN1_1
  , claim_LN1_2
  , claim_A2_1
  , claim_A2_2
  , claim_D2_1
  , claim_D2_2
  , claim_E2_1
  , claim_P2_1
  , claim_P2_2
  , claim_LN2_1
  , claim_A3_1
  , claim_A3_2
  , claim_D3_1
  , claim_D3_2
  , claim_D3_3
  , claim_E3_1
  , claim_E3_2
  , claim_P3_1
  , claim_P3_2
  , claim_T3_1
  , claim_T3_2
  , claim_LN3_1
  , claim_A4_1
  , claim_A4_2
  , claim_D4_1
  , claim_D4_2
  , claim_E4_1
  , claim_T4_1
  , claim_T4_2
  , claim_LN4_1
  , claim_A5_1
  , claim_A5_2
  , claim_D5_1
  , claim_D5_2
  , claim_D5_3
  , claim_P5_1
  , claim_P5_2
  , claim_EXP5_1
  , claim_EXP5_2
  , claim_LN5_1
  , claim_A6_1
  , claim_A6_2
  , claim_A6_3
  , claim_D6_1
  , claim_D6_2
  , claim_E6_1
  , claim_E6_2
  , claim_P6_1
  , claim_P6_2
  , claim_T6_1
  , claim_LN6_1
  , claim_A7_1
  , claim_A7_2
  , claim_BC1
  , claim_BC2
  , claim_BC3
  , claim_BC4a
  , claim_BC4b
  , claim_BC5
  , claim_BC6
  , claim_BC7
  , claim_BC8
  , claim_BC9
  , claim_ID7_1
  , claim_ID7_2
  , claim_A8_1
  , claim_A8_2
  , claim_D8_1
  , claim_T8_1
  , claim_C8_1
  , claim_C8_2
  , claim_A9_1
  , claim_A9_2
  , claim_D9_1
  , claim_E9_1
  , claim_P9_1
  , claim_P9_2
  , claim_P9_3
  , claim_P9_4
  , claim_P9_5
  , claim_A10_1
  , claim_A10_2
  , claim_D10_1
  , claim_E10_1
  , claim_P10_1
  , claim_P10_2
  , claim_A11_1
  , claim_A11_2
  , claim_D11_1
  , claim_T11_1
  , claim_T11_2
  , claim_A12_1
  , claim_A12_2
  , claim_D12_1
  , claim_D12_2
  , claim_E12_1
  , claim_T12_1
  , claim_T12_2
  , claim_A13_1
  , claim_A13_2
  , claim_D13_1
  , claim_E13_1
  , claim_T13_1
  , claim_A14_1
  , claim_A14_2
  , claim_D14_1
  , claim_E14_1
  , claim_PRED14_1
  , claim_D19_1
  , claim_D19_2
  , claim_D19_3
  , claim_D19_4
  , claim_D19_5
  , claim_D19_6
  , claim_D19_7
  , claim_D19_8
  , claim_D19_9
  , claim_D19_10
  , claim_E19_1
  , claim_T19_1
  , claim_A19_1
  , claim_T16_1
  , claim_T16_2
  , claim_T16_3
  , claim_T16_4
  , claim_T16_5
  , claim_T16_6
  , claim_A17_1
  , claim_A17_2
  , claim_D17_1
  , claim_T17_1
  , claim_OPEN17_1
  , claim_EV15_1
  , claim_EV15_2
  , claim_EV15_3
  , claim_EV15_4
  , claim_PROT18_1
  , claim_PROT18_2
  , claim_PROT18_3
  , claim_PROT18_4
  , claim_PROT18_5
  , claim_PRED18_1
  , claim_PRED18_2
  , claim_FALS18_1
  , claim_FALS18_2
  , claim_FALS18_3
  , claim_U1
  , claim_U2
  , claim_U3
  , claim_U4
  , claim_LOVE_ROOT
  , claim_FRUIT_GEN
  , claim_F1
  , claim_F2
  , claim_F3
  , claim_F4
  , claim_F5
  , claim_F6
  , claim_F7
  , claim_F8
  , claim_F9
  , claim_BRIDGE_PHY_THEO
  , claim_BRIDGE_INFO_MIND
  , claim_BRIDGE_PHI_CHI
  , claim_P0
  , claim_P1
  , claim_P2
  , claim_P3
  , claim_P4
  , claim_P5
  , claim_O1
  , claim_O2
  , claim_O3
  , claim_O4
  , claim_SC_QUANTUM
  , claim_SC_PHYSICAL
  , claim_SC_NEURAL
  , claim_SC_INDIVIDUAL
  , claim_SC_SOCIAL
  , claim_SC_COSMIC
  , claim_META_1
  , claim_META_2
  , claim_META_3
  , claim_FINAL_1
  , claim_FINAL_2
  , claim_FINAL_3
  , claim_LAMBDA
  , claim_CLOSURE
  , claim_OMEGA
  , claim_INV9
  ]

def canonicalEdges : List Edge :=
  [ { source := A0, target := claim_A1_0, kind := .entails }
  , { source := A0, target := claim_A1_1, kind := .entails }
  , { source := A0, target := claim_A1_2, kind := .entails }
  , { source := claim_A1_0, target := claim_A1_3, kind := .defines }
  , { source := claim_A1_1, target := claim_D1_1, kind := .defines }
  , { source := claim_A1_2, target := claim_D1_1, kind := .defines }
  , { source := claim_A1_1, target := claim_D1_2, kind := .defines }
  , { source := claim_A1_2, target := claim_D1_2, kind := .defines }
  , { source := claim_A1_1, target := claim_LN1_1, kind := .assumes }
  , { source := claim_A1_2, target := claim_LN1_1, kind := .assumes }
  , { source := claim_A1_1, target := claim_LN1_2, kind := .assumes }
  , { source := claim_A1_2, target := claim_LN1_2, kind := .assumes }
  , { source := claim_A1_0, target := claim_A2_1, kind := .entails }
  , { source := claim_A2_1, target := claim_A2_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_D2_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D2_2, kind := .defines }
  , { source := claim_A2_2, target := claim_E2_1, kind := .defines }
  , { source := claim_A2_2, target := claim_P2_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_P2_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN2_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A3_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_D3_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D3_2, kind := .defines }
  , { source := claim_A2_2, target := claim_D3_3, kind := .defines }
  , { source := claim_A2_2, target := claim_E3_1, kind := .defines }
  , { source := claim_A2_2, target := claim_E3_2, kind := .defines }
  , { source := claim_A2_2, target := claim_P3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_P3_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_T3_1, kind := .assumes }
  , { source := claim_T3_1, target := claim_T3_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A4_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A4_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_D4_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D4_2, kind := .defines }
  , { source := claim_A2_2, target := claim_E4_1, kind := .defines }
  , { source := claim_A2_2, target := claim_T4_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_T4_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN4_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A5_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_D5_1, kind := .defines }
  , { source := claim_A5_1, target := claim_D5_2, kind := .defines }
  , { source := claim_A5_1, target := claim_D5_3, kind := .defines }
  , { source := claim_A5_1, target := claim_P5_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_P5_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_EXP5_1, kind := .contextualizes }
  , { source := claim_A5_1, target := claim_EXP5_2, kind := .contextualizes }
  , { source := claim_A5_1, target := claim_LN5_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_3, kind := .assumes }
  , { source := claim_A5_1, target := claim_D6_1, kind := .defines }
  , { source := claim_A5_1, target := claim_D6_2, kind := .defines }
  , { source := claim_A5_1, target := claim_E6_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_E6_2, kind := .defines }
  , { source := claim_D5_2, target := claim_E6_2, kind := .defines }
  , { source := claim_A6_2, target := claim_E6_2, kind := .defines }
  , { source := claim_A6_2, target := claim_P6_1, kind := .assumes }
  , { source := claim_A6_3, target := claim_P6_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_T6_1, kind := .assumes }
  , { source := claim_A6_2, target := claim_T6_1, kind := .assumes }
  , { source := claim_T6_1, target := claim_LN6_1, kind := .assumes }
  , { source := claim_LN6_1, target := claim_A7_1, kind := .assumes }
  , { source := claim_A7_1, target := claim_A7_2, kind := .assumes }
  , { source := claim_LN6_1, target := claim_BC1, kind := .assumes }
  , { source := claim_A7_1, target := claim_BC1, kind := .assumes }
  , { source := claim_T3_1, target := claim_BC2, kind := .assumes }
  , { source := claim_T3_2, target := claim_BC2, kind := .assumes }
  , { source := claim_A5_1, target := claim_BC3, kind := .assumes }
  , { source := claim_A6_2, target := claim_BC3, kind := .assumes }
  , { source := claim_BC4a, target := claim_BC4b, kind := .assumes }
  , { source := claim_BC4a, target := claim_BC5, kind := .assumes }
  , { source := claim_BC6, target := claim_BC7, kind := .assumes }
  , { source := claim_BC6, target := claim_BC8, kind := .assumes }
  , { source := claim_BC4a, target := claim_BC9, kind := .assumes }
  , { source := claim_BC6, target := claim_BC9, kind := .assumes }
  , { source := claim_BC6, target := claim_ID7_1, kind := .assumes }
  , { source := claim_BC6, target := claim_ID7_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A8_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D8_1, kind := .defines }
  , { source := claim_BC6, target := claim_T8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_C8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_C8_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A9_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A9_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D9_1, kind := .defines }
  , { source := claim_BC6, target := claim_E9_1, kind := .defines }
  , { source := claim_BC6, target := claim_P9_1, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_2, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_3, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_4, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_5, kind := .assumes }
  , { source := claim_BC6, target := claim_A10_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A10_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D10_1, kind := .defines }
  , { source := claim_BC6, target := claim_E10_1, kind := .defines }
  , { source := claim_BC6, target := claim_P10_1, kind := .assumes }
  , { source := claim_BC6, target := claim_P10_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A11_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A11_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D11_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T11_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T11_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A12_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A12_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D12_1, kind := .defines }
  , { source := claim_BC6, target := claim_D12_2, kind := .defines }
  , { source := claim_BC6, target := claim_E12_1, kind := .defines }
  , { source := claim_BC6, target := claim_T12_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T12_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A13_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A13_2, kind := .assumes }
  , { source := claim_BC6, target := claim_D13_1, kind := .defines }
  , { source := claim_BC6, target := claim_E13_1, kind := .defines }
  , { source := claim_BC6, target := claim_T13_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A14_1, kind := .contextualizes }
  , { source := claim_BC6, target := claim_A14_2, kind := .contextualizes }
  , { source := claim_BC6, target := claim_D14_1, kind := .defines }
  , { source := claim_BC6, target := claim_E14_1, kind := .assumes }
  , { source := claim_E14_1, target := claim_PRED14_1, kind := .contextualizes }
  , { source := claim_D3_3, target := claim_D19_1, kind := .defines }
  , { source := claim_E2_1, target := claim_D19_2, kind := .defines }
  , { source := claim_T3_1, target := claim_D19_3, kind := .defines }
  , { source := claim_A8_2, target := claim_D19_3, kind := .defines }
  , { source := claim_D9_1, target := claim_D19_4, kind := .defines }
  , { source := claim_P3_2, target := claim_D19_5, kind := .defines }
  , { source := claim_T3_1, target := claim_D19_6, kind := .defines }
  , { source := claim_LN5_1, target := claim_D19_7, kind := .defines }
  , { source := claim_D8_1, target := claim_D19_8, kind := .defines }
  , { source := claim_A9_2, target := claim_D19_9, kind := .defines }
  , { source := claim_BC4a, target := claim_D19_10, kind := .defines }
  , { source := claim_D19_1, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_2, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_3, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_4, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_5, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_6, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_7, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_8, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_9, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_10, target := claim_E19_1, kind := .defines }
  , { source := claim_E19_1, target := claim_T19_1, kind := .assumes }
  , { source := claim_D2_1, target := claim_T19_1, kind := .assumes }
  , { source := claim_E2_1, target := claim_A19_1, kind := .contextualizes }
  , { source := claim_E3_1, target := claim_A19_1, kind := .contextualizes }
  , { source := claim_BC1, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC4a, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC7, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC8, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC9, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC4a, target := claim_T16_2, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC4a, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC7, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC8, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC9, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_4, kind := .assumes }
  , { source := claim_A7_2, target := claim_T16_5, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC4a, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_6, kind := .assumes }
  , { source := claim_D5_2, target := claim_A17_1, kind := .contextualizes }
  , { source := claim_A17_1, target := claim_A17_2, kind := .assumes }
  , { source := claim_D5_2, target := claim_D17_1, kind := .defines }
  , { source := claim_A17_1, target := claim_T17_1, kind := .assumes }
  , { source := claim_A17_2, target := claim_T17_1, kind := .assumes }
  , { source := claim_T17_1, target := claim_OPEN17_1, kind := .contextualizes }
  , { source := claim_A11_1, target := claim_OPEN17_1, kind := .contextualizes }
  , { source := claim_EV15_1, target := claim_ID7_1, kind := .tests }
  , { source := claim_EV15_2, target := claim_P5_2, kind := .tests }
  , { source := claim_EV15_2, target := claim_D5_2, kind := .tests }
  , { source := claim_EV15_3, target := claim_P5_2, kind := .tests }
  , { source := claim_EV15_4, target := claim_A3_2, kind := .tests }
  , { source := claim_EV15_4, target := claim_E3_2, kind := .tests }
  , { source := claim_PROT18_1, target := claim_BC4a, kind := .tests }
  , { source := claim_PROT18_1, target := claim_BC4b, kind := .tests }
  , { source := claim_PROT18_2, target := claim_A6_2, kind := .tests }
  , { source := claim_PROT18_2, target := claim_E6_2, kind := .tests }
  , { source := claim_PROT18_3, target := claim_D9_1, kind := .tests }
  , { source := claim_PROT18_3, target := claim_T3_1, kind := .tests }
  , { source := claim_PROT18_4, target := claim_E3_2, kind := .tests }
  , { source := claim_PROT18_5, target := claim_T11_1, kind := .tests }
  , { source := claim_PRED18_1, target := claim_PRED14_1, kind := .tests }
  , { source := claim_PRED18_2, target := claim_EV15_2, kind := .tests }
  , { source := claim_FALS18_1, target := claim_D2_1, kind := .falsifies }
  , { source := claim_FALS18_2, target := claim_D9_1, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC1, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC2, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC3, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC4a, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC5, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC6, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC7, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC8, kind := .falsifies }
  , { source := claim_FALS18_3, target := claim_BC9, kind := .falsifies }
  , { source := claim_A3_2, target := claim_U1, kind := .assumes }
  , { source := claim_E3_2, target := claim_U1, kind := .assumes }
  , { source := claim_T3_1, target := claim_U2, kind := .assumes }
  , { source := claim_D9_1, target := claim_U3, kind := .assumes }
  , { source := claim_LOVE_ROOT, target := claim_U4, kind := .contextualizes }
  , { source := claim_BC6, target := claim_LOVE_ROOT, kind := .assumes }
  , { source := claim_A11_2, target := claim_LOVE_ROOT, kind := .assumes }
  , { source := claim_LOVE_ROOT, target := claim_FRUIT_GEN, kind := .assumes }
  , { source := claim_FRUIT_GEN, target := claim_F1, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F2, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F3, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F4, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F5, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F6, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F7, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F8, kind := .contextualizes }
  , { source := claim_FRUIT_GEN, target := claim_F9, kind := .contextualizes }
  , { source := claim_ID7_1, target := claim_BRIDGE_PHY_THEO, kind := .contextualizes }
  , { source := claim_D2_1, target := claim_BRIDGE_PHY_THEO, kind := .contextualizes }
  , { source := claim_A5_1, target := claim_BRIDGE_INFO_MIND, kind := .contextualizes }
  , { source := claim_D2_1, target := claim_BRIDGE_INFO_MIND, kind := .contextualizes }
  , { source := claim_D5_2, target := claim_BRIDGE_PHI_CHI, kind := .contextualizes }
  , { source := claim_D2_2, target := claim_BRIDGE_PHI_CHI, kind := .contextualizes }
  , { source := claim_A1_1, target := claim_P0, kind := .assumes }
  , { source := claim_A5_1, target := claim_P1, kind := .assumes }
  , { source := claim_A1_3, target := claim_P2, kind := .assumes }
  , { source := claim_A3_2, target := claim_P3, kind := .assumes }
  , { source := claim_A5_2, target := claim_P4, kind := .assumes }
  , { source := claim_A7_1, target := claim_P5, kind := .assumes }
  , { source := claim_A1_3, target := claim_O1, kind := .assumes }
  , { source := claim_A3_2, target := claim_O2, kind := .assumes }
  , { source := claim_A5_1, target := claim_O3, kind := .assumes }
  , { source := claim_A5_2, target := claim_O4, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_QUANTUM, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_PHYSICAL, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_NEURAL, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_INDIVIDUAL, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_SOCIAL, kind := .assumes }
  , { source := claim_A2_2, target := claim_SC_COSMIC, kind := .assumes }
  , { source := claim_A2_2, target := claim_META_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_META_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_META_3, kind := .assumes }
  , { source := claim_A2_2, target := claim_FINAL_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_FINAL_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_FINAL_3, kind := .assumes }
  , { source := claim_ID7_1, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O1, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O2, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O3, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O4, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_A2_2, target := claim_CLOSURE, kind := .assumes }
  , { source := claim_A2_2, target := claim_OMEGA, kind := .assumes }
  , { source := claim_BC4a, target := claim_INV9, kind := .assumes }
  , { source := claim_BC6, target := claim_INV9, kind := .assumes }
  ]

/-- AX_DERIVED remains a live grade with no current members. -/
def canonicalDerivedClaims : List Claim := []

theorem claim_count : canonicalClaims.length = 197 := by decide
theorem core_grade_count : claimKindCount canonicalClaims .strictDerivation = 4 := by decide
theorem derived_grade_count : canonicalDerivedClaims.length = 0 := by decide
theorem scaffold_grade_count : claimKindCount canonicalClaims .definition = 43 := by decide
theorem framework_grade_count : claimKindCount canonicalClaims .bridge = 114 := by decide
theorem evidence_grade_count : claimKindCount canonicalClaims .empirical = 35 := by decide
theorem declared_edge_count : canonicalEdges.length = 262 := by decide
theorem exactly_one_root : hasExactlyA0AsRoot canonicalClaims = true := by decide
theorem endpoints_exist : allEdgeEndpointsExist canonicalClaims canonicalEdges = true := by decide
theorem entailment_graph_is_acyclic : entailmentAcyclic canonicalClaims canonicalEdges = true := by decide
theorem grade_propagation_passes : gradePropagationValid canonicalEdges = true := by decide
theorem strict_chain_fully_traces_to_A0 : strictClaimsTraceToA0 canonicalClaims canonicalEdges = true := by decide
theorem bc6_ceiling_has_no_strict_descendants : strictDescendantsOf canonicalClaims canonicalEdges claim_BC6 = [] := by decide
theorem canon_lock_structural_gate_passes : canonReady canonicalClaims canonicalEdges = true := by decide

#eval (unrootedStrictClaims canonicalClaims canonicalEdges).map (fun claim => claim.id)
#eval (gradeViolations canonicalEdges).map (fun edge => (edge.source.id, edge.target.id))
#eval (strictDescendantsOf canonicalClaims canonicalEdges claim_BC6).map (fun claim => claim.id)

#print axioms claim_count
#print axioms core_grade_count
#print axioms derived_grade_count
#print axioms scaffold_grade_count
#print axioms framework_grade_count
#print axioms evidence_grade_count
#print axioms declared_edge_count
#print axioms exactly_one_root
#print axioms endpoints_exist
#print axioms entailment_graph_is_acyclic
#print axioms grade_propagation_passes
#print axioms strict_chain_fully_traces_to_A0
#print axioms bc6_ceiling_has_no_strict_descendants
#print axioms canon_lock_structural_gate_passes

end Theophysics.CanonicalGraph
