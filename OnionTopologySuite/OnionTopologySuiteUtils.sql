-- $manifold$

-- Functions from Script from OnionTopologySuite.dll
-- 
--

FUNCTION GeomToBytes(@geom GEOM) VARBINARY
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomToBytes';

FUNCTION GeomFromBytes(@geombytes VARBINARY) GEOM
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomFromBytes';

FUNCTION GeomBytesToFile(@geom GEOM, @path VARCHAR) VARBINARY
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomBytesToFile';

FUNCTION GeomRoundtripNts(@geom GEOM) GEOM
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomRoundtripNts';

FUNCTION GeomFromWktNTS(@wkt VARCHAR) GEOM
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomFromWktNTS';

