import PowerElectronicsEfficiency

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure PowerElectronicsControl {T : PowerConverterTopology}
    (E : PowerElectronicsEfficiency T) where
  controlLaw : ℝ → ℝ  -- duty cycle as function of error
  stabilityMargin : ℝ
  bandwidth : ℕ
  closedLoopStable : Prop
  closedLoopStableTerm : closedLoopStable

structure PowerElectronicsControlEvidence {T : PowerConverterTopology}
    {E : PowerElectronicsEfficiency T} (C : PowerElectronicsControl E) where
  controlLawContinuous : Prop
  stabilityMarginPositive : C.stabilityMargin > 0
  closedLoopStableClosed : C.closedLoopStable

def PowerElectronicsControlClosed {T : PowerConverterTopology}
    {E : PowerElectronicsEfficiency T} (C : PowerElectronicsControl E) : Prop :=
  C.closedLoopStable

theorem power_electronics_control_closed_from_evidence
    {T : PowerConverterTopology} {E : PowerElectronicsEfficiency T}
    (C : PowerElectronicsControl E) (Ev : PowerElectronicsControlEvidence C) :
    PowerElectronicsControlClosed C :=
  Ev.closedLoopStableClosed

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse
