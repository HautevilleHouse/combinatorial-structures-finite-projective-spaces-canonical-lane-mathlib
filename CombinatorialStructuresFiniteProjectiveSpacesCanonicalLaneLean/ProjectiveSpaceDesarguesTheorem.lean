import canonicalLaneMathlib.AdmissibleClass
import ProjectiveSpaceDuality

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure DesarguesTheoremPackage {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    (D : ProjectiveDualityPackage P) where
  desarguesConfiguration : Prop
  theoremStatement : Prop
  proofViaCoordinatization : Prop
  impliesPappus : Prop

structure DesarguesTheoremEvidence {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} (T : DesarguesTheoremPackage D) where
  desarguesConfigurationClosed : T.desarguesConfiguration
  theoremStatementClosed : T.theoremStatement
  proofViaCoordinatizationClosed : T.proofViaCoordinatization
  impliesPappusClosed : T.impliesPappus

def DesarguesTheoremClosed {q : ℕ} {primePower : q > 1}
    {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} (T : DesarguesTheoremPackage D) : Prop :=
  T.desarguesConfiguration ∧ T.theoremStatement ∧ T.proofViaCoordinatization ∧ T.impliesPappus

theorem desargues_theorem_closed_from_evidence
    {q : ℕ} {primePower : q > 1} {P : FiniteFieldProjectivePlanePackage q primePower}
    {D : ProjectiveDualityPackage P} (T : DesarguesTheoremPackage D)
    (E : DesarguesTheoremEvidence T) : DesarguesTheoremClosed T := by
  exact And.intro E.desarguesConfigurationClosed
    (And.intro E.theoremStatementClosed
      (And.intro E.proofViaCoordinatizationClosed E.impliesPappusClosed))

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse