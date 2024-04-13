-- $manifold$
-- $include$ [OnionTopologySuiteWKB.sql]

-- # Offset Curve

-- Offset in projection units (meter, degree, ...). positive for left, negative for right.
VALUE @offsetDistance     FLOAT64 = -1.1; 


-- NTSOffsetCurve(@geom, @offsetDistance)
FUNCTION NTSOffsetCurve(@geom GEOM, @offsetDistance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBOffsetCurve(GeomWkb(@geom), @offsetDistance)) 
END;

-- Join style
--        Round = 1,
--        Mitre = 2,
--        Bevel = 3
VALUE @joinStyleRound       INT32 = 1;
VALUE @joinStyleMitre       INT32 = 2;
VALUE @joinStyleBevel       INT32 = 3;


VALUE @joinStyle            INT32 = @joinStyleRound;
VALUE @quadrantSegments     INT32 = 8;
VALUE @mitreLimit         FLOAT64 = 5;

-- NTSOffsetCurveWithParams(@geom, @offsetDistance, @quadrantSegments, @joinStyle, @mitreLimit)
FUNCTION NTSOffsetCurveWithParams(@geom GEOM, @offsetDistance FLOAT64, @quadrantSegments INT32, @joinStyle INT32, @mitreLimit FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBOffsetCurveWithParams(GeomWkb(@geom), @offsetDistance, @quadrantSegments, @joinStyle, @mitreLimit)) 
END;

-- # BezierCurveFunctions

-- A curvedness parameter 0 is linear, 1 is round, >1 is increasingly curved
VALUE @bezierAlpha     FLOAT64 = 1.1; 

-- NTSBezierCurveByAlpha(@geom, @bezierAlpha)
FUNCTION NTSBezierCurveByAlpha(@geom GEOM, @alpha FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBezierCurveByAlpha(GeomWkb(@geom), @alpha)) 
END;

-- 0 is none, positive skews towards longer side, negative towards shorter
VALUE @bezierSkew      FLOAT64 = 0; 

-- NTSBezierCurveByAlphaAndSkew(@geom, @bezierAlpha, @bezierSkew)
FUNCTION NTSBezierCurveByAlphaAndSkew(@geom GEOM, @alpha FLOAT64, @skew FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBezierCurveByAlphaAndSkew(GeomWkb(@geom), @alpha, @skew)) 
END;


FUNCTION NTSBezierCurveGetControlPoints(@geom GEOM, @alpha FLOAT64, @skew FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBezierCurveGetControlPoints(GeomWkb(@geom), @alpha, @skew)) 
END;

FUNCTION NTSBezierCurveWithControlPoints(@geom GEOM, @controlPoints GEOM) GEOM
AS
         BinaryWkbGeom(WKBBezierCurveWithControlPoints(GeomWkb(@geom), GeomWkb(@controlPoints))) 
END;


-- HullFunctions
FUNCTION NTSConcaveHullByLength(@geom GEOM, @maxLength FLOAT64, @isHolesAllowed BOOLEAN) GEOM
AS
         BinaryWkbGeom(WKBConcaveHullByLength(GeomWkb(GeomNormalize(@geom, 0)), @maxLength, @isHolesAllowed)) 
END;
FUNCTION NTSConcaveHullByLengthRatio(@geom GEOM, @lengthRatio FLOAT64, @isHolesAllowed BOOLEAN) GEOM
AS
         BinaryWkbGeom(WKBConcaveHullByLengthRatio(GeomWkb(GeomNormalize(@geom, 0)), @lengthRatio, @isHolesAllowed)) 
END;
FUNCTION NTSPolygonHull(@geom GEOM, @isOuter BOOLEAN, @vertexNumFraction FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBPolygonHull(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @vertexNumFraction)) 
END;
FUNCTION NTSPolygonHullByAreaDelta(@geom GEOM, @isOuter BOOLEAN, @areaDeltaRatio FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBPolygonHullByAreaDelta(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @areaDeltaRatio)) 
END;

-- AffineTransformationFunctions
FUNCTION NTSTransformByVectors(@geom GEOM, @control GEOM) GEOM
AS
         BinaryWkbGeom(WKBTransformByVectors(GeomWkb(@geom), GeomWkb(@control))) 
END;
FUNCTION NTSTransformByBaseline(@geom GEOM, @destBaseline GEOM) GEOM
AS
         BinaryWkbGeom(WKBTransformByBaseline(GeomWkb(@geom), GeomWkb(@destBaseline))) 
END;
FUNCTION NTSScale(@geom GEOM, @scale FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBScale(GeomWkb(@geom), @scale)) 
END;
FUNCTION NTSReflectInX(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBReflectInX(GeomWkb(@geom))) 
END;
FUNCTION NTSReflectInY(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBReflectInY(GeomWkb(@geom))) 
END;
FUNCTION NTSRotate(@geom GEOM, @multipleOfPi FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBRotate(GeomWkb(@geom), @multipleOfPi)) 
END;
FUNCTION NTSTranslateCentreToOrigin(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBTranslateCentreToOrigin(GeomWkb(@geom))) 
END;
FUNCTION NTSTranslateToOrigin(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBTranslateToOrigin(GeomWkb(@geom))) 
END;
 
-- BoundaryFunctions
FUNCTION NTSBoundary(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBboundary(GeomWkb(@geom))) 
END;
FUNCTION NTSBoundaryMod2(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBboundaryMod2(GeomWkb(@geom))) 
END;
FUNCTION NTSBoundaryEndpoint(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBboundaryEndpoint(GeomWkb(@geom))) 
END;
FUNCTION NTSBoundaryMonoValentEnd(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBboundaryMonoValentEnd(GeomWkb(@geom))) 
END;
FUNCTION NTSBoundaryMultiValentEnd(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBboundaryMultiValentEnd(GeomWkb(@geom))) 
END;
 
-- BufferByUnionFunctions
FUNCTION NTSComponentBuffers(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBComponentBuffers(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSBufferByComponents(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferByComponents(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSBufferBySegments(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferBySegments(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSBufferByChains(@geom GEOM, @distance FLOAT64, @maxChainSize INT32) GEOM
AS
         BinaryWkbGeom(WKBBufferByChains(GeomWkb(@geom), @distance, @maxChainSize)) 
END;
 
-- BufferFunctions
VALUE @capStyleRound      INT32 = 1;
VALUE @capStyleFlat       INT32 = 2;
VALUE @capStyleSquare     INT32 = 3;
--        Round = 1,
--        Flat = 2,
--        Square = 3

VALUE @joinStyleRound     INT32 = 1;
VALUE @joinStyleMitre     INT32 = 2;
VALUE @joinStyleBevel     INT32 = 3;
--        Round = 1,
--        Mitre = 2,
--        Bevel = 3

FUNCTION NTSBuffer(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBuffer(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSBufferWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferWithParams(GeomWkb(GeomNormalize(@geom, 0)), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)) 
END;
FUNCTION NTSBufferWithSimplify(@geom GEOM, @distance FLOAT64, @simplifyFactor FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferWithSimplify(GeomWkb(GeomNormalize(@geom, 0)), @distance, @simplifyFactor)) 
END;
FUNCTION NTSBufferOffsetCurve(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferOffsetCurve(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSBufferOffsetCurveWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferOffsetCurveWithParams(GeomWkb(GeomNormalize(@geom, 0)), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)) 
END;
FUNCTION NTSBufferLineSimplifier(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferLineSimplifier(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSBufferValidated(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferValidated(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSBufferValidatedGeom(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferValidatedGeom(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSSingleSidedBufferCurve(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSingleSidedBufferCurve(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSSingleSidedBuffer(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSingleSidedBuffer(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSBufferEach(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBBufferEach(GeomWkb(GeomNormalize(@geom, 0)), @distance)) 
END;
FUNCTION NTSVariableBuffer(@line GEOM, @startDist FLOAT64, @endDist FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBVariableBuffer(GeomWkb(@line), @startDist, @endDist)) 
END;
FUNCTION NTSVariableBufferMid(@line GEOM, @startDist FLOAT64, @midDist FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBVariableBufferMid(GeomWkb(@line), @startDist, @midDist)) 
END;
 
-- CGAlgorithmFunctions
FUNCTION NTSOrientationIndex(@segment GEOM, @ptGeom GEOM) INT32
AS
         WKBOrientationIndex(GeomWkb(@segment), GeomWkb(@ptGeom)) 
END;
FUNCTION NTSOrientationIndexDd(@segment GEOM, @ptGeom GEOM) INT32
AS
         WKBOrientationIndexDd(GeomWkb(@segment), GeomWkb(@ptGeom)) 
END;
FUNCTION NTSSegmentIntersects(@g1 GEOM, @g2 GEOM) BOOLEAN
AS
         WKBSegmentIntersects(GeomWkb(@g1), GeomWkb(@g2)) 
END;
FUNCTION NTSSegmentIntersection(@g1 GEOM, @g2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBSegmentIntersection(GeomWkb(@g1), GeomWkb(@g2))) 
END;
FUNCTION NTSSegmentIntersectionDd(@g1 GEOM, @g2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBSegmentIntersectionDd(GeomWkb(@g1), GeomWkb(@g2))) 
END;
 
-- ConstructionFunctions
FUNCTION NTSOctagonalEnvelope(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBOctagonalEnvelope(GeomWkb(@geom))) 
END;
FUNCTION NTSMinimumDiameter(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMinimumDiameter(GeomWkb(@geom))) 
END;
FUNCTION NTSMinimumDiameterLength(@geom GEOM) FLOAT64
AS
         WKBMinimumDiameterLength(GeomWkb(@geom)) 
END;
FUNCTION NTSMinimumRectangle(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMinimumRectangle(GeomWkb(@geom))) 
END;
FUNCTION NTSMinimumBoundingCircle(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMinimumBoundingCircle(GeomWkb(GeomNormalize(@geom, 0)))) 
END;
FUNCTION NTSMinimumBoundingCircleDiameterLength(@geom GEOM) FLOAT64
AS
         WKBMinimumBoundingCircleDiameterLength(GeomWkb(GeomNormalize(@geom, 0))) 
END;
FUNCTION NTSMaximumDiameter(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMaximumDiameter(GeomWkb(@geom))) 
END;
FUNCTION NTSMaximumDiameterLength(@geom GEOM) FLOAT64
AS
         WKBMaximumDiameterLength(GeomWkb(@geom)) 
END;
FUNCTION NTSBoundary(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBBoundary(GeomWkb(@geom))) 
END;
FUNCTION NTSConvexHull(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBConvexHull(GeomWkb(@geom))) 
END;
FUNCTION NTSCentroid(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBCentroid(GeomWkb(@geom))) 
END;
FUNCTION NTSInteriorPoint(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBInteriorPoint(GeomWkb(@geom))) 
END;
FUNCTION NTSDensify(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBDensify(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSExtractLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBExtractLines(GeomWkb(@geom))) 
END;
 
-- ConversionFunctions
FUNCTION NTSPointsToLine(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPointsToLine(GeomWkb(@geom))) 
END;
FUNCTION NTSLineToPolygon(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBLineToPolygon(GeomWkb(@geom))) 
END;
FUNCTION NTSToPoints(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBToPoints(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSToLines(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBToLines(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSToGeometryCollection(@geom GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBToGeometryCollection(GeomWkb(@geom), GeomWkb(@geom2))) 
END;
 
-- CreateRandomGeometryFunctions
FUNCTION NTSRandomPointsInGrid(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomPointsInGrid(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSRandomPoints(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomPoints(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSRandomRadialPoints(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomRadialPoints(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSHaltonPoints(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBHaltonPoints(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSHaltonPoints57(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBHaltonPoints57(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSHaltonPointsWithBases(@geom GEOM, @nPts INT32, @basei INT32, @basej INT32) GEOM
AS
         BinaryWkbGeom(WKBHaltonPointsWithBases(GeomWkb(@geom), @nPts, @basei, @basej)) 
END;
FUNCTION NTSRandomSegments(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomSegments(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSRandomSegmentsInGrid(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomSegmentsInGrid(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSRandomLineString(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomLineString(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSRandomRectilinearWalk(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBRandomRectilinearWalk(GeomWkb(@geom), @nPts)) 
END;
 
-- CreateShapeFunctions
FUNCTION NTSGrid(@geom GEOM, @nCells INT32) GEOM
AS
         BinaryWkbGeom(WKBGrid(GeomWkb(@geom), @nCells)) 
END;
FUNCTION NTSGridPoints(@geom GEOM, @nCells INT32) GEOM
AS
         BinaryWkbGeom(WKBGridPoints(GeomWkb(@geom), @nCells)) 
END;
FUNCTION NTSSupercircle3(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBSupercircle3(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSSquircle(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBSquircle(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSSupercircle5(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBSupercircle5(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSSupercirclePoint5(@geom GEOM, @nPts INT32) GEOM
AS
         BinaryWkbGeom(WKBSupercirclePoint5(GeomWkb(@geom), @nPts)) 
END;
FUNCTION NTSSupercircle(@geom GEOM, @nPts INT32, @pow FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSupercircle(GeomWkb(@geom), @nPts, @pow)) 
END;
FUNCTION NTSPointFieldCentroidStar(@ptsGeom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPointFieldCentroidStar(GeomWkb(@ptsGeom))) 
END;
FUNCTION NTSPointFieldStar(@ptsGeom GEOM, @centrePt GEOM) GEOM
AS
         BinaryWkbGeom(WKBPointFieldStar(GeomWkb(@ptsGeom), GeomWkb(@centrePt))) 
END;
 
-- DiffFunctions
FUNCTION NTSDiffVerticesBoth(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiffVerticesBoth(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDiffVertices(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiffVertices(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDiffSegments(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiffSegments(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDiffSegmentsBoth(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiffSegmentsBoth(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDuplicateSegments(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBDuplicateSegments(GeomWkb(@a))) 
END;
FUNCTION NTSSingleSegments(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBSingleSegments(GeomWkb(@a))) 
END;
 
-- DissolveFunctions
FUNCTION NTSDissolve(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBDissolve(GeomWkb(@geom))) 
END;
 
-- DistanceFunctions
FUNCTION NTSDistance(@a GEOM, @b GEOM) FLOAT64
AS
         WKBDistance(GeomWkb(@a), GeomWkb(@b)) 
END;
FUNCTION NTSIsWithinDistance(@a GEOM, @b GEOM, @dist FLOAT64) BOOLEAN
AS
         WKBIsWithinDistance(GeomWkb(@a), GeomWkb(@b), @dist) 
END;
FUNCTION NTSNearestPoints(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBNearestPoints(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDensifiedDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM, @frac FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBDensifiedDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b), @frac)) 
END;
FUNCTION NTSDiscreteOrientedHausdorffDistanceLine(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDiscreteOrientedHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDiscreteHausdorffDistance(@a GEOM, @b GEOM) FLOAT64
AS
         WKBDiscreteHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) 
END;
FUNCTION NTSDiscreteOrientedHausdorffDistance(@a GEOM, @b GEOM) FLOAT64
AS
         WKBDiscreteOrientedHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) 
END;
FUNCTION NTSDistanceIndexed(@a GEOM, @b GEOM) FLOAT64
AS
         WKBDistanceIndexed(GeomWkb(@a), GeomWkb(@b)) 
END;
FUNCTION NTSNearestPointsIndexed(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBNearestPointsIndexed(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSNearestPointsIndexedAll(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBNearestPointsIndexedAll(GeomWkb(@a), GeomWkb(@b))) 
END;
 
-- EditFunctions
FUNCTION NTSAddHole(@polyGeom GEOM, @hole GEOM) GEOM
AS
         BinaryWkbGeom(WKBAddHole(GeomWkb(@polyGeom), GeomWkb(@hole))) 
END;
 
-- GeometryFunctions
FUNCTION NTSLength(@geom GEOM) FLOAT64
AS
         WKBLength(GeomWkb(@geom)) 
END;
FUNCTION NTSArea(@geom GEOM) FLOAT64
AS
         WKBArea(GeomWkb(@geom)) 
END;
FUNCTION NTSIsCCW(@geom GEOM) BOOLEAN
AS
         WKBIsCCW(GeomWkb(@geom)) 
END;
FUNCTION NTSIsSimple(@geom GEOM) BOOLEAN
AS
         WKBIsSimple(GeomWkb(@geom)) 
END;
FUNCTION NTSIsValid(@geom GEOM) BOOLEAN
AS
         WKBIsValid(GeomWkb(@geom)) 
END;
FUNCTION NTSIsRectangle(@geom GEOM) BOOLEAN
AS
         WKBIsRectangle(GeomWkb(@geom)) 
END;
FUNCTION NTSIsClosed(@geom GEOM) BOOLEAN
AS
         WKBIsClosed(GeomWkb(@geom)) 
END;
FUNCTION NTSEnvelope(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBEnvelope(GeomWkb(@geom))) 
END;
FUNCTION NTSReverse(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBReverse(GeomWkb(@geom))) 
END;
FUNCTION NTSNormalize(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBNormalize(GeomWkb(@geom))) 
END;
FUNCTION NTSSnap(@geom GEOM, @geom2 GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSnap(GeomWkb(@geom), GeomWkb(@geom2), @distance)) 
END;
FUNCTION NTSGetGeometryN(@geom GEOM, @i INT32) GEOM
AS
         BinaryWkbGeom(WKBGetGeometryN(GeomWkb(@geom), @i)) 
END;
FUNCTION NTSGetPolygonShell(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBGetPolygonShell(GeomWkb(@geom))) 
END;
FUNCTION NTSGetPolygonHoles(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBGetPolygonHoles(GeomWkb(@geom))) 
END;
FUNCTION NTSGetPolygonHoleN(@geom GEOM, @i INT32) GEOM
AS
         BinaryWkbGeom(WKBGetPolygonHoleN(GeomWkb(@geom), @i)) 
END;
FUNCTION NTSGetCoordinates(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBGetCoordinates(GeomWkb(@geom))) 
END;
 
-- LinearReferencingFunctions
FUNCTION NTSExtractPoint(@geom GEOM, @index FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBExtractPoint(GeomWkb(@geom), @index)) 
END;
FUNCTION NTSExtractLine(@geom GEOM, @start FLOAT64, @end FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBExtractLine(GeomWkb(@geom), @start, @end)) 
END;
FUNCTION NTSExtractLineByGeom(@geom GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBExtractLineByGeom(GeomWkb(@geom), GeomWkb(@geom2))) 
END;
FUNCTION NTSExtractLineByGeomBounds(@geom GEOM, @geom2 GEOM, @b1 FLOAT64, @b2 FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBExtractLineByGeomBounds(GeomWkb(@geom), GeomWkb(@geom2), @b1, @b2)) 
END;
FUNCTION NTSProject(@geom GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBProject(GeomWkb(@geom), GeomWkb(@geom2))) 
END;
FUNCTION NTSProjectIndex(@geom GEOM, @geom2 GEOM) FLOAT64
AS
         WKBProjectIndex(GeomWkb(@geom), GeomWkb(@geom2)) 
END;
 
-- LineHandlingFunctions
FUNCTION NTSMergeLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMergeLines(GeomWkb(@geom))) 
END;
FUNCTION NTSSequenceLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBSequenceLines(GeomWkb(@geom))) 
END;
FUNCTION NTSExtractLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBExtractLines(GeomWkb(@geom))) 
END;
FUNCTION NTSExtractSegments(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBExtractSegments(GeomWkb(@geom))) 
END;
FUNCTION NTSExtractChains(@geom GEOM, @maxChainSize INT32) GEOM
AS
         BinaryWkbGeom(WKBExtractChains(GeomWkb(@geom), @maxChainSize)) 
END;
FUNCTION NTSDissolve(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBDissolve(GeomWkb(@geom))) 
END;
 
-- LineSegmentFunctions
FUNCTION NTSSegmentIntersects(@geom1 GEOM, @geom2 GEOM) BOOLEAN
AS
         WKBSegmentIntersects(GeomWkb(@geom1), GeomWkb(@geom2)) 
END;
FUNCTION NTSSegmentIntersection(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBSegmentIntersection(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSSegmentIntersectionDd(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBSegmentIntersectionDd(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSLineIntersection(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBLineIntersection(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSLineIntersectionDD(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBLineIntersectionDD(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
FUNCTION NTSReflectPoint(@geom1 GEOM, @geom2 GEOM) GEOM
AS
         BinaryWkbGeom(WKBReflectPoint(GeomWkb(@geom1), GeomWkb(@geom2))) 
END;
 
-- NodingFunctions
FUNCTION NTSIsNodingValid(@geom GEOM) BOOLEAN
AS
         WKBIsNodingValid(GeomWkb(@geom)) 
END;
FUNCTION NTSIsSegmentNodingValid(@geom GEOM) BOOLEAN
AS
         WKBIsSegmentNodingValid(GeomWkb(@geom)) 
END;
FUNCTION NTSFindOneNode(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBFindOneNode(GeomWkb(@geom))) 
END;
FUNCTION NTSFindNodes(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBFindNodes(GeomWkb(@geom))) 
END;
FUNCTION NTSFindInteriorNodes(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBFindInteriorNodes(GeomWkb(@geom))) 
END;
FUNCTION NTSIntersectionCount(@geom GEOM) INT32
AS
         WKBIntersectionCount(GeomWkb(@geom)) 
END;
FUNCTION NTSInteriorIntersectionCount(@geom GEOM) INT32
AS
         WKBInteriorIntersectionCount(GeomWkb(@geom)) 
END;
FUNCTION NTSMCIndexNodingWithPrecision(@geom GEOM, @scaleFactor FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBMCIndexNodingWithPrecision(GeomWkb(@geom), @scaleFactor)) 
END;
FUNCTION NTSMCIndexNoding(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMCIndexNoding(GeomWkb(@geom))) 
END;
FUNCTION NTSSnapRoundWithPrecision(@geom GEOM, @scaleFactor FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSnapRoundWithPrecision(GeomWkb(@geom), @scaleFactor)) 
END;
FUNCTION NTSScaledNoding(@geom GEOM, @scaleFactor FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBScaledNoding(GeomWkb(@geom), @scaleFactor)) 
END;
 
-- NTSFunctions
FUNCTION NTSLogoLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBLogoLines(GeomWkb(@geom))) 
END;
FUNCTION NTSLogoBuffer(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBLogoBuffer(GeomWkb(@geom), @distance)) 
END;
 
-- OverlayFunctions
FUNCTION NTSIntersection(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBIntersection(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSUnion(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBUnion(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSSymDifference(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBSymDifference(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDifference(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDifference(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSDifferenceBa(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBDifferenceBa(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSUnaryUnion(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBUnaryUnion(GeomWkb(@a))) 
END;
FUNCTION NTSUnionUsingGeometryCollection(@a GEOM, @b GEOM) GEOM
AS
         BinaryWkbGeom(WKBUnionUsingGeometryCollection(GeomWkb(@a), GeomWkb(@b))) 
END;
FUNCTION NTSClip(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBClip(GeomWkb(@a), GeomWkb(@mask))) 
END;
 
-- PolygonizeFunctions
FUNCTION NTSPolygonize(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonize(GeomWkb(@geom))) 
END;
FUNCTION NTSPolygonizeValidPolygonal(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonizeValidPolygonal(GeomWkb(@geom))) 
END;
FUNCTION NTSPolygonizeDangles(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonizeDangles(GeomWkb(@geom))) 
END;
FUNCTION NTSPolygonizeCutEdges(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonizeCutEdges(GeomWkb(@geom))) 
END;
FUNCTION NTSPolygonizeInvalidRingLines(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonizeInvalidRingLines(GeomWkb(@geom))) 
END;
FUNCTION NTSPolygonizeAllErrors(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPolygonizeAllErrors(GeomWkb(@geom))) 
END;
 
-- PrecisionFunctions
FUNCTION NTSReducePrecisionPointwise(@geom GEOM, @scaleFactor FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBReducePrecisionPointwise(GeomWkb(@geom), @scaleFactor)) 
END;
 
-- SelectionFunctions
FUNCTION NTSIntersects(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBIntersects(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSCovers(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBCovers(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSCoveredBy(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBCoveredBy(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSDisjoint(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBDisjoint(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSValid(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBValid(GeomWkb(@a))) 
END;
FUNCTION NTSInvalid(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBInvalid(GeomWkb(@a))) 
END;
FUNCTION NTSAreaGreater(@a GEOM, @minArea FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBAreaGreater(GeomWkb(@a), @minArea)) 
END;
FUNCTION NTSAreaZero(@a GEOM) GEOM
AS
         BinaryWkbGeom(WKBAreaZero(GeomWkb(@a))) 
END;
FUNCTION NTSWithin(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBWithin(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSInteriorPointWithin(@a GEOM, @mask GEOM) GEOM
AS
         BinaryWkbGeom(WKBInteriorPointWithin(GeomWkb(@a), GeomWkb(@mask))) 
END;
FUNCTION NTSwithinDistance(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBwithinDistance(GeomWkb(@a), GeomWkb(@mask), @maximumDistance)) 
END;
FUNCTION NTSwithinDistanceIndexed(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBwithinDistanceIndexed(GeomWkb(@a), GeomWkb(@mask), @maximumDistance)) 
END;
FUNCTION NTSFirstNComponents(@geom GEOM, @n INT32) GEOM
AS
         BinaryWkbGeom(WKBFirstNComponents(GeomWkb(@geom), @n)) 
END;
 
-- SimplificationFunctions
FUNCTION NTSSimplifyDp(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSimplifyDp(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSSimplifyTp(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSimplifyTp(GeomWkb(@geom), @distance)) 
END;
FUNCTION NTSSimplifyVW(@geom GEOM, @distance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBSimplifyVW(GeomWkb(@geom), @distance)) 
END;
 
-- SortingFunctions
FUNCTION NTSSortByLength(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBSortByLength(GeomWkb(@geom))) 
END;
FUNCTION NTSSortByArea(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBSortByArea(GeomWkb(@geom))) 
END;
FUNCTION NTSSortByHilbertCode(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBSortByHilbertCode(GeomWkb(@geom))) 
END;
FUNCTION NTSSortByMortonCode(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBSortByMortonCode(GeomWkb(@geom))) 
END;
 
-- SpatialIndexFunctions
FUNCTION NTSKdTreeQuery(@pts GEOM, @query GEOM, @tolerance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBKdTreeQuery(GeomWkb(@pts), GeomWkb(@query), @tolerance)) 
END;
FUNCTION NTSKdTreeQueryRepeated(@pts GEOM, @queryEnv GEOM, @tolerance FLOAT64) GEOM
AS
         BinaryWkbGeom(WKBKdTreeQueryRepeated(GeomWkb(@pts), GeomWkb(@queryEnv), @tolerance)) 
END;
FUNCTION NTSSTRtreeBounds(@geoms GEOM) GEOM
AS
         BinaryWkbGeom(WKBSTRtreeBounds(GeomWkb(@geoms))) 
END;
FUNCTION NTSSTRtreeQuery(@geoms GEOM, @queryEnv GEOM) GEOM
AS
         BinaryWkbGeom(WKBSTRtreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv))) 
END;
FUNCTION NTSStrTreeNN(@geoms GEOM, @geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBStrTreeNN(GeomWkb(@geoms), GeomWkb(@geom))) 
END;
FUNCTION NTSStrTreeNNInSet(@geoms GEOM) GEOM
AS
         BinaryWkbGeom(WKBStrTreeNNInSet(GeomWkb(@geoms))) 
END;
FUNCTION NTSStrTreeNNk(@geoms GEOM, @geom GEOM, @k INT32) GEOM
AS
         BinaryWkbGeom(WKBStrTreeNNk(GeomWkb(@geoms), GeomWkb(@geom), @k)) 
END;
FUNCTION NTSQuadTreeQuery(@geoms GEOM, @queryEnv GEOM) GEOM
AS
         BinaryWkbGeom(WKBQuadTreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv))) 
END;
FUNCTION NTSMonotoneChains(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBMonotoneChains(GeomWkb(@geom))) 
END;
 
-- TriangleFunctions
FUNCTION NTSCentroid(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBCentroid(GeomWkb(@geom))) 
END;
FUNCTION NTSCircumcentre(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBCircumcentre(GeomWkb(@geom))) 
END;
FUNCTION NTSCircumcentreDD(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBCircumcentreDD(GeomWkb(@geom))) 
END;
FUNCTION NTSPerpendicularBisectors(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBPerpendicularBisectors(GeomWkb(@geom))) 
END;
FUNCTION NTSInCentre(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBInCentre(GeomWkb(@geom))) 
END;
FUNCTION NTSAngleBisectors(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBAngleBisectors(GeomWkb(@geom))) 
END;
 
-- ValidationFunctions
FUNCTION NTSInvalidLocations(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBInvalidLocations(GeomWkb(@geom))) 
END;
FUNCTION NTSInvalidGeoms(@geom GEOM) GEOM
AS
         BinaryWkbGeom(WKBInvalidGeoms(GeomWkb(@geom))) 
END;