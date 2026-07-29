import ElectricalPowerElectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure ControlLoopBandwidthPackage where
  bandwidth : Float
  phaseMarginSufficient : Prop
  gainMarginSufficient : Prop
  stabilityMarginAchieved : Prop

structure ControlLoopBandwidthEvidence (C : ControlLoopBandwidthPackage) where
  phaseMarginSufficientClosed : C.phaseMarginSufficient
  gainMarginSufficientClosed : C.gainMarginSufficient
  stabilityMarginAchievedClosed : C.stabilityMarginAchieved

def ControlLoopBandwidthClosed (C : ControlLoopBandwidthPackage) : Prop :=
  C.phaseMarginSufficient ∧ C.gainMarginSufficient ∧ C.stabilityMarginAchieved

theorem control_loop_bandwidth_closed_from_evidence (C : ControlLoopBandwidthPackage)
    (E : ControlLoopBandwidthEvidence C) : ControlLoopBandwidthClosed C := by
  exact And.intro E.phaseMarginSufficientClosed
    (And.intro E.gainMarginSufficientClosed E.stabilityMarginAchievedClosed)

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse