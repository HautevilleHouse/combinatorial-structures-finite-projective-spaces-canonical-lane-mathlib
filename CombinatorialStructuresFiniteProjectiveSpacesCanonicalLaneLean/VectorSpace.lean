import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.FiniteField

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure VectorSpacePackage (F : FiniteFieldPackage) where
  space : Type u
  zeroVector : space
  vectorAddition : space → space → space
  scalarMultiplication : F.carrier → space → space
  vectorSpaceAxioms : Prop
  dimension : ℕ
  finiteDimensional : Prop
  basis : Type v
  vectorSpaceAxiomsTerm : vectorSpaceAxioms
  finiteDimensionalTerm : finiteDimensional
  basisTerm : basis

structure VectorSpaceEvidence {F : FiniteFieldPackage}
    (V : VectorSpacePackage F) where
  vectorSpaceAxiomsClosed : V.vectorSpaceAxioms
  finiteDimensionalClosed : V.finiteDimensional
  basisClosed : V.basis

def VectorSpaceClosed {F : FiniteFieldPackage} (V : VectorSpacePackage F) : Prop :=
  V.vectorSpaceAxioms ∧ V.finiteDimensional ∧ Nonempty V.basis

theorem vector_space_closed_from_evidence {F : FiniteFieldPackage}
    (V : VectorSpacePackage F) (E : VectorSpaceEvidence V) :
    VectorSpaceClosed V := by
  refine And.intro E.vectorSpaceAxiomsClosed (And.intro E.finiteDimensionalClosed ?_)
  exact ⟨E.basisClosed⟩

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
