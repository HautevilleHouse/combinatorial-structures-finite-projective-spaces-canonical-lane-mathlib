import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure FiniteProjectivePlane where
  Points : Type u
  Lines : Type v
  incidence : Points → Lines → Prop
  order : ℕ
  pointCount : ℕ
  lineCount : ℕ
  pointCountEqOrderSqPlusOrderPlusOne : pointCount = order^2 + order + 1
  lineCountEqOrderSqPlusOrderPlusOne : lineCount = order^2 + order + 1
  eachLineHasOrderPlusOnePoints : ∀ l : Lines, Cardinal.mk {p : Points | incidence p l} = order + 1
  eachPointOnOrderPlusOneLines : ∀ p : Points, Cardinal.mk {l : Lines | incidence p l} = order + 1
  anyTwoPointsUniqueLine : ∀ p q : Points, p ≠ q → ∃! l : Lines, incidence p l ∧ incidence q l
  anyTwoLinesUniquePoint : ∀ l m : Lines, l ≠ m → ∃! p : Points, incidence p l ∧ incidence p m

structure FiniteProjectivePlaneEvidence (π : FiniteProjectivePlane) where
  pointCountClosed : π.pointCount = π.order^2 + π.order + 1
  lineCountClosed : π.lineCount = π.order^2 + π.order + 1
  eachLineHasOrderPlusOnePointsClosed : ∀ l : π.Lines, Fintype.card {p : π.Points | π.incidence p l} = π.order + 1
  eachPointOnOrderPlusOneLinesClosed : ∀ p : π.Points, Fintype.card {l : π.Lines | π.incidence p l} = π.order + 1
  anyTwoPointsUniqueLineClosed : ∀ p q : π.Points, p ≠ q → ∃! l : π.Lines, π.incidence p l ∧ π.incidence q l
  anyTwoLinesUniquePointClosed : ∀ l m : π.Lines, l ≠ m → ∃! p : π.Points, π.incidence p l ∧ π.incidence p m

def FiniteProjectivePlaneClosed (π : FiniteProjectivePlane) : Prop :=
  (π.pointCount = π.order^2 + π.order + 1) ∧
  (π.lineCount = π.order^2 + π.order + 1) ∧
  (∀ l : π.Lines, Fintype.card {p : π.Points | π.incidence p l} = π.order + 1) ∧
  (∀ p : π.Points, Fintype.card {l : π.Lines | π.incidence p l} = π.order + 1) ∧
  (∀ p q : π.Points, p ≠ q → ∃! l : π.Lines, π.incidence p l ∧ π.incidence q l) ∧
  (∀ l m : π.Lines, l ≠ m → ∃! p : π.Points, π.incidence p l ∧ π.incidence p m)

theorem finite_projective_plane_closed_from_evidence (π : FiniteProjectivePlane) (E : FiniteProjectivePlaneEvidence π) : FiniteProjectivePlaneClosed π := by
  exact And.intro E.pointCountClosed (And.intro E.lineCountClosed (And.intro E.eachLineHasOrderPlusOnePointsClosed (And.intro E.eachPointOnOrderPlusOneLinesClosed (And.intro E.anyTwoPointsUniqueLineClosed E.anyTwoLinesUniquePointClosed))))

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse