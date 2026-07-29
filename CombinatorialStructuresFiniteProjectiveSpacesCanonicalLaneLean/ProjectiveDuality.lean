import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ProjectiveDuality (π : FiniteProjectivePlane) where
  dualPoints : Type u
  dualLines : Type v
  dualIncidence : dualPoints → dualLines → Prop
  dualIsProjectivePlane : FiniteProjectivePlane
  orderPreserving : dualIsProjectivePlane.order = π.order
  bijectionPoints : dualPoints ≃ π.Lines
  bijectionLines : dualLines ≃ π.Points
  incidencePreserving : ∀ (p : π.Points) (l : π.Lines), π.incidence p l ↔ dualIncidence (dualPoints.mk l) (dualLines.mk p)

structure ProjectiveDualityEvidence (π : FiniteProjectivePlane) (D : ProjectiveDuality π) where
  orderPreservingClosed : D.dualIsProjectivePlane.order = π.order
  incidencePreservingClosed : ∀ (p : π.Points) (l : π.Lines), π.incidence p l ↔ D.dualIncidence (D.bijectionPoints.toFun l) (D.bijectionLines.toFun p)

def ProjectiveDualityClosed (π : FiniteProjectivePlane) (D : ProjectiveDuality π) : Prop :=
  D.dualIsProjectivePlane.order = π.order ∧ (∀ (p : π.Points) (l : π.Lines), π.incidence p l ↔ D.dualIncidence (D.bijectionPoints.toFun l) (D.bijectionLines.toFun p))

theorem projective_duality_closed_from_evidence (π : FiniteProjectivePlane) (D : ProjectiveDuality π) (E : ProjectiveDualityEvidence π D) : ProjectiveDualityClosed π D := by
  exact And.intro E.orderPreservingClosed E.incidencePreservingClosed

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse