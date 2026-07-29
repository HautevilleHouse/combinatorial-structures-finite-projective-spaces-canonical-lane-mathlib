import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.FiniteFieldStructure

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ProjectiveSpaceModel (F : FiniteFieldStructure) where
  dimension : Nat
  pointType : Type u
  incidence : pointType → pointType → Prop
  pointsFromVectorSpace : Prop
  collinearityAxioms : Prop
  orderConsistency : Fintype.card pointType = (F.q ^ (dimension + 1) - 1) / (F.q - 1)

structure ProjectiveSpaceEvidence (F : FiniteFieldStructure) (P : ProjectiveSpaceModel F) where
  pointsFromVectorSpaceClosed : P.pointsFromVectorSpace
  collinearityAxiomsClosed : P.collinearityAxioms
  orderConsistencyClosed : P.orderConsistency

def ProjectiveSpaceClosed (F : FiniteFieldStructure) (P : ProjectiveSpaceModel F) : Prop :=
  P.pointsFromVectorSpace ∧ P.collinearityAxioms ∧ P.orderConsistency

theorem projective_space_closed_from_evidence (F : FiniteFieldStructure) (P : ProjectiveSpaceModel F)
    (E : ProjectiveSpaceEvidence F P) : ProjectiveSpaceClosed F P := by
  exact And.intro E.pointsFromVectorSpaceClosed (And.intro E.collinearityAxiomsClosed E.orderConsistencyClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
