 
-- WKBAffineTransformationFunctions
FUNCTION WKBTransformByVectors(@wKBGeom VARBINARY, @wKBcontrol VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBTransformByVectors';
FUNCTION WKBTransformByBaseline(@wKBGeom VARBINARY, @wKBdestBaseline VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBTransformByBaseline';
FUNCTION WKBScale(@wKBGeom VARBINARY, @scale FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBScale';
FUNCTION WKBReflectInX(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBReflectInX';
FUNCTION WKBReflectInY(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBReflectInY';
FUNCTION WKBRotate(@wKBGeom VARBINARY, @multipleOfPi FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBRotate';
FUNCTION WKBTranslateCentreToOrigin(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBTranslateCentreToOrigin';
FUNCTION WKBTranslateToOrigin(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBAffineTransformationFunctions.WKBTranslateToOrigin';
  
-- WKBBoundaryFunctions
FUNCTION WKBboundary(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBoundaryFunctions.WKBboundary';
FUNCTION WKBboundaryMod2(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBoundaryFunctions.WKBboundaryMod2';
FUNCTION WKBboundaryEndpoint(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBoundaryFunctions.WKBboundaryEndpoint';
FUNCTION WKBboundaryMonoValentEnd(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBoundaryFunctions.WKBboundaryMonoValentEnd';
FUNCTION WKBboundaryMultiValentEnd(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBoundaryFunctions.WKBboundaryMultiValentEnd';
  
-- WKBBufferByUnionFunctions
FUNCTION WKBComponentBuffers(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferByUnionFunctions.WKBComponentBuffers';
FUNCTION WKBBufferByComponents(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferByUnionFunctions.WKBBufferByComponents';
FUNCTION WKBBufferBySegments(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferByUnionFunctions.WKBBufferBySegments';
FUNCTION WKBBufferByChains(@wKBGeom VARBINARY, @distance FLOAT64, @maxChainSize INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferByUnionFunctions.WKBBufferByChains';
  
-- WKBBufferFunctions
FUNCTION WKBBuffer(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBuffer';
FUNCTION WKBBufferWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferWithParams';
FUNCTION WKBBufferWithSimplify(@wKBGeom VARBINARY, @distance FLOAT64, @simplifyFactor FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferWithSimplify';
FUNCTION WKBBufferOffsetCurve(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferOffsetCurve';
FUNCTION WKBBufferOffsetCurveWithParams(@wKBGeom VARBINARY, @distance FLOAT64, @quadrantSegments INT32, @capStyle INT32, @joinStyle INT32, @mitreLimit FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferOffsetCurveWithParams';
FUNCTION WKBBufferLineSimplifier(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferLineSimplifier';
FUNCTION WKBBufferValidated(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferValidated';
FUNCTION WKBBufferValidatedGeom(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferValidatedGeom';
FUNCTION WKBSingleSidedBufferCurve(@wKBgeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBSingleSidedBufferCurve';
FUNCTION WKBSingleSidedBuffer(@wKBgeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBSingleSidedBuffer';
FUNCTION WKBBufferEach(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBBufferEach';
FUNCTION WKBVariableBuffer(@wKBline VARBINARY, @startDist FLOAT64, @endDist FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBVariableBuffer';
FUNCTION WKBVariableBufferMid(@wKBline VARBINARY, @startDist FLOAT64, @midDist FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBBufferFunctions.WKBVariableBufferMid';
  
-- WKBCGAlgorithmFunctions
FUNCTION WKBOrientationIndex(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) INT32 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCGAlgorithmFunctions.WKBOrientationIndex';
FUNCTION WKBOrientationIndexDd(@wKBsegment VARBINARY, @wKBptGeom VARBINARY) INT32 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCGAlgorithmFunctions.WKBOrientationIndexDd';

-- WKBConstructionFunctions
FUNCTION WKBCentroid(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBCentroid';
FUNCTION WKBOctagonalEnvelope(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBOctagonalEnvelope';
FUNCTION WKBMinimumDiameter(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMinimumDiameter';
FUNCTION WKBMinimumDiameterLength(@wKBGeom VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMinimumDiameterLength';
FUNCTION WKBMinimumRectangle(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMinimumRectangle';
FUNCTION WKBMinimumBoundingCircle(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMinimumBoundingCircle';
FUNCTION WKBMinimumBoundingCircleDiameterLength(@wKBGeom VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMinimumBoundingCircleDiameterLength';
FUNCTION WKBMaximumDiameter(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMaximumDiameter';
FUNCTION WKBMaximumDiameterLength(@wKBGeom VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBMaximumDiameterLength';
FUNCTION WKBConvexHull(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBConvexHull';
FUNCTION WKBInteriorPoint(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBInteriorPoint';
FUNCTION WKBDensify(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConstructionFunctions.WKBDensify';
  
-- WKBConversionFunctions
FUNCTION WKBPointsToLine(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConversionFunctions.WKBPointsToLine';
FUNCTION WKBLineToPolygon(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConversionFunctions.WKBLineToPolygon';
FUNCTION WKBToPoints(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConversionFunctions.WKBToPoints';
FUNCTION WKBToLines(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConversionFunctions.WKBToLines';
FUNCTION WKBToGeometryCollection(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBConversionFunctions.WKBToGeometryCollection';
  
-- WKBCreateRandomGeometryFunctions
FUNCTION WKBRandomPointsInGrid(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomPointsInGrid';
FUNCTION WKBRandomPoints(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomPoints';
FUNCTION WKBRandomRadialPoints(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomRadialPoints';
FUNCTION WKBHaltonPoints(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBHaltonPoints';
FUNCTION WKBHaltonPoints57(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBHaltonPoints57';
FUNCTION WKBHaltonPointsWithBases(@wKBGeom VARBINARY, @nPts INT32, @basei INT32, @basej INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBHaltonPointsWithBases';
FUNCTION WKBRandomSegments(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomSegments';
FUNCTION WKBRandomSegmentsInGrid(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomSegmentsInGrid';
FUNCTION WKBRandomLineString(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomLineString';
FUNCTION WKBRandomRectilinearWalk(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateRandomGeometryFunctions.WKBRandomRectilinearWalk';
  
-- WKBCreateShapeFunctions
FUNCTION WKBGrid(@wKBGeom VARBINARY, @nCells INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBGrid';
FUNCTION WKBGridPoints(@wKBGeom VARBINARY, @nCells INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBGridPoints';
FUNCTION WKBSupercircle3(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBSupercircle3';
FUNCTION WKBSquircle(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBSquircle';
FUNCTION WKBSupercircle5(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBSupercircle5';
FUNCTION WKBSupercirclePoint5(@wKBGeom VARBINARY, @nPts INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBSupercirclePoint5';
FUNCTION WKBSupercircle(@wKBGeom VARBINARY, @nPts INT32, @pow FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBSupercircle';
FUNCTION WKBPointFieldCentroidStar(@wKBptsGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBPointFieldCentroidStar';
FUNCTION WKBPointFieldStar(@wKBptsGeom VARBINARY, @wKBcentrePt VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBCreateShapeFunctions.WKBPointFieldStar';
  
-- WKBDiffFunctions
FUNCTION WKBDiffVerticesBoth(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.WKBDiffVerticesBoth';
FUNCTION WKBDiffVertices(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.DiffVertices';
FUNCTION WKBDiffSegments(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.WKBDiffSegments';
FUNCTION WKBDiffSegmentsBoth(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.WKBDiffSegmentsBoth';
FUNCTION WKBDuplicateSegments(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.WKBDuplicateSegments';
FUNCTION WKBSingleSegments(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDiffFunctions.WKBSingleSegments';
  
-- WKBDistanceFunctions
FUNCTION WKBDistance(@wKBa VARBINARY, @wKBb VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDistance';
FUNCTION WKBIsWithinDistance(@wKBa VARBINARY, @wKBb VARBINARY, @dist FLOAT64) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBIsWithinDistance';
FUNCTION WKBNearestPoints(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBNearestPoints';
FUNCTION WKBDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDiscreteHausdorffDistanceLine';
FUNCTION WKBDensifiedDiscreteHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY, @frac FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDensifiedDiscreteHausdorffDistanceLine';
FUNCTION WKBDiscreteOrientedHausdorffDistanceLine(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDiscreteOrientedHausdorffDistanceLine';
FUNCTION WKBDiscreteHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDiscreteHausdorffDistance';
FUNCTION WKBDiscreteOrientedHausdorffDistance(@wKBa VARBINARY, @wKBb VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDiscreteOrientedHausdorffDistance';
FUNCTION WKBDistanceIndexed(@wKBa VARBINARY, @wKBb VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBDistanceIndexed';
FUNCTION WKBNearestPointsIndexed(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBNearestPointsIndexed';
FUNCTION WKBNearestPointsIndexedAll(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBDistanceFunctions.WKBNearestPointsIndexedAll';
  
-- WKBEditFunctions
FUNCTION WKBAddHole(@wKBpolyGeom VARBINARY, @wKBhole VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBEditFunctions.WKBAddHole';
  
-- WKBGeometryFunctions
FUNCTION WKBLength(@wKBGeom VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBLength';
FUNCTION WKBArea(@wKBGeom VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBArea';
FUNCTION WKBIsCCW(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBIsCCW';
FUNCTION WKBIsSimple(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBIsSimple';
FUNCTION WKBIsValid(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBIsValid';
FUNCTION WKBIsRectangle(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBIsRectangle';
FUNCTION WKBIsClosed(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBIsClosed';
FUNCTION WKBEnvelope(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBEnvelope';
FUNCTION WKBReverse(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBReverse';
FUNCTION WKBNormalize(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBNormalize';
FUNCTION WKBSnap(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBSnap';
FUNCTION WKBGetGeometryN(@wKBGeom VARBINARY, @i INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBGetGeometryN';
FUNCTION WKBGetPolygonShell(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBGetPolygonShell';
FUNCTION WKBGetPolygonHoles(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBGetPolygonHoles';
FUNCTION WKBGetPolygonHoleN(@wKBGeom VARBINARY, @i INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBGetPolygonHoleN';
FUNCTION WKBGetCoordinates(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBGeometryFunctions.WKBGetCoordinates';
  
-- WKBLinearReferencingFunctions
FUNCTION WKBExtractPoint(@wKBGeom VARBINARY, @index FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBExtractPoint';
FUNCTION WKBExtractLine(@wKBGeom VARBINARY, @start FLOAT64, @end FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBExtractLine';
FUNCTION WKBExtractLineByGeom(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBExtractLineByGeom';
FUNCTION WKBExtractLineByGeomBounds(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY, @b1 FLOAT64, @b2 FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBExtractLineByGeomBounds';
FUNCTION WKBProject(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBProject';
FUNCTION WKBProjectIndex(@wKBGeom VARBINARY, @wKBGeom2 VARBINARY) FLOAT64 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLinearReferencingFunctions.WKBProjectIndex';
  
-- WKBLineHandlingFunctions
FUNCTION WKBMergeLines(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBMergeLines';
FUNCTION WKBSequenceLines(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBSequenceLines';
FUNCTION WKBExtractLines(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBExtractLines';
FUNCTION WKBExtractSegments(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBExtractSegments';
FUNCTION WKBExtractChains(@wKBGeom VARBINARY, @maxChainSize INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBExtractChains';
FUNCTION WKBDissolve(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineHandlingFunctions.WKBDissolve';
  
-- WKBLineSegmentFunctions
FUNCTION WKBSegmentIntersects(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBSegmentIntersects';
FUNCTION WKBSegmentIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBSegmentIntersection';
FUNCTION WKBSegmentIntersectionDd(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBSegmentIntersectionDd';
FUNCTION WKBLineIntersection(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBLineIntersection';
FUNCTION WKBLineIntersectionDD(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBLineIntersectionDD';
FUNCTION WKBReflectPoint(@wKBGeom1 VARBINARY, @wKBGeom2 VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBLineSegmentFunctions.WKBReflectPoint';
  
-- WKBNodingFunctions
FUNCTION WKBIsNodingValid(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBIsNodingValid';
FUNCTION WKBIsSegmentNodingValid(@wKBGeom VARBINARY) BOOLEAN AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBIsSegmentNodingValid';
FUNCTION WKBFindOneNode(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBFindOneNode';
FUNCTION WKBFindNodes(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBFindNodes';
FUNCTION WKBFindInteriorNodes(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBFindInteriorNodes';
FUNCTION WKBIntersectionCount(@wKBGeom VARBINARY) INT32 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBIntersectionCount';
FUNCTION WKBInteriorIntersectionCount(@wKBGeom VARBINARY) INT32 AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBInteriorIntersectionCount';
FUNCTION WKBMCIndexNodingWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBMCIndexNodingWithPrecision';
FUNCTION WKBMCIndexNoding(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBMCIndexNoding';
FUNCTION WKBSnapRoundWithPrecision(@wKBGeom VARBINARY, @scaleFactor FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBSnapRoundWithPrecision';
FUNCTION WKBScaledNoding(@wKBGeom VARBINARY, @scaleFactor FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNodingFunctions.WKBScaledNoding';
  
-- WKBNTSFunctions
FUNCTION WKBLogoLines(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNTSFunctions.WKBLogoLines';
FUNCTION WKBLogoBuffer(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBNTSFunctions.WKBLogoBuffer';
  
-- WKBOverlayFunctions
FUNCTION WKBIntersection(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBIntersection';
FUNCTION WKBUnion(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBUnion';
FUNCTION WKBSymDifference(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBSymDifference';
FUNCTION WKBDifference(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBDifference';
FUNCTION WKBDifferenceBa(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBDifferenceBa';
FUNCTION WKBUnaryUnion(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBUnaryUnion';
FUNCTION WKBUnionUsingGeometryCollection(@wKBa VARBINARY, @wKBb VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBUnionUsingGeometryCollection';
FUNCTION WKBClip(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBOverlayFunctions.WKBClip';
  
-- WKBPolygonizeFunctions
FUNCTION WKBPolygonize(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonize';
FUNCTION WKBPolygonizeValidPolygonal(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonizeValidPolygonal';
FUNCTION WKBPolygonizeDangles(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonizeDangles';
FUNCTION WKBPolygonizeCutEdges(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonizeCutEdges';
FUNCTION WKBPolygonizeInvalidRingLines(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonizeInvalidRingLines';
FUNCTION WKBPolygonizeAllErrors(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPolygonizeFunctions.WKBPolygonizeAllErrors';
  
-- WKBPrecisionFunctions
FUNCTION WKBReducePrecisionPointwise(@wKBGeom VARBINARY, @scaleFactor FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBPrecisionFunctions.WKBReducePrecisionPointwise';
  
-- WKBSelectionFunctions
FUNCTION WKBIntersects(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBIntersects';
FUNCTION WKBCovers(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBCovers';
FUNCTION WKBCoveredBy(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBCoveredBy';
FUNCTION WKBDisjoint(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBDisjoint';
FUNCTION WKBValid(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBValid';
FUNCTION WKBInvalid(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBInvalid';
FUNCTION WKBAreaGreater(@wKBa VARBINARY, @minArea FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBAreaGreater';
FUNCTION WKBAreaZero(@wKBa VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBAreaZero';
FUNCTION WKBWithin(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBWithin';
FUNCTION WKBInteriorPointWithin(@wKBa VARBINARY, @wKBmask VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBInteriorPointWithin';
FUNCTION WKBwithinDistance(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBwithinDistance';
FUNCTION WKBwithinDistanceIndexed(@wKBa VARBINARY, @wKBmask VARBINARY, @maximumDistance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBwithinDistanceIndexed';
FUNCTION WKBFirstNComponents(@wKBGeom VARBINARY, @n INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSelectionFunctions.WKBFirstNComponents';
  
-- WKBSimplificationFunctions
FUNCTION WKBSimplifyDp(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSimplificationFunctions.WKBSimplifyDp';
FUNCTION WKBSimplifyTp(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSimplificationFunctions.WKBSimplifyTp';
FUNCTION WKBSimplifyVW(@wKBGeom VARBINARY, @distance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSimplificationFunctions.WKBSimplifyVW';
  
-- WKBSortingFunctions
FUNCTION WKBSortByLength(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSortingFunctions.WKBSortByLength';
FUNCTION WKBSortByArea(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSortingFunctions.WKBSortByArea';
FUNCTION WKBSortByHilbertCode(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSortingFunctions.WKBSortByHilbertCode';
FUNCTION WKBSortByMortonCode(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSortingFunctions.WKBSortByMortonCode';
  
-- WKBSpatialIndexFunctions
FUNCTION WKBKdTreeQuery(@wKBpts VARBINARY, @wKBquery VARBINARY, @tolerance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBKdTreeQuery';
FUNCTION WKBKdTreeQueryRepeated(@wKBpts VARBINARY, @wKBqueryEnv VARBINARY, @tolerance FLOAT64) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBKdTreeQueryRepeated';
FUNCTION WKBSTRtreeBounds(@wKBGeoms VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBSTRtreeBounds';
FUNCTION WKBSTRtreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBSTRtreeQuery';
FUNCTION WKBStrTreeNN(@wKBGeoms VARBINARY, @wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBStrTreeNN';
FUNCTION WKBStrTreeNNInSet(@wKBGeoms VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBStrTreeNNInSet';
FUNCTION WKBStrTreeNNk(@wKBGeoms VARBINARY, @wKBGeom VARBINARY, @k INT32) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBStrTreeNNk';
FUNCTION WKBQuadTreeQuery(@wKBGeoms VARBINARY, @wKBqueryEnv VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBQuadTreeQuery';
FUNCTION WKBMonotoneChains(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBSpatialIndexFunctions.WKBMonotoneChains';
  
-- WKBTriangleFunctions
FUNCTION WKBCircumcentre(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBTriangleFunctions.WKBCircumcentre';
FUNCTION WKBCircumcentreDD(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBTriangleFunctions.WKBCircumcentreDD';
FUNCTION WKBPerpendicularBisectors(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBTriangleFunctions.WKBPerpendicularBisectors';
FUNCTION WKBInCentre(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBTriangleFunctions.WKBInCentre';
FUNCTION WKBAngleBisectors(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBTriangleFunctions.WKBAngleBisectors';
  
-- WKBValidationFunctions
FUNCTION WKBInvalidLocations(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBValidationFunctions.WKBInvalidLocations';
FUNCTION WKBInvalidGeoms(@wKBGeom VARBINARY) VARBINARY AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'WKBValidationFunctions.WKBInvalidGeoms';