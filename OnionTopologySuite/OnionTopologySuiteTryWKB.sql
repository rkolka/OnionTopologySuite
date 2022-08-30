
-- WKBOffsetCurveFunctions
FUNCTION TryOffsetCurve(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOffsetCurveFunctions.TryOffsetCurve';
FUNCTION TryOffsetCurveWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOffsetCurveFunctions.TryOffsetCurveWithParams';

-- WKBBezierCurveFunctions
FUNCTION TryBezierCurveByAlpha(@wKBGeom VARBINARY, @alpha FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBezierCurveFunctions.TryBezierCurveByAlpha';
FUNCTION TryBezierCurveByAlphaAndSkew(@wKBGeom VARBINARY, @alpha FLOAT64, @skew FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBezierCurveFunctions.TryBezierCurveByAlphaAndSkew';
FUNCTION TryBezierCurveWithControlPoints(@wKBGeom VARBINARY, @controlPoints VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBezierCurveFunctions.TryBezierCurveWithControlPoints';
 
--FUNCTION TryBezierCurveWithControlPoints(@wKBGeom VARBINARY, @controlPoints VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBezierCurveFunctions.TryBezierCurveWithControlPoints';
 

-- WKBHullFunctions
FUNCTION TryConcaveHullByLength(@wKBGeom VARBINARY, @maxLength FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryHullFunctions.TryConcaveHullByLength';
FUNCTION TryConcaveHullByLengthRatio(@wKBGeom VARBINARY, @lengthRatio FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryHullFunctions.TryConcaveHullByLengthRatio';
FUNCTION TryPolygonHull(@wKBGeom VARBINARY, @isOuter BOOLEAN, @vertexNumFraction FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryHullFunctions.TryPolygonHull';
FUNCTION TryPolygonHullByAreaDelta(@wKBGeom VARBINARY, @isOuter BOOLEAN, @areaDeltaRatio FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryHullFunctions.TryPolygonHullByAreaDelta';
 
-- WKBAffineTransformationFunctions
FUNCTION TryTransformByVectors(@wKBGeom VARBINARY, @wKBcontrol VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryTransformByVectors';
FUNCTION TryTransformByBaseline(@wKBGeom VARBINARY, @wKBdestBaseline VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryTransformByBaseline';
FUNCTION TryScale(@wKBGeom VARBINARY, @scale FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryScale';
FUNCTION TryReflectInX(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryReflectInX';
FUNCTION TryReflectInY(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryReflectInY';
FUNCTION TryRotate(@wKBGeom VARBINARY, @multipleOfPi FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryRotate';
FUNCTION TryTranslateCentreToOrigin(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryTranslateCentreToOrigin';
FUNCTION TryTranslateToOrigin(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryAffineTransformationFunctions.TryTranslateToOrigin';
  
-- WKBBoundaryFunctions
FUNCTION Tryboundary(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBoundaryFunctions.Tryboundary';
FUNCTION TryboundaryMod2(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBoundaryFunctions.TryboundaryMod2';
FUNCTION TryboundaryEndpoint(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBoundaryFunctions.TryboundaryEndpoint';
FUNCTION TryboundaryMonoValentEnd(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBoundaryFunctions.TryboundaryMonoValentEnd';
FUNCTION TryboundaryMultiValentEnd(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBoundaryFunctions.TryboundaryMultiValentEnd';
  
-- WKBBufferByUnionFunctions
FUNCTION TryComponentBuffers(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferByUnionFunctions.TryComponentBuffers';
FUNCTION TryBufferByComponents(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferByUnionFunctions.TryBufferByComponents';
FUNCTION TryBufferBySegments(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferByUnionFunctions.TryBufferBySegments';
FUNCTION TryBufferByChains(@wKBGeom VARBINARY, @distance FLOAT64, @maxChainSize INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferByUnionFunctions.TryBufferByChains';
  
-- WKBBufferFunctions
FUNCTION TryBuffer(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBuffer';
FUNCTION TryBufferWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferWithParams';
FUNCTION TryBufferWithSimplify(@wKBGeom VARBINARY, @distance FLOAT64, @simplifyFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferWithSimplify';
FUNCTION TryBufferOffsetCurve(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferOffsetCurve';
FUNCTION TryBufferOffsetCurveWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferOffsetCurveWithParams';
FUNCTION TryBufferLineSimplifier(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferLineSimplifier';
FUNCTION TryBufferValidated(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferValidated';
FUNCTION TryBufferValidatedGeom(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferValidatedGeom';
FUNCTION TrySingleSidedBufferCurve(@wKBgeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TrySingleSidedBufferCurve';
FUNCTION TrySingleSidedBuffer(@wKBgeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TrySingleSidedBuffer';
FUNCTION TryBufferEach(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryBufferEach';
FUNCTION TryVariableBuffer(@wKBline VARBINARY, @startDist FLOAT64, @endDist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryVariableBuffer';
FUNCTION TryVariableBufferMid(@wKBline VARBINARY, @startDist FLOAT64, @midDist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryBufferFunctions.TryVariableBufferMid';
  
-- WKBCGAlgorithmFunctions
FUNCTION TryOrientationIndex(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCGAlgorithmFunctions.TryOrientationIndex';
FUNCTION TryOrientationIndexDd(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCGAlgorithmFunctions.TryOrientationIndexDd';

-- WKBConstructionFunctions
FUNCTION TryCentroid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryCentroid';
FUNCTION TryOctagonalEnvelope(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryOctagonalEnvelope';
FUNCTION TryMinimumDiameter(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMinimumDiameter';
FUNCTION TryMinimumDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMinimumDiameterLength';
FUNCTION TryMinimumRectangle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMinimumRectangle';
FUNCTION TryMinimumBoundingCircle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMinimumBoundingCircle';
FUNCTION TryMinimumBoundingCircleDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMinimumBoundingCircleDiameterLength';
FUNCTION TryMaximumDiameter(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMaximumDiameter';
FUNCTION TryMaximumDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryMaximumDiameterLength';
FUNCTION TryConvexHull(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryConvexHull';
FUNCTION TryInteriorPoint(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryInteriorPoint';
FUNCTION TryDensify(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConstructionFunctions.TryDensify';
  
-- WKBConversionFunctions
FUNCTION TryPointsToLine(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConversionFunctions.TryPointsToLine';
FUNCTION TryLineToPolygon(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConversionFunctions.TryLineToPolygon';
FUNCTION TryToPoints(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConversionFunctions.TryToPoints';
FUNCTION TryToLines(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConversionFunctions.TryToLines';
FUNCTION TryToGeometryCollection(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryConversionFunctions.TryToGeometryCollection';
  
-- WKBCreateRandomGeometryFunctions
FUNCTION TryRandomPointsInGrid(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomPointsInGrid';
FUNCTION TryRandomPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomPoints';
FUNCTION TryRandomRadialPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomRadialPoints';
FUNCTION TryHaltonPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryHaltonPoints';
FUNCTION TryHaltonPoints57(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryHaltonPoints57';
FUNCTION TryHaltonPointsWithBases(@wKBGeom VARBINARY, @nPts INT32, @basei INT32, @basej INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryHaltonPointsWithBases';
FUNCTION TryRandomSegments(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomSegments';
FUNCTION TryRandomSegmentsInGrid(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomSegmentsInGrid';
FUNCTION TryRandomLineString(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomLineString';
FUNCTION TryRandomRectilinearWalk(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateRandomGeometryFunctions.TryRandomRectilinearWalk';
  
-- WKBCreateShapeFunctions
FUNCTION TryGrid(@wKBGeom VARBINARY, @nCells INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TryGrid';
FUNCTION TryGridPoints(@wKBGeom VARBINARY, @nCells INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TryGridPoints';
FUNCTION TrySupercircle3(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TrySupercircle3';
FUNCTION TrySquircle(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TrySquircle';
FUNCTION TrySupercircle5(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TrySupercircle5';
FUNCTION TrySupercirclePoint5(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TrySupercirclePoint5';
FUNCTION TrySupercircle(@wKBGeom VARBINARY, @nPts INT32, @pow FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TrySupercircle';
FUNCTION TryPointFieldCentroidStar(@wKBptsGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TryPointFieldCentroidStar';
FUNCTION TryPointFieldStar(@wKBptsGeom VARBINARY, @wKBcentrePt VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryCreateShapeFunctions.TryPointFieldStar';
  
-- WKBDiffFunctions
FUNCTION TryDiffVerticesBoth(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.TryDiffVerticesBoth';
FUNCTION TryDiffVertices(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.DiffVertices';
FUNCTION TryDiffSegments(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.TryDiffSegments';
FUNCTION TryDiffSegmentsBoth(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.TryDiffSegmentsBoth';
FUNCTION TryDuplicateSegments(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.TryDuplicateSegments';
FUNCTION TrySingleSegments(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDiffFunctions.TrySingleSegments';
  
-- WKBDistanceFunctions
FUNCTION TryDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDistance';
FUNCTION TryIsWithinDistance(@wKBa VARBINARY, @wKBb VARBINARY, @dist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryIsWithinDistance';
FUNCTION TryNearestPoints(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryNearestPoints';
FUNCTION TryDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDiscreteHausdorffDistanceLine';
FUNCTION TryDensifiedDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY, @frac FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDensifiedDiscreteHausdorffDistanceLine';
FUNCTION TryDiscreteOrientedHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDiscreteOrientedHausdorffDistanceLine';
FUNCTION TryDiscreteHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDiscreteHausdorffDistance';
FUNCTION TryDiscreteOrientedHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDiscreteOrientedHausdorffDistance';
FUNCTION TryDistanceIndexed(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryDistanceIndexed';
FUNCTION TryNearestPointsIndexed(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryNearestPointsIndexed';
FUNCTION TryNearestPointsIndexedAll(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryDistanceFunctions.TryNearestPointsIndexedAll';
  
-- WKBEditFunctions
FUNCTION TryAddHole(@wKBpolyGeom VARBINARY, @wKBhole VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryEditFunctions.TryAddHole';
  
-- WKBGeometryFunctions
FUNCTION TryLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryLength';
FUNCTION TryArea(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryArea';
FUNCTION TryIsCCW(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryIsCCW';
FUNCTION TryIsSimple(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryIsSimple';
FUNCTION TryIsValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryIsValid';
FUNCTION TryIsRectangle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryIsRectangle';
FUNCTION TryIsClosed(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryIsClosed';
FUNCTION TryEnvelope(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryEnvelope';
FUNCTION TryReverse(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryReverse';
FUNCTION TryNormalize(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryNormalize';
FUNCTION TrySnap(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TrySnap';
FUNCTION TryGetGeometryN(@wKBGeom VARBINARY, @i INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryGetGeometryN';
FUNCTION TryGetPolygonShell(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryGetPolygonShell';
FUNCTION TryGetPolygonHoles(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryGetPolygonHoles';
FUNCTION TryGetPolygonHoleN(@wKBGeom VARBINARY, @i INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryGetPolygonHoleN';
FUNCTION TryGetCoordinates(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryGeometryFunctions.TryGetCoordinates';
  
-- WKBLinearReferencingFunctions
FUNCTION TryExtractPoint(@wKBGeom VARBINARY, @index FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryExtractPoint';
FUNCTION TryExtractLine(@wKBGeom VARBINARY, @start FLOAT64, @end FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryExtractLine';
FUNCTION TryExtractLineByGeom(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryExtractLineByGeom';
FUNCTION TryExtractLineByGeomBounds(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @b1 FLOAT64, @b2 FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryExtractLineByGeomBounds';
FUNCTION TryProject(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryProject';
FUNCTION TryProjectIndex(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLinearReferencingFunctions.TryProjectIndex';
  
-- WKBLineHandlingFunctions
FUNCTION TryMergeLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TryMergeLines';
FUNCTION TrySequenceLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TrySequenceLines';
FUNCTION TryExtractLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TryExtractLines';
FUNCTION TryExtractSegments(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TryExtractSegments';
FUNCTION TryExtractChains(@wKBGeom VARBINARY, @maxChainSize INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TryExtractChains';
FUNCTION TryDissolve(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineHandlingFunctions.TryDissolve';
  
-- WKBLineSegmentFunctions
FUNCTION TrySegmentIntersects(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TrySegmentIntersects';
FUNCTION TrySegmentIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TrySegmentIntersection';
FUNCTION TrySegmentIntersectionDd(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TrySegmentIntersectionDd';
FUNCTION TryLineIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TryLineIntersection';
FUNCTION TryLineIntersectionDD(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TryLineIntersectionDD';
FUNCTION TryReflectPoint(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryLineSegmentFunctions.TryReflectPoint';
  
-- WKBNodingFunctions
FUNCTION TryIsNodingValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryIsNodingValid';
FUNCTION TryIsSegmentNodingValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryIsSegmentNodingValid';
FUNCTION TryFindOneNode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryFindOneNode';
FUNCTION TryFindNodes(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryFindNodes';
FUNCTION TryFindInteriorNodes(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryFindInteriorNodes';
FUNCTION TryIntersectionCount(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryIntersectionCount';
FUNCTION TryInteriorIntersectionCount(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryInteriorIntersectionCount';
FUNCTION TryMCIndexNodingWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryMCIndexNodingWithPrecision';
FUNCTION TryMCIndexNoding(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryMCIndexNoding';
FUNCTION TrySnapRoundWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TrySnapRoundWithPrecision';
FUNCTION TryScaledNoding(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNodingFunctions.TryScaledNoding';
  
-- WKBNTSFunctions
FUNCTION TryLogoLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNTSFunctions.TryLogoLines';
FUNCTION TryLogoBuffer(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryNTSFunctions.TryLogoBuffer';
  
-- WKBOverlayFunctions
FUNCTION TryIntersection(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryIntersection';
FUNCTION TryUnion(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryUnion';
FUNCTION TrySymDifference(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TrySymDifference';
FUNCTION TryDifference(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryDifference';
FUNCTION TryDifferenceBa(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryDifferenceBa';
FUNCTION TryUnaryUnion(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryUnaryUnion';
FUNCTION TryUnionUsingGeometryCollection(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryUnionUsingGeometryCollection';
FUNCTION TryClip(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryOverlayFunctions.TryClip';
  
-- WKBPolygonizeFunctions
FUNCTION TryPolygonize(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonize';
FUNCTION TryPolygonizeValidPolygonal(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonizeValidPolygonal';
FUNCTION TryPolygonizeDangles(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonizeDangles';
FUNCTION TryPolygonizeCutEdges(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonizeCutEdges';
FUNCTION TryPolygonizeInvalidRingLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonizeInvalidRingLines';
FUNCTION TryPolygonizeAllErrors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPolygonizeFunctions.TryPolygonizeAllErrors';
  
-- WKBPrecisionFunctions
FUNCTION TryReducePrecisionPointwise(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryPrecisionFunctions.TryReducePrecisionPointwise';
  
-- WKBSelectionFunctions
FUNCTION TryIntersects(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryIntersects';
FUNCTION TryCovers(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryCovers';
FUNCTION TryCoveredBy(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryCoveredBy';
FUNCTION TryDisjoint(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryDisjoint';
FUNCTION TryValid(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryValid';
FUNCTION TryInvalid(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryInvalid';
FUNCTION TryAreaGreater(@wKBa VARBINARY, @minArea FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryAreaGreater';
FUNCTION TryAreaZero(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryAreaZero';
FUNCTION TryWithin(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryWithin';
FUNCTION TryInteriorPointWithin(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryInteriorPointWithin';
FUNCTION TrywithinDistance(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TrywithinDistance';
FUNCTION TrywithinDistanceIndexed(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TrywithinDistanceIndexed';
FUNCTION TryFirstNComponents(@wKBGeom VARBINARY, @n INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySelectionFunctions.TryFirstNComponents';
  
-- WKBSimplificationFunctions
FUNCTION TrySimplifyDp(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySimplificationFunctions.TrySimplifyDp';
FUNCTION TrySimplifyTp(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySimplificationFunctions.TrySimplifyTp';
FUNCTION TrySimplifyVW(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySimplificationFunctions.TrySimplifyVW';
  
-- WKBSortingFunctions
FUNCTION TrySortByLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySortingFunctions.TrySortByLength';
FUNCTION TrySortByArea(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySortingFunctions.TrySortByArea';
FUNCTION TrySortByHilbertCode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySortingFunctions.TrySortByHilbertCode';
FUNCTION TrySortByMortonCode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySortingFunctions.TrySortByMortonCode';
  
-- WKBSpatialIndexFunctions
FUNCTION TryKdTreeQuery(@wKBpts VARBINARY, @wKBquery VARBINARY, @tolerance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryKdTreeQuery';
FUNCTION TryKdTreeQueryRepeated(@wKBpts VARBINARY, @wKBqueryEnv VARBINARY, @tolerance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryKdTreeQueryRepeated';
FUNCTION TrySTRtreeBounds(@wKBGeoms VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TrySTRtreeBounds';
FUNCTION TrySTRtreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TrySTRtreeQuery';
FUNCTION TryStrTreeNN(@wKBGeoms VARBINARY, @wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryStrTreeNN';
FUNCTION TryStrTreeNNInSet(@wKBGeoms VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryStrTreeNNInSet';
FUNCTION TryStrTreeNNk(@wKBGeoms VARBINARY, @wKBGeom VARBINARY, @k INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryStrTreeNNk';
FUNCTION TryQuadTreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryQuadTreeQuery';
FUNCTION TryMonotoneChains(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TrySpatialIndexFunctions.TryMonotoneChains';
  
-- WKBTriangleFunctions
FUNCTION TryCircumcentre(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryTriangleFunctions.TryCircumcentre';
FUNCTION TryCircumcentreDD(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryTriangleFunctions.TryCircumcentreDD';
FUNCTION TryPerpendicularBisectors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryTriangleFunctions.TryPerpendicularBisectors';
FUNCTION TryInCentre(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryTriangleFunctions.TryInCentre';
FUNCTION TryAngleBisectors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryTriangleFunctions.TryAngleBisectors';
  
-- WKBValidationFunctions
FUNCTION TryInvalidLocations(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryValidationFunctions.TryInvalidLocations';
FUNCTION TryInvalidGeoms(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'TryValidationFunctions.TryInvalidGeoms';