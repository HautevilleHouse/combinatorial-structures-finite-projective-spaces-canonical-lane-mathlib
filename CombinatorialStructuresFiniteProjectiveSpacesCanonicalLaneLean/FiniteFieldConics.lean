import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure Conic (π : FiniteProjectivePlane) (F : Type u) [Field F] where
  equation : F → F → F → Prop
  pointsOnConic : Set π.Points
  irreducible : Prop
  smoothness : Prop
  pointsOverField : Fintype.card {p : π.Points × F × F × F | equation p.2.1 p.2.2.1 p.2.2.2} = (π.order : ℕ) + 1

structure ConicEvidence (π : FiniteProjectivePlane) (F : Type u) [Field F] (C : Conic π F) where
  irreducibleClosed : C.irreducible
  smoothnessClosed : C.smoothness
  pointsCountClosed : Fintype.card {p : π.Points × F × F × F | C.equation p.2.1 p.2.2.1 p.2.2.2} = (π.order : ℕ) + 1

def ConicClosed (π : FiniteProjectivePlane) (F : Type u) [Field F] (C : Conic π F) : Prop :=
  C.irreducible ∧ C.smoothness ∧ Fintype.card {p : π.Points × F × F × F | C.equation p.2.1 p.2.2.1 p.2.2.2} = (π.order : ℕ) + 1

theorem conic_closed_from_evidence (π : FiniteProjectivePlane) (F : Type u) [Field F] (C : Conic π F) (E : ConicEvidence π F C) : ConicClosed π F C := by
  exact And.intro E.irreducibleClosed (And.intro E.smoothnessClosed E.pointsCountClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse