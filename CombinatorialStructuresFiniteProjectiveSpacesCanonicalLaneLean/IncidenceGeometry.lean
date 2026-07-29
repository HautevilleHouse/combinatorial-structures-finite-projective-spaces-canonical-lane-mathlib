import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.ProjectiveSpace

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure IncidenceGeometryPackage {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} (P : ProjectiveSpacePackage V) where
  subspaces : Type u
  subspaceInclusion : subspaces → subspaces → Prop
  dimension : subspaces → ℕ
  incidenceAxioms : Prop
  projectiveDimensionTheory : Prop
  incidenceAxiomsTerm : incidenceAxioms
  projectiveDimensionTheoryTerm : projectiveDimensionTheory

structure IncidenceGeometryEvidence {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} {P : ProjectiveSpacePackage V}
    (I : IncidenceGeometryPackage P) where
  incidenceAxiomsClosed : I.incidenceAxioms
  projectiveDimensionTheoryClosed : I.projectiveDimensionTheory

def IncidenceGeometryClosed {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} {P : ProjectiveSpacePackage V}
    (I : IncidenceGeometryPackage P) : Prop :=
  I.incidenceAxioms ∧ I.projectiveDimensionTheory

theorem incidence_geometry_closed_from_evidence {F : FiniteFieldPackage}
    {V : VectorSpacePackage F} {P : ProjectiveSpacePackage V}
    (I : IncidenceGeometryPackage P) (E : IncidenceGeometryEvidence I) :
    IncidenceGeometryClosed I := by
  exact And.intro E.incidenceAxiomsClosed E.projectiveDimensionTheoryClosed

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
