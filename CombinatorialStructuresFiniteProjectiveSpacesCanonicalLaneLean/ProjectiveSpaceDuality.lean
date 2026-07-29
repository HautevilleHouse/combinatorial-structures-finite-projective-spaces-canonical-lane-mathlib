import canonicalLaneMathlib.AdmissibleClass
import FiniteFieldProjectivePlane

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ProjectiveDualityPackage {q : ℕ} {primePower : q > 1}
    (P : FiniteFieldProjectivePlanePackage q primePower) where
  dualSpaceDefined : Prop
  bijectionBetweenPointsAndLines : Prop
  incidencePreserved : Prop
  selfDualProperty : Prop

structure ProjectiveDualityEvidence {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower} (D : ProjectiveDualityPackage P) where
  dualSpaceDefinedClosed : D.dualSpaceDefined
  bijectionBetweenPointsAndLinesClosed : D.bijectionBetweenPointsAndLines
  incidencePreservedClosed : D.incidencePreserved
  selfDualPropertyClosed : D.selfDualProperty

def ProjectiveDualityClosed {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower} (D : ProjectiveDualityPackage P) : Prop :=
  D.dualSpaceDefined ∧ D.bijectionBetweenPointsAndLines ∧ D.incidencePreserved ∧ D.selfDualProperty

theorem projective_duality_closed_from_evidence
    {q : ℕ} {primePower : q > 1} {P : FiniteFieldProjectivePlanePackage q primePower}
    (D : ProjectiveDualityPackage P) (E : ProjectiveDualityEvidence D) : ProjectiveDualityClosed D := by
  exact And.intro E.dualSpaceDefinedClosed
    (And.intro E.bijectionBetweenPointsAndLinesClosed
      (And.intro E.incidencePreservedClosed E.selfDualPropertyClosed))

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse