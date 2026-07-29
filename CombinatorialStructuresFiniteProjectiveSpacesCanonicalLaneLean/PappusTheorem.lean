import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpaces

structure PappusConfiguration where
  collinearTripleA : Type
  collinearTripleB : Type
  intersectionPoints : Type
  incidenceConstraints : Prop
  pappusCollinearity : Prop

structure PappusTheoremPackage where
  plane : FiniteProjectivePlane
  configuration : PappusConfiguration
  configurationValid : Prop
  pappusTheoremHolds : Prop

structure PappusEvidence (P : PappusTheoremPackage) where
  configurationValidClosed : P.configurationValid
  pappusTheoremHoldsClosed : P.pappusTheoremHolds

def PappusClosed (P : PappusTheoremPackage) : Prop :=
  P.configurationValid ∧ P.pappusTheoremHolds

theorem pappus_closed_from_evidence (P : PappusTheoremPackage)
    (E : PappusEvidence P) : PappusClosed P := by
  exact And.intro E.configurationValidClosed E.pappusTheoremHoldsClosed

end CombinatorialStructuresFiniteProjectiveSpaces
end HautevilleHouse
