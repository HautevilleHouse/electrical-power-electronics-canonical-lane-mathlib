import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  PowerWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse