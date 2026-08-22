import EpistemicFirewall

set_option autoImplicit false
set_option maxRecDepth 20000

namespace Theophysics.CanonicalGraph
open Theophysics.EpistemicFirewall

/-- Source SHA-256: 2707631276d56b28f8be5516d7a332a6976cc27c06cc28a45c1fd37fc899889d -/
def claim_A1_1 : Claim := { id := "A1.1", kind := .strictDerivation, status := .candidate }
def claim_A1_2 : Claim := { id := "A1.2", kind := .strictDerivation, status := .candidate }
def claim_A2_1 : Claim := { id := "A2.1", kind := .strictDerivation, status := .candidate }
def claim_A2_2 : Claim := { id := "A2.2", kind := .strictDerivation, status := .candidate }
def claim_A5_1 : Claim := { id := "A5.1", kind := .bridge, status := .candidate }
def claim_BC4 : Claim := { id := "BC4", kind := .bridge, status := .candidate }
def claim_BC6 : Claim := { id := "BC6", kind := .bridge, status := .candidate }
def claim_A1_3 : Claim := { id := "A1.3", kind := .strictDerivation, status := .candidate }
def claim_T3_1 : Claim := { id := "T3.1", kind := .strictDerivation, status := .candidate }
def claim_BC2 : Claim := { id := "BC2", kind := .strictDerivation, status := .candidate }
def claim_BC7 : Claim := { id := "BC7", kind := .bridge, status := .candidate }
def claim_BC8 : Claim := { id := "BC8", kind := .bridge, status := .candidate }
def claim_D1_1 : Claim := { id := "D1.1", kind := .definition, status := .candidate }
def claim_D1_2 : Claim := { id := "D1.2", kind := .definition, status := .candidate }
def claim_D2_1 : Claim := { id := "D2.1", kind := .definition, status := .candidate }
def claim_D2_2 : Claim := { id := "D2.2", kind := .definition, status := .candidate }
def claim_E2_1 : Claim := { id := "E2.1", kind := .definition, status := .candidate }
def claim_D3_1 : Claim := { id := "D3.1", kind := .definition, status := .candidate }
def claim_D3_2 : Claim := { id := "D3.2", kind := .definition, status := .candidate }
def claim_D3_3 : Claim := { id := "D3.3", kind := .definition, status := .candidate }
def claim_E3_1 : Claim := { id := "E3.1", kind := .definition, status := .candidate }
def claim_E3_2 : Claim := { id := "E3.2", kind := .definition, status := .candidate }
def claim_D4_1 : Claim := { id := "D4.1", kind := .definition, status := .candidate }
def claim_D4_2 : Claim := { id := "D4.2", kind := .definition, status := .candidate }
def claim_E4_1 : Claim := { id := "E4.1", kind := .definition, status := .candidate }
def claim_D5_1 : Claim := { id := "D5.1", kind := .definition, status := .candidate }
def claim_D5_2 : Claim := { id := "D5.2", kind := .definition, status := .candidate }
def claim_D5_3 : Claim := { id := "D5.3", kind := .definition, status := .candidate }
def claim_D6_1 : Claim := { id := "D6.1", kind := .definition, status := .candidate }
def claim_D6_2 : Claim := { id := "D6.2", kind := .definition, status := .candidate }
def claim_E6_2 : Claim := { id := "E6.2", kind := .definition, status := .candidate }
def claim_D8_1 : Claim := { id := "D8.1", kind := .definition, status := .candidate }
def claim_D9_1 : Claim := { id := "D9.1", kind := .definition, status := .candidate }
def claim_E9_1 : Claim := { id := "E9.1", kind := .definition, status := .candidate }
def claim_D10_1 : Claim := { id := "D10.1", kind := .definition, status := .candidate }
def claim_E10_1 : Claim := { id := "E10.1", kind := .definition, status := .candidate }
def claim_D11_1 : Claim := { id := "D11.1", kind := .definition, status := .candidate }
def claim_D12_1 : Claim := { id := "D12.1", kind := .definition, status := .candidate }
def claim_D12_2 : Claim := { id := "D12.2", kind := .definition, status := .candidate }
def claim_E12_1 : Claim := { id := "E12.1", kind := .definition, status := .candidate }
def claim_D13_1 : Claim := { id := "D13.1", kind := .definition, status := .candidate }
def claim_E13_1 : Claim := { id := "E13.1", kind := .definition, status := .candidate }
def claim_D14_1 : Claim := { id := "D14.1", kind := .definition, status := .candidate }
def claim_D17_1 : Claim := { id := "D17.1", kind := .definition, status := .candidate }
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
def claim_LN1_1 : Claim := { id := "LN1.1", kind := .bridge, status := .candidate }
def claim_LN1_2 : Claim := { id := "LN1.2", kind := .bridge, status := .candidate }
def claim_P2_1 : Claim := { id := "P2.1", kind := .bridge, status := .candidate }
def claim_P2_2 : Claim := { id := "P2.2", kind := .bridge, status := .candidate }
def claim_LN2_1 : Claim := { id := "LN2.1", kind := .bridge, status := .candidate }
def claim_A3_1 : Claim := { id := "A3.1", kind := .bridge, status := .candidate }
def claim_A3_2 : Claim := { id := "A3.2", kind := .bridge, status := .candidate }
def claim_P3_1 : Claim := { id := "P3.1", kind := .bridge, status := .candidate }
def claim_P3_2 : Claim := { id := "P3.2", kind := .bridge, status := .candidate }
def claim_LN3_1 : Claim := { id := "LN3.1", kind := .bridge, status := .candidate }
def claim_A4_1 : Claim := { id := "A4.1", kind := .bridge, status := .candidate }
def claim_A4_2 : Claim := { id := "A4.2", kind := .bridge, status := .candidate }
def claim_T4_1 : Claim := { id := "T4.1", kind := .bridge, status := .candidate }
def claim_T4_2 : Claim := { id := "T4.2", kind := .bridge, status := .candidate }
def claim_LN4_1 : Claim := { id := "LN4.1", kind := .bridge, status := .candidate }
def claim_A5_2 : Claim := { id := "A5.2", kind := .bridge, status := .candidate }
def claim_P5_1 : Claim := { id := "P5.1", kind := .bridge, status := .candidate }
def claim_P5_2 : Claim := { id := "P5.2", kind := .bridge, status := .candidate }
def claim_LN5_1 : Claim := { id := "LN5.1", kind := .bridge, status := .candidate }
def claim_A6_1 : Claim := { id := "A6.1", kind := .bridge, status := .candidate }
def claim_A6_2 : Claim := { id := "A6.2", kind := .bridge, status := .candidate }
def claim_A6_3 : Claim := { id := "A6.3", kind := .bridge, status := .candidate }
def claim_E6_1 : Claim := { id := "E6.1", kind := .bridge, status := .candidate }
def claim_P6_1 : Claim := { id := "P6.1", kind := .bridge, status := .candidate }
def claim_P6_2 : Claim := { id := "P6.2", kind := .bridge, status := .candidate }
def claim_T6_1 : Claim := { id := "T6.1", kind := .bridge, status := .candidate }
def claim_LN6_1 : Claim := { id := "LN6.1", kind := .bridge, status := .candidate }
def claim_A7_1 : Claim := { id := "A7.1", kind := .bridge, status := .candidate }
def claim_A7_2 : Claim := { id := "A7.2", kind := .bridge, status := .candidate }
def claim_BC1 : Claim := { id := "BC1", kind := .bridge, status := .candidate }
def claim_BC3 : Claim := { id := "BC3", kind := .bridge, status := .candidate }
def claim_BC5 : Claim := { id := "BC5", kind := .bridge, status := .candidate }
def claim_BC9 : Claim := { id := "BC9", kind := .bridge, status := .candidate }
def claim_ID7_1 : Claim := { id := "ID7.1", kind := .bridge, status := .candidate }
def claim_PERSONHOOD : Claim := { id := "PERSONHOOD", kind := .bridge, status := .candidate }
def claim_A8_1 : Claim := { id := "A8.1", kind := .bridge, status := .candidate }
def claim_A8_2 : Claim := { id := "A8.2", kind := .bridge, status := .candidate }
def claim_T8_1 : Claim := { id := "T8.1", kind := .bridge, status := .candidate }
def claim_C8_1 : Claim := { id := "C8.1", kind := .bridge, status := .candidate }
def claim_C8_2 : Claim := { id := "C8.2", kind := .bridge, status := .candidate }
def claim_A9_1 : Claim := { id := "A9.1", kind := .bridge, status := .candidate }
def claim_A9_2 : Claim := { id := "A9.2", kind := .bridge, status := .candidate }
def claim_P9_1 : Claim := { id := "P9.1", kind := .bridge, status := .candidate }
def claim_P9_2 : Claim := { id := "P9.2", kind := .bridge, status := .candidate }
def claim_P9_3 : Claim := { id := "P9.3", kind := .bridge, status := .candidate }
def claim_P9_4 : Claim := { id := "P9.4", kind := .bridge, status := .candidate }
def claim_P9_5 : Claim := { id := "P9.5", kind := .bridge, status := .candidate }
def claim_A10_1 : Claim := { id := "A10.1", kind := .bridge, status := .candidate }
def claim_A10_2 : Claim := { id := "A10.2", kind := .bridge, status := .candidate }
def claim_P10_1 : Claim := { id := "P10.1", kind := .bridge, status := .candidate }
def claim_P10_2 : Claim := { id := "P10.2", kind := .bridge, status := .candidate }
def claim_A11_1 : Claim := { id := "A11.1", kind := .bridge, status := .candidate }
def claim_A11_2 : Claim := { id := "A11.2", kind := .bridge, status := .candidate }
def claim_T11_1 : Claim := { id := "T11.1", kind := .bridge, status := .candidate }
def claim_T11_2 : Claim := { id := "T11.2", kind := .bridge, status := .candidate }
def claim_A12_1 : Claim := { id := "A12.1", kind := .bridge, status := .candidate }
def claim_A12_2 : Claim := { id := "A12.2", kind := .bridge, status := .candidate }
def claim_T12_1 : Claim := { id := "T12.1", kind := .bridge, status := .candidate }
def claim_T12_2 : Claim := { id := "T12.2", kind := .bridge, status := .candidate }
def claim_A13_1 : Claim := { id := "A13.1", kind := .bridge, status := .candidate }
def claim_A13_2 : Claim := { id := "A13.2", kind := .bridge, status := .candidate }
def claim_T13_1 : Claim := { id := "T13.1", kind := .bridge, status := .candidate }
def claim_A14_1 : Claim := { id := "A14.1", kind := .bridge, status := .candidate }
def claim_E14_1 : Claim := { id := "E14.1", kind := .bridge, status := .candidate }
def claim_T16_1 : Claim := { id := "T16.1", kind := .bridge, status := .candidate }
def claim_T16_2 : Claim := { id := "T16.2", kind := .bridge, status := .candidate }
def claim_T16_3 : Claim := { id := "T16.3", kind := .bridge, status := .candidate }
def claim_T16_4 : Claim := { id := "T16.4", kind := .bridge, status := .candidate }
def claim_T16_5 : Claim := { id := "T16.5", kind := .bridge, status := .candidate }
def claim_T16_6 : Claim := { id := "T16.6", kind := .bridge, status := .candidate }
def claim_A17_2 : Claim := { id := "A17.2", kind := .bridge, status := .candidate }
def claim_T17_1 : Claim := { id := "T17.1", kind := .bridge, status := .candidate }
def claim_T19_1 : Claim := { id := "T19.1", kind := .bridge, status := .candidate }
def claim_INV9 : Claim := { id := "INV9", kind := .bridge, status := .candidate }
def claim_U1 : Claim := { id := "U1", kind := .bridge, status := .candidate }
def claim_U2 : Claim := { id := "U2", kind := .bridge, status := .candidate }
def claim_U3 : Claim := { id := "U3", kind := .bridge, status := .candidate }
def claim_P0 : Claim := { id := "P0", kind := .bridge, status := .candidate }
def claim_P1 : Claim := { id := "P1", kind := .bridge, status := .candidate }
def claim_P2_stage : Claim := { id := "P2_stage", kind := .bridge, status := .candidate }
def claim_P3_stage : Claim := { id := "P3_stage", kind := .bridge, status := .candidate }
def claim_P4 : Claim := { id := "P4", kind := .bridge, status := .candidate }
def claim_P5_stage : Claim := { id := "P5_stage", kind := .bridge, status := .candidate }
def claim_O1 : Claim := { id := "O1", kind := .bridge, status := .candidate }
def claim_O2 : Claim := { id := "O2", kind := .bridge, status := .candidate }
def claim_O3 : Claim := { id := "O3", kind := .bridge, status := .candidate }
def claim_O4 : Claim := { id := "O4", kind := .bridge, status := .candidate }
def claim_LAMBDA : Claim := { id := "LAMBDA", kind := .bridge, status := .candidate }
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
def claim_CLOSURE : Claim := { id := "CLOSURE", kind := .bridge, status := .candidate }
def claim_OMEGA : Claim := { id := "OMEGA", kind := .bridge, status := .candidate }
def claim_EXP5_1 : Claim := { id := "EXP5.1", kind := .empirical, status := .candidate }
def claim_EXP5_2 : Claim := { id := "EXP5.2", kind := .empirical, status := .candidate }
def claim_A14_2 : Claim := { id := "A14.2", kind := .empirical, status := .candidate }
def claim_PRED14_1 : Claim := { id := "PRED14.1", kind := .empirical, status := .candidate }
def claim_EV15_1 : Claim := { id := "EV15.1", kind := .empirical, status := .candidate }
def claim_EV15_2 : Claim := { id := "EV15.2", kind := .empirical, status := .candidate }
def claim_EV15_3 : Claim := { id := "EV15.3", kind := .empirical, status := .candidate }
def claim_EV15_4 : Claim := { id := "EV15.4", kind := .empirical, status := .candidate }
def claim_A17_1 : Claim := { id := "A17.1", kind := .empirical, status := .candidate }
def claim_OPEN17_1 : Claim := { id := "OPEN17.1", kind := .empirical, status := .candidate }
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
def claim_A19_1 : Claim := { id := "A19.1", kind := .empirical, status := .candidate }
def claim_U4 : Claim := { id := "U4", kind := .empirical, status := .candidate }
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

def canonicalClaims : List Claim :=
  [ A0
  , { id := "A1.1", kind := .strictDerivation, status := .candidate }
  , { id := "A1.2", kind := .strictDerivation, status := .candidate }
  , { id := "A2.1", kind := .strictDerivation, status := .candidate }
  , { id := "A2.2", kind := .strictDerivation, status := .candidate }
  , { id := "A5.1", kind := .bridge, status := .candidate }
  , { id := "BC4", kind := .bridge, status := .candidate }
  , { id := "BC6", kind := .bridge, status := .candidate }
  , { id := "A1.3", kind := .strictDerivation, status := .candidate }
  , { id := "T3.1", kind := .strictDerivation, status := .candidate }
  , { id := "BC2", kind := .strictDerivation, status := .candidate }
  , { id := "BC7", kind := .bridge, status := .candidate }
  , { id := "BC8", kind := .bridge, status := .candidate }
  , { id := "D1.1", kind := .definition, status := .candidate }
  , { id := "D1.2", kind := .definition, status := .candidate }
  , { id := "D2.1", kind := .definition, status := .candidate }
  , { id := "D2.2", kind := .definition, status := .candidate }
  , { id := "E2.1", kind := .definition, status := .candidate }
  , { id := "D3.1", kind := .definition, status := .candidate }
  , { id := "D3.2", kind := .definition, status := .candidate }
  , { id := "D3.3", kind := .definition, status := .candidate }
  , { id := "E3.1", kind := .definition, status := .candidate }
  , { id := "E3.2", kind := .definition, status := .candidate }
  , { id := "D4.1", kind := .definition, status := .candidate }
  , { id := "D4.2", kind := .definition, status := .candidate }
  , { id := "E4.1", kind := .definition, status := .candidate }
  , { id := "D5.1", kind := .definition, status := .candidate }
  , { id := "D5.2", kind := .definition, status := .candidate }
  , { id := "D5.3", kind := .definition, status := .candidate }
  , { id := "D6.1", kind := .definition, status := .candidate }
  , { id := "D6.2", kind := .definition, status := .candidate }
  , { id := "E6.2", kind := .definition, status := .candidate }
  , { id := "D8.1", kind := .definition, status := .candidate }
  , { id := "D9.1", kind := .definition, status := .candidate }
  , { id := "E9.1", kind := .definition, status := .candidate }
  , { id := "D10.1", kind := .definition, status := .candidate }
  , { id := "E10.1", kind := .definition, status := .candidate }
  , { id := "D11.1", kind := .definition, status := .candidate }
  , { id := "D12.1", kind := .definition, status := .candidate }
  , { id := "D12.2", kind := .definition, status := .candidate }
  , { id := "E12.1", kind := .definition, status := .candidate }
  , { id := "D13.1", kind := .definition, status := .candidate }
  , { id := "E13.1", kind := .definition, status := .candidate }
  , { id := "D14.1", kind := .definition, status := .candidate }
  , { id := "D17.1", kind := .definition, status := .candidate }
  , { id := "D19.1", kind := .definition, status := .candidate }
  , { id := "D19.2", kind := .definition, status := .candidate }
  , { id := "D19.3", kind := .definition, status := .candidate }
  , { id := "D19.4", kind := .definition, status := .candidate }
  , { id := "D19.5", kind := .definition, status := .candidate }
  , { id := "D19.6", kind := .definition, status := .candidate }
  , { id := "D19.7", kind := .definition, status := .candidate }
  , { id := "D19.8", kind := .definition, status := .candidate }
  , { id := "D19.9", kind := .definition, status := .candidate }
  , { id := "D19.10", kind := .definition, status := .candidate }
  , { id := "E19.1", kind := .definition, status := .candidate }
  , { id := "LN1.1", kind := .bridge, status := .candidate }
  , { id := "LN1.2", kind := .bridge, status := .candidate }
  , { id := "P2.1", kind := .bridge, status := .candidate }
  , { id := "P2.2", kind := .bridge, status := .candidate }
  , { id := "LN2.1", kind := .bridge, status := .candidate }
  , { id := "A3.1", kind := .bridge, status := .candidate }
  , { id := "A3.2", kind := .bridge, status := .candidate }
  , { id := "P3.1", kind := .bridge, status := .candidate }
  , { id := "P3.2", kind := .bridge, status := .candidate }
  , { id := "LN3.1", kind := .bridge, status := .candidate }
  , { id := "A4.1", kind := .bridge, status := .candidate }
  , { id := "A4.2", kind := .bridge, status := .candidate }
  , { id := "T4.1", kind := .bridge, status := .candidate }
  , { id := "T4.2", kind := .bridge, status := .candidate }
  , { id := "LN4.1", kind := .bridge, status := .candidate }
  , { id := "A5.2", kind := .bridge, status := .candidate }
  , { id := "P5.1", kind := .bridge, status := .candidate }
  , { id := "P5.2", kind := .bridge, status := .candidate }
  , { id := "LN5.1", kind := .bridge, status := .candidate }
  , { id := "A6.1", kind := .bridge, status := .candidate }
  , { id := "A6.2", kind := .bridge, status := .candidate }
  , { id := "A6.3", kind := .bridge, status := .candidate }
  , { id := "E6.1", kind := .bridge, status := .candidate }
  , { id := "P6.1", kind := .bridge, status := .candidate }
  , { id := "P6.2", kind := .bridge, status := .candidate }
  , { id := "T6.1", kind := .bridge, status := .candidate }
  , { id := "LN6.1", kind := .bridge, status := .candidate }
  , { id := "A7.1", kind := .bridge, status := .candidate }
  , { id := "A7.2", kind := .bridge, status := .candidate }
  , { id := "BC1", kind := .bridge, status := .candidate }
  , { id := "BC3", kind := .bridge, status := .candidate }
  , { id := "BC5", kind := .bridge, status := .candidate }
  , { id := "BC9", kind := .bridge, status := .candidate }
  , { id := "ID7.1", kind := .bridge, status := .candidate }
  , { id := "PERSONHOOD", kind := .bridge, status := .candidate }
  , { id := "A8.1", kind := .bridge, status := .candidate }
  , { id := "A8.2", kind := .bridge, status := .candidate }
  , { id := "T8.1", kind := .bridge, status := .candidate }
  , { id := "C8.1", kind := .bridge, status := .candidate }
  , { id := "C8.2", kind := .bridge, status := .candidate }
  , { id := "A9.1", kind := .bridge, status := .candidate }
  , { id := "A9.2", kind := .bridge, status := .candidate }
  , { id := "P9.1", kind := .bridge, status := .candidate }
  , { id := "P9.2", kind := .bridge, status := .candidate }
  , { id := "P9.3", kind := .bridge, status := .candidate }
  , { id := "P9.4", kind := .bridge, status := .candidate }
  , { id := "P9.5", kind := .bridge, status := .candidate }
  , { id := "A10.1", kind := .bridge, status := .candidate }
  , { id := "A10.2", kind := .bridge, status := .candidate }
  , { id := "P10.1", kind := .bridge, status := .candidate }
  , { id := "P10.2", kind := .bridge, status := .candidate }
  , { id := "A11.1", kind := .bridge, status := .candidate }
  , { id := "A11.2", kind := .bridge, status := .candidate }
  , { id := "T11.1", kind := .bridge, status := .candidate }
  , { id := "T11.2", kind := .bridge, status := .candidate }
  , { id := "A12.1", kind := .bridge, status := .candidate }
  , { id := "A12.2", kind := .bridge, status := .candidate }
  , { id := "T12.1", kind := .bridge, status := .candidate }
  , { id := "T12.2", kind := .bridge, status := .candidate }
  , { id := "A13.1", kind := .bridge, status := .candidate }
  , { id := "A13.2", kind := .bridge, status := .candidate }
  , { id := "T13.1", kind := .bridge, status := .candidate }
  , { id := "A14.1", kind := .bridge, status := .candidate }
  , { id := "E14.1", kind := .bridge, status := .candidate }
  , { id := "T16.1", kind := .bridge, status := .candidate }
  , { id := "T16.2", kind := .bridge, status := .candidate }
  , { id := "T16.3", kind := .bridge, status := .candidate }
  , { id := "T16.4", kind := .bridge, status := .candidate }
  , { id := "T16.5", kind := .bridge, status := .candidate }
  , { id := "T16.6", kind := .bridge, status := .candidate }
  , { id := "A17.2", kind := .bridge, status := .candidate }
  , { id := "T17.1", kind := .bridge, status := .candidate }
  , { id := "T19.1", kind := .bridge, status := .candidate }
  , { id := "INV9", kind := .bridge, status := .candidate }
  , { id := "U1", kind := .bridge, status := .candidate }
  , { id := "U2", kind := .bridge, status := .candidate }
  , { id := "U3", kind := .bridge, status := .candidate }
  , { id := "P0", kind := .bridge, status := .candidate }
  , { id := "P1", kind := .bridge, status := .candidate }
  , { id := "P2_stage", kind := .bridge, status := .candidate }
  , { id := "P3_stage", kind := .bridge, status := .candidate }
  , { id := "P4", kind := .bridge, status := .candidate }
  , { id := "P5_stage", kind := .bridge, status := .candidate }
  , { id := "O1", kind := .bridge, status := .candidate }
  , { id := "O2", kind := .bridge, status := .candidate }
  , { id := "O3", kind := .bridge, status := .candidate }
  , { id := "O4", kind := .bridge, status := .candidate }
  , { id := "LAMBDA", kind := .bridge, status := .candidate }
  , { id := "SC-QUANTUM", kind := .bridge, status := .candidate }
  , { id := "SC-PHYSICAL", kind := .bridge, status := .candidate }
  , { id := "SC-NEURAL", kind := .bridge, status := .candidate }
  , { id := "SC-INDIVIDUAL", kind := .bridge, status := .candidate }
  , { id := "SC-SOCIAL", kind := .bridge, status := .candidate }
  , { id := "SC-COSMIC", kind := .bridge, status := .candidate }
  , { id := "META-1", kind := .bridge, status := .candidate }
  , { id := "META-2", kind := .bridge, status := .candidate }
  , { id := "META-3", kind := .bridge, status := .candidate }
  , { id := "FINAL-1", kind := .bridge, status := .candidate }
  , { id := "FINAL-2", kind := .bridge, status := .candidate }
  , { id := "FINAL-3", kind := .bridge, status := .candidate }
  , { id := "CLOSURE", kind := .bridge, status := .candidate }
  , { id := "OMEGA", kind := .bridge, status := .candidate }
  , { id := "EXP5.1", kind := .empirical, status := .candidate }
  , { id := "EXP5.2", kind := .empirical, status := .candidate }
  , { id := "A14.2", kind := .empirical, status := .candidate }
  , { id := "PRED14.1", kind := .empirical, status := .candidate }
  , { id := "EV15.1", kind := .empirical, status := .candidate }
  , { id := "EV15.2", kind := .empirical, status := .candidate }
  , { id := "EV15.3", kind := .empirical, status := .candidate }
  , { id := "EV15.4", kind := .empirical, status := .candidate }
  , { id := "A17.1", kind := .empirical, status := .candidate }
  , { id := "OPEN17.1", kind := .empirical, status := .candidate }
  , { id := "PROT18.1", kind := .empirical, status := .candidate }
  , { id := "PROT18.2", kind := .empirical, status := .candidate }
  , { id := "PROT18.3", kind := .empirical, status := .candidate }
  , { id := "PROT18.4", kind := .empirical, status := .candidate }
  , { id := "PROT18.5", kind := .empirical, status := .candidate }
  , { id := "PRED18.1", kind := .empirical, status := .candidate }
  , { id := "PRED18.2", kind := .empirical, status := .candidate }
  , { id := "FALS18.1", kind := .empirical, status := .candidate }
  , { id := "FALS18.2", kind := .empirical, status := .candidate }
  , { id := "FALS18.3", kind := .empirical, status := .candidate }
  , { id := "A19.1", kind := .empirical, status := .candidate }
  , { id := "U4", kind := .empirical, status := .candidate }
  , { id := "F1", kind := .empirical, status := .candidate }
  , { id := "F2", kind := .empirical, status := .candidate }
  , { id := "F3", kind := .empirical, status := .candidate }
  , { id := "F4", kind := .empirical, status := .candidate }
  , { id := "F5", kind := .empirical, status := .candidate }
  , { id := "F6", kind := .empirical, status := .candidate }
  , { id := "F7", kind := .empirical, status := .candidate }
  , { id := "F8", kind := .empirical, status := .candidate }
  , { id := "F9", kind := .empirical, status := .candidate }
  , { id := "BRIDGE-PHY-THEO", kind := .empirical, status := .candidate }
  , { id := "BRIDGE-INFO-MIND", kind := .empirical, status := .candidate }
  , { id := "BRIDGE-PHI-CHI", kind := .empirical, status := .candidate }
  ]

def canonicalEdges : List Edge :=
  [ { source := A0, target := claim_A1_1, kind := .entails }
  , { source := claim_A1_1, target := claim_A1_2, kind := .entails }
  , { source := claim_A1_3, target := claim_A2_1, kind := .entails }
  , { source := claim_A2_1, target := claim_A2_2, kind := .entails }
  , { source := claim_A1_1, target := claim_A1_3, kind := .entails }
  , { source := claim_A1_2, target := claim_A1_3, kind := .entails }
  , { source := claim_A2_2, target := claim_T3_1, kind := .entails }
  , { source := claim_D3_1, target := claim_T3_1, kind := .entails }
  , { source := claim_T3_1, target := claim_BC2, kind := .entails }
  , { source := claim_BC6, target := claim_BC7, kind := .assumes }
  , { source := claim_BC6, target := claim_BC8, kind := .assumes }
  , { source := claim_A1_1, target := claim_D1_1, kind := .defines }
  , { source := claim_A1_2, target := claim_D1_1, kind := .defines }
  , { source := claim_A1_1, target := claim_D1_2, kind := .defines }
  , { source := claim_A1_2, target := claim_D1_2, kind := .defines }
  , { source := claim_A2_2, target := claim_D2_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D2_2, kind := .defines }
  , { source := claim_A2_2, target := claim_E2_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D3_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D3_2, kind := .defines }
  , { source := claim_A2_2, target := claim_D3_3, kind := .defines }
  , { source := claim_A2_2, target := claim_E3_1, kind := .defines }
  , { source := claim_D3_1, target := claim_E3_1, kind := .defines }
  , { source := claim_A2_2, target := claim_E3_2, kind := .defines }
  , { source := claim_D3_1, target := claim_E3_2, kind := .defines }
  , { source := claim_A2_2, target := claim_D4_1, kind := .defines }
  , { source := claim_A2_2, target := claim_D4_2, kind := .defines }
  , { source := claim_A2_2, target := claim_E4_1, kind := .defines }
  , { source := claim_D4_1, target := claim_E4_1, kind := .defines }
  , { source := claim_A5_1, target := claim_D5_1, kind := .defines }
  , { source := claim_A5_1, target := claim_D5_2, kind := .defines }
  , { source := claim_A5_1, target := claim_D5_3, kind := .defines }
  , { source := claim_A5_1, target := claim_D6_1, kind := .defines }
  , { source := claim_D5_2, target := claim_D6_1, kind := .defines }
  , { source := claim_A5_1, target := claim_D6_2, kind := .defines }
  , { source := claim_D6_1, target := claim_D6_2, kind := .defines }
  , { source := claim_A5_1, target := claim_E6_2, kind := .defines }
  , { source := claim_A6_2, target := claim_E6_2, kind := .defines }
  , { source := claim_D5_2, target := claim_E6_2, kind := .defines }
  , { source := claim_BC6, target := claim_D8_1, kind := .defines }
  , { source := claim_BC6, target := claim_D9_1, kind := .defines }
  , { source := claim_BC6, target := claim_E9_1, kind := .defines }
  , { source := claim_D9_1, target := claim_E9_1, kind := .defines }
  , { source := claim_BC6, target := claim_D10_1, kind := .defines }
  , { source := claim_BC6, target := claim_E10_1, kind := .defines }
  , { source := claim_D10_1, target := claim_E10_1, kind := .defines }
  , { source := claim_BC6, target := claim_D11_1, kind := .defines }
  , { source := claim_BC6, target := claim_D12_1, kind := .defines }
  , { source := claim_BC6, target := claim_D12_2, kind := .defines }
  , { source := claim_BC6, target := claim_E12_1, kind := .defines }
  , { source := claim_D12_1, target := claim_E12_1, kind := .defines }
  , { source := claim_D12_2, target := claim_E12_1, kind := .defines }
  , { source := claim_BC6, target := claim_D13_1, kind := .defines }
  , { source := claim_BC6, target := claim_E13_1, kind := .defines }
  , { source := claim_D13_1, target := claim_E13_1, kind := .defines }
  , { source := claim_BC6, target := claim_D14_1, kind := .defines }
  , { source := claim_D5_2, target := claim_D17_1, kind := .defines }
  , { source := claim_D3_3, target := claim_D19_1, kind := .defines }
  , { source := claim_E2_1, target := claim_D19_2, kind := .defines }
  , { source := claim_A8_2, target := claim_D19_3, kind := .defines }
  , { source := claim_T3_1, target := claim_D19_3, kind := .defines }
  , { source := claim_D9_1, target := claim_D19_4, kind := .defines }
  , { source := claim_P3_2, target := claim_D19_5, kind := .defines }
  , { source := claim_T3_1, target := claim_D19_6, kind := .defines }
  , { source := claim_LN5_1, target := claim_D19_7, kind := .defines }
  , { source := claim_D8_1, target := claim_D19_8, kind := .defines }
  , { source := claim_A9_2, target := claim_D19_9, kind := .defines }
  , { source := claim_BC4, target := claim_D19_10, kind := .defines }
  , { source := claim_D19_1, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_10, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_2, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_3, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_4, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_5, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_6, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_7, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_8, target := claim_E19_1, kind := .defines }
  , { source := claim_D19_9, target := claim_E19_1, kind := .defines }
  , { source := claim_A1_1, target := claim_LN1_1, kind := .assumes }
  , { source := claim_A1_2, target := claim_LN1_1, kind := .assumes }
  , { source := claim_A1_1, target := claim_LN1_2, kind := .assumes }
  , { source := claim_A1_2, target := claim_LN1_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_P2_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_P2_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN2_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A3_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_P3_1, kind := .assumes }
  , { source := claim_D3_1, target := claim_P3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_P3_2, kind := .assumes }
  , { source := claim_D3_1, target := claim_P3_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN3_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A4_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_A4_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_T4_1, kind := .assumes }
  , { source := claim_D4_1, target := claim_T4_1, kind := .assumes }
  , { source := claim_A2_2, target := claim_T4_2, kind := .assumes }
  , { source := claim_D4_1, target := claim_T4_2, kind := .assumes }
  , { source := claim_A2_2, target := claim_LN4_1, kind := .assumes }
  , { source := claim_T4_1, target := claim_LN4_1, kind := .assumes }
  , { source := claim_T4_2, target := claim_LN4_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A5_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_P5_1, kind := .assumes }
  , { source := claim_D5_2, target := claim_P5_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_P5_2, kind := .assumes }
  , { source := claim_D5_2, target := claim_P5_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_LN5_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_A6_3, kind := .assumes }
  , { source := claim_A5_1, target := claim_E6_1, kind := .assumes }
  , { source := claim_D6_1, target := claim_E6_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_P6_1, kind := .assumes }
  , { source := claim_D5_2, target := claim_P6_1, kind := .assumes }
  , { source := claim_D6_1, target := claim_P6_1, kind := .assumes }
  , { source := claim_A5_1, target := claim_P6_2, kind := .assumes }
  , { source := claim_A6_3, target := claim_P6_2, kind := .assumes }
  , { source := claim_A5_1, target := claim_T6_1, kind := .assumes }
  , { source := claim_A6_2, target := claim_T6_1, kind := .assumes }
  , { source := claim_T6_1, target := claim_LN6_1, kind := .assumes }
  , { source := claim_LN6_1, target := claim_A7_1, kind := .assumes }
  , { source := claim_A7_1, target := claim_A7_2, kind := .assumes }
  , { source := claim_A7_1, target := claim_BC1, kind := .assumes }
  , { source := claim_LN6_1, target := claim_BC1, kind := .assumes }
  , { source := claim_A5_1, target := claim_BC3, kind := .assumes }
  , { source := claim_A6_2, target := claim_BC3, kind := .assumes }
  , { source := claim_BC4, target := claim_BC5, kind := .assumes }
  , { source := claim_BC4, target := claim_BC9, kind := .assumes }
  , { source := claim_BC6, target := claim_BC9, kind := .assumes }
  , { source := claim_BC6, target := claim_ID7_1, kind := .assumes }
  , { source := claim_BC6, target := claim_PERSONHOOD, kind := .assumes }
  , { source := claim_BC6, target := claim_A8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A8_2, kind := .assumes }
  , { source := claim_A8_2, target := claim_T8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T8_1, kind := .assumes }
  , { source := claim_D8_1, target := claim_T8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_C8_1, kind := .assumes }
  , { source := claim_T8_1, target := claim_C8_1, kind := .assumes }
  , { source := claim_BC6, target := claim_C8_2, kind := .assumes }
  , { source := claim_C8_1, target := claim_C8_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A9_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A9_2, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_1, kind := .assumes }
  , { source := claim_D9_1, target := claim_P9_1, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_2, kind := .assumes }
  , { source := claim_D9_1, target := claim_P9_2, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_3, kind := .assumes }
  , { source := claim_D9_1, target := claim_P9_3, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_4, kind := .assumes }
  , { source := claim_D9_1, target := claim_P9_4, kind := .assumes }
  , { source := claim_BC6, target := claim_P9_5, kind := .assumes }
  , { source := claim_D9_1, target := claim_P9_5, kind := .assumes }
  , { source := claim_BC6, target := claim_A10_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A10_2, kind := .assumes }
  , { source := claim_BC6, target := claim_P10_1, kind := .assumes }
  , { source := claim_D10_1, target := claim_P10_1, kind := .assumes }
  , { source := claim_BC6, target := claim_P10_2, kind := .assumes }
  , { source := claim_D10_1, target := claim_P10_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A11_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A11_2, kind := .assumes }
  , { source := claim_BC6, target := claim_T11_1, kind := .assumes }
  , { source := claim_D11_1, target := claim_T11_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T11_2, kind := .assumes }
  , { source := claim_D11_1, target := claim_T11_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A12_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A12_2, kind := .assumes }
  , { source := claim_BC6, target := claim_T12_1, kind := .assumes }
  , { source := claim_D12_1, target := claim_T12_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T12_2, kind := .assumes }
  , { source := claim_D12_2, target := claim_T12_2, kind := .assumes }
  , { source := claim_BC6, target := claim_A13_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A13_2, kind := .assumes }
  , { source := claim_BC6, target := claim_T13_1, kind := .assumes }
  , { source := claim_E13_1, target := claim_T13_1, kind := .assumes }
  , { source := claim_BC6, target := claim_A14_1, kind := .assumes }
  , { source := claim_T13_1, target := claim_A14_1, kind := .assumes }
  , { source := claim_BC6, target := claim_E14_1, kind := .assumes }
  , { source := claim_D14_1, target := claim_E14_1, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC4, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC7, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC8, target := claim_T16_1, kind := .assumes }
  , { source := claim_BC4, target := claim_T16_2, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC4, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC7, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC8, target := claim_T16_3, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_4, kind := .assumes }
  , { source := claim_A7_2, target := claim_T16_5, kind := .assumes }
  , { source := claim_BC1, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC2, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC3, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC4, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC5, target := claim_T16_6, kind := .assumes }
  , { source := claim_BC6, target := claim_T16_6, kind := .assumes }
  , { source := claim_D5_2, target := claim_A17_2, kind := .assumes }
  , { source := claim_A17_2, target := claim_T17_1, kind := .assumes }
  , { source := claim_D5_2, target := claim_T17_1, kind := .assumes }
  , { source := claim_D2_1, target := claim_T19_1, kind := .assumes }
  , { source := claim_E19_1, target := claim_T19_1, kind := .assumes }
  , { source := claim_BC4, target := claim_INV9, kind := .assumes }
  , { source := claim_BC6, target := claim_INV9, kind := .assumes }
  , { source := claim_A3_2, target := claim_U1, kind := .assumes }
  , { source := claim_E3_2, target := claim_U1, kind := .assumes }
  , { source := claim_T3_1, target := claim_U2, kind := .assumes }
  , { source := claim_BC6, target := claim_U3, kind := .assumes }
  , { source := claim_D9_1, target := claim_U3, kind := .assumes }
  , { source := claim_A1_1, target := claim_P0, kind := .assumes }
  , { source := claim_A5_1, target := claim_P1, kind := .assumes }
  , { source := claim_A1_2, target := claim_P2_stage, kind := .assumes }
  , { source := claim_A1_3, target := claim_P2_stage, kind := .assumes }
  , { source := claim_A2_2, target := claim_P3_stage, kind := .assumes }
  , { source := claim_D3_1, target := claim_P3_stage, kind := .assumes }
  , { source := claim_A5_1, target := claim_P4, kind := .assumes }
  , { source := claim_A5_2, target := claim_P4, kind := .assumes }
  , { source := claim_A7_1, target := claim_P5_stage, kind := .assumes }
  , { source := claim_A1_3, target := claim_O1, kind := .assumes }
  , { source := claim_D3_1, target := claim_O2, kind := .assumes }
  , { source := claim_A5_1, target := claim_O3, kind := .assumes }
  , { source := claim_A5_2, target := claim_O4, kind := .assumes }
  , { source := claim_ID7_1, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O1, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O2, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O3, target := claim_LAMBDA, kind := .assumes }
  , { source := claim_O4, target := claim_LAMBDA, kind := .assumes }
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
  , { source := claim_A2_2, target := claim_CLOSURE, kind := .assumes }
  , { source := claim_A2_2, target := claim_OMEGA, kind := .assumes }
  , { source := claim_EXP5_1, target := claim_A5_1, kind := .tests }
  , { source := claim_EXP5_2, target := claim_A5_1, kind := .tests }
  , { source := claim_A14_2, target := claim_BC6, kind := .tests }
  , { source := claim_PRED14_1, target := claim_E14_1, kind := .tests }
  , { source := claim_EV15_1, target := claim_ID7_1, kind := .tests }
  , { source := claim_EV15_2, target := claim_D5_2, kind := .tests }
  , { source := claim_EV15_2, target := claim_P5_2, kind := .tests }
  , { source := claim_EV15_3, target := claim_P5_2, kind := .tests }
  , { source := claim_EV15_4, target := claim_A3_2, kind := .tests }
  , { source := claim_EV15_4, target := claim_E3_2, kind := .tests }
  , { source := claim_A17_1, target := claim_D5_2, kind := .tests }
  , { source := claim_A17_1, target := claim_P5_1, kind := .tests }
  , { source := claim_OPEN17_1, target := claim_A11_1, kind := .tests }
  , { source := claim_OPEN17_1, target := claim_T17_1, kind := .tests }
  , { source := claim_PROT18_1, target := claim_BC4, kind := .tests }
  , { source := claim_PROT18_2, target := claim_A5_1, kind := .tests }
  , { source := claim_PROT18_2, target := claim_A6_2, kind := .tests }
  , { source := claim_PROT18_2, target := claim_E6_2, kind := .tests }
  , { source := claim_PROT18_3, target := claim_D9_1, kind := .tests }
  , { source := claim_PROT18_3, target := claim_T3_1, kind := .tests }
  , { source := claim_PROT18_4, target := claim_E3_2, kind := .tests }
  , { source := claim_PROT18_4, target := claim_EV15_4, kind := .tests }
  , { source := claim_PROT18_5, target := claim_T11_1, kind := .tests }
  , { source := claim_PRED18_1, target := claim_PRED14_1, kind := .tests }
  , { source := claim_PRED18_2, target := claim_EV15_2, kind := .tests }
  , { source := claim_FALS18_1, target := claim_D2_1, kind := .tests }
  , { source := claim_FALS18_2, target := claim_D9_1, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC1, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC2, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC3, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC4, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC5, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC6, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC7, kind := .tests }
  , { source := claim_FALS18_3, target := claim_BC8, kind := .tests }
  , { source := claim_A19_1, target := claim_E2_1, kind := .tests }
  , { source := claim_A19_1, target := claim_E3_1, kind := .tests }
  , { source := claim_U4, target := claim_A11_2, kind := .tests }
  , { source := claim_U4, target := claim_D11_1, kind := .tests }
  , { source := claim_F1, target := claim_D11_1, kind := .tests }
  , { source := claim_F2, target := claim_D11_1, kind := .tests }
  , { source := claim_F3, target := claim_D11_1, kind := .tests }
  , { source := claim_F4, target := claim_D11_1, kind := .tests }
  , { source := claim_F5, target := claim_D11_1, kind := .tests }
  , { source := claim_F6, target := claim_D11_1, kind := .tests }
  , { source := claim_F7, target := claim_D11_1, kind := .tests }
  , { source := claim_F8, target := claim_D11_1, kind := .tests }
  , { source := claim_F9, target := claim_D11_1, kind := .tests }
  , { source := claim_BRIDGE_PHY_THEO, target := claim_D2_1, kind := .tests }
  , { source := claim_BRIDGE_PHY_THEO, target := claim_ID7_1, kind := .tests }
  , { source := claim_BRIDGE_INFO_MIND, target := claim_A5_1, kind := .tests }
  , { source := claim_BRIDGE_INFO_MIND, target := claim_D2_1, kind := .tests }
  , { source := claim_BRIDGE_PHI_CHI, target := claim_A2_2, kind := .tests }
  ]

theorem claim_count : canonicalClaims.length = 192 := by decide
theorem declared_edge_count : canonicalEdges.length = 300 := by decide
theorem exactly_one_root : hasExactlyA0AsRoot canonicalClaims = true := by decide
theorem endpoints_exist : allEdgeEndpointsExist canonicalClaims canonicalEdges = true := by decide
theorem entailment_graph_is_acyclic : entailmentAcyclic canonicalClaims canonicalEdges = true := by decide
theorem strict_chain_fully_traces_to_A0 : strictClaimsTraceToA0 canonicalClaims canonicalEdges = true := by decide
theorem current_projection_is_canon_ready : canonReady canonicalClaims canonicalEdges = true := by decide

#eval (unrootedStrictClaims canonicalClaims canonicalEdges).map (fun claim => claim.id)

#print axioms claim_count
#print axioms declared_edge_count
#print axioms exactly_one_root
#print axioms endpoints_exist
#print axioms entailment_graph_is_acyclic
#print axioms strict_chain_fully_traces_to_A0
#print axioms current_projection_is_canon_ready

end Theophysics.CanonicalGraph
