import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure FiniteFieldPackage where
  carrier : Type u
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  additiveIdentity : carrier
  multiplicativeIdentity : carrier
  additiveInverse : carrier → carrier
  multiplicativeInverse : carrier → carrier
  fieldAxioms : Prop
  finite : Prop
  order : ℕ
  primePower : ℕ → Prop
  fieldAxiomsTerm : fieldAxioms
  finiteTerm : finite
  primePowerTerm : primePower order

structure FiniteFieldEvidence (F : FiniteFieldPackage) where
  fieldAxiomsClosed : F.fieldAxioms
  finiteClosed : F.finite
  primePowerClosed : F.primePower F.order

def FiniteFieldClosed (F : FiniteFieldPackage) : Prop :=
  F.fieldAxioms ∧ F.finite ∧ F.primePower F.order

theorem finite_field_closed_from_evidence (F : FiniteFieldPackage)
    (E : FiniteFieldEvidence F) : FiniteFieldClosed F := by
  exact And.intro E.fieldAxiomsClosed (And.intro E.finiteClosed E.primePowerClosed)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
