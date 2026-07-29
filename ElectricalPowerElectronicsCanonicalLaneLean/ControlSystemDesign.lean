import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ElectricalPowerElectronicsCanonicalLaneLean

structure ControlSystemDesignPackage where
  controllerType : Prop
  stabilityMargin : Prop
  dynamicResponse : Prop
  robustness : Prop

structure ControlSystemDesignEvidence (C : ControlSystemDesignPackage) where
  controllerTypeClosed : C.controllerType
  stabilityMarginClosed : C.stabilityMargin
  dynamicResponseClosed : C.dynamicResponse
  robustnessClosed : C.robustness

def ControlSystemDesignClosed (C : ControlSystemDesignPackage) : Prop :=
  C.controllerType ∧ C.stabilityMargin ∧ C.dynamicResponse ∧ C.robustness

theorem control_system_design_closed_from_evidence (C : ControlSystemDesignPackage) (E : ControlSystemDesignEvidence C) :
    ControlSystemDesignClosed C := by
  exact And.intro E.controllerTypeClosed (And.intro E.stabilityMarginClosed (And.intro E.dynamicResponseClosed E.robustnessClosed))

end ElectricalPowerElectronicsCanonicalLaneLean
end HautevilleHouse