# [:floppy_disk: Click here to download the add-in](https://raw.githubusercontent.com/rkolka/OnionTopologySuite/master/OnionTopologySuite.zip "Click here to download")
# OnionTopologySuite
Exposes parts of NetTopologySuite as Manifold® SQL functions. There are some interesting functions that have no counterpart built into Manifold. 

## Why Onion?
Because it has layers. Starting from user facing (top) layer:
* :onion: Manifold SQL functions that take and return Manifold's GEOM type. Defined in OnionTopologySuiteGEOM.sql. Converting GEOM to/from WKB with built-in GeomWkb/BinaryWkbGeom functions.
* :onion: Manifold SQL functions that take and return WKB type. Declared in OnionTopologySuiteWKB.sql, actual definitions in layer below.
* :onion: C# functions (that is, static methods that return a value and have no visible side effects) that take and return WKB type. Defined in OnionTopologySuite.dll. Converting WKB to/from NTS Geometry type with NetTopologySuite.IO.WKBReader/WKBWriter. 
* :onion: C# static methods from NetTopologySuite.TestRunner.Functions that take and return NTS Geometry type. I just copied the code from NTS TestRunner project into this project because it had almost everything I wished for.
* :onion: Objects and methods in NetTopologySuite that do the hard work, but are not clean functions with N inputs and 1 output.


## Using
Download add-in [(link)](https://raw.githubusercontent.com/rkolka/OnionTopologySuite/master/OnionTopologySuite.zip) and unpack it under ~\extras\.

These files are imported into your project if you run it from Tools->Add-ins->OnionTopologySuite:
* OnionTopologySuiteWKB.sql
* OnionTopologySuiteGEOM.sql



Include [OnionTopologySuiteGEOM.sql] in your queries. 
```sql
-- $manifold$
-- $include$ [OnionTopologySuiteGEOM.sql]

...your query...
```

You can also look at OnionTopologySuiteTest.sql and OnionTopologySuite.map

## What functions?
I almost mechanically converted all functions from NetTopologySuite\test\NetTopologySuite.TestRunner\Functions.
Some are duplicates of, or don't even make much sense in Manifold. 

## List of functions
For details, study code comments [here](https://github.com/NetTopologySuite/NetTopologySuite/tree/c838c5061aa0f13d1fa65f828a868d790302ec06/test/NetTopologySuite.TestRunner/Functions)

#### OffsetCurveFunctions
* NTSOffsetCurve(@geom, @distance)
* NTSOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @joinStyle, @mitreLimit) 

#### BezierCurveFunctions
* NTSBezierCurveByAlpha(@geom, @alpha)
* NTSBezierCurveByAlphaAndSkew(@geom, @alpha, @skew)
* NTSBezierCurveWithControlPoints(@geom, @controlPoints)

#### HullFunctions
* NTSConcaveHullByLength(@geom, @maxLength, @isHolesAllowed)
* NTSConcaveHullByLengthRatio(@geom, @lengthRatio, @isHolesAllowed)
* NTSPolygonHull(@geom, @isOuter, @vertexNumFraction)
* NTSPolygonHullByAreaDelta(@geom, @isOuter, @areaDeltaRatio)

#### AffineTransformationFunctions
* NTSTransformByVectors(@geom, @geomcontrol)
* NTSTransformByBaseline(@geom, @geomdestBaseline)
* NTSScale(@geom, @scale)
* NTSReflectInX(@geom)
* NTSReflectInY(@geom)
* NTSRotate(@geom, @multipleOfPi)
* NTSTranslateCentreToOrigin(@geom)
* NTSTranslateToOrigin(@geom)

#### BoundaryFunctions
* NTSBoundary(@geom)
* NTSBoundaryMod2(@geom)
* NTSBoundaryEndpoint(@geom)
* NTSBoundaryMonoValentEnd(@geom)
* NTSBoundaryMultiValentEnd(@geom)

#### BufferByUnionFunctions
* NTSComponentBuffers(@geom, @distance)
* NTSBufferByComponents(@geom, @distance)
* NTSBufferBySegments(@geom, @distance)
* NTSBufferByChains(@geom, @distance, @maxChainSize)

#### BufferFunctions
* NTSBuffer(@geom, @distance)
* NTSBufferWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)
* NTSBufferWithSimplify(@geom, @distance, @simplifyFactor)
* NTSBufferOffsetCurve(@geom, @distance)
* NTSBufferOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)
* NTSBufferLineSimplifier(@geom, @distance)
* NTSBufferValidated(@geom, @distance)
* NTSBufferValidatedGeom(@geom, @distance)
* NTSSingleSidedBufferCurve(@geom, @distance)
* NTSSingleSidedBuffer(@geom, @distance)
* NTSBufferEach(@geom, @distance)
* NTSVariableBuffer(@geomline, @startDist, @endDist)
* NTSVariableBufferMid(@geomline, @startDist, @midDist)

#### CGAlgorithmFunctions
* NTSOrientationIndex(@geomsegment, @geomptGeom)
* NTSOrientationIndexDd(@geomsegment, @geomptGeom)
* NTSSegmentIntersects(@geomg1, @geomg2)
* NTSSegmentIntersection(@geomg1, @geomg2)
* NTSSegmentIntersectionDd(@geomg1, @geomg2)

#### ConstructionFunctions
* NTSOctagonalEnvelope(@geom)
* NTSMinimumDiameter(@geom)
* NTSMinimumDiameterLength(@geom)
* NTSMinimumRectangle(@geom)
* NTSMinimumBoundingCircle(@geom)
* NTSMinimumBoundingCircleDiameterLength(@geom)
* NTSMaximumDiameter(@geom)
* NTSMaximumDiameterLength(@geom)
* NTSBoundary(@geom)
* NTSConvexHull(@geom)
* NTSCentroid(@geom)
* NTSInteriorPoint(@geom)
* NTSDensify(@geom, @distance)
* NTSExtractLines(@geom)

#### ConversionFunctions
* NTSPointsToLine(@geom)
* NTSLineToPolygon(@geom)
* NTSToPoints(@geom1, @geom2)
* NTSToLines(@geom1, @geom2)
* NTSToGeometryCollection(@geom, @geom2)

#### CreateRandomGeometryFunctions
* NTSRandomPointsInGrid(@geom, @nPts)
* NTSRandomPoints(@geom, @nPts)
* NTSRandomRadialPoints(@geom, @nPts)
* NTSHaltonPoints(@geom, @nPts)
* NTSHaltonPoints57(@geom, @nPts)
* NTSHaltonPointsWithBases(@geom, @nPts, @basei, @basej)
* NTSRandomSegments(@geom, @nPts)
* NTSRandomSegmentsInGrid(@geom, @nPts)
* NTSRandomLineString(@geom, @nPts)
* NTSRandomRectilinearWalk(@geom, @nPts)

#### CreateShapeFunctions
* NTSGrid(@geom, @nCells)
* NTSGridPoints(@geom, @nCells)
* NTSSupercircle3(@geom, @nPts)
* NTSSquircle(@geom, @nPts)
* NTSSupercircle5(@geom, @nPts)
* NTSSupercirclePoint5(@geom, @nPts)
* NTSSupercircle(@geom, @nPts, @pow)
* NTSPointFieldCentroidStar(@geomptsGeom)
* NTSPointFieldStar(@geomptsGeom, @geomcentrePt)

#### DiffFunctions
* NTSDiffVerticesBoth(@geoma, @geomb)
* NTSDiffVertices(@geoma, @geomb)
* NTSDiffSegments(@geoma, @geomb)
* NTSDiffSegmentsBoth(@geoma, @geomb)
* NTSDuplicateSegments(@geoma)
* NTSSingleSegments(@geoma)

#### DissolveFunctions
* NTSDissolve(@geom)

#### DistanceFunctions
* NTSDistance(@geoma, @geomb)
* NTSIsWithinDistance(@geoma, @geomb, @dist)
* NTSNearestPoints(@geoma, @geomb)
* NTSDiscreteHausdorffDistanceLine(@geoma, @geomb)
* NTSDensifiedDiscreteHausdorffDistanceLine(@geoma, @geomb, @frac)
* NTSDiscreteOrientedHausdorffDistanceLine(@geoma, @geomb)
* NTSDiscreteHausdorffDistance(@geoma, @geomb)
* NTSDiscreteOrientedHausdorffDistance(@geoma, @geomb)
* NTSDistanceIndexed(@geoma, @geomb)
* NTSNearestPointsIndexed(@geoma, @geomb)
* NTSNearestPointsIndexedAll(@geoma, @geomb)

#### EditFunctions
* NTSAddHole(@geompolyGeom, @geomhole)

#### GeometryFunctions
* NTSLength(@geom)
* NTSArea(@geom)
* NTSIsCCW(@geom)
* NTSIsSimple(@geom)
* NTSIsValid(@geom)
* NTSIsRectangle(@geom)
* NTSIsClosed(@geom)
* NTSEnvelope(@geom)
* NTSReverse(@geom)
* NTSNormalize(@geom)
* NTSSnap(@geom, @geom2, @distance)
* NTSGetGeometryN(@geom, @i)
* NTSGetPolygonShell(@geom)
* NTSGetPolygonHoles(@geom)
* NTSGetPolygonHoleN(@geom, @i)
* NTSGetCoordinates(@geom)

#### LinearReferencingFunctions
* NTSExtractPoint(@geom, @index)
* NTSExtractLine(@geom, @start, @end)
* NTSProject(@geom, @geom2)
* NTSProjectIndex(@geom, @geom2)

#### 
* NTSMergeLines(@geom)
* NTSSequenceLines(@geom)
* NTSExtractLines(@geom)
* NTSExtractSegments(@geom)
* NTSExtractChains(@geom, @maxChainSize)
* NTSDissolve(@geom)
* NTSSegmentIntersects(@geom1, @geom2)
* NTSSegmentIntersection(@geom1, @geom2)
* NTSSegmentIntersectionDd(@geom1, @geom2)
* NTSLineIntersection(@geom1, @geom2)
* NTSLineIntersectionDD(@geom1, @geom2)
* NTSReflectPoint(@geom1, @geom2)
* NTSIsNodingValid(@geom)
* NTSIsSegmentNodingValid(@geom)
* NTSFindOneNode(@geom)
* NTSFindNodes(@geom)
* NTSFindInteriorNodes(@geom)
* NTSIntersectionCount(@geom)
* NTSInteriorIntersectionCount(@geom)
* NTSMCIndexNodingWithPrecision(@geom, @scaleFactor)
* NTSMCIndexNoding(@geom)
* NTSSnapRoundWithPrecision(@geom, @scaleFactor)
* NTSScaledNoding(@geom, @scaleFactor)
* NTSLogoLines(@geom)
* NTSLogoBuffer(@geom, @distance)
* NTSIntersection(@geoma, @geomb)
* NTSUnion(@geoma, @geomb)
* NTSSymDifference(@geoma, @geomb)
* NTSDifference(@geoma, @geomb)
* NTSDifferenceBa(@geoma, @geomb)
* NTSUnaryUnion(@geoma)
* NTSUnionUsingGeometryCollection(@geoma, @geomb)
* NTSClip(@geoma, @geommask)
* NTSPolygonize(@geom)
* NTSPolygonizeValidPolygonal(@geom)
* NTSPolygonizeDangles(@geom)
* NTSPolygonizeCutEdges(@geom)
* NTSPolygonizeInvalidRingLines(@geom)
* NTSPolygonizeAllErrors(@geom)
* NTSReducePrecisionPointwise(@geom, @scaleFactor)
* NTSIntersects(@geoma, @geommask)
* NTSCovers(@geoma, @geommask)
* NTSCoveredBy(@geoma, @geommask)
* NTSDisjoint(@geoma, @geommask)
* NTSValid(@geoma)
* NTSInvalid(@geoma)
* NTSAreaGreater(@geoma, @minArea)
* NTSAreaZero(@geoma)
* NTSWithin(@geoma, @geommask)
* NTSInteriorPointWithin(@geoma, @geommask)
* NTSwithinDistance(@geoma, @geommask, @maximumDistance)
* NTSwithinDistanceIndexed(@geoma, @geommask, @maximumDistance)
* NTSFirstNComponents(@geom, @n)
* NTSSimplifyDp(@geom, @distance)
* NTSSimplifyTp(@geom, @distance)
* NTSSimplifyVW(@geom, @distance)
* NTSSortByLength(@geom)
* NTSSortByArea(@geom)
* NTSSortByHilbertCode(@geom)
* NTSSortByMortonCode(@geom)
* NTSKdTreeQuery(@geompts, @geomquery, @tolerance)
* NTSKdTreeQueryRepeated(@geompts, @geomqueryEnv, @tolerance)
* NTSSTRtreeBounds(@geoms)
* NTSSTRtreeQuery(@geoms, @geomqueryEnv)
* NTSStrTreeNN(@geoms, @geom)
* NTSStrTreeNNInSet(@geoms)
* NTSStrTreeNNk(@geoms, @geom, @k)
* NTSQuadTreeQuery(@geoms, @geomqueryEnv)
* NTSMonotoneChains(@geom)
* NTSCentroid(@geom)
* NTSCircumcentre(@geom)
* NTSCircumcentreDD(@geom)
* NTSPerpendicularBisectors(@geom)
* NTSInCentre(@geom)
* NTSAngleBisectors(@geom)
* NTSInvalidLocations(@geom)
* NTSInvalidGeoms(@geom)
