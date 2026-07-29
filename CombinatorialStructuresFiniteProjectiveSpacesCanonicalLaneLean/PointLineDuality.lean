import CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean.IncidenceStructure

namespace HautevilleHouse
namespace CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean

structure PointLineDualityPackage (I : IncidenceStructurePackage) where
  dualPointSet : I.pointSet → I.lineSet
  dualLineSet : I.lineSet → I.pointSet
  dualityProperties : Prop
  dualityInvolution : I.pointSet → I.pointSet

structure PointLineDualityEvidence {I : IncidenceStructurePackage}
    (D : PointLineDualityPackage I) where
  dualityPropertiesClosed : D.dualityProperties
  involutionIdempotent : ∀ p, D.dualityInvolution (D.dualityInvolution p) = p

def PointLineDualityClosed {I : IncidenceStructurePackage}
    (D : PointLineDualityPackage I) : Prop :=
  D.dualityProperties

theorem point_line_duality_closed_from_evidence {I : IncidenceStructurePackage}
    (D : PointLineDualityPackage I) (E : PointLineDualityEvidence D) :
    PointLineDualityClosed D := by
  exact E.dualityPropertiesClosed

end CombinatorialStructuresFiniteProjectiveSpacesCanonicalLaneLean
end HautevilleHouse