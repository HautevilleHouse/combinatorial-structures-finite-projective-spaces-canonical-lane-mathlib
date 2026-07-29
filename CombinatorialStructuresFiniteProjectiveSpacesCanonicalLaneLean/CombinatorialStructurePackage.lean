import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.ProjectiveSpaceModel
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.DesarguesTheorem
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.FiniteFieldStructure

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure CombinatorialStructurePackage (F : FiniteFieldStructure) where
  projectiveSpace : ProjectiveSpaceModel F
  desargues : DesarguesTheoremStatement
  additionalCombinatorialProperties : Prop

structure CombinatorialStructureEvidence (F : FiniteFieldStructure) (C : CombinatorialStructurePackage F) where
  projectiveSpaceClosed : ProjectiveSpaceClosed F C.projectiveSpace
  desarguesHolds : C.desargues.holdsInProjectiveSpace
  additionalCombinatorialPropertiesClosed : C.additionalCombinatorialProperties

def CombinatorialStructureClosed (F : FiniteFieldStructure) (C : CombinatorialStructurePackage F) : Prop :=
  ProjectiveSpaceClosed F C.projectiveSpace ∧ C.desargues.holdsInProjectiveSpace ∧ C.additionalCombinatorialProperties

theorem combinatorial_structure_closed_from_evidence (F : FiniteFieldStructure) (C : CombinatorialStructurePackage F)
    (E : CombinatorialStructureEvidence F C) : CombinatorialStructureClosed F C := by
  exact And.intro E.projectiveSpaceClosed (And.intro E.desarguesHolds E.additionalCombinatorialPropertiesClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
