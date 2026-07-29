import canonicalLaneMathlib.AdmissibleClass
import ProjectiveSpaceAdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

def bridgeClosed (A : ProjectiveAdmissibleClass) : Prop :=
  ProjectiveWitnessClosed A.object

theorem bridge_from_admissible_class (A : ProjectiveAdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse