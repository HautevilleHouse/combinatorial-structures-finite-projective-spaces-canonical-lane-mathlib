import CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.FiniteFieldStructure

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure IncidenceStructurePackage where
  pointSet : Type u
  lineSet : Type v
  incidence : pointSet → lineSet → Prop
  incidenceAxioms : Prop
  finite : Fintype pointSet × Fintype lineSet
  uniform : ℕ
  regular : ℕ

structure IncidenceStructureEvidence (I : IncidenceStructurePackage) where
  incidenceAxiomsClosed : I.incidenceAxioms
  uniformPositive : I.uniform ≥ 1
  regularPositive : I.regular ≥ 1

def IncidenceStructureClosed (I : IncidenceStructurePackage) : Prop :=
  I.incidenceAxioms ∧ I.uniform ≥ 1 ∧ I.regular ≥ 1

theorem incidence_structure_closed_from_evidence (I : IncidenceStructurePackage)
    (E : IncidenceStructureEvidence I) : IncidenceStructureClosed I := by
  exact And.intro E.incidenceAxiomsClosed (And.intro E.uniformPositive E.regularPositive)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse