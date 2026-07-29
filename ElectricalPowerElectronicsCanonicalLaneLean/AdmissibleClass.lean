import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure PowerAdmittedObject where
  system : Type
  topology : TopologicalSpace system
  operatingPoint : Prop
  controlObjective : Prop
  conclusion : controlObjective

structure AdmissibleClass where
  object : PowerAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  PowerWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def PowerWitnessClosed (O : PowerAdmittedObject) : Prop :=
  O.controlObjective

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse