-- $manifold$
-- $include$ [OnionTopologySuiteWktWKB.sql]

-- OffsetCurveFunctions
FUNCTION NTSWKTOffsetCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktOffsetCurve(GeomWkb(@geom), @distance) END  ;
FUNCTION NTSWKTOffsetCurveWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS WktOffsetCurveWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @joinStyle, @mitreLimit) END ;

-- BezierCurveFunctions
FUNCTION NTSWKTBezierCurveByAlpha(@geom GEOM, @alpha FLOAT64) NVARCHAR AS WktBezierCurveByAlpha(GeomWkb(@geom), @alpha) END ;
FUNCTION NTSWKTBezierCurveByAlphaAndSkew(@geom GEOM, @alpha FLOAT64, @skew FLOAT64) NVARCHAR AS WktBezierCurveByAlphaAndSkew(GeomWkb(@geom), @alpha, @skew) END ;
FUNCTION NTSWKTBezierCurveWithControlPoints(@geom GEOM, @controlPoints GEOM) NVARCHAR AS WktBezierCurveWithControlPoints(GeomWkb(@geom), GeomWkb(@controlPoints)) END ;



-- HullFunctions
FUNCTION NTSWKTConcaveHullByLength(@geom GEOM, @maxLength FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS WktConcaveHullByLength(GeomWkb(GeomNormalize(@geom, 0)), @maxLength, @isHolesAllowed) END ;
FUNCTION NTSWKTConcaveHullByLengthRatio(@geom GEOM, @lengthRatio FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS WktConcaveHullByLengthRatio(GeomWkb(GeomNormalize(@geom, 0)), @lengthRatio, @isHolesAllowed) END ;
FUNCTION NTSWKTPolygonHull(@geom GEOM, @isOuter BOOLEAN, @vertexNumFraction FLOAT64) NVARCHAR AS WktPolygonHull(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @vertexNumFraction) END ;
FUNCTION NTSWKTPolygonHullByAreaDelta(@geom GEOM, @isOuter BOOLEAN, @areaDeltaRatio FLOAT64) NVARCHAR AS WktPolygonHullByAreaDelta(GeomWkb(GeomNormalize(@geom, 0)), @isOuter, @areaDeltaRatio) END ;

-- AffineTransformationFunctions
FUNCTION NTSWKTTransformByVectors(@geom GEOM, @control GEOM) NVARCHAR AS WktTransformByVectors(GeomWkb(@geom), GeomWkb(@control)) END ;
FUNCTION NTSWKTTransformByBaseline(@geom GEOM, @destBaseline GEOM) NVARCHAR AS WktTransformByBaseline(GeomWkb(@geom), GeomWkb(@destBaseline)) END ;
FUNCTION NTSWKTScale(@geom GEOM, @scale FLOAT64) NVARCHAR AS WktScale(GeomWkb(@geom), @scale) END ;
FUNCTION NTSWKTReflectInX(@geom GEOM) NVARCHAR AS WktReflectInX(GeomWkb(@geom)) END ;
FUNCTION NTSWKTReflectInY(@geom GEOM) NVARCHAR AS WktReflectInY(GeomWkb(@geom)) END ;
FUNCTION NTSWKTRotate(@geom GEOM, @multipleOfPi FLOAT64) NVARCHAR AS WktRotate(GeomWkb(@geom), @multipleOfPi) END ;
FUNCTION NTSWKTTranslateCentreToOrigin(@geom GEOM) NVARCHAR AS WktTranslateCentreToOrigin(GeomWkb(@geom)) END ;
FUNCTION NTSWKTTranslateToOrigin(@geom GEOM) NVARCHAR AS WktTranslateToOrigin(GeomWkb(@geom)) END ;
 
-- BoundaryFunctions
FUNCTION NTSWKTBoundary(@geom GEOM) NVARCHAR AS Wktboundary(GeomWkb(@geom)) END ;
FUNCTION NTSWKTBoundaryMod2(@geom GEOM) NVARCHAR AS WktboundaryMod2(GeomWkb(@geom)) END ;
FUNCTION NTSWKTBoundaryEndpoint(@geom GEOM) NVARCHAR AS WktboundaryEndpoint(GeomWkb(@geom)) END ;
FUNCTION NTSWKTBoundaryMonoValentEnd(@geom GEOM) NVARCHAR AS WktboundaryMonoValentEnd(GeomWkb(@geom)) END ;
FUNCTION NTSWKTBoundaryMultiValentEnd(@geom GEOM) NVARCHAR AS WktboundaryMultiValentEnd(GeomWkb(@geom)) END ;
 
-- BufferByUnionFunctions
FUNCTION NTSWKTComponentBuffers(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktComponentBuffers(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferByComponents(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferByComponents(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferBySegments(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferBySegments(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferByChains(@geom GEOM, @distance FLOAT64, @maxChainSize INT32) NVARCHAR AS WktBufferByChains(GeomWkb(@geom), @distance, @maxChainSize) END ;
 
-- BufferFunctions
FUNCTION NTSWKTBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBuffer(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS WktBufferWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) END ;
FUNCTION NTSWKTBufferWithSimplify(@geom GEOM, @distance FLOAT64, @simplifyFactor FLOAT64) NVARCHAR AS WktBufferWithSimplify(GeomWkb(@geom), @distance, @simplifyFactor) END ;
FUNCTION NTSWKTBufferOffsetCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferOffsetCurve(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferOffsetCurveWithParams(@geom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS WktBufferOffsetCurveWithParams(GeomWkb(@geom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) END ;
FUNCTION NTSWKTBufferLineSimplifier(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferLineSimplifier(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferValidated(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferValidated(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferValidatedGeom(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferValidatedGeom(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTSingleSidedBufferCurve(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktSingleSidedBufferCurve(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTSingleSidedBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktSingleSidedBuffer(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTBufferEach(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktBufferEach(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTVariableBuffer(@line GEOM, @startDist FLOAT64, @endDist FLOAT64) NVARCHAR AS WktVariableBuffer(GeomWkb(@line), @startDist, @endDist) END ;
FUNCTION NTSWKTVariableBufferMid(@line GEOM, @startDist FLOAT64, @midDist FLOAT64) NVARCHAR AS WktVariableBufferMid(GeomWkb(@line), @startDist, @midDist) END ;
 
-- CGAlgorithmFunctions
FUNCTION NTSWKTOrientationIndex(@segment GEOM, @ptGeom GEOM) NVARCHAR AS WktOrientationIndex(GeomWkb(@segment), GeomWkb(@ptGeom)) END ;
FUNCTION NTSWKTOrientationIndexDd(@segment GEOM, @ptGeom GEOM) NVARCHAR AS WktOrientationIndexDd(GeomWkb(@segment), GeomWkb(@ptGeom)) END ;
FUNCTION NTSWKTSegmentIntersects(@g1 GEOM, @g2 GEOM) NVARCHAR AS WktSegmentIntersects(GeomWkb(@g1), GeomWkb(@g2)) END ;
FUNCTION NTSWKTSegmentIntersection(@g1 GEOM, @g2 GEOM) NVARCHAR AS WktSegmentIntersection(GeomWkb(@g1), GeomWkb(@g2)) END ;
FUNCTION NTSWKTSegmentIntersectionDd(@g1 GEOM, @g2 GEOM) NVARCHAR AS WktSegmentIntersectionDd(GeomWkb(@g1), GeomWkb(@g2)) END ;
 
-- ConstructionFunctions
FUNCTION NTSWKTOctagonalEnvelope(@geom GEOM) NVARCHAR AS WktOctagonalEnvelope(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMinimumDiameter(@geom GEOM) NVARCHAR AS WktMinimumDiameter(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMinimumDiameterLength(@geom GEOM) NVARCHAR AS WktMinimumDiameterLength(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMinimumRectangle(@geom GEOM) NVARCHAR AS WktMinimumRectangle(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMinimumBoundingCircle(@geom GEOM) NVARCHAR AS WktMinimumBoundingCircle(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMinimumBoundingCircleDiameterLength(@geom GEOM) NVARCHAR AS WktMinimumBoundingCircleDiameterLength(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMaximumDiameter(@geom GEOM) NVARCHAR AS WktMaximumDiameter(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMaximumDiameterLength(@geom GEOM) NVARCHAR AS WktMaximumDiameterLength(GeomWkb(@geom)) END ;
FUNCTION NTSWKTBoundary(@geom GEOM) NVARCHAR AS WktBoundary(GeomWkb(@geom)) END ;
FUNCTION NTSWKTConvexHull(@geom GEOM) NVARCHAR AS WktConvexHull(GeomWkb(@geom)) END ;
FUNCTION NTSWKTCentroid(@geom GEOM) NVARCHAR AS WktCentroid(GeomWkb(@geom)) END ;
FUNCTION NTSWKTInteriorPoint(@geom GEOM) NVARCHAR AS WktInteriorPoint(GeomWkb(@geom)) END ;
FUNCTION NTSWKTDensify(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktDensify(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTExtractLines(@geom GEOM) NVARCHAR AS WktExtractLines(GeomWkb(@geom)) END ;
 
-- ConversionFunctions
FUNCTION NTSWKTPointsToLine(@geom GEOM) NVARCHAR AS WktPointsToLine(GeomWkb(@geom)) END ;
FUNCTION NTSWKTLineToPolygon(@geom GEOM) NVARCHAR AS WktLineToPolygon(GeomWkb(@geom)) END ;
FUNCTION NTSWKTToPoints(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktToPoints(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTToLines(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktToLines(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTToGeometryCollection(@geom GEOM, @geom2 GEOM) NVARCHAR AS WktToGeometryCollection(GeomWkb(@geom), GeomWkb(@geom2)) END ;
 
-- CreateRandomGeometryFunctions
FUNCTION NTSWKTRandomPointsInGrid(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomPointsInGrid(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTRandomPoints(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTRandomRadialPoints(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomRadialPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTHaltonPoints(@geom GEOM, @nPts INT32) NVARCHAR AS WktHaltonPoints(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTHaltonPoints57(@geom GEOM, @nPts INT32) NVARCHAR AS WktHaltonPoints57(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTHaltonPointsWithBases(@geom GEOM, @nPts INT32, @basei INT32, @basej INT32) NVARCHAR AS WktHaltonPointsWithBases(GeomWkb(@geom), @nPts, @basei, @basej) END ;
FUNCTION NTSWKTRandomSegments(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomSegments(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTRandomSegmentsInGrid(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomSegmentsInGrid(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTRandomLineString(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomLineString(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTRandomRectilinearWalk(@geom GEOM, @nPts INT32) NVARCHAR AS WktRandomRectilinearWalk(GeomWkb(@geom), @nPts) END ;
 
-- CreateShapeFunctions
FUNCTION NTSWKTGrid(@geom GEOM, @nCells INT32) NVARCHAR AS WktGrid(GeomWkb(@geom), @nCells) END ;
FUNCTION NTSWKTGridPoints(@geom GEOM, @nCells INT32) NVARCHAR AS WktGridPoints(GeomWkb(@geom), @nCells) END ;
FUNCTION NTSWKTSupercircle3(@geom GEOM, @nPts INT32) NVARCHAR AS WktSupercircle3(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTSquircle(@geom GEOM, @nPts INT32) NVARCHAR AS WktSquircle(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTSupercircle5(@geom GEOM, @nPts INT32) NVARCHAR AS WktSupercircle5(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTSupercirclePoint5(@geom GEOM, @nPts INT32) NVARCHAR AS WktSupercirclePoint5(GeomWkb(@geom), @nPts) END ;
FUNCTION NTSWKTSupercircle(@geom GEOM, @nPts INT32, @pow FLOAT64) NVARCHAR AS WktSupercircle(GeomWkb(@geom), @nPts, @pow) END ;
FUNCTION NTSWKTPointFieldCentroidStar(@ptsGeom GEOM) NVARCHAR AS WktPointFieldCentroidStar(GeomWkb(@ptsGeom)) END ;
FUNCTION NTSWKTPointFieldStar(@ptsGeom GEOM, @centrePt GEOM) NVARCHAR AS WktPointFieldStar(GeomWkb(@ptsGeom), GeomWkb(@centrePt)) END ;
 
-- DiffFunctions
FUNCTION NTSWKTDiffVerticesBoth(@a GEOM, @b GEOM) NVARCHAR AS WktDiffVerticesBoth(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiffVertices(@a GEOM, @b GEOM) NVARCHAR AS WktDiffVertices(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiffSegments(@a GEOM, @b GEOM) NVARCHAR AS WktDiffSegments(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiffSegmentsBoth(@a GEOM, @b GEOM) NVARCHAR AS WktDiffSegmentsBoth(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDuplicateSegments(@a GEOM) NVARCHAR AS WktDuplicateSegments(GeomWkb(@a)) END ;
FUNCTION NTSWKTSingleSegments(@a GEOM) NVARCHAR AS WktSingleSegments(GeomWkb(@a)) END ;
 
-- DissolveFunctions
FUNCTION NTSWKTDissolve(@geom GEOM) NVARCHAR AS WktDissolve(GeomWkb(@geom)) END ;
 
-- DistanceFunctions
FUNCTION NTSWKTDistance(@a GEOM, @b GEOM) NVARCHAR AS WktDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTIsWithinDistance(@a GEOM, @b GEOM, @dist FLOAT64) NVARCHAR AS WktIsWithinDistance(GeomWkb(@a), GeomWkb(@b), @dist) END ;
FUNCTION NTSWKTNearestPoints(@a GEOM, @b GEOM) NVARCHAR AS WktNearestPoints(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM) NVARCHAR AS WktDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDensifiedDiscreteHausdorffDistanceLine(@a GEOM, @b GEOM, @frac FLOAT64) NVARCHAR AS WktDensifiedDiscreteHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b), @frac) END ;
FUNCTION NTSWKTDiscreteOrientedHausdorffDistanceLine(@a GEOM, @b GEOM) NVARCHAR AS WktDiscreteOrientedHausdorffDistanceLine(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiscreteHausdorffDistance(@a GEOM, @b GEOM) NVARCHAR AS WktDiscreteHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDiscreteOrientedHausdorffDistance(@a GEOM, @b GEOM) NVARCHAR AS WktDiscreteOrientedHausdorffDistance(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDistanceIndexed(@a GEOM, @b GEOM) NVARCHAR AS WktDistanceIndexed(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTNearestPointsIndexed(@a GEOM, @b GEOM) NVARCHAR AS WktNearestPointsIndexed(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTNearestPointsIndexedAll(@a GEOM, @b GEOM) NVARCHAR AS WktNearestPointsIndexedAll(GeomWkb(@a), GeomWkb(@b)) END ;
 
-- EditFunctions
FUNCTION NTSWKTAddHole(@polyGeom GEOM, @hole GEOM) NVARCHAR AS WktAddHole(GeomWkb(@polyGeom), GeomWkb(@hole)) END ;
 
-- GeometryFunctions
FUNCTION NTSWKTLength(@geom GEOM) NVARCHAR AS WktLength(GeomWkb(@geom)) END ;
FUNCTION NTSWKTArea(@geom GEOM) NVARCHAR AS WktArea(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsCCW(@geom GEOM) NVARCHAR AS WktIsCCW(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsSimple(@geom GEOM) NVARCHAR AS WktIsSimple(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsValid(@geom GEOM) NVARCHAR AS WktIsValid(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsRectangle(@geom GEOM) NVARCHAR AS WktIsRectangle(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsClosed(@geom GEOM) NVARCHAR AS WktIsClosed(GeomWkb(@geom)) END ;
FUNCTION NTSWKTEnvelope(@geom GEOM) NVARCHAR AS WktEnvelope(GeomWkb(@geom)) END ;
FUNCTION NTSWKTReverse(@geom GEOM) NVARCHAR AS WktReverse(GeomWkb(@geom)) END ;
FUNCTION NTSWKTNormalize(@geom GEOM) NVARCHAR AS WktNormalize(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSnap(@geom GEOM, @geom2 GEOM, @distance FLOAT64) NVARCHAR AS WktSnap(GeomWkb(@geom), GeomWkb(@geom2), @distance) END ;
FUNCTION NTSWKTGetGeometryN(@geom GEOM, @i INT32) NVARCHAR AS WktGetGeometryN(GeomWkb(@geom), @i) END ;
FUNCTION NTSWKTGetPolygonShell(@geom GEOM) NVARCHAR AS WktGetPolygonShell(GeomWkb(@geom)) END ;
FUNCTION NTSWKTGetPolygonHoles(@geom GEOM) NVARCHAR AS WktGetPolygonHoles(GeomWkb(@geom)) END ;
FUNCTION NTSWKTGetPolygonHoleN(@geom GEOM, @i INT32) NVARCHAR AS WktGetPolygonHoleN(GeomWkb(@geom), @i) END ;
FUNCTION NTSWKTGetCoordinates(@geom GEOM) NVARCHAR AS WktGetCoordinates(GeomWkb(@geom)) END ;
 
-- LinearReferencingFunctions
FUNCTION NTSWKTExtractPoint(@geom GEOM, @index FLOAT64) NVARCHAR AS WktExtractPoint(GeomWkb(@geom), @index) END ;
FUNCTION NTSWKTExtractLine(@geom GEOM, @start FLOAT64, @end FLOAT64) NVARCHAR AS WktExtractLine(GeomWkb(@geom), @start, @end) END ;
FUNCTION NTSWKTExtractLineByGeom(@geom GEOM, @geom2 GEOM) NVARCHAR AS WktExtractLineByGeom(GeomWkb(@geom), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTExtractLineByGeomBounds(@geom GEOM, @geom2 GEOM, @b1 FLOAT64, @b2 FLOAT64) NVARCHAR AS WktExtractLineByGeomBounds(GeomWkb(@geom), GeomWkb(@geom2), @b1, @b2) END ;
FUNCTION NTSWKTProject(@geom GEOM, @geom2 GEOM) NVARCHAR AS WktProject(GeomWkb(@geom), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTProjectIndex(@geom GEOM, @geom2 GEOM) NVARCHAR AS WktProjectIndex(GeomWkb(@geom), GeomWkb(@geom2)) END ;
 
-- LineHandlingFunctions
FUNCTION NTSWKTMergeLines(@geom GEOM) NVARCHAR AS WktMergeLines(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSequenceLines(@geom GEOM) NVARCHAR AS WktSequenceLines(GeomWkb(@geom)) END ;
FUNCTION NTSWKTExtractLines(@geom GEOM) NVARCHAR AS WktExtractLines(GeomWkb(@geom)) END ;
FUNCTION NTSWKTExtractSegments(@geom GEOM) NVARCHAR AS WktExtractSegments(GeomWkb(@geom)) END ;
FUNCTION NTSWKTExtractChains(@geom GEOM, @maxChainSize INT32) NVARCHAR AS WktExtractChains(GeomWkb(@geom), @maxChainSize) END ;
FUNCTION NTSWKTDissolve(@geom GEOM) NVARCHAR AS WktDissolve(GeomWkb(@geom)) END ;
 
-- LineSegmentFunctions
FUNCTION NTSWKTSegmentIntersects(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktSegmentIntersects(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTSegmentIntersection(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktSegmentIntersection(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTSegmentIntersectionDd(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktSegmentIntersectionDd(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTLineIntersection(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktLineIntersection(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTLineIntersectionDD(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktLineIntersectionDD(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
FUNCTION NTSWKTReflectPoint(@geom1 GEOM, @geom2 GEOM) NVARCHAR AS WktReflectPoint(GeomWkb(@geom1), GeomWkb(@geom2)) END ;
 
-- NodingFunctions
FUNCTION NTSWKTIsNodingValid(@geom GEOM) NVARCHAR AS WktIsNodingValid(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIsSegmentNodingValid(@geom GEOM) NVARCHAR AS WktIsSegmentNodingValid(GeomWkb(@geom)) END ;
FUNCTION NTSWKTFindOneNode(@geom GEOM) NVARCHAR AS WktFindOneNode(GeomWkb(@geom)) END ;
FUNCTION NTSWKTFindNodes(@geom GEOM) NVARCHAR AS WktFindNodes(GeomWkb(@geom)) END ;
FUNCTION NTSWKTFindInteriorNodes(@geom GEOM) NVARCHAR AS WktFindInteriorNodes(GeomWkb(@geom)) END ;
FUNCTION NTSWKTIntersectionCount(@geom GEOM) NVARCHAR AS WktIntersectionCount(GeomWkb(@geom)) END ;
FUNCTION NTSWKTInteriorIntersectionCount(@geom GEOM) NVARCHAR AS WktInteriorIntersectionCount(GeomWkb(@geom)) END ;
FUNCTION NTSWKTMCIndexNodingWithPrecision(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS WktMCIndexNodingWithPrecision(GeomWkb(@geom), @scaleFactor) END ;
FUNCTION NTSWKTMCIndexNoding(@geom GEOM) NVARCHAR AS WktMCIndexNoding(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSnapRoundWithPrecision(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS WktSnapRoundWithPrecision(GeomWkb(@geom), @scaleFactor) END ;
FUNCTION NTSWKTScaledNoding(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS WktScaledNoding(GeomWkb(@geom), @scaleFactor) END ;
 
-- NTSFunctions
FUNCTION NTSWKTLogoLines(@geom GEOM) NVARCHAR AS WktLogoLines(GeomWkb(@geom)) END ;
FUNCTION NTSWKTLogoBuffer(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktLogoBuffer(GeomWkb(@geom), @distance) END ;
 
-- OverlayFunctions
FUNCTION NTSWKTIntersection(@a GEOM, @b GEOM) NVARCHAR AS WktIntersection(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTUnion(@a GEOM, @b GEOM) NVARCHAR AS WktUnion(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTSymDifference(@a GEOM, @b GEOM) NVARCHAR AS WktSymDifference(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDifference(@a GEOM, @b GEOM) NVARCHAR AS WktDifference(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTDifferenceBa(@a GEOM, @b GEOM) NVARCHAR AS WktDifferenceBa(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTUnaryUnion(@a GEOM) NVARCHAR AS WktUnaryUnion(GeomWkb(@a)) END ;
FUNCTION NTSWKTUnionUsingGeometryCollection(@a GEOM, @b GEOM) NVARCHAR AS WktUnionUsingGeometryCollection(GeomWkb(@a), GeomWkb(@b)) END ;
FUNCTION NTSWKTClip(@a GEOM, @mask GEOM) NVARCHAR AS WktClip(GeomWkb(@a), GeomWkb(@mask)) END ;
 
-- PolygonizeFunctions
FUNCTION NTSWKTPolygonize(@geom GEOM) NVARCHAR AS WktPolygonize(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPolygonizeValidPolygonal(@geom GEOM) NVARCHAR AS WktPolygonizeValidPolygonal(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPolygonizeDangles(@geom GEOM) NVARCHAR AS WktPolygonizeDangles(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPolygonizeCutEdges(@geom GEOM) NVARCHAR AS WktPolygonizeCutEdges(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPolygonizeInvalidRingLines(@geom GEOM) NVARCHAR AS WktPolygonizeInvalidRingLines(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPolygonizeAllErrors(@geom GEOM) NVARCHAR AS WktPolygonizeAllErrors(GeomWkb(@geom)) END ;
 
-- PrecisionFunctions
FUNCTION NTSWKTReducePrecisionPointwise(@geom GEOM, @scaleFactor FLOAT64) NVARCHAR AS WktReducePrecisionPointwise(GeomWkb(@geom), @scaleFactor) END ;
 
-- SelectionFunctions
FUNCTION NTSWKTIntersects(@a GEOM, @mask GEOM) NVARCHAR AS WktIntersects(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTCovers(@a GEOM, @mask GEOM) NVARCHAR AS WktCovers(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTCoveredBy(@a GEOM, @mask GEOM) NVARCHAR AS WktCoveredBy(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTDisjoint(@a GEOM, @mask GEOM) NVARCHAR AS WktDisjoint(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTValid(@a GEOM) NVARCHAR AS WktValid(GeomWkb(@a)) END ;
FUNCTION NTSWKTInvalid(@a GEOM) NVARCHAR AS WktInvalid(GeomWkb(@a)) END ;
FUNCTION NTSWKTAreaGreater(@a GEOM, @minArea FLOAT64) NVARCHAR AS WktAreaGreater(GeomWkb(@a), @minArea) END ;
FUNCTION NTSWKTAreaZero(@a GEOM) NVARCHAR AS WktAreaZero(GeomWkb(@a)) END ;
FUNCTION NTSWKTWithin(@a GEOM, @mask GEOM) NVARCHAR AS WktWithin(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTInteriorPointWithin(@a GEOM, @mask GEOM) NVARCHAR AS WktInteriorPointWithin(GeomWkb(@a), GeomWkb(@mask)) END ;
FUNCTION NTSWKTwithinDistance(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) NVARCHAR AS WktwithinDistance(GeomWkb(@a), GeomWkb(@mask), @maximumDistance) END ;
FUNCTION NTSWKTwithinDistanceIndexed(@a GEOM, @mask GEOM, @maximumDistance FLOAT64) NVARCHAR AS WktwithinDistanceIndexed(GeomWkb(@a), GeomWkb(@mask), @maximumDistance) END ;
FUNCTION NTSWKTFirstNComponents(@geom GEOM, @n INT32) NVARCHAR AS WktFirstNComponents(GeomWkb(@geom), @n) END ;
 
-- SimplificationFunctions
FUNCTION NTSWKTSimplifyDp(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktSimplifyDp(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTSimplifyTp(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktSimplifyTp(GeomWkb(@geom), @distance) END ;
FUNCTION NTSWKTSimplifyVW(@geom GEOM, @distance FLOAT64) NVARCHAR AS WktSimplifyVW(GeomWkb(@geom), @distance) END ;
 
-- SortingFunctions
FUNCTION NTSWKTSortByLength(@geom GEOM) NVARCHAR AS WktSortByLength(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSortByArea(@geom GEOM) NVARCHAR AS WktSortByArea(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSortByHilbertCode(@geom GEOM) NVARCHAR AS WktSortByHilbertCode(GeomWkb(@geom)) END ;
FUNCTION NTSWKTSortByMortonCode(@geom GEOM) NVARCHAR AS WktSortByMortonCode(GeomWkb(@geom)) END ;
 
-- SpatialIndexFunctions
FUNCTION NTSWKTKdTreeQuery(@pts GEOM, @query GEOM, @tolerance FLOAT64) NVARCHAR AS WktKdTreeQuery(GeomWkb(@pts), GeomWkb(@query), @tolerance) END ;
FUNCTION NTSWKTKdTreeQueryRepeated(@pts GEOM, @queryEnv GEOM, @tolerance FLOAT64) NVARCHAR AS WktKdTreeQueryRepeated(GeomWkb(@pts), GeomWkb(@queryEnv), @tolerance) END ;
FUNCTION NTSWKTSTRtreeBounds(@geoms GEOM) NVARCHAR AS WktSTRtreeBounds(GeomWkb(@geoms)) END ;
FUNCTION NTSWKTSTRtreeQuery(@geoms GEOM, @queryEnv GEOM) NVARCHAR AS WktSTRtreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv)) END ;
FUNCTION NTSWKTStrTreeNN(@geoms GEOM, @geom GEOM) NVARCHAR AS WktStrTreeNN(GeomWkb(@geoms), GeomWkb(@geom)) END ;
FUNCTION NTSWKTStrTreeNNInSet(@geoms GEOM) NVARCHAR AS WktStrTreeNNInSet(GeomWkb(@geoms)) END ;
FUNCTION NTSWKTStrTreeNNk(@geoms GEOM, @geom GEOM, @k INT32) NVARCHAR AS WktStrTreeNNk(GeomWkb(@geoms), GeomWkb(@geom), @k) END ;
FUNCTION NTSWKTQuadTreeQuery(@geoms GEOM, @queryEnv GEOM) NVARCHAR AS WktQuadTreeQuery(GeomWkb(@geoms), GeomWkb(@queryEnv)) END ;
FUNCTION NTSWKTMonotoneChains(@geom GEOM) NVARCHAR AS WktMonotoneChains(GeomWkb(@geom)) END ;
 
-- TriangleFunctions
FUNCTION NTSWKTCentroid(@geom GEOM) NVARCHAR AS WktCentroid(GeomWkb(@geom)) END ;
FUNCTION NTSWKTCircumcentre(@geom GEOM) NVARCHAR AS WktCircumcentre(GeomWkb(@geom)) END ;
FUNCTION NTSWKTCircumcentreDD(@geom GEOM) NVARCHAR AS WktCircumcentreDD(GeomWkb(@geom)) END ;
FUNCTION NTSWKTPerpendicularBisectors(@geom GEOM) NVARCHAR AS WktPerpendicularBisectors(GeomWkb(@geom)) END ;
FUNCTION NTSWKTInCentre(@geom GEOM) NVARCHAR AS WktInCentre(GeomWkb(@geom)) END ;
FUNCTION NTSWKTAngleBisectors(@geom GEOM) NVARCHAR AS WktAngleBisectors(GeomWkb(@geom)) END ;
 
-- ValidationFunctions
FUNCTION NTSWKTInvalidLocations(@geom GEOM) NVARCHAR AS WktInvalidLocations(GeomWkb(@geom)) END ;
FUNCTION NTSWKTInvalidGeoms(@geom GEOM) NVARCHAR AS WktInvalidGeoms(GeomWkb(@geom)) END ;