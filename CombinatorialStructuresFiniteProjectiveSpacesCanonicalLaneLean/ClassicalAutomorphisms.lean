import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.CombinatorialStructurePackage

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ClassicalAutomorphisms (C : CombinatorialStructurePackage F) where
  collineationGroupType : Type u
  collineationAction : collineationGroupType → C.projectiveSpace.pointType → C.projectiveSpace.pointType
  groupOperation : collineationGroupType → collineationGroupType → collineationGroupType
  identityElement : collineationGroupType
  inverseElement : collineationGroupType → collineationGroupType
  groupAxioms : Prop
  actionPreservesIncidence : Prop
  groupOrder : Fintype.card collineationGroupType = (C.projectiveSpace.dimension + 1) * (F.q ^ (C.projectiveSpace.dimension + 1) - 1) / (F.q - 1) * (F.q ^ C.projectiveSpace.dimension - 1)

structure ClassicalAutomorphismsEvidence (C : CombinatorialStructurePackage F) (A : ClassicalAutomorphisms C) where
  groupAxiomsClosed : A.groupAxioms
  actionPreservesIncidenceClosed : A.actionPreservesIncidence
  groupOrderClosed : A.groupOrder

def ClassicalAutomorphismsClosed (C : CombinatorialStructurePackage F) (A : ClassicalAutomorphisms C) : Prop :=
  A.groupAxioms ∧ A.actionPreservesIncidence ∧ A.groupOrder

theorem classical_automorphisms_closed_from_evidence (C : CombinatorialStructurePackage F) (A : ClassicalAutomorphisms C)
    (E : ClassicalAutomorphismsEvidence C A) : ClassicalAutomorphismsClosed C A := by
  exact And.intro E.groupAxiomsClosed (And.intro E.actionPreservesIncidenceClosed E.groupOrderClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
