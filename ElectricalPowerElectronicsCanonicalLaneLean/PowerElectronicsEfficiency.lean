import PowerConverterTopology

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure PowerElectronicsEfficiency (T : PowerConverterTopology) where
  efficiencyCurve : ℝ → ℝ  -- efficiency as function of load power
  maxEfficiency : ℝ
  losses : ℝ → ℝ  -- losses as function of load
  thermalLimit : ℝ
  efficiencyMeasured : Prop
  efficiencyMeasuredTerm : efficiencyMeasured

structure PowerElectronicsEfficiencyEvidence {T : PowerConverterTopology}
    (E : PowerElectronicsEfficiency T) where
  efficiencyCurveNonnegative : ∀ x, E.efficiencyCurve x ≥ 0
  maxEfficiencyBounded : E.maxEfficiency ≤ 1
  efficiencyMeasuredClosed : E.efficiencyMeasured

def PowerElectronicsEfficiencyClosed {T : PowerConverterTopology}
    (E : PowerElectronicsEfficiency T) : Prop :=
  E.efficiencyMeasured

theorem power_electronics_efficiency_closed_from_evidence
    {T : PowerConverterTopology} (E : PowerElectronicsEfficiency T)
    (Ev : PowerElectronicsEfficiencyEvidence E) : PowerElectronicsEfficiencyClosed E :=
  Ev.efficiencyMeasuredClosed

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse
