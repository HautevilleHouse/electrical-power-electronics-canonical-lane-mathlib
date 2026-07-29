import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure ReliabilityAnalysisPackage where
  componentStress : Prop
  thermalCycling : Prop
  mtbf : Prop
  failureModeAnalysis : Prop

structure ReliabilityAnalysisEvidence (R : ReliabilityAnalysisPackage) where
  componentStressClosed : R.componentStress
  thermalCyclingClosed : R.thermalCycling
  mtbfClosed : R.mtbf
  failureModeAnalysisClosed : R.failureModeAnalysis

def ReliabilityAnalysisClosed (R : ReliabilityAnalysisPackage) : Prop :=
  R.componentStress ∧ R.thermalCycling ∧ R.mtbf ∧ R.failureModeAnalysis

theorem reliability_analysis_closed_from_evidence (R : ReliabilityAnalysisPackage) (E : ReliabilityAnalysisEvidence R) :
    ReliabilityAnalysisClosed R := by
  exact And.intro E.componentStressClosed (And.intro E.thermalCyclingClosed (And.intro E.mtbfClosed E.failureModeAnalysisClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse