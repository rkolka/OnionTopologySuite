-- $manifold$
-- $include$ [OnionTopologySuiteGEOM.sql]

--CREATE DRAWING [Drawing] (
--  PROPERTY 'FieldGeom' 'Geom',
--  PROPERTY 'Table' '[Drawing Table]'
--);
--CREATE TABLE [Drawing Table] (
--  [mfd_id] INT64,
--  [Geom] GEOM,
--  INDEX [mfd_id_x] BTREE ([mfd_id]),
--  INDEX [Geom_x] RTREE ([Geom]),
--  PROPERTY 'FieldCoordSystem.Geom' '{ "Axes": "XY", "Base": "WGS 84 (EPSG:4326)", "CenterLat": 0, "CenterLon": 0, "Eccentricity": 0.08181919084262149, "MajorAxis": 6378137, "Name": "WGS 84 \\/ Pseudo-Mercator (EPSG:3857)", "System": "Pseudo Mercator", "Unit": "Meter", "UnitScale": 1, "UnitShort": "m" }'
--);

--CREATE TABLE [Results] (
--  [mfd_id] INT64,
--  [signature] NVARCHAR,
--  [resultNumber] FLOAT64,
--  [resultbOOLEAN] BOOLEAN,
--  [resultGeom] GEOM,
--  INDEX [mfd_id_x] BTREE ([mfd_id]),
--  INDEX [resultGeom_x] RTREE ([resultGeom])
--);
--CREATE DRAWING [Results Drawing] (
--  PROPERTY 'FieldGeom' 'resultGeom',
--  PROPERTY 'StyleAreaColorBack' '{ "Value": -16777216 }',
--  PROPERTY 'Table' '[Results]'
--);


VALUE @area GEOM = ( SELECT First([Geom]) FROM [Drawing] where GeomIsArea([Geom]) );
VALUE @line GEOM = ( SELECT First([Geom]) FROM [Drawing] where GeomIsLine([Geom]) );
VALUE @point GEOM = ( SELECT First([Geom]) FROM [Drawing] where GeomIsPoint([Geom]) );

VALUE @area2 GEOM = ( SELECT Last([Geom]) FROM [Drawing] where GeomIsArea([Geom]) );
VALUE @line2 GEOM = ( SELECT Last([Geom]) FROM [Drawing] where GeomIsLine([Geom]) );
VALUE @point2 GEOM = ( SELECT Last([Geom]) FROM [Drawing] where GeomIsPoint([Geom]) );


VALUE @areas GEOM = ( SELECT GeomMergeAreas([Geom]) FROM [Drawing] where GeomIsArea([Geom]) );
VALUE @lines GEOM = ( SELECT GeomMergeLines([Geom]) FROM [Drawing] where GeomIsLine([Geom]) );
VALUE @points GEOM = ( SELECT GeomMergePoints([Geom]) FROM [Drawing] where GeomIsPoint([Geom]) );


VALUE @basei              INT32 = 6;  -- Halton sequence
VALUE @basej              INT32 = 7;  -- Halton sequence
VALUE @capStyle           INT32 = 2;
--        Round = 1,
--        Flat = 2,
--        Square = 3
VALUE @dist               FLOAT64 = 2;
VALUE @distance           FLOAT64 = 2;
VALUE @end                FLOAT64 = 8; -- using the length along the line as the index.
VALUE @endDist            FLOAT64 = 2; -- Variable buffer
VALUE @frac               FLOAT64 = 0.5;
VALUE @geom               GEOM = @area;
VALUE @geom1              GEOM = @area;
VALUE @geom2              GEOM = @area2;
VALUE @geoma              GEOM = @area;
VALUE @geomb              GEOM = @area2;
VALUE @geomcentrePt       GEOM = @point;
VALUE @geomcontrol        GEOM = @line;
VALUE @geomdestBaseline   GEOM = @line;
VALUE @geomg1             GEOM = @area;
VALUE @geomg2             GEOM = @area2;
VALUE @geomhole           GEOM = @area2;
VALUE @geomline           GEOM = @line;
VALUE @geommask           GEOM = @area;
VALUE @geompolyGeom       GEOM = @area;
VALUE @geomptGeom         GEOM = @point;
VALUE @geompts            GEOM = @point;
VALUE @geomptsGeom        GEOM = @point;
VALUE @geomquery          GEOM = @area;
VALUE @geomqueryEnv       GEOM = @area;
VALUE @geoms              GEOM = @area;
VALUE @geomsegment        GEOM = @line;
VALUE @i                  INT32 = 2;
VALUE @index              INT32 = 3;

VALUE @k                  INT32 = 6;  --NNk
VALUE @maxChainSize       INT32 = 4;
VALUE @maximumDistance    FLOAT64 = 5;
VALUE @midDist            FLOAT64 = 3; -- Variable buffer
VALUE @minArea            FLOAT64 = 1;

VALUE @multipleOfPi       FLOAT64 = 0.31831;
VALUE @n                  INT32 = 3;
VALUE @nCells             INT32 = 8;
VALUE @nPts               INT32 = 6;
VALUE @pow                FLOAT64 = 2;
VALUE @scale              FLOAT64 = 2.2;
VALUE @scaleFactor        FLOAT64 = 2.3;
VALUE @simplifyFactor     FLOAT64 = 1.1;
VALUE @start              FLOAT64 = 2; --using the length along the line as the index.
VALUE @startDist          FLOAT64 = 1; -- Variable buffer
VALUE @tolerance          FLOAT64 = 0.001;


DELETE FROM [Results];

-- WKBOffsetCurveFunctions
VALUE @distance           FLOAT64 = 2;
VALUE @quadrantSegments   INT32 = 5;
VALUE @joinStyle          INT32 = 3;
--        Round = 1,
--        Mitre = 2,
--        Bevel = 3
VALUE @mitreLimit         FLOAT64 = 1;

INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'WKBOffsetCurve(@geom, @distance)', WKBOffsetCurve(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'WKBOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @joinStyle, @mitreLimit)', WKBOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @joinStyle, @mitreLimit) FROM (VALUES (1));


-- WKBBezierCurveFunctions
VALUE @alpha	          FLOAT64 = 1.2;  -- A curvedness parameter (0 is linear, 1 is round, >1 is increasingly curved)
VALUE @skew		          FLOAT64 = -1;  -- The skew parameter (0 is none, positive skews towards longer side, negative towards shorter
VALUE @controlPoints      GEOM = ( SELECT Last([Geom]) FROM [Drawing] where mfd_id = 5 ); -- create a name field

INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBezierCurveByAlpha(@geom, @alpha)', NTSBezierCurveByAlpha(@geom, @alpha) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBezierCurveByAlphaAndSkew(@geom, @alpha, @skew)', NTSBezierCurveByAlphaAndSkew(@geom, @alpha, @skew) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBezierCurveWithControlPoints(@geom, @controlPoints)', NTSBezierCurveWithControlPoints(@geom, @controlPoints) FROM (VALUES (1));


-- WKBHullFunctions
VALUE @maxLength          FLOAT64 = 3.3;  -- The target maximum edge length
VALUE @isHolesAllowed     BOOLEAN = FALSE; -- A flag whether holes are allowed in the result
VALUE @lengthRatio        FLOAT64 = 0.4;   -- The edge length ratio 
	-- is a fraction of the length difference between the longest and shortest edges 
	-- in the Delaunay Triangulation of the input points.

VALUE @vertexNumFraction  FLOAT64 = -0.6; -- The target fraction of number of input vertices in result
	-- Larger values compute less concave results. A value of 1 produces the convex hull; 
	-- a value of 0 produces the original geometry. 
	-- An outer hull is computed if the parameter is positive, 
	-- an inner hull is computed if it is negative.

VALUE @areaDeltaRatio     FLOAT64 = 0.5;  -- The target ratio of area difference to original area
	-- target parameter specifying the ratio of maximum difference in
    -- area to original area. Larger values compute less concave results. A value of
    -- 0 produces the original geometry. An outer hull is computed if the parameter
    -- is positive, an inner hull is computed if it is negative.

INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSConcaveHullByLength(@geom, @maxLength, @isHolesAllowed)', NTSConcaveHullByLength(@geom, @maxLength, @isHolesAllowed) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSConcaveHullByLengthRatio(@geom, @lengthRatio, @isHolesAllowed)', NTSConcaveHullByLengthRatio(@geom, @lengthRatio, @isHolesAllowed) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonHull(@geom, @vertexNumFraction)', NTSPolygonHull(@geom, @vertexNumFraction) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonHullByAreaDelta(@geom, @areaDeltaRatio)', NTSPolygonHullByAreaDelta(@geom, @areaDeltaRatio) FROM (VALUES (1));



-- WKBAffineTransformationFunctions
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSTransformByVectors(@geom, @geomcontrol)', NTSTransformByVectors(@geom, @geomcontrol) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSTransformByBaseline(@geom, @geomdestBaseline)', NTSTransformByBaseline(@geom, @geomdestBaseline) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSScale(@geom, @scale)', NTSScale(@geom, @scale) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSReflectInX(@geom)', NTSReflectInX(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSReflectInY(@geom)', NTSReflectInY(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRotate(@geom, @multipleOfPi)', NTSRotate(@geom, @multipleOfPi) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSTranslateCentreToOrigin(@geom)', NTSTranslateCentreToOrigin(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSTranslateToOrigin(@geom)', NTSTranslateToOrigin(@geom) FROM (VALUES (1));

-- WKBBoundaryFunctions
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundary(@geom)', NTSBoundary(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundaryMod2(@geom)', NTSBoundaryMod2(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundaryEndpoint(@geom)', NTSBoundaryEndpoint(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundaryMonoValentEnd(@geom)', NTSBoundaryMonoValentEnd(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundaryMultiValentEnd(@geom)', NTSBoundaryMultiValentEnd(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSComponentBuffers(@geom, @distance)', NTSComponentBuffers(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferByComponents(@geom, @distance)', NTSBufferByComponents(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferBySegments(@geom, @distance)', NTSBufferBySegments(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferByChains(@geom, @distance, @maxChainSize)', NTSBufferByChains(@geom, @distance, @maxChainSize) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBuffer(@geom, @distance)', NTSBuffer(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)', NTSBufferWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferWithSimplify(@geom, @distance, @simplifyFactor)', NTSBufferWithSimplify(@geom, @distance, @simplifyFactor) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferOffsetCurve(@geom, @distance)', NTSBufferOffsetCurve(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)', NTSBufferOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferLineSimplifier(@geom, @distance)', NTSBufferLineSimplifier(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferValidated(@geom, @distance)', NTSBufferValidated(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferValidatedGeom(@geom, @distance)', NTSBufferValidatedGeom(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSingleSidedBufferCurve(@geom, @distance)', NTSSingleSidedBufferCurve(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSingleSidedBuffer(@geom, @distance)', NTSSingleSidedBuffer(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBufferEach(@geom, @distance)', NTSBufferEach(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSVariableBuffer(@geomline, @startDist, @endDist)', NTSVariableBuffer(@geomline, @startDist, @endDist) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSVariableBufferMid(@geomline, @startDist, @midDist)', NTSVariableBufferMid(@geomline, @startDist, @midDist) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSOrientationIndex(@geomsegment, @geomptGeom)', NTSOrientationIndex(@geomsegment, @geomptGeom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSOrientationIndexDd(@geomsegment, @geomptGeom)', NTSOrientationIndexDd(@geomsegment, @geomptGeom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSegmentIntersects(@geomg1, @geomg2)', NTSSegmentIntersects(@geomg1, @geomg2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSegmentIntersection(@geomg1, @geomg2)', NTSSegmentIntersection(@geomg1, @geomg2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSegmentIntersectionDd(@geomg1, @geomg2)', NTSSegmentIntersectionDd(@geomg1, @geomg2) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSOctagonalEnvelope(@geom)', NTSOctagonalEnvelope(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMinimumDiameter(@geom)', NTSMinimumDiameter(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSMinimumDiameterLength(@geom)', NTSMinimumDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMinimumRectangle(@geom)', NTSMinimumRectangle(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMinimumBoundingCircle(@geom)', NTSMinimumBoundingCircle(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSMinimumBoundingCircleDiameterLength(@geom)', NTSMinimumBoundingCircleDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMaximumDiameter(@geom)', NTSMaximumDiameter(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSMaximumDiameterLength(@geom)', NTSMaximumDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSBoundary(@geom)', NTSBoundary(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSConvexHull(@geom)', NTSConvexHull(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCentroid(@geom)', NTSCentroid(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInteriorPoint(@geom)', NTSInteriorPoint(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDensify(@geom, @distance)', NTSDensify(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractLines(@geom)', NTSExtractLines(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPointsToLine(@points)', NTSPointsToLine(@points) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSLineToPolygon(@line)', NTSLineToPolygon(@line) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSToPoints(@area, @line)', NTSToPoints(@area, @line) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSToLines(@area, @points)', NTSToLines(@area, @points) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSToGeometryCollection(@area, @points)', NTSToGeometryCollection(@area, @points) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomPointsInGrid(@geom, @nPts)', NTSRandomPointsInGrid(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomPoints(@geom, @nPts)', NTSRandomPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomRadialPoints(@geom, @nPts)', NTSRandomRadialPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSHaltonPoints(@geom, @nPts)', NTSHaltonPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSHaltonPoints57(@geom, @nPts)', NTSHaltonPoints57(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSHaltonPointsWithBases(@geom, @nPts, @basei, @basej)', NTSHaltonPointsWithBases(@geom, @nPts, @basei, @basej) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomSegments(@geom, @nPts)', NTSRandomSegments(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomSegmentsInGrid(@geom, @nPts)', NTSRandomSegmentsInGrid(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomLineString(@geom, @nPts)', NTSRandomLineString(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSRandomRectilinearWalk(@geom, @nPts)', NTSRandomRectilinearWalk(@geom, @nPts) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGrid(@geom, @nCells)', NTSGrid(@geom, @nCells) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGridPoints(@geom, @nCells)', NTSGridPoints(@geom, @nCells) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSupercircle3(@geom, @nPts)', NTSSupercircle3(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSquircle(@geom, @nPts)', NTSSquircle(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSupercircle5(@geom, @nPts)', NTSSupercircle5(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSupercirclePoint5(@geom, @nPts)', NTSSupercirclePoint5(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSupercircle(@geom, @nPts, @pow)', NTSSupercircle(@geom, @nPts, @pow) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPointFieldCentroidStar(@geomptsGeom)', NTSPointFieldCentroidStar(@geomptsGeom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPointFieldStar(@geomptsGeom, @geomcentrePt)', NTSPointFieldStar(@geomptsGeom, @geomcentrePt) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiffVerticesBoth(@geoma, @geomb)', NTSDiffVerticesBoth(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiffVertices(@geoma, @geomb)', NTSDiffVertices(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiffSegments(@geoma, @geomb)', NTSDiffSegments(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiffSegmentsBoth(@geoma, @geomb)', NTSDiffSegmentsBoth(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDuplicateSegments(@geoma)', NTSDuplicateSegments(@geoma) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSingleSegments(@geoma)', NTSSingleSegments(@geoma) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDissolve(@geom)', NTSDissolve(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSDistance(@geoma, @geomb)', NTSDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsWithinDistance(@geoma, @geomb, @dist)', NTSIsWithinDistance(@geoma, @geomb, @dist) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSNearestPoints(@geoma, @geomb)', NTSNearestPoints(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiscreteHausdorffDistanceLine(@geoma, @geomb)', NTSDiscreteHausdorffDistanceLine(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDensifiedDiscreteHausdorffDistanceLine(@geoma, @geomb, @frac)', NTSDensifiedDiscreteHausdorffDistanceLine(@geoma, @geomb, @frac) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDiscreteOrientedHausdorffDistanceLine(@geoma, @geomb)', NTSDiscreteOrientedHausdorffDistanceLine(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSDiscreteHausdorffDistance(@geoma, @geomb)', NTSDiscreteHausdorffDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSDiscreteOrientedHausdorffDistance(@geoma, @geomb)', NTSDiscreteOrientedHausdorffDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSDistanceIndexed(@geoma, @geomb)', NTSDistanceIndexed(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSNearestPointsIndexed(@geoma, @geomb)', NTSNearestPointsIndexed(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSNearestPointsIndexedAll(@geoma, @geomb)', NTSNearestPointsIndexedAll(@geoma, @geomb) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSAddHole(@geompolyGeom, @geomhole)', NTSAddHole(@geompolyGeom, @geomhole) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSLength(@geom)', NTSLength(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSArea(@geom)', NTSArea(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsCCW(@geom)', NTSIsCCW(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsSimple(@geom)', NTSIsSimple(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsValid(@geom)', NTSIsValid(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsRectangle(@geom)', NTSIsRectangle(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsClosed(@geom)', NTSIsClosed(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSEnvelope(@geom)', NTSEnvelope(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSReverse(@geom)', NTSReverse(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSNormalize(@geom)', NTSNormalize(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSnap(@geom, @geom2, @distance)', NTSSnap(@geom, @geom2, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGetGeometryN(@geom, @i)', NTSGetGeometryN(@geom, @i) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGetPolygonShell(@geom)', NTSGetPolygonShell(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGetPolygonHoles(@geom)', NTSGetPolygonHoles(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGetPolygonHoleN(@geom, @i)', NTSGetPolygonHoleN(@geom, @i) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSGetCoordinates(@geom)', NTSGetCoordinates(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractPoint(@geom, @index)', NTSExtractPoint(@geom, @index) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractLine(@geom, @start, @end)', NTSExtractLine(@geom, @start, @end) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSProject(@geom, @geom2)', NTSProject(@geom, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSProjectIndex(@geom, @geom2)', NTSProjectIndex(@geom, @geom2) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMergeLines(@geom)', NTSMergeLines(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSequenceLines(@geom)', NTSSequenceLines(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractLines(@geom)', NTSExtractLines(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractSegments(@geom)', NTSExtractSegments(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSExtractChains(@geom, @maxChainSize)', NTSExtractChains(@geom, @maxChainSize) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDissolve(@geom)', NTSDissolve(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSSegmentIntersects(@geom1, @geom2)', NTSSegmentIntersects(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSegmentIntersection(@geom1, @geom2)', NTSSegmentIntersection(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSegmentIntersectionDd(@geom1, @geom2)', NTSSegmentIntersectionDd(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSLineIntersection(@geom1, @geom2)', NTSLineIntersection(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSLineIntersectionDD(@geom1, @geom2)', NTSLineIntersectionDD(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSReflectPoint(@geom1, @geom2)', NTSReflectPoint(@geom1, @geom2) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsNodingValid(@geom)', NTSIsNodingValid(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultBoolean]) SELECT 'NTSIsSegmentNodingValid(@geom)', NTSIsSegmentNodingValid(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSFindOneNode(@geom)', NTSFindOneNode(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSFindNodes(@geom)', NTSFindNodes(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSFindInteriorNodes(@geom)', NTSFindInteriorNodes(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSIntersectionCount(@geom)', NTSIntersectionCount(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultNumber]) SELECT 'NTSInteriorIntersectionCount(@geom)', NTSInteriorIntersectionCount(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMCIndexNodingWithPrecision(@geom, @scaleFactor)', NTSMCIndexNodingWithPrecision(@geom, @scaleFactor) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMCIndexNoding(@geom)', NTSMCIndexNoding(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSnapRoundWithPrecision(@geom, @scaleFactor)', NTSSnapRoundWithPrecision(@geom, @scaleFactor) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSScaledNoding(@geom, @scaleFactor)', NTSScaledNoding(@geom, @scaleFactor) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSLogoLines(@geom)', NTSLogoLines(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSLogoBuffer(@geom, @distance)', NTSLogoBuffer(@geom, @distance) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSIntersection(@geoma, @geomb)', NTSIntersection(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSUnion(@geoma, @geomb)', NTSUnion(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSymDifference(@geoma, @geomb)', NTSSymDifference(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDifference(@geoma, @geomb)', NTSDifference(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDifferenceBa(@geoma, @geomb)', NTSDifferenceBa(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSUnaryUnion(@geoma)', NTSUnaryUnion(@geoma) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSUnionUsingGeometryCollection(@geoma, @geomb)', NTSUnionUsingGeometryCollection(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSClip(@geoma, @geommask)', NTSClip(@geoma, @geommask) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonize(@geom)', NTSPolygonize(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonizeValidPolygonal(@geom)', NTSPolygonizeValidPolygonal(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonizeDangles(@geom)', NTSPolygonizeDangles(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonizeCutEdges(@geom)', NTSPolygonizeCutEdges(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonizeInvalidRingLines(@geom)', NTSPolygonizeInvalidRingLines(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPolygonizeAllErrors(@geom)', NTSPolygonizeAllErrors(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSReducePrecisionPointwise(@geom, @scaleFactor)', NTSReducePrecisionPointwise(@geom, @scaleFactor) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSIntersects(@geoma, @geommask)', NTSIntersects(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCovers(@geoma, @geommask)', NTSCovers(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCoveredBy(@geoma, @geommask)', NTSCoveredBy(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSDisjoint(@geoma, @geommask)', NTSDisjoint(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSValid(@geoma)', NTSValid(@geoma) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInvalid(@geoma)', NTSInvalid(@geoma) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSAreaGreater(@geoma, @minArea)', NTSAreaGreater(@geoma, @minArea) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSAreaZero(@geoma)', NTSAreaZero(@geoma) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSWithin(@geoma, @geommask)', NTSWithin(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInteriorPointWithin(@geoma, @geommask)', NTSInteriorPointWithin(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSwithinDistance(@geoma, @geommask, @maximumDistance)', NTSwithinDistance(@geoma, @geommask, @maximumDistance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSwithinDistanceIndexed(@geoma, @geommask, @maximumDistance)', NTSwithinDistanceIndexed(@geoma, @geommask, @maximumDistance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSFirstNComponents(@geom, @n)', NTSFirstNComponents(@geom, @n) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSimplifyDp(@geom, @distance)', NTSSimplifyDp(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSimplifyTp(@geom, @distance)', NTSSimplifyTp(@geom, @distance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSimplifyVW(@geom, @distance)', NTSSimplifyVW(@geom, @distance) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSortByLength(@geom)', NTSSortByLength(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSortByArea(@geom)', NTSSortByArea(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSortByHilbertCode(@geom)', NTSSortByHilbertCode(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSortByMortonCode(@geom)', NTSSortByMortonCode(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSKdTreeQuery(@geompts, @geomquery, @tolerance)', NTSKdTreeQuery(@geompts, @geomquery, @tolerance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSKdTreeQueryRepeated(@geompts, @geomqueryEnv, @tolerance)', NTSKdTreeQueryRepeated(@geompts, @geomqueryEnv, @tolerance) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSTRtreeBounds(@geoms)', NTSSTRtreeBounds(@geoms) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSSTRtreeQuery(@geoms, @geomqueryEnv)', NTSSTRtreeQuery(@geoms, @geomqueryEnv) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSStrTreeNN(@geoms, @geom)', NTSStrTreeNN(@geoms, @geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSStrTreeNNInSet(@geoms)', NTSStrTreeNNInSet(@geoms) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSStrTreeNNk(@geoms, @geom, @k)', NTSStrTreeNNk(@geoms, @geom, @k) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSQuadTreeQuery(@geoms, @geomqueryEnv)', NTSQuadTreeQuery(@geoms, @geomqueryEnv) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSMonotoneChains(@geom)', NTSMonotoneChains(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCentroid(@geom)', NTSCentroid(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCircumcentre(@geom)', NTSCircumcentre(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSCircumcentreDD(@geom)', NTSCircumcentreDD(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSPerpendicularBisectors(@geom)', NTSPerpendicularBisectors(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInCentre(@geom)', NTSInCentre(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSAngleBisectors(@geom)', NTSAngleBisectors(@geom) FROM (VALUES (1));


INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInvalidLocations(@geom)', NTSInvalidLocations(@geom) FROM (VALUES (1));
INSERT INTO [Results] ([signature], [resultGeom]) SELECT 'NTSInvalidGeoms(@geom)', NTSInvalidGeoms(@geom) FROM (VALUES (1));