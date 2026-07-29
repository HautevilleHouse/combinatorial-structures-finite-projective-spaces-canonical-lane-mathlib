import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpaces

structure FiniteProjectivePlane where
  Point : Type
  Line : Type
  incidence : Point → Line → Prop
  pointCount : Nat
  lineCount : Nat
  order : Nat
  anyTwoPointsUniqueLine : ∀ (p q : Point), p ≠ q → ∃! (l : Line), incidence p l ∧ incidence q l
  anyTwoLinesUniquePoint : ∀ (l m : Line), l ≠ m → ∃! (p : Point), incidence p l ∧ incidence p m
  existsFourPointsInGeneralPosition : ∃ (p q r s : Point), ∀ (l : Line), ¬ (incidence p l ∧ incidence q l ∧ incidence r l ∧ incidence s l)
  pointCountSatisfies : pointCount = order^2 + order + 1
  lineCountSatisfies : lineCount = order^2 + order + 1

structure ProjectivePlaneEvidence (P : FiniteProjectivePlane) where
  anyTwoPointsUniqueLineClosed : P.anyTwoPointsUniqueLine
  anyTwoLinesUniquePointClosed : P.anyTwoLinesUniquePoint
  existsFourPointsInGeneralPositionClosed : P.existsFourPointsInGeneralPosition
  pointCountSatisfiesClosed : P.pointCountSatisfies
  lineCountSatisfiesClosed : P.lineCountSatisfies

def ProjectivePlaneAxiomsClosed (P : FiniteProjectivePlane) : Prop :=
  P.anyTwoPointsUniqueLine ∧ P.anyTwoLinesUniquePoint ∧
  P.existsFourPointsInGeneralPosition ∧ P.pointCountSatisfies ∧ P.lineCountSatisfies

theorem projective_plane_axioms_closed_from_evidence (P : FiniteProjectivePlane)
    (E : ProjectivePlaneEvidence P) : ProjectivePlaneAxiomsClosed P := by
  exact And.intro E.anyTwoPointsUniqueLineClosed
    (And.intro E.anyTwoLinesUniquePointClosed
      (And.intro E.existsFourPointsInGeneralPositionClosed
        (And.intro E.pointCountSatisfiesClosed E.lineCountSatisfiesClosed)))

end CombinatorialStructuresFiniteProjectiveSpaces
end HautevilleHouse
