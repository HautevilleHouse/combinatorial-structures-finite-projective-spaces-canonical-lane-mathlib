import canonicalLaneMathlib.AdmissibleClass
import ProjectiveSpaceBridgeLemmas

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

def gateClosed (A : ProjectiveAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : ProjectiveAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse