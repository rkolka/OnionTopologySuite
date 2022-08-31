
-- WKBOffsetCurveFunctions
FUNCTION WktOffsetCurve(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOffsetCurveFunctions.WktOffsetCurve';
FUNCTION WktOffsetCurveWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOffsetCurveFunctions.WktOffsetCurveWithParams';

-- WKBBezierCurveFunctions
FUNCTION WktBezierCurveByAlpha(@wKBGeom VARBINARY, @alpha FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBezierCurveFunctions.WktBezierCurveByAlpha';
FUNCTION WktBezierCurveByAlphaAndSkew(@wKBGeom VARBINARY, @alpha FLOAT64, @skew FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBezierCurveFunctions.WktBezierCurveByAlphaAndSkew';
FUNCTION WktBezierCurveWithControlPoints(@wKBGeom VARBINARY, @controlPoints VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBezierCurveFunctions.WktBezierCurveWithControlPoints';
 
 

-- WKBHullFunctions
FUNCTION WktConcaveHullByLength(@wKBGeom VARBINARY, @maxLength FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktHullFunctions.WktConcaveHullByLength';
FUNCTION WktConcaveHullByLengthRatio(@wKBGeom VARBINARY, @lengthRatio FLOAT64, @isHolesAllowed BOOLEAN) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktHullFunctions.WktConcaveHullByLengthRatio';
FUNCTION WktPolygonHull(@wKBGeom VARBINARY, @isOuter BOOLEAN, @vertexNumFraction FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktHullFunctions.WktPolygonHull';
FUNCTION WktPolygonHullByAreaDelta(@wKBGeom VARBINARY, @isOuter BOOLEAN, @areaDeltaRatio FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktHullFunctions.WktPolygonHullByAreaDelta';
 
-- WKBAffineTransformationFunctions
FUNCTION WktTransformByVectors(@wKBGeom VARBINARY, @wKBcontrol VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktTransformByVectors';
FUNCTION WktTransformByBaseline(@wKBGeom VARBINARY, @wKBdestBaseline VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktTransformByBaseline';
FUNCTION WktScale(@wKBGeom VARBINARY, @scale FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktScale';
FUNCTION WktReflectInX(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktReflectInX';
FUNCTION WktReflectInY(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktReflectInY';
FUNCTION WktRotate(@wKBGeom VARBINARY, @multipleOfPi FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktRotate';
FUNCTION WktTranslateCentreToOrigin(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktTranslateCentreToOrigin';
FUNCTION WktTranslateToOrigin(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktAffineTransformationFunctions.WktTranslateToOrigin';
  
-- WKBBoundaryFunctions
FUNCTION Wktboundary(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBoundaryFunctions.Wktboundary';
FUNCTION WktboundaryMod2(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBoundaryFunctions.WktboundaryMod2';
FUNCTION WktboundaryEndpoint(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBoundaryFunctions.WktboundaryEndpoint';
FUNCTION WktboundaryMonoValentEnd(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBoundaryFunctions.WktboundaryMonoValentEnd';
FUNCTION WktboundaryMultiValentEnd(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBoundaryFunctions.WktboundaryMultiValentEnd';
  
-- WKBBufferByUnionFunctions
FUNCTION WktComponentBuffers(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferByUnionFunctions.WktComponentBuffers';
FUNCTION WktBufferByComponents(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferByUnionFunctions.WktBufferByComponents';
FUNCTION WktBufferBySegments(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferByUnionFunctions.WktBufferBySegments';
FUNCTION WktBufferByChains(@wKBGeom VARBINARY, @distance FLOAT64, @maxChainSize INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferByUnionFunctions.WktBufferByChains';
  
-- WKBBufferFunctions
FUNCTION WktBuffer(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBuffer';
FUNCTION WktBufferWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferWithParams';
FUNCTION WktBufferWithSimplify(@wKBGeom VARBINARY, @distance FLOAT64, @simplifyFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferWithSimplify';
FUNCTION WktBufferOffsetCurve(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferOffsetCurve';
FUNCTION WktBufferOffsetCurveWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferOffsetCurveWithParams';
FUNCTION WktBufferLineSimplifier(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferLineSimplifier';
FUNCTION WktBufferValidated(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferValidated';
FUNCTION WktBufferValidatedGeom(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferValidatedGeom';
FUNCTION WktSingleSidedBufferCurve(@wKBgeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktSingleSidedBufferCurve';
FUNCTION WktSingleSidedBuffer(@wKBgeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktSingleSidedBuffer';
FUNCTION WktBufferEach(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktBufferEach';
FUNCTION WktVariableBuffer(@wKBline VARBINARY, @startDist FLOAT64, @endDist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktVariableBuffer';
FUNCTION WktVariableBufferMid(@wKBline VARBINARY, @startDist FLOAT64, @midDist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktBufferFunctions.WktVariableBufferMid';
  
-- WKBCGAlgorithmFunctions
FUNCTION WktOrientationIndex(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCGAlgorithmFunctions.WktOrientationIndex';
FUNCTION WktOrientationIndexDd(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCGAlgorithmFunctions.WktOrientationIndexDd';

-- WKBConstructionFunctions
FUNCTION WktCentroid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktCentroid';
FUNCTION WktOctagonalEnvelope(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktOctagonalEnvelope';
FUNCTION WktMinimumDiameter(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMinimumDiameter';
FUNCTION WktMinimumDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMinimumDiameterLength';
FUNCTION WktMinimumRectangle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMinimumRectangle';
FUNCTION WktMinimumBoundingCircle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMinimumBoundingCircle';
FUNCTION WktMinimumBoundingCircleDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMinimumBoundingCircleDiameterLength';
FUNCTION WktMaximumDiameter(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMaximumDiameter';
FUNCTION WktMaximumDiameterLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktMaximumDiameterLength';
FUNCTION WktConvexHull(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktConvexHull';
FUNCTION WktInteriorPoint(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktInteriorPoint';
FUNCTION WktDensify(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConstructionFunctions.WktDensify';
  
-- WKBConversionFunctions
FUNCTION WktPointsToLine(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConversionFunctions.WktPointsToLine';
FUNCTION WktLineToPolygon(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConversionFunctions.WktLineToPolygon';
FUNCTION WktToPoints(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConversionFunctions.WktToPoints';
FUNCTION WktToLines(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConversionFunctions.WktToLines';
FUNCTION WktToGeometryCollection(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktConversionFunctions.WktToGeometryCollection';
  
-- WKBCreateRandomGeometryFunctions
FUNCTION WktRandomPointsInGrid(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomPointsInGrid';
FUNCTION WktRandomPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomPoints';
FUNCTION WktRandomRadialPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomRadialPoints';
FUNCTION WktHaltonPoints(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktHaltonPoints';
FUNCTION WktHaltonPoints57(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktHaltonPoints57';
FUNCTION WktHaltonPointsWithBases(@wKBGeom VARBINARY, @nPts INT32, @basei INT32, @basej INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktHaltonPointsWithBases';
FUNCTION WktRandomSegments(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomSegments';
FUNCTION WktRandomSegmentsInGrid(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomSegmentsInGrid';
FUNCTION WktRandomLineString(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomLineString';
FUNCTION WktRandomRectilinearWalk(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateRandomGeometryFunctions.WktRandomRectilinearWalk';
  
-- WKBCreateShapeFunctions
FUNCTION WktGrid(@wKBGeom VARBINARY, @nCells INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktGrid';
FUNCTION WktGridPoints(@wKBGeom VARBINARY, @nCells INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktGridPoints';
FUNCTION WktSupercircle3(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktSupercircle3';
FUNCTION WktSquircle(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktSquircle';
FUNCTION WktSupercircle5(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktSupercircle5';
FUNCTION WktSupercirclePoint5(@wKBGeom VARBINARY, @nPts INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktSupercirclePoint5';
FUNCTION WktSupercircle(@wKBGeom VARBINARY, @nPts INT32, @pow FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktSupercircle';
FUNCTION WktPointFieldCentroidStar(@wKBptsGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktPointFieldCentroidStar';
FUNCTION WktPointFieldStar(@wKBptsGeom VARBINARY, @wKBcentrePt VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktCreateShapeFunctions.WktPointFieldStar';
  
-- WKBDiffFunctions
FUNCTION WktDiffVerticesBoth(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktDiffVerticesBoth';
FUNCTION WktDiffVertices(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktDiffVertices';
FUNCTION WktDiffSegments(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktDiffSegments';
FUNCTION WktDiffSegmentsBoth(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktDiffSegmentsBoth';
FUNCTION WktDuplicateSegments(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktDuplicateSegments';
FUNCTION WktSingleSegments(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDiffFunctions.WktSingleSegments';
  
-- WKBDistanceFunctions
FUNCTION WktDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDistance';
FUNCTION WktIsWithinDistance(@wKBa VARBINARY, @wKBb VARBINARY, @dist FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktIsWithinDistance';
FUNCTION WktNearestPoints(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktNearestPoints';
FUNCTION WktDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDiscreteHausdorffDistanceLine';
FUNCTION WktDensifiedDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY, @frac FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDensifiedDiscreteHausdorffDistanceLine';
FUNCTION WktDiscreteOrientedHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDiscreteOrientedHausdorffDistanceLine';
FUNCTION WktDiscreteHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDiscreteHausdorffDistance';
FUNCTION WktDiscreteOrientedHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDiscreteOrientedHausdorffDistance';
FUNCTION WktDistanceIndexed(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktDistanceIndexed';
FUNCTION WktNearestPointsIndexed(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktNearestPointsIndexed';
FUNCTION WktNearestPointsIndexedAll(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktDistanceFunctions.WktNearestPointsIndexedAll';
  
-- WKBEditFunctions
FUNCTION WktAddHole(@wKBpolyGeom VARBINARY, @wKBhole VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktEditFunctions.WktAddHole';
  
-- WKBGeometryFunctions
FUNCTION WktLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktLength';
FUNCTION WktArea(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktArea';
FUNCTION WktIsCCW(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktIsCCW';
FUNCTION WktIsSimple(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktIsSimple';
FUNCTION WktIsValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktIsValid';
FUNCTION WktIsRectangle(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktIsRectangle';
FUNCTION WktIsClosed(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktIsClosed';
FUNCTION WktEnvelope(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktEnvelope';
FUNCTION WktReverse(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktReverse';
FUNCTION WktNormalize(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktNormalize';
FUNCTION WktSnap(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktSnap';
FUNCTION WktGetGeometryN(@wKBGeom VARBINARY, @i INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktGetGeometryN';
FUNCTION WktGetPolygonShell(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktGetPolygonShell';
FUNCTION WktGetPolygonHoles(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktGetPolygonHoles';
FUNCTION WktGetPolygonHoleN(@wKBGeom VARBINARY, @i INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktGetPolygonHoleN';
FUNCTION WktGetCoordinates(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktGeometryFunctions.WktGetCoordinates';
  
-- WKBLinearReferencingFunctions
FUNCTION WktExtractPoint(@wKBGeom VARBINARY, @index FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktExtractPoint';
FUNCTION WktExtractLine(@wKBGeom VARBINARY, @start FLOAT64, @end FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktExtractLine';
FUNCTION WktExtractLineByGeom(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktExtractLineByGeom';
FUNCTION WktExtractLineByGeomBounds(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @b1 FLOAT64, @b2 FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktExtractLineByGeomBounds';
FUNCTION WktProject(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktProject';
FUNCTION WktProjectIndex(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLinearReferencingFunctions.WktProjectIndex';
  
-- WKBLineHandlingFunctions
FUNCTION WktMergeLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktMergeLines';
FUNCTION WktSequenceLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktSequenceLines';
FUNCTION WktExtractLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktExtractLines';
FUNCTION WktExtractSegments(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktExtractSegments';
FUNCTION WktExtractChains(@wKBGeom VARBINARY, @maxChainSize INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktExtractChains';
FUNCTION WktDissolve(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineHandlingFunctions.WktDissolve';
  
-- WKBLineSegmentFunctions
FUNCTION WktSegmentIntersects(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktSegmentIntersects';
FUNCTION WktSegmentIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktSegmentIntersection';
FUNCTION WktSegmentIntersectionDd(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktSegmentIntersectionDd';
FUNCTION WktLineIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktLineIntersection';
FUNCTION WktLineIntersectionDD(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktLineIntersectionDD';
FUNCTION WktReflectPoint(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktLineSegmentFunctions.WktReflectPoint';
  
-- WKBNodingFunctions
FUNCTION WktIsNodingValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktIsNodingValid';
FUNCTION WktIsSegmentNodingValid(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktIsSegmentNodingValid';
FUNCTION WktFindOneNode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktFindOneNode';
FUNCTION WktFindNodes(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktFindNodes';
FUNCTION WktFindInteriorNodes(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktFindInteriorNodes';
FUNCTION WktIntersectionCount(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktIntersectionCount';
FUNCTION WktInteriorIntersectionCount(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktInteriorIntersectionCount';
FUNCTION WktMCIndexNodingWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktMCIndexNodingWithPrecision';
FUNCTION WktMCIndexNoding(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktMCIndexNoding';
FUNCTION WktSnapRoundWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktSnapRoundWithPrecision';
FUNCTION WktScaledNoding(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNodingFunctions.WktScaledNoding';
  
-- WKBNTSFunctions
FUNCTION WktLogoLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNTSFunctions.WktLogoLines';
FUNCTION WktLogoBuffer(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktNTSFunctions.WktLogoBuffer';
  
-- WKBOverlayFunctions
FUNCTION WktIntersection(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktIntersection';
FUNCTION WktUnion(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktUnion';
FUNCTION WktSymDifference(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktSymDifference';
FUNCTION WktDifference(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktDifference';
FUNCTION WktDifferenceBa(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktDifferenceBa';
FUNCTION WktUnaryUnion(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktUnaryUnion';
FUNCTION WktUnionUsingGeometryCollection(@wKBa VARBINARY, @wKBb VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktUnionUsingGeometryCollection';
FUNCTION WktClip(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktOverlayFunctions.WktClip';
  
-- WKBPolygonizeFunctions
FUNCTION WktPolygonize(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonize';
FUNCTION WktPolygonizeValidPolygonal(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonizeValidPolygonal';
FUNCTION WktPolygonizeDangles(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonizeDangles';
FUNCTION WktPolygonizeCutEdges(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonizeCutEdges';
FUNCTION WktPolygonizeInvalidRingLines(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonizeInvalidRingLines';
FUNCTION WktPolygonizeAllErrors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPolygonizeFunctions.WktPolygonizeAllErrors';
  
-- WKBPrecisionFunctions
FUNCTION WktReducePrecisionPointwise(@wKBGeom VARBINARY, @scaleFactor FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktPrecisionFunctions.WktReducePrecisionPointwise';
  
-- WKBSelectionFunctions
FUNCTION WktIntersects(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktIntersects';
FUNCTION WktCovers(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktCovers';
FUNCTION WktCoveredBy(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktCoveredBy';
FUNCTION WktDisjoint(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktDisjoint';
FUNCTION WktValid(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktValid';
FUNCTION WktInvalid(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktInvalid';
FUNCTION WktAreaGreater(@wKBa VARBINARY, @minArea FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktAreaGreater';
FUNCTION WktAreaZero(@wKBa VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktAreaZero';
FUNCTION WktWithin(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktWithin';
FUNCTION WktInteriorPointWithin(@wKBa VARBINARY, @wKBmask VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktInteriorPointWithin';
FUNCTION WktwithinDistance(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktwithinDistance';
FUNCTION WktwithinDistanceIndexed(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktwithinDistanceIndexed';
FUNCTION WktFirstNComponents(@wKBGeom VARBINARY, @n INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSelectionFunctions.WktFirstNComponents';
  
-- WKBSimplificationFunctions
FUNCTION WktSimplifyDp(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSimplificationFunctions.WktSimplifyDp';
FUNCTION WktSimplifyTp(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSimplificationFunctions.WktSimplifyTp';
FUNCTION WktSimplifyVW(@wKBGeom VARBINARY, @distance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSimplificationFunctions.WktSimplifyVW';
  
-- WKBSortingFunctions
FUNCTION WktSortByLength(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSortingFunctions.WktSortByLength';
FUNCTION WktSortByArea(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSortingFunctions.WktSortByArea';
FUNCTION WktSortByHilbertCode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSortingFunctions.WktSortByHilbertCode';
FUNCTION WktSortByMortonCode(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSortingFunctions.WktSortByMortonCode';
  
-- WKBSpatialIndexFunctions
FUNCTION WktKdTreeQuery(@wKBpts VARBINARY, @wKBquery VARBINARY, @tolerance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktKdTreeQuery';
FUNCTION WktKdTreeQueryRepeated(@wKBpts VARBINARY, @wKBqueryEnv VARBINARY, @tolerance FLOAT64) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktKdTreeQueryRepeated';
FUNCTION WktSTRtreeBounds(@wKBGeoms VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktSTRtreeBounds';
FUNCTION WktSTRtreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktSTRtreeQuery';
FUNCTION WktStrTreeNN(@wKBGeoms VARBINARY, @wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktStrTreeNN';
FUNCTION WktStrTreeNNInSet(@wKBGeoms VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktStrTreeNNInSet';
FUNCTION WktStrTreeNNk(@wKBGeoms VARBINARY, @wKBGeom VARBINARY, @k INT32) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktStrTreeNNk';
FUNCTION WktQuadTreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktQuadTreeQuery';
FUNCTION WktMonotoneChains(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktSpatialIndexFunctions.WktMonotoneChains';
  
-- WKBTriangleFunctions
FUNCTION WktCircumcentre(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktTriangleFunctions.WktCircumcentre';
FUNCTION WktCircumcentreDD(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktTriangleFunctions.WktCircumcentreDD';
FUNCTION WktPerpendicularBisectors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktTriangleFunctions.WktPerpendicularBisectors';
FUNCTION WktInCentre(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktTriangleFunctions.WktInCentre';
FUNCTION WktAngleBisectors(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktTriangleFunctions.WktAngleBisectors';
  
-- WKBValidationFunctions
FUNCTION WktInvalidLocations(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktValidationFunctions.WktInvalidLocations';
FUNCTION WktInvalidGeoms(@wKBGeom VARBINARY) NVARCHAR AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WktValidationFunctions.WktInvalidGeoms';