import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpaces

structure DesarguesConfiguration where
  triangleOnePoints : Type
  triangleTwoPoints : Type
  perspectivePoint : Type
  perspectiveLine : Type
  incidenceStructure : Prop
  desarguesProperty : Prop

structure DesarguesTheoremPackage where
  plane : FiniteProjectivePlane
  configuration : DesarguesConfiguration
  configValid : Prop
  desarguesTheoremHolds : Prop

structure DesarguesEvidence (D : DesarguesTheoremPackage) where
  configValidClosed : D.configValid
  desarguesTheoremHoldsClosed : D.desarguesTheoremHolds

def DesarguesClosed (D : DesarguesTheoremPackage) : Prop :=
  D.configValid ∧ D.desarguesTheoremHolds

theorem desargues_closed_from_evidence (D : DesarguesTheoremPackage)
    (E : DesarguesEvidence D) : DesarguesClosed D := by
  exact And.intro E.configValidClosed E.desarguesTheoremHoldsClosed

end CombinatorialStructuresFiniteProjectiveSpaces
end HautevilleHouse
