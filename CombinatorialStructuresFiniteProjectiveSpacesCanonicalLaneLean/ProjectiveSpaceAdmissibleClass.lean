import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure ProjectiveSpaceAdmittedObject where
  q : ℕ
  order : ℕ
  pointCount : ℕ
  lineCount : ℕ
  incidenceConditionMet : Prop
  desarguesian : Prop
  conclusion : incidenceConditionMet ∧ desarguesian

structure ProjectiveAdmissibleClass where
  object : ProjectiveSpaceAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def projectiveAdmittedClosure (A : ProjectiveAdmissibleClass) : Prop :=
  ProjectiveWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def ProjectiveWitnessClosed (O : ProjectiveSpaceAdmittedObject) : Prop :=
  O.conclusion

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse