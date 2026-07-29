import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpaces

structure Oval where
  plane : FiniteProjectivePlane
  setOfPoints : Type
  size : Nat
  noThreeCollinear : Prop
  everyPointHasUniqueTangent : Prop

structure Conic where
  plane : FiniteProjectivePlane
  quadraticForm : Type
  setOfPoints : Type
  isNondegenerate : Prop
  conicHasOvalProperty : Prop

structure OvalConicPackage where
  oval : Oval
  conic : Conic
  equivalenceInOddOrder : Prop
  equivalenceProof : Oval.plane = Conic.plane → Oval.size = Conic.size → Prop

structure OvalConicEvidence (O : OvalConicPackage) where
  equivalenceInOddOrderClosed : O.equivalenceInOddOrder

def OvalConicClosed (O : OvalConicPackage) : Prop :=
  O.equivalenceInOddOrder

theorem oval_conic_closed_from_evidence (O : OvalConicPackage)
    (E : OvalConicEvidence O) : OvalConicClosed O := by
  exact E.equivalenceInOddOrderClosed

end CombinatorialStructuresFiniteProjectiveSpaces
end HautevilleHouse
