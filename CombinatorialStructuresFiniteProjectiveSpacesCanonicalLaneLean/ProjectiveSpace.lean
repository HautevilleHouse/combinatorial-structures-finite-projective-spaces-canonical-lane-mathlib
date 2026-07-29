import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.VectorSpace

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ProjectiveSpacePackage {F : FiniteFieldPackage}
    (V : VectorSpacePackage F) where
  points : Type u
  lines : Type v
  incidence : points → lines → Prop
  projectivePlaneAxioms : Prop
  order : ℕ
  sizePoints : ℕ
  sizeLines : ℕ
  projectivePlaneAxiomsTerm : projectivePlaneAxioms
  sizePointsTerm : sizePoints = F.order^2 + F.order + 1
  sizeLinesTerm : sizeLines = F.order^2 + F.order + 1

structure ProjectiveSpaceEvidence {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} (P : ProjectiveSpacePackage V) where
  projectivePlaneAxiomsClosed : P.projectivePlaneAxioms
  sizePointsClosed : P.sizePoints = P.order^2 + P.order + 1
  sizeLinesClosed : P.sizeLines = P.order^2 + P.order + 1

def ProjectiveSpaceClosed {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} (P : ProjectiveSpacePackage V) : Prop :=
  P.projectivePlaneAxioms ∧ P.sizePoints = P.order^2 + P.order + 1 ∧ P.sizeLines = P.order^2 + P.order + 1

theorem projective_space_closed_from_evidence {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} (P : ProjectiveSpacePackage V)
    (E : ProjectiveSpaceEvidence P) : ProjectiveSpaceClosed P := by
  exact And.intro E.projectivePlaneAxiomsClosed (And.intro E.sizePointsClosed E.sizeLinesClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
