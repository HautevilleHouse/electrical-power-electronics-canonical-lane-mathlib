import ElectricalPowerElectronicsCanonicalLaneLean.SwitchingControl

/-!
# Converter Topologies Package
-/

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure ConverterTopologyPackage {C : PowerElectronicsControlPackage}
    {S : SwitchingSchemePackage C} (T : TopologyFamilyPackage S) where
  highFrequencyOperationCovered : Prop
  modulationScheme : Prop
  efficiencyBounds : Prop
  thermalStability : Prop

structure ConverterTopologyEvidence {C : PowerElectronicsControlPackage}
    {S : SwitchingSchemePackage C} {T : TopologyFamilyPackage S}
    (P : ConverterTopologyPackage T) where
  highFrequencyOperationCoveredClosed : P.highFrequencyOperationCovered
  modulationSchemeClosed : P.modulationScheme
  efficiencyBoundsClosed : P.efficiencyBounds
  thermalStabilityClosed : P.thermalStability

def ConverterTopologyClosed {C : PowerElectronicsControlPackage}
    {S : SwitchingSchemePackage C} {T : TopologyFamilyPackage S}
    (P : ConverterTopologyPackage T) : Prop :=
  P.highFrequencyOperationCovered ∧ P.modulationScheme ∧
  P.efficiencyBounds ∧ P.thermalStability

theorem converter_topology_closed_from_evidence
    {C : PowerElectronicsControlPackage} {S : SwitchingSchemePackage C}
    {T : TopologyFamilyPackage S} (P : ConverterTopologyPackage T)
    (E : ConverterTopologyEvidence P) : ConverterTopologyClosed P := by
  exact And.intro E.highFrequencyOperationCoveredClosed
    (And.intro E.modulationSchemeClosed
      (And.intro E.efficiencyBoundsClosed E.thermalStabilityClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse
