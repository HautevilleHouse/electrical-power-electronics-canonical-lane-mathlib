import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure PowerElectronicsSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure PowerElectronicsAdmittedObject where
  system : PowerElectronicsSpace
  powerTopology : Prop
  controlLoopDesigned : Prop
  stabilityAchieved : Prop
  emcCompliant : Prop
  thermalSafe : Prop
  conclusion : stabilityAchieved ∧ emcCompliant ∧ thermalSafe

structure PowerElectronicsEndgameState where
  object : PowerElectronicsAdmittedObject

def PowerElectronicsWitnessClosed (O : PowerElectronicsAdmittedObject) : Prop :=
  O.stabilityAchieved ∧ O.emcCompliant ∧ O.thermalSafe

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse