import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure FiniteFieldStructure where
  q : Nat
  primePower : q > 1
  fieldType : Type u
  addition : fieldType → fieldType → fieldType
  multiplication : fieldType → fieldType → fieldType
  multiplicativeIdentity : fieldType
  additiveIdentity : fieldType
  fieldAxioms : Prop
  orderIsQ : Fintype.card fieldType = q

def FiniteFieldEvidence (F : FiniteFieldStructure) : Prop := F.fieldAxioms ∧ F.orderIsQ

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
