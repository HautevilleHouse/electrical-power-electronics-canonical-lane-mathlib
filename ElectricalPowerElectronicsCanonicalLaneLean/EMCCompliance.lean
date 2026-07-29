import ElectricalPowerElectronicsCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure EMCCompliancePackage where
  conductedEmissionWithinLimits : Prop
  radiatedEmissionWithinLimits : Prop
  filterDesignValid : Prop
  harmonicDistortionBelowThreshold : Prop

structure EMCComplianceEvidence (E : EMCCompliancePackage) where
  conductedEmissionWithinLimitsClosed : E.conductedEmissionWithinLimits
  radiatedEmissionWithinLimitsClosed : E.radiatedEmissionWithinLimits
  filterDesignValidClosed : E.filterDesignValid
  harmonicDistortionBelowThresholdClosed : E.harmonicDistortionBelowThreshold

def EMCComplianceClosed (E : EMCCompliancePackage) : Prop :=
  E.conductedEmissionWithinLimits ∧ E.radiatedEmissionWithinLimits ∧
  E.filterDesignValid ∧ E.harmonicDistortionBelowThreshold

theorem emc_compliance_closed_from_evidence (E : EMCCompliancePackage)
    (Ev : EMCComplianceEvidence E) : EMCComplianceClosed E := by
  exact And.intro Ev.conductedEmissionWithinLimitsClosed
    (And.intro Ev.radiatedEmissionWithinLimitsClosed
      (And.intro Ev.filterDesignValidClosed Ev.harmonicDistortionBelowThresholdClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse