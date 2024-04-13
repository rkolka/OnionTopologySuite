-- $manifold$
-- $include$ [OnionTopologySuiteWktGEOM.sql]

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

--CREATE TABLE [ResultsWKT] (
--  [mfd_id] INT64,
--  [signature] NVARCHAR,
--  [resultNVARCHAR] NVARCHAR,
--  INDEX [mfd_id_x] BTREE ([mfd_id])
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


DELETE FROM [ResultsWKT];

-- WKBOffsetCurveFunctions
VALUE @distance           FLOAT64 = 2;
VALUE @quadrantSegments   INT32 = 5;
VALUE @joinStyle          INT32 = 3;
--        Round = 1,
--        Mitre = 2,
--        Bevel = 3
VALUE @mitreLimit         FLOAT64 = 1;

INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTOffsetCurve(@lines, @distance)', NTSWKTOffsetCurve(@lines, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTOffsetCurveWithParams(@lines, @distance, @quadrantSegments, @joinStyle, @mitreLimit)', NTSWKTOffsetCurveWithParams(@lines, @distance, @quadrantSegments, @joinStyle, @mitreLimit) FROM (VALUES (1));


-- WKBBezierCurveFunctions
VALUE @alpha	          FLOAT64 = 1.2;  -- A curvedness parameter (0 is linear, 1 is round, >1 is increasingly curved)
VALUE @skew		          FLOAT64 = -1;  -- The skew parameter (0 is none, positive skews towards longer side, negative towards shorter
VALUE @controlPoints      GEOM = ( SELECT Last([Geom]) FROM [Drawing] where mfd_id = 5 ); -- create a name field

INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBezierCurveByAlpha(@geom, @alpha)', NTSWKTBezierCurveByAlpha(@geom, @alpha) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBezierCurveByAlphaAndSkew(@geom, @alpha, @skew)', NTSWKTBezierCurveByAlphaAndSkew(@geom, @alpha, @skew) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBezierCurveGetControlPoints(@geom, @alpha, @skew)', NTSWKTBezierCurveGetControlPoints(@geom, @alpha, @skew) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBezierCurveWithControlPoints(@geom, @controlPoints)', NTSWKTBezierCurveWithControlPoints(@geom, @controlPoints) FROM (VALUES (1));


-- WKBHullFunctions
VALUE @maxLength          FLOAT64 = 3.3;  -- The target maximum edge length
VALUE @isHolesAllowed     BOOLEAN = FALSE; -- A flag whether holes are allowed in the result
VALUE @isOuter            BOOLEAN = FALSE; -- A flag whether Hull is outer. 
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

INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTConcaveHullByLength(@geom, @maxLength, @isHolesAllowed)', NTSWKTConcaveHullByLength(@geom, @maxLength, @isHolesAllowed) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTConcaveHullByLengthRatio(@geom, @lengthRatio, @isHolesAllowed)', NTSWKTConcaveHullByLengthRatio(@geom, @lengthRatio, @isHolesAllowed) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonHull(@geom, @isOuter, @vertexNumFraction)', NTSWKTPolygonHull(@geom, @isOuter, @vertexNumFraction) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonHullByAreaDelta(@geom, @isOuter, @areaDeltaRatio)', NTSWKTPolygonHullByAreaDelta(@geom, @isOuter, @areaDeltaRatio) FROM (VALUES (1));



-- WKBAffineTransformationFunctions
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTTransformByVectors(@geom, @geomcontrol)', NTSWKTTransformByVectors(@geom, @geomcontrol) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTTransformByBaseline(@geom, @geomdestBaseline)', NTSWKTTransformByBaseline(@geom, @geomdestBaseline) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTScale(@geom, @scale)', NTSWKTScale(@geom, @scale) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTReflectInX(@geom)', NTSWKTReflectInX(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTReflectInY(@geom)', NTSWKTReflectInY(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRotate(@geom, @multipleOfPi)', NTSWKTRotate(@geom, @multipleOfPi) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTTranslateCentreToOrigin(@geom)', NTSWKTTranslateCentreToOrigin(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTTranslateToOrigin(@geom)', NTSWKTTranslateToOrigin(@geom) FROM (VALUES (1));

-- WKBBoundaryFunctions
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundary(@geom)', NTSWKTBoundary(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundaryMod2(@geom)', NTSWKTBoundaryMod2(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundaryEndpoint(@geom)', NTSWKTBoundaryEndpoint(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundaryMonoValentEnd(@geom)', NTSWKTBoundaryMonoValentEnd(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundaryMultiValentEnd(@geom)', NTSWKTBoundaryMultiValentEnd(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTComponentBuffers(@geom, @distance)', NTSWKTComponentBuffers(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferByComponents(@geom, @distance)', NTSWKTBufferByComponents(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferBySegments(@geom, @distance)', NTSWKTBufferBySegments(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferByChains(@geom, @distance, @maxChainSize)', NTSWKTBufferByChains(@geom, @distance, @maxChainSize) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBuffer(@geom, @distance)', NTSWKTBuffer(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)', NTSWKTBufferWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferWithSimplify(@geom, @distance, @simplifyFactor)', NTSWKTBufferWithSimplify(@geom, @distance, @simplifyFactor) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferOffsetCurve(@geom, @distance)', NTSWKTBufferOffsetCurve(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit)', NTSWKTBufferOffsetCurveWithParams(@geom, @distance, @quadrantSegments, @capStyle, @joinStyle, @mitreLimit) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferLineSimplifier(@geom, @distance)', NTSWKTBufferLineSimplifier(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferValidated(@geom, @distance)', NTSWKTBufferValidated(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferValidatedGeom(@geom, @distance)', NTSWKTBufferValidatedGeom(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSingleSidedBufferCurve(@geom, @distance)', NTSWKTSingleSidedBufferCurve(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSingleSidedBuffer(@geom, @distance)', NTSWKTSingleSidedBuffer(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBufferEach(@geom, @distance)', NTSWKTBufferEach(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTVariableBuffer(@geomline, @startDist, @endDist)', NTSWKTVariableBuffer(@geomline, @startDist, @endDist) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTVariableBufferMid(@geomline, @startDist, @midDist)', NTSWKTVariableBufferMid(@geomline, @startDist, @midDist) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTOrientationIndex(@geomsegment, @geomptGeom)', NTSWKTOrientationIndex(@geomsegment, @geomptGeom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTOrientationIndexDd(@geomsegment, @geomptGeom)', NTSWKTOrientationIndexDd(@geomsegment, @geomptGeom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersects(@geomg1, @geomg2)', NTSWKTSegmentIntersects(@geomg1, @geomg2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersection(@geomg1, @geomg2)', NTSWKTSegmentIntersection(@geomg1, @geomg2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersectionDd(@geomg1, @geomg2)', NTSWKTSegmentIntersectionDd(@geomg1, @geomg2) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTOctagonalEnvelope(@geom)', NTSWKTOctagonalEnvelope(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMinimumDiameter(@geom)', NTSWKTMinimumDiameter(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMinimumDiameterLength(@geom)', NTSWKTMinimumDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMinimumRectangle(@geom)', NTSWKTMinimumRectangle(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMinimumBoundingCircle(@geom)', NTSWKTMinimumBoundingCircle(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMinimumBoundingCircleDiameterLength(@geom)', NTSWKTMinimumBoundingCircleDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMaximumDiameter(@geom)', NTSWKTMaximumDiameter(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMaximumDiameterLength(@geom)', NTSWKTMaximumDiameterLength(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTBoundary(@geom)', NTSWKTBoundary(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTConvexHull(@geom)', NTSWKTConvexHull(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCentroid(@geom)', NTSWKTCentroid(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInteriorPoint(@geom)', NTSWKTInteriorPoint(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDensify(@geom, @distance)', NTSWKTDensify(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractLines(@geom)', NTSWKTExtractLines(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPointsToLine(@points)', NTSWKTPointsToLine(@points) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLineToPolygon(@line)', NTSWKTLineToPolygon(@line) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTToPoints(@area, @line)', NTSWKTToPoints(@area, @line) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTToLines(@area, @points)', NTSWKTToLines(@area, @points) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTToGeometryCollection(@area, @points)', NTSWKTToGeometryCollection(@area, @points) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomPointsInGrid(@geom, @nPts)', NTSWKTRandomPointsInGrid(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomPoints(@geom, @nPts)', NTSWKTRandomPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomRadialPoints(@geom, @nPts)', NTSWKTRandomRadialPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTHaltonPoints(@geom, @nPts)', NTSWKTHaltonPoints(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTHaltonPoints57(@geom, @nPts)', NTSWKTHaltonPoints57(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTHaltonPointsWithBases(@geom, @nPts, @basei, @basej)', NTSWKTHaltonPointsWithBases(@geom, @nPts, @basei, @basej) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomSegments(@geom, @nPts)', NTSWKTRandomSegments(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomSegmentsInGrid(@geom, @nPts)', NTSWKTRandomSegmentsInGrid(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomLineString(@geom, @nPts)', NTSWKTRandomLineString(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTRandomRectilinearWalk(@geom, @nPts)', NTSWKTRandomRectilinearWalk(@geom, @nPts) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGrid(@geom, @nCells)', NTSWKTGrid(@geom, @nCells) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGridPoints(@geom, @nCells)', NTSWKTGridPoints(@geom, @nCells) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSupercircle3(@geom, @nPts)', NTSWKTSupercircle3(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSquircle(@geom, @nPts)', NTSWKTSquircle(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSupercircle5(@geom, @nPts)', NTSWKTSupercircle5(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSupercirclePoint5(@geom, @nPts)', NTSWKTSupercirclePoint5(@geom, @nPts) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSupercircle(@geom, @nPts, @pow)', NTSWKTSupercircle(@geom, @nPts, @pow) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPointFieldCentroidStar(@geomptsGeom)', NTSWKTPointFieldCentroidStar(@geomptsGeom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPointFieldStar(@geomptsGeom, @geomcentrePt)', NTSWKTPointFieldStar(@geomptsGeom, @geomcentrePt) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiffVerticesBoth(@geoma, @geomb)', NTSWKTDiffVerticesBoth(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiffVertices(@geoma, @geomb)', NTSWKTDiffVertices(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiffSegments(@geoma, @geomb)', NTSWKTDiffSegments(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiffSegmentsBoth(@geoma, @geomb)', NTSWKTDiffSegmentsBoth(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDuplicateSegments(@geoma)', NTSWKTDuplicateSegments(@geoma) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSingleSegments(@geoma)', NTSWKTSingleSegments(@geoma) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDissolve(@geom)', NTSWKTDissolve(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDistance(@geoma, @geomb)', NTSWKTDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsWithinDistance(@geoma, @geomb, @dist)', NTSWKTIsWithinDistance(@geoma, @geomb, @dist) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTNearestPoints(@geoma, @geomb)', NTSWKTNearestPoints(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiscreteHausdorffDistanceLine(@geoma, @geomb)', NTSWKTDiscreteHausdorffDistanceLine(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDensifiedDiscreteHausdorffDistanceLine(@geoma, @geomb, @frac)', NTSWKTDensifiedDiscreteHausdorffDistanceLine(@geoma, @geomb, @frac) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiscreteOrientedHausdorffDistanceLine(@geoma, @geomb)', NTSWKTDiscreteOrientedHausdorffDistanceLine(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiscreteHausdorffDistance(@geoma, @geomb)', NTSWKTDiscreteHausdorffDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDiscreteOrientedHausdorffDistance(@geoma, @geomb)', NTSWKTDiscreteOrientedHausdorffDistance(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDistanceIndexed(@geoma, @geomb)', NTSWKTDistanceIndexed(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTNearestPointsIndexed(@geoma, @geomb)', NTSWKTNearestPointsIndexed(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTNearestPointsIndexedAll(@geoma, @geomb)', NTSWKTNearestPointsIndexedAll(@geoma, @geomb) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTAddHole(@geompolyGeom, @geomhole)', NTSWKTAddHole(@geompolyGeom, @geomhole) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLength(@geom)', NTSWKTLength(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTArea(@geom)', NTSWKTArea(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsCCW(@geom)', NTSWKTIsCCW(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsSimple(@geom)', NTSWKTIsSimple(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsValid(@geom)', NTSWKTIsValid(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsRectangle(@geom)', NTSWKTIsRectangle(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsClosed(@geom)', NTSWKTIsClosed(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTEnvelope(@geom)', NTSWKTEnvelope(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTReverse(@geom)', NTSWKTReverse(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTNormalize(@geom)', NTSWKTNormalize(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSnap(@geom, @geom2, @distance)', NTSWKTSnap(@geom, @geom2, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGetGeometryN(@geom, @i)', NTSWKTGetGeometryN(@geom, @i) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGetPolygonShell(@geom)', NTSWKTGetPolygonShell(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGetPolygonHoles(@geom)', NTSWKTGetPolygonHoles(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGetPolygonHoleN(@geom, @i)', NTSWKTGetPolygonHoleN(@geom, @i) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTGetCoordinates(@geom)', NTSWKTGetCoordinates(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractPoint(@geom, @index)', NTSWKTExtractPoint(@geom, @index) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractLine(@geom, @start, @end)', NTSWKTExtractLine(@geom, @start, @end) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTProject(@geom, @geom2)', NTSWKTProject(@geom, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTProjectIndex(@geom, @geom2)', NTSWKTProjectIndex(@geom, @geom2) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMergeLines(@geom)', NTSWKTMergeLines(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSequenceLines(@geom)', NTSWKTSequenceLines(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractLines(@geom)', NTSWKTExtractLines(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractSegments(@geom)', NTSWKTExtractSegments(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTExtractChains(@geom, @maxChainSize)', NTSWKTExtractChains(@geom, @maxChainSize) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDissolve(@geom)', NTSWKTDissolve(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersects(@geom1, @geom2)', NTSWKTSegmentIntersects(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersection(@geom1, @geom2)', NTSWKTSegmentIntersection(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSegmentIntersectionDd(@geom1, @geom2)', NTSWKTSegmentIntersectionDd(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLineIntersection(@geom1, @geom2)', NTSWKTLineIntersection(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLineIntersectionDD(@geom1, @geom2)', NTSWKTLineIntersectionDD(@geom1, @geom2) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTReflectPoint(@geom1, @geom2)', NTSWKTReflectPoint(@geom1, @geom2) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsNodingValid(@geom)', NTSWKTIsNodingValid(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIsSegmentNodingValid(@geom)', NTSWKTIsSegmentNodingValid(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTFindOneNode(@geom)', NTSWKTFindOneNode(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTFindNodes(@geom)', NTSWKTFindNodes(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTFindInteriorNodes(@geom)', NTSWKTFindInteriorNodes(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIntersectionCount(@geom)', NTSWKTIntersectionCount(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInteriorIntersectionCount(@geom)', NTSWKTInteriorIntersectionCount(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMCIndexNodingWithPrecision(@geom, @scaleFactor)', NTSWKTMCIndexNodingWithPrecision(@geom, @scaleFactor) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMCIndexNoding(@geom)', NTSWKTMCIndexNoding(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSnapRoundWithPrecision(@geom, @scaleFactor)', NTSWKTSnapRoundWithPrecision(@geom, @scaleFactor) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTScaledNoding(@geom, @scaleFactor)', NTSWKTScaledNoding(@geom, @scaleFactor) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLogoLines(@geom)', NTSWKTLogoLines(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTLogoBuffer(@geom, @distance)', NTSWKTLogoBuffer(@geom, @distance) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIntersection(@geoma, @geomb)', NTSWKTIntersection(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTUnion(@geoma, @geomb)', NTSWKTUnion(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSymDifference(@geoma, @geomb)', NTSWKTSymDifference(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDifference(@geoma, @geomb)', NTSWKTDifference(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDifferenceBa(@geoma, @geomb)', NTSWKTDifferenceBa(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTUnaryUnion(@geoma)', NTSWKTUnaryUnion(@geoma) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTUnionUsingGeometryCollection(@geoma, @geomb)', NTSWKTUnionUsingGeometryCollection(@geoma, @geomb) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTClip(@geoma, @geommask)', NTSWKTClip(@geoma, @geommask) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonize(@geom)', NTSWKTPolygonize(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonizeValidPolygonal(@geom)', NTSWKTPolygonizeValidPolygonal(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonizeDangles(@geom)', NTSWKTPolygonizeDangles(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonizeCutEdges(@geom)', NTSWKTPolygonizeCutEdges(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonizeInvalidRingLines(@geom)', NTSWKTPolygonizeInvalidRingLines(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPolygonizeAllErrors(@geom)', NTSWKTPolygonizeAllErrors(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTReducePrecisionPointwise(@geom, @scaleFactor)', NTSWKTReducePrecisionPointwise(@geom, @scaleFactor) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTIntersects(@geoma, @geommask)', NTSWKTIntersects(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCovers(@geoma, @geommask)', NTSWKTCovers(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCoveredBy(@geoma, @geommask)', NTSWKTCoveredBy(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTDisjoint(@geoma, @geommask)', NTSWKTDisjoint(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTValid(@geoma)', NTSWKTValid(@geoma) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInvalid(@geoma)', NTSWKTInvalid(@geoma) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTAreaGreater(@geoma, @minArea)', NTSWKTAreaGreater(@geoma, @minArea) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTAreaZero(@geoma)', NTSWKTAreaZero(@geoma) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTWithin(@geoma, @geommask)', NTSWKTWithin(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInteriorPointWithin(@geoma, @geommask)', NTSWKTInteriorPointWithin(@geoma, @geommask) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTwithinDistance(@geoma, @geommask, @maximumDistance)', NTSWKTwithinDistance(@geoma, @geommask, @maximumDistance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTwithinDistanceIndexed(@geoma, @geommask, @maximumDistance)', NTSWKTwithinDistanceIndexed(@geoma, @geommask, @maximumDistance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTFirstNComponents(@geom, @n)', NTSWKTFirstNComponents(@geom, @n) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSimplifyDp(@geom, @distance)', NTSWKTSimplifyDp(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSimplifyTp(@geom, @distance)', NTSWKTSimplifyTp(@geom, @distance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSimplifyVW(@geom, @distance)', NTSWKTSimplifyVW(@geom, @distance) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSortByLength(@geom)', NTSWKTSortByLength(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSortByArea(@geom)', NTSWKTSortByArea(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSortByHilbertCode(@geom)', NTSWKTSortByHilbertCode(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSortByMortonCode(@geom)', NTSWKTSortByMortonCode(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTKdTreeQuery(@geompts, @geomquery, @tolerance)', NTSWKTKdTreeQuery(@geompts, @geomquery, @tolerance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTKdTreeQueryRepeated(@geompts, @geomqueryEnv, @tolerance)', NTSWKTKdTreeQueryRepeated(@geompts, @geomqueryEnv, @tolerance) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSTRtreeBounds(@geoms)', NTSWKTSTRtreeBounds(@geoms) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTSTRtreeQuery(@geoms, @geomqueryEnv)', NTSWKTSTRtreeQuery(@geoms, @geomqueryEnv) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTStrTreeNN(@geoms, @geom)', NTSWKTStrTreeNN(@geoms, @geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTStrTreeNNInSet(@geoms)', NTSWKTStrTreeNNInSet(@geoms) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTStrTreeNNk(@geoms, @geom, @k)', NTSWKTStrTreeNNk(@geoms, @geom, @k) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTQuadTreeQuery(@geoms, @geomqueryEnv)', NTSWKTQuadTreeQuery(@geoms, @geomqueryEnv) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTMonotoneChains(@geom)', NTSWKTMonotoneChains(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCentroid(@geom)', NTSWKTCentroid(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCircumcentre(@geom)', NTSWKTCircumcentre(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTCircumcentreDD(@geom)', NTSWKTCircumcentreDD(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTPerpendicularBisectors(@geom)', NTSWKTPerpendicularBisectors(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInCentre(@geom)', NTSWKTInCentre(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTAngleBisectors(@geom)', NTSWKTAngleBisectors(@geom) FROM (VALUES (1));


INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInvalidLocations(@geom)', NTSWKTInvalidLocations(@geom) FROM (VALUES (1));
INSERT INTO [ResultsWKT] ([signature], [resultNVARCHAR]) SELECT 'NTSWKTInvalidGeoms(@geom)', NTSWKTInvalidGeoms(@geom) FROM (VALUES (1));