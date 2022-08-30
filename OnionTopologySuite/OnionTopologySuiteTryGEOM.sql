-- $manifold$
-- $include$ [OnionTopologySuiteTryWKB.sql]

-- OffsetCurveFunctions
FUNCTION TryNTSOffsetCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryOffsetCurve(GeomWkb(@geom), @distance) END  ;
FUNCTION TryNTSOffsetCurveWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS TryOffsetCurveWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @joinStyle, @mitreLimit) END ;

-- BezierCurveFunctions
FUNCTION TryNTSBezierCurveByAlpha(@geom GEOM, @alpha FLOAT64) NVARCHAR AS TryBezierCurveByAlpha(GeomWkb(@geom), @alpha) END ;
FUNCTION TryNTSBezierCurveByAlphaAndSkew(@geom GEOM, @alpha FLOAT64, @skew FLOAT64) NVARCHAR AS TryBezierCurveByAlphaAndSkew(GeomWkb(@geom), @alpha, @skew) END ;
FUNCTION TryNTSBezierCurveWithControlPoints(@geom GEOM, @controlPoints GEOM) NVARCHAR AS TryBezierCurveWithControlPoints(GeomWkb(@geom), GeomWkb(@controlPoints)) END ;

FUNCTION TryNTSBezierCurveWithControlPoints(@geom GEOM, @controlPoints GEOM) NVARCHAR AS TryWKBBezierCurveWithControlPoints(GeomWkb(@geom), GeomWkb(@controlPoints)) END ;


-- HullFunctions
FUNCTION TryNTSConcaveHullByLength(@geom GEOM, @maxLength FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS TryConcaveHullByLength(GeomWkb(GeomNormalize(@geom, 0)), @maxLength, @isHolesAllowed) END ;
FUNCTION TryNTSConcaveHullByLengthRatio(@geom GEOM, @lengthRatio FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS TryConcaveHullByLengthRatio(GeomWkb(GeomNormalize(@geom, 0)), @lengthRatio, @isHolesAllowed) END ;
FUNCTION TryNTSPolygonHull(@geom GEOM, @isOuter BOOLEAN, @vertexNumFraction FLOAT64) NVARCHAR AS TryPolygonHull(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @vertexNumFraction) END ;
FUNCTION TryNTSPolygonHullByAreaDelta(@geom GEOM, @isOuter BOOLEAN, @areaDeltaRatio FLOAT64) NVARCHAR AS TryPolygonHullByAreaDelta(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @areaDeltaRatio) END ;

-- AffineTransformationFunctions
FUNCTION TryNTSTransformByVectors(@geom GEOM, @control GEOM) NVARCHAR AS TryTransformByVectors(GeomWkb(@geom), GeomWkb(@control)) END ;
FUNCTION TryNTSTransformByBaseline(@geom GEOM, @destBaseline GEOM) NVARCHAR AS TryTransformByBaseline(GeomWkb(@geom), GeomWkb(@destBaseline)) END ;
FUNCTION TryNTSScale(@geom GEOM, @scale FLOAT64) NVARCHAR AS TryScale(GeomWkb(@geom), @scale) END ;
FUNCTION TryNTSReflectInX(@geom GEOM) NVARCHAR AS TryReflectInX(GeomWkb(@geom)) END ;
FUNCTION TryNTSReflectInY(@geom GEOM) NVARCHAR AS TryReflectInY(GeomWkb(@geom)) END ;
FUNCTION TryNTSRotate(@geom GEOM, @multipleOfPi FLOAT64) NVARCHAR AS TryRotate(GeomWkb(@geom), @multipleOfPi) END ;
FUNCTION TryNTSTranslateCentreToOrigin(@geom GEOM) NVARCHAR AS TryTranslateCentreToOrigin(GeomWkb(@geom)) END ;
FUNCTION TryNTSTranslateToOrigin(@geom GEOM) NVARCHAR AS TryTranslateToOrigin(GeomWkb(@geom)) END ;
 
-- BoundaryFunctions
FUNCTION TryNTSBoundary(@geom GEOM) NVARCHAR AS Tryboundary(GeomWkb(@geom)) END ;
FUNCTION TryNTSBoundaryMod2(@geom GEOM) NVARCHAR AS TryboundaryMod2(GeomWkb(@geom)) END ;
FUNCTION TryNTSBoundaryEndpoint(@geom GEOM) NVARCHAR AS TryboundaryEndpoint(GeomWkb(@geom)) END ;
FUNCTION TryNTSBoundaryMonoValentEnd(@geom GEOM) NVARCHAR AS TryboundaryMonoValentEnd(GeomWkb(@geom)) END ;
FUNCTION TryNTSBoundaryMultiValentEnd(@geom GEOM) NVARCHAR AS TryboundaryMultiValentEnd(GeomWkb(@geom)) END ;
 
-- BufferByUnionFunctions
FUNCTION TryNTSComponentBuffers(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryComponentBuffers(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferByComponents(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferByComponents(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferBySegments(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferBySegments(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferByChains(@geom GEOM, @distance FLOAT64, @maxChainSize INT32) NVARCHAR AS TryBufferByChains(GeomWkb(@geom), @distance, @maxChainSize) END ;
 
-- BufferFunctions
FUNCTION TryNTSBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBuffer(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS TryBufferWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) END ;
FUNCTION TryNTSBufferWithSimplify(@geom GEOM, @distance FLOAT64, @simplifyFactor FLOAT64) NVARCHAR AS TryBufferWithSimplify(GeomWkb(@geom), @distance, @simplifyFactor) END ;
FUNCTION TryNTSBufferOffsetCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferOffsetCurve(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferOffsetCurveWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS TryBufferOffsetCurveWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) END ;
FUNCTION TryNTSBufferLineSimplifier(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferLineSimplifier(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferValidated(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferValidated(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferValidatedGeom(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferValidatedGeom(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSSingleSidedBufferCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS TrySingleSidedBufferCurve(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSSingleSidedBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS TrySingleSidedBuffer(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSBufferEach(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryBufferEach(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSVariableBuffer(@line GEOM, @startDist FLOAT64, @endDist FLOAT64) NVARCHAR AS TryVariableBuffer(GeomWkb(@line), @startDist, @endDist) END ;
FUNCTION TryNTSVariableBufferMid(@line GEOM, @startDist FLOAT64, @midDist FLOAT64) NVARCHAR AS TryVariableBufferMid(GeomWkb(@line), @startDist, @midDist) END ;
 
-- CGAlgorithmFunctions
FUNCTION TryNTSOrientationIndex(@segment GEOM, @ptGeom GEOM) INT32 AS TryOrientationIndex(GeomWkb(@segment), GeomWkb(@ptGeom)) END ;
FUNCTION TryNTSOrientationIndexDd(@segment GEOM, @ptGeom GEOM) INT32 AS TryOrientationIndexDd(GeomWkb(@segment), GeomWkb(@ptGeom)) END ;
FUNCTION TryNTSSegmentIntersects(@g1 GEOM, @g2 GEOM) BOOLEAN AS TrySegmentIntersects(GeomWkb(@g1), GeomWkb(@g2)) END ;
FUNCTION TryNTSSegmentIntersection(@g1 GEOM, @g2 GEOM) NVARCHAR AS TrySegmentIntersection(GeomWkb(@g1), GeomWkb(@g2)) END ;
FUNCTION TryNTSSegmentIntersectionDd(@g1 GEOM, @g2 GEOM) NVARCHAR AS TrySegmentIntersectionDd(GeomWkb(@g1), GeomWkb(@g2)) END ;
 
-- ConstructionFunctions
FUNCTION TryNTSOctagonalEnvelope(@geom GEOM) NVARCHAR AS TryOctagonalEnvelope(GeomWkb(@geom)) END ;
FUNCTION TryNTSMinimumDiameter(@geom GEOM) NVARCHAR AS TryMinimumDiameter(GeomWkb(@geom)) END ;
FUNCTION TryNTSMinimumDiameterLength(@geom GEOM) FLOAT64 AS TryMinimumDiameterLength(GeomWkb(@geom)) END ;
FUNCTION TryNTSMinimumRectangle(@geom GEOM) NVARCHAR AS TryMinimumRectangle(GeomWkb(@geom)) END ;
FUNCTION TryNTSMinimumBoundingCircle(@geom GEOM) NVARCHAR AS TryMinimumBoundingCircle(GeomWkb(@geom)) END ;
FUNCTION TryNTSMinimumBoundingCircleDiameterLength(@geom GEOM) FLOAT64 AS TryMinimumBoundingCircleDiameterLength(GeomWkb(@geom)) END ;
FUNCTION TryNTSMaximumDiameter(@geom GEOM) NVARCHAR AS TryMaximumDiameter(GeomWkb(@geom)) END ;
FUNCTION TryNTSMaximumDiameterLength(@geom GEOM) FLOAT64 AS TryMaximumDiameterLength(GeomWkb(@geom)) END ;
FUNCTION TryNTSBoundary(@geom GEOM) NVARCHAR AS TryBoundary(GeomWkb(@geom)) END ;
FUNCTION TryNTSConvexHull(@geom GEOM) NVARCHAR AS TryConvexHull(GeomWkb(@geom)) END ;
FUNCTION TryNTSCentroid(@geom GEOM) NVARCHAR AS TryCentroid(GeomWkb(@geom)) END ;
FUNCTION TryNTSInteriorPoint(@geom GEOM) NVARCHAR AS TryInteriorPoint(GeomWkb(@geom)) END ;
FUNCTION TryNTSDensify(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryDensify(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSExtractLines(@geom GEOM) NVARCHAR AS TryExtractLines(GeomWkb(@geom)) END ;
 
-- ConversionFunctions
FUNCTION TryNTSPointsToLine(@geom GEOM) NVARCHAR AS TryPointsToLine(GeomWkb(@geom)) END ;
FUNCTION TryNTSLineToPolygon(@geom GEOM) NVARCHAR AS TryLineToPolygon(GeomWkb(@geom)) END ;
FUNCTION TryNTSToPoints(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TryToPoints(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSToLines(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TryToLines(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSToGeometryCollection(@geom GEOM, @geom2 GEOM) NVARCHAR AS TryToGeometryCollection(GeomWkb(@geom), GeomWkb(@geom2)) END ;
 
-- CreateRandomGeometryFunctions
FUNCTION TryNTSRandomPointsInGrid(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomPointsInGrid(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSRandomPoints(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSRandomRadialPoints(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomRadialPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSHaltonPoints(@geom GEOM, @nPts INT32) NVARCHAR AS TryHaltonPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSHaltonPoints57(@geom GEOM, @nPts INT32) NVARCHAR AS TryHaltonPoints57(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSHaltonPointsWithBases(@geom GEOM, @nPts INT32, @basei INT32, @basej INT32) NVARCHAR AS TryHaltonPointsWithBases(GeomWkb(@geom), @nPts, @basei, @basej) END ;
FUNCTION TryNTSRandomSegments(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomSegments(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSRandomSegmentsInGrid(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomSegmentsInGrid(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSRandomLineString(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomLineString(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSRandomRectilinearWalk(@geom GEOM, @nPts INT32) NVARCHAR AS TryRandomRectilinearWalk(GeomWkb(@geom), @nPts) END ;
 
-- CreateShapeFunctions
FUNCTION TryNTSGrid(@geom GEOM, @nCells INT32) NVARCHAR AS TryGrid(GeomWkb(@geom), @nCells) END ;
FUNCTION TryNTSGridPoints(@geom GEOM, @nCells INT32) NVARCHAR AS TryGridPoints(GeomWkb(@geom), @nCells) END ;
FUNCTION TryNTSSupercircle3(@geom GEOM, @nPts INT32) NVARCHAR AS TrySupercircle3(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSSquircle(@geom GEOM, @nPts INT32) NVARCHAR AS TrySquircle(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSSupercircle5(@geom GEOM, @nPts INT32) NVARCHAR AS TrySupercircle5(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSSupercirclePoint5(@geom GEOM, @nPts INT32) NVARCHAR AS TrySupercirclePoint5(GeomWkb(@geom), @nPts) END ;
FUNCTION TryNTSSupercircle(@geom GEOM, @nPts INT32, @pow FLOAT64) NVARCHAR AS TrySupercircle(GeomWkb(@geom), @nPts, @pow) END ;
FUNCTION TryNTSPointFieldCentroidStar(@ptsGeom GEOM) NVARCHAR AS TryPointFieldCentroidStar(GeomWkb(@ptsGeom)) END ;
FUNCTION TryNTSPointFieldStar(@ptsGeom GEOM, @centrePt GEOM) NVARCHAR AS TryPointFieldStar(GeomWkb(@ptsGeom), GeomWkb(@centrePt)) END ;
 
-- DiffFunctions
FUNCTION TryNTSDiffVerticesBoth(@a GEOM, @b GEOM) NVARCHAR AS TryDiffVerticesBoth(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiffVertices(@a GEOM, @b GEOM) NVARCHAR AS TryDiffVertices(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiffSegments(@a GEOM, @b GEOM) NVARCHAR AS TryDiffSegments(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiffSegmentsBoth(@a GEOM, @b GEOM) NVARCHAR AS TryDiffSegmentsBoth(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDuplicateSegments(@a GEOM) NVARCHAR AS TryDuplicateSegments(GeomWkb(@a)) END ;
FUNCTION TryNTSSingleSegments(@a GEOM) NVARCHAR AS TrySingleSegments(GeomWkb(@a)) END ;
 
-- DissolveFunctions
FUNCTION TryNTSDissolve(@geom GEOM) NVARCHAR AS TryDissolve(GeomWkb(@geom)) END ;
 
-- DistanceFunctions
FUNCTION TryNTSDistance(@a GEOM, @b GEOM) FLOAT64 AS TryDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSIsWithinDistance(@a GEOM, @b GEOM, @dist FLOAT64) BOOLEAN AS TryIsWithinDistance(GeomWkb(@a), GeomWkb(@b), @dist) END ;
FUNCTION TryNTSNearestPoints(@a GEOM, @b GEOM) NVARCHAR AS TryNearestPoints(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM) NVARCHAR AS TryDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDensifiedDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM, @frac FLOAT64) NVARCHAR AS TryDensifiedDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b), @frac) END ;
FUNCTION TryNTSDiscreteOrientedHausdorffDistanceLine(@a GEOM, @b GEOM) NVARCHAR AS TryDiscreteOrientedHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiscreteHausdorffDistance(@a GEOM, @b GEOM) FLOAT64 AS TryDiscreteHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDiscreteOrientedHausdorffDistance(@a GEOM, @b GEOM) FLOAT64 AS TryDiscreteOrientedHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDistanceIndexed(@a GEOM, @b GEOM) FLOAT64 AS TryDistanceIndexed(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSNearestPointsIndexed(@a GEOM, @b GEOM) NVARCHAR AS TryNearestPointsIndexed(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSNearestPointsIndexedAll(@a GEOM, @b GEOM) NVARCHAR AS TryNearestPointsIndexedAll(GeomWkb(@a), GeomWkb(@b)) END ;
 
-- EditFunctions
FUNCTION TryNTSAddHole(@polyGeom GEOM, @hole GEOM) NVARCHAR AS TryAddHole(GeomWkb(@polyGeom), GeomWkb(@hole)) END ;
 
-- GeometryFunctions
FUNCTION TryNTSLength(@geom GEOM) FLOAT64 AS TryLength(GeomWkb(@geom)) END ;
FUNCTION TryNTSArea(@geom GEOM) FLOAT64 AS TryArea(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsCCW(@geom GEOM) BOOLEAN AS TryIsCCW(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsSimple(@geom GEOM) BOOLEAN AS TryIsSimple(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsValid(@geom GEOM) BOOLEAN AS TryIsValid(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsRectangle(@geom GEOM) BOOLEAN AS TryIsRectangle(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsClosed(@geom GEOM) BOOLEAN AS TryIsClosed(GeomWkb(@geom)) END ;
FUNCTION TryNTSEnvelope(@geom GEOM) NVARCHAR AS TryEnvelope(GeomWkb(@geom)) END ;
FUNCTION TryNTSReverse(@geom GEOM) NVARCHAR AS TryReverse(GeomWkb(@geom)) END ;
FUNCTION TryNTSNormalize(@geom GEOM) NVARCHAR AS TryNormalize(GeomWkb(@geom)) END ;
FUNCTION TryNTSSnap(@geom GEOM, @geom2 GEOM, @distance FLOAT64) NVARCHAR AS TrySnap(GeomWkb(@geom), GeomWkb(@geom2), @distance) END ;
FUNCTION TryNTSGetGeometryN(@geom GEOM, @i INT32) NVARCHAR AS TryGetGeometryN(GeomWkb(@geom), @i) END ;
FUNCTION TryNTSGetPolygonShell(@geom GEOM) NVARCHAR AS TryGetPolygonShell(GeomWkb(@geom)) END ;
FUNCTION TryNTSGetPolygonHoles(@geom GEOM) NVARCHAR AS TryGetPolygonHoles(GeomWkb(@geom)) END ;
FUNCTION TryNTSGetPolygonHoleN(@geom GEOM, @i INT32) NVARCHAR AS TryGetPolygonHoleN(GeomWkb(@geom), @i) END ;
FUNCTION TryNTSGetCoordinates(@geom GEOM) NVARCHAR AS TryGetCoordinates(GeomWkb(@geom)) END ;
 
-- LinearReferencingFunctions
FUNCTION TryNTSExtractPoint(@geom GEOM, @index FLOAT64) NVARCHAR AS TryExtractPoint(GeomWkb(@geom), @index) END ;
FUNCTION TryNTSExtractLine(@geom GEOM, @start FLOAT64, @end FLOAT64) NVARCHAR AS TryExtractLine(GeomWkb(@geom), @start, @end) END ;
FUNCTION TryNTSExtractLineByGeom(@geom GEOM, @geom2 GEOM) NVARCHAR AS TryExtractLineByGeom(GeomWkb(@geom), GeomWkb(@geom2)) END ;
FUNCTION TryNTSExtractLineByGeomBounds(@geom GEOM, @geom2 GEOM, @b1 FLOAT64, @b2 FLOAT64) NVARCHAR AS TryExtractLineByGeomBounds(GeomWkb(@geom), GeomWkb(@geom2), @b1, @b2) END ;
FUNCTION TryNTSProject(@geom GEOM, @geom2 GEOM) NVARCHAR AS TryProject(GeomWkb(@geom), GeomWkb(@geom2)) END ;
FUNCTION TryNTSProjectIndex(@geom GEOM, @geom2 GEOM) FLOAT64 AS TryProjectIndex(GeomWkb(@geom), GeomWkb(@geom2)) END ;
 
-- LineHandlingFunctions
FUNCTION TryNTSMergeLines(@geom GEOM) NVARCHAR AS TryMergeLines(GeomWkb(@geom)) END ;
FUNCTION TryNTSSequenceLines(@geom GEOM) NVARCHAR AS TrySequenceLines(GeomWkb(@geom)) END ;
FUNCTION TryNTSExtractLines(@geom GEOM) NVARCHAR AS TryExtractLines(GeomWkb(@geom)) END ;
FUNCTION TryNTSExtractSegments(@geom GEOM) NVARCHAR AS TryExtractSegments(GeomWkb(@geom)) END ;
FUNCTION TryNTSExtractChains(@geom GEOM, @maxChainSize INT32) NVARCHAR AS TryExtractChains(GeomWkb(@geom), @maxChainSize) END ;
FUNCTION TryNTSDissolve(@geom GEOM) NVARCHAR AS TryDissolve(GeomWkb(@geom)) END ;
 
-- LineSegmentFunctions
FUNCTION TryNTSSegmentIntersects(@geom1 GEOM, @geom2 GEOM) BOOLEAN AS TrySegmentIntersects(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSSegmentIntersection(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TrySegmentIntersection(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSSegmentIntersectionDd(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TrySegmentIntersectionDd(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSLineIntersection(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TryLineIntersection(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSLineIntersectionDD(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TryLineIntersectionDD(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION TryNTSReflectPoint(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS TryReflectPoint(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
 
-- NodingFunctions
FUNCTION TryNTSIsNodingValid(@geom GEOM) BOOLEAN AS TryIsNodingValid(GeomWkb(@geom)) END ;
FUNCTION TryNTSIsSegmentNodingValid(@geom GEOM) BOOLEAN AS TryIsSegmentNodingValid(GeomWkb(@geom)) END ;
FUNCTION TryNTSFindOneNode(@geom GEOM) NVARCHAR AS TryFindOneNode(GeomWkb(@geom)) END ;
FUNCTION TryNTSFindNodes(@geom GEOM) NVARCHAR AS TryFindNodes(GeomWkb(@geom)) END ;
FUNCTION TryNTSFindInteriorNodes(@geom GEOM) NVARCHAR AS TryFindInteriorNodes(GeomWkb(@geom)) END ;
FUNCTION TryNTSIntersectionCount(@geom GEOM) INT32 AS TryIntersectionCount(GeomWkb(@geom)) END ;
FUNCTION TryNTSInteriorIntersectionCount(@geom GEOM) INT32 AS TryInteriorIntersectionCount(GeomWkb(@geom)) END ;
FUNCTION TryNTSMCIndexNodingWithPrecision(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS TryMCIndexNodingWithPrecision(GeomWkb(@geom), @scaleFactor) END ;
FUNCTION TryNTSMCIndexNoding(@geom GEOM) NVARCHAR AS TryMCIndexNoding(GeomWkb(@geom)) END ;
FUNCTION TryNTSSnapRoundWithPrecision(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS TrySnapRoundWithPrecision(GeomWkb(@geom), @scaleFactor) END ;
FUNCTION TryNTSScaledNoding(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS TryScaledNoding(GeomWkb(@geom), @scaleFactor) END ;
 
-- NTSFunctions
FUNCTION TryNTSLogoLines(@geom GEOM) NVARCHAR AS TryLogoLines(GeomWkb(@geom)) END ;
FUNCTION TryNTSLogoBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS TryLogoBuffer(GeomWkb(@geom), @distance) END ;
 
-- OverlayFunctions
FUNCTION TryNTSIntersection(@a GEOM, @b GEOM) NVARCHAR AS TryIntersection(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSUnion(@a GEOM, @b GEOM) NVARCHAR AS TryUnion(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSSymDifference(@a GEOM, @b GEOM) NVARCHAR AS TrySymDifference(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDifference(@a GEOM, @b GEOM) NVARCHAR AS TryDifference(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSDifferenceBa(@a GEOM, @b GEOM) NVARCHAR AS TryDifferenceBa(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSUnaryUnion(@a GEOM) NVARCHAR AS TryUnaryUnion(GeomWkb(@a)) END ;
FUNCTION TryNTSUnionUsingGeometryCollection(@a GEOM, @b GEOM) NVARCHAR AS TryUnionUsingGeometryCollection(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION TryNTSClip(@a GEOM, @mask GEOM) NVARCHAR AS TryClip(GeomWkb(@a), GeomWkb(@mask)) END ;
 
-- PolygonizeFunctions
FUNCTION TryNTSPolygonize(@geom GEOM) NVARCHAR AS TryPolygonize(GeomWkb(@geom)) END ;
FUNCTION TryNTSPolygonizeValidPolygonal(@geom GEOM) NVARCHAR AS TryPolygonizeValidPolygonal(GeomWkb(@geom)) END ;
FUNCTION TryNTSPolygonizeDangles(@geom GEOM) NVARCHAR AS TryPolygonizeDangles(GeomWkb(@geom)) END ;
FUNCTION TryNTSPolygonizeCutEdges(@geom GEOM) NVARCHAR AS TryPolygonizeCutEdges(GeomWkb(@geom)) END ;
FUNCTION TryNTSPolygonizeInvalidRingLines(@geom GEOM) NVARCHAR AS TryPolygonizeInvalidRingLines(GeomWkb(@geom)) END ;
FUNCTION TryNTSPolygonizeAllErrors(@geom GEOM) NVARCHAR AS TryPolygonizeAllErrors(GeomWkb(@geom)) END ;
 
-- PrecisionFunctions
FUNCTION TryNTSReducePrecisionPointwise(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS TryReducePrecisionPointwise(GeomWkb(@geom), @scaleFactor) END ;
 
-- SelectionFunctions
FUNCTION TryNTSIntersects(@a GEOM, @mask GEOM) NVARCHAR AS TryIntersects(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSCovers(@a GEOM, @mask GEOM) NVARCHAR AS TryCovers(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSCoveredBy(@a GEOM, @mask GEOM) NVARCHAR AS TryCoveredBy(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSDisjoint(@a GEOM, @mask GEOM) NVARCHAR AS TryDisjoint(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSValid(@a GEOM) NVARCHAR AS TryValid(GeomWkb(@a)) END ;
FUNCTION TryNTSInvalid(@a GEOM) NVARCHAR AS TryInvalid(GeomWkb(@a)) END ;
FUNCTION TryNTSAreaGreater(@a GEOM, @minArea FLOAT64) NVARCHAR AS TryAreaGreater(GeomWkb(@a), @minArea) END ;
FUNCTION TryNTSAreaZero(@a GEOM) NVARCHAR AS TryAreaZero(GeomWkb(@a)) END ;
FUNCTION TryNTSWithin(@a GEOM, @mask GEOM) NVARCHAR AS TryWithin(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSInteriorPointWithin(@a GEOM, @mask GEOM) NVARCHAR AS TryInteriorPointWithin(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION TryNTSwithinDistance(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) NVARCHAR AS TrywithinDistance(GeomWkb(@a), GeomWkb(@mask), @maximumDistance) END ;
FUNCTION TryNTSwithinDistanceIndexed(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) NVARCHAR AS TrywithinDistanceIndexed(GeomWkb(@a), GeomWkb(@mask), @maximumDistance) END ;
FUNCTION TryNTSFirstNComponents(@geom GEOM, @n INT32) NVARCHAR AS TryFirstNComponents(GeomWkb(@geom), @n) END ;
 
-- SimplificationFunctions
FUNCTION TryNTSSimplifyDp(@geom GEOM, @distance FLOAT64) NVARCHAR AS TrySimplifyDp(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSSimplifyTp(@geom GEOM, @distance FLOAT64) NVARCHAR AS TrySimplifyTp(GeomWkb(@geom), @distance) END ;
FUNCTION TryNTSSimplifyVW(@geom GEOM, @distance FLOAT64) NVARCHAR AS TrySimplifyVW(GeomWkb(@geom), @distance) END ;
 
-- SortingFunctions
FUNCTION TryNTSSortByLength(@geom GEOM) NVARCHAR AS TrySortByLength(GeomWkb(@geom)) END ;
FUNCTION TryNTSSortByArea(@geom GEOM) NVARCHAR AS TrySortByArea(GeomWkb(@geom)) END ;
FUNCTION TryNTSSortByHilbertCode(@geom GEOM) NVARCHAR AS TrySortByHilbertCode(GeomWkb(@geom)) END ;
FUNCTION TryNTSSortByMortonCode(@geom GEOM) NVARCHAR AS TrySortByMortonCode(GeomWkb(@geom)) END ;
 
-- SpatialIndexFunctions
FUNCTION TryNTSKdTreeQuery(@pts GEOM, @query GEOM, @tolerance FLOAT64) NVARCHAR AS TryKdTreeQuery(GeomWkb(@pts), GeomWkb(@query), @tolerance) END ;
FUNCTION TryNTSKdTreeQueryRepeated(@pts GEOM, @queryEnv GEOM, @tolerance FLOAT64) NVARCHAR AS TryKdTreeQueryRepeated(GeomWkb(@pts), GeomWkb(@queryEnv), @tolerance) END ;
FUNCTION TryNTSSTRtreeBounds(@geoms GEOM) NVARCHAR AS TrySTRtreeBounds(GeomWkb(@geoms)) END ;
FUNCTION TryNTSSTRtreeQuery(@geoms GEOM, @queryEnv GEOM) NVARCHAR AS TrySTRtreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv)) END ;
FUNCTION TryNTSStrTreeNN(@geoms GEOM, @geom GEOM) NVARCHAR AS TryStrTreeNN(GeomWkb(@geoms), GeomWkb(@geom)) END ;
FUNCTION TryNTSStrTreeNNInSet(@geoms GEOM) NVARCHAR AS TryStrTreeNNInSet(GeomWkb(@geoms)) END ;
FUNCTION TryNTSStrTreeNNk(@geoms GEOM, @geom GEOM, @k INT32) NVARCHAR AS TryStrTreeNNk(GeomWkb(@geoms), GeomWkb(@geom), @k) END ;
FUNCTION TryNTSQuadTreeQuery(@geoms GEOM, @queryEnv GEOM) NVARCHAR AS TryQuadTreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv)) END ;
FUNCTION TryNTSMonotoneChains(@geom GEOM) NVARCHAR AS TryMonotoneChains(GeomWkb(@geom)) END ;
 
-- TriangleFunctions
FUNCTION TryNTSCentroid(@geom GEOM) NVARCHAR AS TryCentroid(GeomWkb(@geom)) END ;
FUNCTION TryNTSCircumcentre(@geom GEOM) NVARCHAR AS TryCircumcentre(GeomWkb(@geom)) END ;
FUNCTION TryNTSCircumcentreDD(@geom GEOM) NVARCHAR AS TryCircumcentreDD(GeomWkb(@geom)) END ;
FUNCTION TryNTSPerpendicularBisectors(@geom GEOM) NVARCHAR AS TryPerpendicularBisectors(GeomWkb(@geom)) END ;
FUNCTION TryNTSInCentre(@geom GEOM) NVARCHAR AS TryInCentre(GeomWkb(@geom)) END ;
FUNCTION TryNTSAngleBisectors(@geom GEOM) NVARCHAR AS TryAngleBisectors(GeomWkb(@geom)) END ;
 
-- ValidationFunctions
FUNCTION TryNTSInvalidLocations(@geom GEOM) NVARCHAR AS TryInvalidLocations(GeomWkb(@geom)) END ;
FUNCTION TryNTSInvalidGeoms(@geom GEOM) NVARCHAR AS TryInvalidGeoms(GeomWkb(@geom)) END ;