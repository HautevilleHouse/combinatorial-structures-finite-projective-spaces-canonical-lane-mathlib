import CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def projectiveProjection : Projection ProjectiveSpaceEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem projective_projection_idempotent (x : ProjectiveSpaceEndgameState) :
    projectiveProjection.toFun (projectiveProjection.toFun x) = projectiveProjection.toFun x := by
  exact projectiveProjection.idempotent x

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse