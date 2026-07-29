import CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure ProjectiveSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure ProjectiveSpaceAdmittedObject where
  space : ProjectiveSpace
  finiteDimensional : Prop
  coordinateField : Type
  fieldStructure : Field coordinateField
  finite : Fintype coordinateField
  projectiveLineCount : ℕ
  conclusion : projectiveLineCount = (Fintype.card coordinateField) ^ 2 + (Fintype.card coordinateField) + 1

structure ProjectiveSpaceEndgameState where
  object : ProjectiveSpaceAdmittedObject

def ProjectiveWitnessClosed (O : ProjectiveSpaceAdmittedObject) : Prop :=
  O.conclusion

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse