import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure SwitchingHarmonicsPackage where
  harmonicSpectrum : Prop
  totalHarmonicDistortion : Prop
  filterAttenuation : Prop
  emcCompliance : Prop

structure SwitchingHarmonicsEvidence (S : SwitchingHarmonicsPackage) where
  harmonicSpectrumClosed : S.harmonicSpectrum
  totalHarmonicDistortionClosed : S.totalHarmonicDistortion
  filterAttenuationClosed : S.filterAttenuation
  emcComplianceClosed : S.emcCompliance

def SwitchingHarmonicsClosed (S : SwitchingHarmonicsPackage) : Prop :=
  S.harmonicSpectrum ∧ S.totalHarmonicDistortion ∧ S.filterAttenuation ∧ S.emcCompliance

theorem switching_harmonics_closed_from_evidence (S : SwitchingHarmonicsPackage) (E : SwitchingHarmonicsEvidence S) :
    SwitchingHarmonicsClosed S := by
  exact And.intro E.harmonicSpectrumClosed (And.intro E.totalHarmonicDistortionClosed (And.intro E.filterAttenuationClosed E.emcComplianceClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse