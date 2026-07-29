import canonicalLaneMathlib.AdmissibleClass
import ProjectiveSpaceGateLemmas

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

def ConstrainedProjectiveSpaceClosure (A : ProjectiveAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_projective_space_endgame (A : ProjectiveAdmissibleClass) :
    ConstrainedProjectiveSpaceClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse