import ElectricalPowerElectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure PowerConverterPackage (A : AdmissibleClass) where
  topology : String
  switchingScheme : String
  inputVoltage : Float
  outputVoltage : Float
  efficiency : Float
  voltageRegulation : Prop
  harmonicDistortion : Prop

structure PowerConverterEvidence (A : AdmissibleClass) (P : PowerConverterPackage A) where
  voltageRegulationClosed : P.voltageRegulation
  harmonicDistortionClosed : P.harmonicDistortion

def PowerConverterClosed (A : AdmissibleClass) (P : PowerConverterPackage A) : Prop :=
  P.voltageRegulation ∧ P.harmonicDistortion

theorem power_converter_closed_from_evidence (A : AdmissibleClass) (P : PowerConverterPackage A) (E : PowerConverterEvidence A P) :
    PowerConverterClosed A P := by
  exact And.intro E.voltageRegulationClosed E.harmonicDistortionClosed

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse
