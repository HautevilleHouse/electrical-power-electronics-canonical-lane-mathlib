import ElectricalPowerElectronicsCanonicalLaneLean.PowerElectronicsFoundation

/-!
# Switching Control Package
-/

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure SwitchingControlPackage {D : DriveSystemPackage}
    {I : InverterModelPackage D} {C : ConverterTopologyPackage I}
    {U : ControlLawPackage C} (P : PulseWidthModulationPackage U) where
  switchingFrequencyRange : Prop
  deadTimeCompensation : Prop
  harmonicFiltering : Prop
  currentRegulationBandwidth : Prop

structure SwitchingControlEvidence {D : DriveSystemPackage}
    {I : InverterModelPackage D} {C : ConverterTopologyPackage I}
    {U : ControlLawPackage C} {P : PulseWidthModulationPackage U}
    (E : SwitchingControlPackage P) where
  switchingFrequencyRangeClosed : E.switchingFrequencyRange
  deadTimeCompensationClosed : E.deadTimeCompensation
  harmonicFilteringClosed : E.harmonicFiltering
  currentRegulationBandwidthClosed : E.currentRegulationBandwidth

def SwitchingControlClosed {D : DriveSystemPackage}
    {I : InverterModelPackage D} {C : ConverterTopologyPackage I}
    {U : ControlLawPackage C} {P : PulseWidthModulationPackage U}
    (E : SwitchingControlPackage P) : Prop :=
  E.switchingFrequencyRange ∧ E.deadTimeCompensation ∧
  E.harmonicFiltering ∧ E.currentRegulationBandwidth

theorem switching_control_closed_from_evidence
    {D : DriveSystemPackage} {I : InverterModelPackage D}
    {C : ConverterTopologyPackage I} {U : ControlLawPackage C}
    {P : PulseWidthModulationPackage U} (E : SwitchingControlPackage P)
    (Ev : SwitchingControlEvidence E) : SwitchingControlClosed E := by
  exact And.intro Ev.switchingFrequencyRangeClosed
    (And.intro Ev.deadTimeCompensationClosed
      (And.intro Ev.harmonicFilteringClosed Ev.currentRegulationBandwidthClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse
