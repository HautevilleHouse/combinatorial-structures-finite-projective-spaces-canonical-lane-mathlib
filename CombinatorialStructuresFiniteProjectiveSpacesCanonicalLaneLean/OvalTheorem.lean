import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure Oval (π : FiniteProjectivePlane) where
  points : Set π.Points
  size : ℕ
  sizeEqOrderPlusOne : size = π.order + 1
  noThreeCollinear : ∀ (p q r : π.Points), p ∈ points → q ∈ points → r ∈ points → p ≠ q → p ≠ r → q ≠ r → ¬ (∃ (l : π.Lines), π.incidence p l ∧ π.incidence q l ∧ π.incidence r l)
  throughEachPointUniqueTangent : ∀ (p : π.Points), p ∈ points → ∃! l : π.Lines, π.incidence p l ∧ (¬ ∃ (q : π.Points), q ∈ points ∧ q ≠ p ∧ π.incidence q l)

structure OvalEvidence (π : FiniteProjectivePlane) (O : Oval π) where
  sizeClosed : O.size = π.order + 1
  noThreeCollinearClosed : ∀ (p q r : π.Points), p ∈ O.points → q ∈ O.points → r ∈ O.points → p ≠ q → p ≠ r → q ≠ r → ¬ (∃ (l : π.Lines), π.incidence p l ∧ π.incidence q l ∧ π.incidence r l)
  tangentUniqueClosed : ∀ (p : π.Points), p ∈ O.points → ∃! l : π.Lines, π.incidence p l ∧ (¬ ∃ (q : π.Points), q ∈ O.points ∧ q ≠ p ∧ π.incidence q l)

def OvalClosed (π : FiniteProjectivePlane) (O : Oval π) : Prop :=
  O.size = π.order + 1 ∧ (∀ (p q r : π.Points), p ∈ O.points → q ∈ O.points → r ∈ O.points → p ≠ q → p ≠ r → q ≠ r → ¬ (∃ (l : π.Lines), π.incidence p l ∧ π.incidence q l ∧ π.incidence r l)) ∧ (∀ (p : π.Points), p ∈ O.points → ∃! l : π.Lines, π.incidence p l ∧ (¬ ∃ (q : π.Points), q ∈ O.points ∧ q ≠ p ∧ π.incidence q l))

theorem oval_closed_from_evidence (π : FiniteProjectivePlane) (O : Oval π) (E : OvalEvidence π O) : OvalClosed π O := by
  exact And.intro E.sizeClosed (And.intro E.noThreeCollinearClosed E.tangentUniqueClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse