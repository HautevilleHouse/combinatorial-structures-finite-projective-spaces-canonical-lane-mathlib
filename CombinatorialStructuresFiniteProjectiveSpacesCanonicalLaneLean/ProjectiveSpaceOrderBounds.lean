import canonicalLaneMathlib.AdmissibleClass
import DesarguesTheorem

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure OrderBoundsPackage {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} {T : DesarguesTheoremPackage D} where
  lowerBoundExistence : Prop
  upperBoundObstruction : Prop
  bruckRyserTheorem : Prop
  primePowerConjecture : Prop

structure OrderBoundsEvidence {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} {T : DesarguesTheoremPackage D}
    (B : OrderBoundsPackage T) where
  lowerBoundExistenceClosed : B.lowerBoundExistence
  upperBoundObstructionClosed : B.upperBoundObstruction
  bruckRyserTheoremClosed : B.bruckRyserTheorem
  primePowerConjectureClosed : B.primePowerConjecture

def OrderBoundsClosed {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} {T : DesarguesTheoremPackage D}
    (B : OrderBoundsPackage T) : Prop :=
  B.lowerBoundExistence ∧ B.upperBoundObstruction ∧ B.bruckRyserTheorem ∧ B.primePowerConjecture

theorem order_bounds_closed_from_evidence
    {q : ℕ} {primePower : q > 1} {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} {T : DesarguesTheoremPackage D}
    (B : OrderBoundsPackage T) (E : OrderBoundsEvidence B) : OrderBoundsClosed B := by
  exact And.intro E.lowerBoundExistenceClosed
    (And.intro E.upperBoundObstructionClosed
      (And.intro E.bruckRyserTheoremClosed E.primePowerConjectureClosed))

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse