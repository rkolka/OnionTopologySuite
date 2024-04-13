-- $manifold$

-- $include$ [OnionTopologySuiteUtils.sql]
-- Functions from Script from OnionTopologySuite.dll
-- 
--


GeomWkt(GeomRoundtripNts(
	StringWktGeom('GEOMETRYCOLLECTION (POLYGON ((0 200, 20 180, 20 140, 60 140, 200 0, 0 0, 0 200)),  POLYGON ((200 200, 0 200, 20 180, 60 180, 60 140, 200 0, 200 200)))')
))


GeomWkt(GeomRoundtripNts(
	StringWktGeom('POLYGON ((0 0, 0 200, 200 200, 200 0, 0 0),   (60 180, 20 180, 20 140, 60 140, 60 180),   (180 60, 140 60, 140 20, 180 20, 180 60))')
))

GeomWkt(GeomRoundtripNts(
	StringWktGeom('POLYGON ((0 0, 0 200, 200 200, 200 0, 0 0),   (60 180, 20 180, 20 140, 60 140, 60 180))')
))

GeomWkt(GeomRoundtripNts(
	StringWktGeom('GEOMETRYCOLLECTION (LINESTRING (80 0, 80 120, 120 120, 120 0),   MULTIPOINT ((20 60), (40 80), (60 60)))')
))

GeomWkt(GeomRoundtripNts(
	StringWktGeom('GEOMETRYCOLLECTION (POLYGON ((0 200, 20 180, 20 140, 60 140, 200 0, 0 0, 0 200)), POLYGON ((200 200, 0 200, 20 180, 60 180, 60 140, 200 0, 200 200)))')
))

GeomWkt(GeomFromWktNTS('GEOMETRYCOLLECTION (POLYGON ((0 200, 20 180, 20 140, 60 140, 200 0, 0 0, 0 200)), POLYGON ((200 200, 0 200, 20 180, 60 180, 60 140, 200 0, 200 200)))'))

