import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpaces

structure FiniteField where
  carrier : Type
  zero : carrier
  one : carrier
  add : carrier → carrier → carrier
  mul : carrier → carrier → carrier
  fieldAxioms : Prop
  order : Nat
  orderIsPrimePower : ∃ p k : Nat, Nat.Prime p ∧ order = p ^ k

structure FieldBasedProjectivePlane where
  field : FiniteField
  pointSet : Type
  lineSet : Type
  incidenceRelation : pointSet → lineSet → Prop
  coordinateConstruction : Prop
  planeAxiomsSatisfied : Prop

structure FieldPlaneEvidence (F : FieldBasedProjectivePlane) where
  coordinateConstructionClosed : F.coordinateConstruction
  planeAxiomsSatisfiedClosed : F.planeAxiomsSatisfied

def FieldPlaneClosed (F : FieldBasedProjectivePlane) : Prop :=
  F.coordinateConstruction ∧ F.planeAxiomsSatisfied

theorem field_plane_closed_from_evidence (F : FieldBasedProjectivePlane)
    (E : FieldPlaneEvidence F) : FieldPlaneClosed F := by
  exact And.intro E.coordinateConstructionClosed E.planeAxiomsSatisfiedClosed

end CombinatorialStructuresFiniteProjectiveSpaces
end HautevilleHouse
