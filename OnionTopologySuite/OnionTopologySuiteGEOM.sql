-- $manifold$
-- $include$ [OnionTopologySuiteWKB]


 
-- WKBAffineTransformationFunctions
FUNCTION NTSTransformByVectors(@wKBGeom GEOM, @wKBcontrol GEOM) GEOM AS BinaryWkbGeom(WKBTransformByVectors(GeomWkb(@wKBGeom), GeomWkb(@wKBcontrol))) END ;
FUNCTION NTSTransformByBaseline(@wKBGeom GEOM, @wKBdestBaseline GEOM) GEOM AS BinaryWkbGeom(WKBTransformByBaseline(GeomWkb(@wKBGeom), GeomWkb(@wKBdestBaseline))) END ;
FUNCTION NTSScale(@wKBGeom GEOM, @scale FLOAT64) GEOM AS BinaryWkbGeom(WKBScale(GeomWkb(@wKBGeom), @scale)) END ;
FUNCTION NTSReflectInX(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBReflectInX(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSReflectInY(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBReflectInY(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSRotate(@wKBGeom GEOM, @multipleOfPi FLOAT64) GEOM AS BinaryWkbGeom(WKBRotate(GeomWkb(@wKBGeom), @multipleOfPi)) END ;
FUNCTION NTSTranslateCentreToOrigin(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBTranslateCentreToOrigin(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSTranslateToOrigin(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBTranslateToOrigin(GeomWkb(@wKBGeom))) END ;
 
-- WKBBoundaryFunctions
FUNCTION NTSBoundary(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBboundary(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSBoundaryMod2(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBboundaryMod2(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSBoundaryEndpoint(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBboundaryEndpoint(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSBoundaryMonoValentEnd(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBboundaryMonoValentEnd(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSBoundaryMultiValentEnd(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBboundaryMultiValentEnd(GeomWkb(@wKBGeom))) END ;
 
-- WKBBufferByUnionFunctions
FUNCTION NTSComponentBuffers(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBComponentBuffers(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferByComponents(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferByComponents(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferBySegments(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferBySegments(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferByChains(@wKBGeom GEOM, @distance FLOAT64, @maxChainSize INT32) GEOM AS BinaryWkbGeom(WKBBufferByChains(GeomWkb(@wKBGeom), @distance, @maxChainSize)) END ;
 
-- WKBBufferFunctions
FUNCTION NTSBuffer(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBuffer(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferWithParams(@wKBGeom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferWithParams(GeomWkb(@wKBGeom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)) END ;
FUNCTION NTSBufferWithSimplify(@wKBGeom GEOM, @distance FLOAT64, @simplifyFactor FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferWithSimplify(GeomWkb(@wKBGeom), @distance, @simplifyFactor)) END ;
FUNCTION NTSBufferOffsetCurve(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferOffsetCurve(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferOffsetCurveWithParams(@wKBGeom GEOM, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferOffsetCurveWithParams(GeomWkb(@wKBGeom), @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)) END ;
FUNCTION NTSBufferLineSimplifier(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferLineSimplifier(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferValidated(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferValidated(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSBufferValidatedGeom(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferValidatedGeom(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSSingleSidedBufferCurve(@wKBgeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSingleSidedBufferCurve(GeomWkb(@wKBgeom), @distance)) END ;
FUNCTION NTSSingleSidedBuffer(@wKBgeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSingleSidedBuffer(GeomWkb(@wKBgeom), @distance)) END ;
FUNCTION NTSBufferEach(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBBufferEach(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSVariableBuffer(@wKBline GEOM, @startDist FLOAT64, @endDist FLOAT64) GEOM AS BinaryWkbGeom(WKBVariableBuffer(GeomWkb(@wKBline), @startDist, @endDist)) END ;
FUNCTION NTSVariableBufferMid(@wKBline GEOM, @startDist FLOAT64, @midDist FLOAT64) GEOM AS BinaryWkbGeom(WKBVariableBufferMid(GeomWkb(@wKBline), @startDist, @midDist)) END ;
 
-- WKBCGAlgorithmFunctions
FUNCTION NTSOrientationIndex(@wKBsegment GEOM, @wKBptGeom GEOM) INT32 AS WKBOrientationIndex(GeomWkb(@wKBsegment), GeomWkb(@wKBptGeom)) END ;
FUNCTION NTSOrientationIndexDd(@wKBsegment GEOM, @wKBptGeom GEOM) INT32 AS WKBOrientationIndexDd(GeomWkb(@wKBsegment), GeomWkb(@wKBptGeom)) END ;
FUNCTION NTSSegmentIntersects(@wKBg1 GEOM, @wKBg2 GEOM) BOOLEAN AS WKBSegmentIntersects(GeomWkb(@wKBg1), GeomWkb(@wKBg2)) END ;
FUNCTION NTSSegmentIntersection(@wKBg1 GEOM, @wKBg2 GEOM) GEOM AS BinaryWkbGeom(WKBSegmentIntersection(GeomWkb(@wKBg1), GeomWkb(@wKBg2))) END ;
FUNCTION NTSSegmentIntersectionDd(@wKBg1 GEOM, @wKBg2 GEOM) GEOM AS BinaryWkbGeom(WKBSegmentIntersectionDd(GeomWkb(@wKBg1), GeomWkb(@wKBg2))) END ;
 
-- WKBConstructionFunctions
FUNCTION NTSOctagonalEnvelope(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBOctagonalEnvelope(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSMinimumDiameter(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMinimumDiameter(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSMinimumDiameterLength(@wKBGeom GEOM) FLOAT64 AS WKBMinimumDiameterLength(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSMinimumRectangle(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMinimumRectangle(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSMinimumBoundingCircle(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMinimumBoundingCircle(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSMinimumBoundingCircleDiameterLength(@wKBGeom GEOM) FLOAT64 AS WKBMinimumBoundingCircleDiameterLength(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSMaximumDiameter(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMaximumDiameter(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSMaximumDiameterLength(@wKBGeom GEOM) FLOAT64 AS WKBMaximumDiameterLength(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSBoundary(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBBoundary(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSConvexHull(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBConvexHull(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSCentroid(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBCentroid(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSInteriorPoint(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBInteriorPoint(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSDensify(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBDensify(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSExtractLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBExtractLines(GeomWkb(@wKBGeom))) END ;
 
-- WKBConversionFunctions
FUNCTION NTSPointsToLine(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPointsToLine(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSLineToPolygon(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBLineToPolygon(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSToPoints(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBToPoints(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSToLines(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBToLines(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSToGeometryCollection(@wKBGeom GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBToGeometryCollection(GeomWkb(@wKBGeom), GeomWkb(@wKBGeom2))) END ;
 
-- WKBCreateRandomGeometryFunctions
FUNCTION NTSRandomPointsInGrid(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomPointsInGrid(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSRandomPoints(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomPoints(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSRandomRadialPoints(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomRadialPoints(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSHaltonPoints(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBHaltonPoints(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSHaltonPoints57(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBHaltonPoints57(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSHaltonPointsWithBases(@wKBGeom GEOM, @nPts INT32, @basei INT32, @basej INT32) GEOM AS BinaryWkbGeom(WKBHaltonPointsWithBases(GeomWkb(@wKBGeom), @nPts, @basei, @basej)) END ;
FUNCTION NTSRandomSegments(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomSegments(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSRandomSegmentsInGrid(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomSegmentsInGrid(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSRandomLineString(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomLineString(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSRandomRectilinearWalk(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBRandomRectilinearWalk(GeomWkb(@wKBGeom), @nPts)) END ;
 
-- WKBCreateShapeFunctions
FUNCTION NTSGrid(@wKBGeom GEOM, @nCells INT32) GEOM AS BinaryWkbGeom(WKBGrid(GeomWkb(@wKBGeom), @nCells)) END ;
FUNCTION NTSGridPoints(@wKBGeom GEOM, @nCells INT32) GEOM AS BinaryWkbGeom(WKBGridPoints(GeomWkb(@wKBGeom), @nCells)) END ;
FUNCTION NTSSupercircle3(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBSupercircle3(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSSquircle(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBSquircle(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSSupercircle5(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBSupercircle5(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSSupercirclePoint5(@wKBGeom GEOM, @nPts INT32) GEOM AS BinaryWkbGeom(WKBSupercirclePoint5(GeomWkb(@wKBGeom), @nPts)) END ;
FUNCTION NTSSupercircle(@wKBGeom GEOM, @nPts INT32, @pow FLOAT64) GEOM AS BinaryWkbGeom(WKBSupercircle(GeomWkb(@wKBGeom), @nPts, @pow)) END ;
FUNCTION NTSPointFieldCentroidStar(@wKBptsGeom GEOM) GEOM AS BinaryWkbGeom(WKBPointFieldCentroidStar(GeomWkb(@wKBptsGeom))) END ;
FUNCTION NTSPointFieldStar(@wKBptsGeom GEOM, @wKBcentrePt GEOM) GEOM AS BinaryWkbGeom(WKBPointFieldStar(GeomWkb(@wKBptsGeom), GeomWkb(@wKBcentrePt))) END ;
 
-- WKBDiffFunctions
FUNCTION NTSDiffVerticesBoth(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiffVerticesBoth(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDiffVertices(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiffVertices(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDiffSegments(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiffSegments(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDiffSegmentsBoth(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiffSegmentsBoth(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDuplicateSegments(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBDuplicateSegments(GeomWkb(@wKBa))) END ;
FUNCTION NTSSingleSegments(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBSingleSegments(GeomWkb(@wKBa))) END ;
 
-- WKBDissolveFunctions
FUNCTION NTSDissolve(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBDissolve(GeomWkb(@wKBGeom))) END ;
 
-- WKBDistanceFunctions
FUNCTION NTSDistance(@wKBa GEOM, @wKBb GEOM) FLOAT64 AS WKBDistance(GeomWkb(@wKBa), GeomWkb(@wKBb)) END ;
FUNCTION NTSIsWithinDistance(@wKBa GEOM, @wKBb GEOM, @dist FLOAT64) BOOLEAN AS WKBIsWithinDistance(GeomWkb(@wKBa), GeomWkb(@wKBb), @dist) END ;
FUNCTION NTSNearestPoints(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBNearestPoints(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDiscreteHausdorffDistanceLine(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiscreteHausdorffDistanceLine(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDensifiedDiscreteHausdorffDistanceLine(@wKBa GEOM, @wKBb GEOM, @frac FLOAT64) GEOM AS BinaryWkbGeom(WKBDensifiedDiscreteHausdorffDistanceLine(GeomWkb(@wKBa), GeomWkb(@wKBb), @frac)) END ;
FUNCTION NTSDiscreteOrientedHausdorffDistanceLine(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDiscreteOrientedHausdorffDistanceLine(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDiscreteHausdorffDistance(@wKBa GEOM, @wKBb GEOM) FLOAT64 AS WKBDiscreteHausdorffDistance(GeomWkb(@wKBa), GeomWkb(@wKBb)) END ;
FUNCTION NTSDiscreteOrientedHausdorffDistance(@wKBa GEOM, @wKBb GEOM) FLOAT64 AS WKBDiscreteOrientedHausdorffDistance(GeomWkb(@wKBa), GeomWkb(@wKBb)) END ;
FUNCTION NTSDistanceIndexed(@wKBa GEOM, @wKBb GEOM) FLOAT64 AS WKBDistanceIndexed(GeomWkb(@wKBa), GeomWkb(@wKBb)) END ;
FUNCTION NTSNearestPointsIndexed(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBNearestPointsIndexed(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSNearestPointsIndexedAll(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBNearestPointsIndexedAll(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
 
-- WKBEditFunctions
FUNCTION NTSAddHole(@wKBpolyGeom GEOM, @wKBhole GEOM) GEOM AS BinaryWkbGeom(WKBAddHole(GeomWkb(@wKBpolyGeom), GeomWkb(@wKBhole))) END ;
 
-- WKBGeometryFunctions
FUNCTION NTSLength(@wKBGeom GEOM) FLOAT64 AS WKBLength(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSArea(@wKBGeom GEOM) FLOAT64 AS WKBArea(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsCCW(@wKBGeom GEOM) BOOLEAN AS WKBIsCCW(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsSimple(@wKBGeom GEOM) BOOLEAN AS WKBIsSimple(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsValid(@wKBGeom GEOM) BOOLEAN AS WKBIsValid(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsRectangle(@wKBGeom GEOM) BOOLEAN AS WKBIsRectangle(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsClosed(@wKBGeom GEOM) BOOLEAN AS WKBIsClosed(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSEnvelope(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBEnvelope(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSReverse(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBReverse(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSNormalize(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBNormalize(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSnap(@wKBGeom GEOM, @wKBGeom2 GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSnap(GeomWkb(@wKBGeom), GeomWkb(@wKBGeom2), @distance)) END ;
FUNCTION NTSGetGeometryN(@wKBGeom GEOM, @i INT32) GEOM AS BinaryWkbGeom(WKBGetGeometryN(GeomWkb(@wKBGeom), @i)) END ;
FUNCTION NTSGetPolygonShell(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBGetPolygonShell(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSGetPolygonHoles(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBGetPolygonHoles(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSGetPolygonHoleN(@wKBGeom GEOM, @i INT32) GEOM AS BinaryWkbGeom(WKBGetPolygonHoleN(GeomWkb(@wKBGeom), @i)) END ;
FUNCTION NTSGetCoordinates(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBGetCoordinates(GeomWkb(@wKBGeom))) END ;
 
-- WKBLinearReferencingFunctions
FUNCTION NTSExtractPoint(@wKBGeom GEOM, @index FLOAT64) GEOM AS BinaryWkbGeom(WKBExtractPoint(GeomWkb(@wKBGeom), @index)) END ;
FUNCTION NTSExtractLine(@wKBGeom GEOM, @start FLOAT64, @end FLOAT64) GEOM AS BinaryWkbGeom(WKBExtractLine(GeomWkb(@wKBGeom), @start, @end)) END ;
FUNCTION NTSProject(@wKBGeom GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBProject(GeomWkb(@wKBGeom), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSProjectIndex(@wKBGeom GEOM, @wKBGeom2 GEOM) FLOAT64 AS WKBProjectIndex(GeomWkb(@wKBGeom), GeomWkb(@wKBGeom2)) END ;
 
-- WKBLineHandlingFunctions
FUNCTION NTSMergeLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMergeLines(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSequenceLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBSequenceLines(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSExtractLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBExtractLines(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSExtractSegments(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBExtractSegments(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSExtractChains(@wKBGeom GEOM, @maxChainSize INT32) GEOM AS BinaryWkbGeom(WKBExtractChains(GeomWkb(@wKBGeom), @maxChainSize)) END ;
FUNCTION NTSDissolve(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBDissolve(GeomWkb(@wKBGeom))) END ;
 
-- WKBLineSegmentFunctions
FUNCTION NTSSegmentIntersects(@wKBGeom1 GEOM, @wKBGeom2 GEOM) BOOLEAN AS WKBSegmentIntersects(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2)) END ;
FUNCTION NTSSegmentIntersection(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBSegmentIntersection(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSSegmentIntersectionDd(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBSegmentIntersectionDd(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSLineIntersection(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBLineIntersection(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSLineIntersectionDD(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBLineIntersectionDD(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
FUNCTION NTSReflectPoint(@wKBGeom1 GEOM, @wKBGeom2 GEOM) GEOM AS BinaryWkbGeom(WKBReflectPoint(GeomWkb(@wKBGeom1), GeomWkb(@wKBGeom2))) END ;
 
-- WKBNodingFunctions
FUNCTION NTSIsNodingValid(@wKBGeom GEOM) BOOLEAN AS WKBIsNodingValid(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSIsSegmentNodingValid(@wKBGeom GEOM) BOOLEAN AS WKBIsSegmentNodingValid(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSFindOneNode(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBFindOneNode(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSFindNodes(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBFindNodes(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSFindInteriorNodes(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBFindInteriorNodes(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSIntersectionCount(@wKBGeom GEOM) INT32 AS WKBIntersectionCount(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSInteriorIntersectionCount(@wKBGeom GEOM) INT32 AS WKBInteriorIntersectionCount(GeomWkb(@wKBGeom)) END ;
FUNCTION NTSMCIndexNodingWithPrecision(@wKBGeom GEOM, @scaleFactor FLOAT64) GEOM AS BinaryWkbGeom(WKBMCIndexNodingWithPrecision(GeomWkb(@wKBGeom), @scaleFactor)) END ;
FUNCTION NTSMCIndexNoding(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMCIndexNoding(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSnapRoundWithPrecision(@wKBGeom GEOM, @scaleFactor FLOAT64) GEOM AS BinaryWkbGeom(WKBSnapRoundWithPrecision(GeomWkb(@wKBGeom), @scaleFactor)) END ;
FUNCTION NTSScaledNoding(@wKBGeom GEOM, @scaleFactor FLOAT64) GEOM AS BinaryWkbGeom(WKBScaledNoding(GeomWkb(@wKBGeom), @scaleFactor)) END ;
 
-- WKBNTSFunctions
FUNCTION NTSLogoLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBLogoLines(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSLogoBuffer(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBLogoBuffer(GeomWkb(@wKBGeom), @distance)) END ;
 
-- WKBOverlayFunctions
FUNCTION NTSIntersection(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBIntersection(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSUnion(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBUnion(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSSymDifference(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBSymDifference(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDifference(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDifference(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSDifferenceBa(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBDifferenceBa(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSUnaryUnion(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBUnaryUnion(GeomWkb(@wKBa))) END ;
FUNCTION NTSUnionUsingGeometryCollection(@wKBa GEOM, @wKBb GEOM) GEOM AS BinaryWkbGeom(WKBUnionUsingGeometryCollection(GeomWkb(@wKBa), GeomWkb(@wKBb))) END ;
FUNCTION NTSClip(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBClip(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
 
-- WKBPolygonizeFunctions
FUNCTION NTSPolygonize(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonize(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPolygonizeValidPolygonal(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonizeValidPolygonal(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPolygonizeDangles(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonizeDangles(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPolygonizeCutEdges(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonizeCutEdges(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPolygonizeInvalidRingLines(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonizeInvalidRingLines(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPolygonizeAllErrors(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPolygonizeAllErrors(GeomWkb(@wKBGeom))) END ;
 
-- WKBPrecisionFunctions
FUNCTION NTSReducePrecisionPointwise(@wKBGeom GEOM, @scaleFactor FLOAT64) GEOM AS BinaryWkbGeom(WKBReducePrecisionPointwise(GeomWkb(@wKBGeom), @scaleFactor)) END ;
 
-- WKBSelectionFunctions
FUNCTION NTSIntersects(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBIntersects(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSCovers(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBCovers(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSCoveredBy(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBCoveredBy(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSDisjoint(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBDisjoint(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSValid(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBValid(GeomWkb(@wKBa))) END ;
FUNCTION NTSInvalid(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBInvalid(GeomWkb(@wKBa))) END ;
FUNCTION NTSAreaGreater(@wKBa GEOM, @minArea FLOAT64) GEOM AS BinaryWkbGeom(WKBAreaGreater(GeomWkb(@wKBa), @minArea)) END ;
FUNCTION NTSAreaZero(@wKBa GEOM) GEOM AS BinaryWkbGeom(WKBAreaZero(GeomWkb(@wKBa))) END ;
FUNCTION NTSWithin(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBWithin(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSInteriorPointWithin(@wKBa GEOM, @wKBmask GEOM) GEOM AS BinaryWkbGeom(WKBInteriorPointWithin(GeomWkb(@wKBa), GeomWkb(@wKBmask))) END ;
FUNCTION NTSwithinDistance(@wKBa GEOM, @wKBmask GEOM, @maximumDistance FLOAT64) GEOM AS BinaryWkbGeom(WKBwithinDistance(GeomWkb(@wKBa), GeomWkb(@wKBmask), @maximumDistance)) END ;
FUNCTION NTSwithinDistanceIndexed(@wKBa GEOM, @wKBmask GEOM, @maximumDistance FLOAT64) GEOM AS BinaryWkbGeom(WKBwithinDistanceIndexed(GeomWkb(@wKBa), GeomWkb(@wKBmask), @maximumDistance)) END ;
FUNCTION NTSFirstNComponents(@wKBGeom GEOM, @n INT32) GEOM AS BinaryWkbGeom(WKBFirstNComponents(GeomWkb(@wKBGeom), @n)) END ;
 
-- WKBSimplificationFunctions
FUNCTION NTSSimplifyDp(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSimplifyDp(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSSimplifyTp(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSimplifyTp(GeomWkb(@wKBGeom), @distance)) END ;
FUNCTION NTSSimplifyVW(@wKBGeom GEOM, @distance FLOAT64) GEOM AS BinaryWkbGeom(WKBSimplifyVW(GeomWkb(@wKBGeom), @distance)) END ;
 
-- WKBSortingFunctions
FUNCTION NTSSortByLength(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBSortByLength(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSortByArea(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBSortByArea(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSortByHilbertCode(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBSortByHilbertCode(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSSortByMortonCode(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBSortByMortonCode(GeomWkb(@wKBGeom))) END ;
 
-- WKBSpatialIndexFunctions
FUNCTION NTSKdTreeQuery(@wKBpts GEOM, @wKBquery GEOM, @tolerance FLOAT64) GEOM AS BinaryWkbGeom(WKBKdTreeQuery(GeomWkb(@wKBpts), GeomWkb(@wKBquery), @tolerance)) END ;
FUNCTION NTSKdTreeQueryRepeated(@wKBpts GEOM, @wKBqueryEnv GEOM, @tolerance FLOAT64) GEOM AS BinaryWkbGeom(WKBKdTreeQueryRepeated(GeomWkb(@wKBpts), GeomWkb(@wKBqueryEnv), @tolerance)) END ;
FUNCTION NTSSTRtreeBounds(@wKBGeoms GEOM) GEOM AS BinaryWkbGeom(WKBSTRtreeBounds(GeomWkb(@wKBGeoms))) END ;
FUNCTION NTSSTRtreeQuery(@wKBGeoms GEOM, @wKBqueryEnv GEOM) GEOM AS BinaryWkbGeom(WKBSTRtreeQuery(GeomWkb(@wKBGeoms), GeomWkb(@wKBqueryEnv))) END ;
FUNCTION NTSStrTreeNN(@wKBGeoms GEOM, @wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBStrTreeNN(GeomWkb(@wKBGeoms), GeomWkb(@wKBGeom))) END ;
FUNCTION NTSStrTreeNNInSet(@wKBGeoms GEOM) GEOM AS BinaryWkbGeom(WKBStrTreeNNInSet(GeomWkb(@wKBGeoms))) END ;
FUNCTION NTSStrTreeNNk(@wKBGeoms GEOM, @wKBGeom GEOM, @k INT32) GEOM AS BinaryWkbGeom(WKBStrTreeNNk(GeomWkb(@wKBGeoms), GeomWkb(@wKBGeom), @k)) END ;
FUNCTION NTSQuadTreeQuery(@wKBGeoms GEOM, @wKBqueryEnv GEOM) GEOM AS BinaryWkbGeom(WKBQuadTreeQuery(GeomWkb(@wKBGeoms), GeomWkb(@wKBqueryEnv))) END ;
FUNCTION NTSMonotoneChains(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBMonotoneChains(GeomWkb(@wKBGeom))) END ;
 
-- WKBTriangleFunctions
FUNCTION NTSCentroid(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBCentroid(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSCircumcentre(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBCircumcentre(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSCircumcentreDD(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBCircumcentreDD(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSPerpendicularBisectors(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBPerpendicularBisectors(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSInCentre(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBInCentre(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSAngleBisectors(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBAngleBisectors(GeomWkb(@wKBGeom))) END ;
 
-- WKBValidationFunctions
FUNCTION NTSInvalidLocations(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBInvalidLocations(GeomWkb(@wKBGeom))) END ;
FUNCTION NTSInvalidGeoms(@wKBGeom GEOM) GEOM AS BinaryWkbGeom(WKBInvalidGeoms(GeomWkb(@wKBGeom))) END ;