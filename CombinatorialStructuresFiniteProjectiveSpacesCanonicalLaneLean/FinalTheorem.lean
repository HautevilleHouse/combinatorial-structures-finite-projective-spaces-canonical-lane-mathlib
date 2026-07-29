import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.IncidenceGeometry

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

def ConstrainedProjectiveClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_projective_endgame (A : AdmissibleClass) :
    ConstrainedProjectiveClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse
