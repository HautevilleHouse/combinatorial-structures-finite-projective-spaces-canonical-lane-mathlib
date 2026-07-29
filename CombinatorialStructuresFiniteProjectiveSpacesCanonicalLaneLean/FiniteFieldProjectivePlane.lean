import canonicalLaneMathlib.AdmissibleClass
import ProjectiveSpaceAdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure FiniteFieldProjectivePlanePackage (q : ℕ) (primePower : q > 1) where
  fieldExistence : Prop
  projectivePlaneDefined : Prop
  orderQ : ℕ := q
  pointCountQ : ℕ := q^2 + q + 1
  lineCountQ : ℕ := q^2 + q + 1
  incidenceProperties : Prop
  desarguesianProperty : Prop

structure FiniteFieldProjectivePlaneEvidence {q : ℕ} {primePower : q > 1}
    (P : FiniteFieldProjectivePlanePackage q primePower) where
  fieldExistenceClosed : P.fieldExistence
  projectivePlaneDefinedClosed : P.projectivePlaneDefined
  incidencePropertiesClosed : P.incidenceProperties
  desarguesianPropertyClosed : P.desarguesianProperty

def FiniteFieldProjectivePlaneClosed {q : ℕ} {primePower : q > 1}
    (P : FiniteFieldProjectivePlanePackage q primePower) : Prop :=
  P.fieldExistence ∧ P.projectivePlaneDefined ∧ P.incidenceProperties ∧ P.desarguesianProperty

theorem finite_field_projective_plane_closed_from_evidence
    {q : ℕ} {primePower : q > 1} (P : FiniteFieldProjectivePlanePackage q primePower)
    (E : FiniteFieldProjectivePlaneEvidence P) : FiniteFieldProjectivePlaneClosed P := by
  exact And.intro E.fieldExistenceClosed
    (And.intro E.projectivePlaneDefinedClosed
      (And.intro E.incidencePropertiesClosed E.desarguesianPropertyClosed))

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse