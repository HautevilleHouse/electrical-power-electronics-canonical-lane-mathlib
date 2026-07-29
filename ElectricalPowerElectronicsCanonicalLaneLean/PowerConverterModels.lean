import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure PowerConverterModelPackage where
  topology : Prop
  switchingFrequency : Prop
  filterDesign : Prop
  efficiencyModel : Prop

structure PowerConverterModelEvidence (P : PowerConverterModelPackage) where
  topologyClosed : P.topology
  switchingFrequencyClosed : P.switchingFrequency
  filterDesignClosed : P.filterDesign
  efficiencyModelClosed : P.efficiencyModel

def PowerConverterModelClosed (P : PowerConverterModelPackage) : Prop :=
  P.topology ∧ P.switchingFrequency ∧ P.filterDesign ∧ P.efficiencyModel

theorem power_converter_model_closed_from_evidence (P : PowerConverterModelPackage) (E : PowerConverterModelEvidence P) :
    PowerConverterModelClosed P := by
  exact And.intro E.topologyClosed (And.intro E.switchingFrequencyClosed (And.intro E.filterDesignClosed E.efficiencyModelClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse