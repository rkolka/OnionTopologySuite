-- $manifold$

-- Functions from Script from OnionTopologySuite.dll
-- 
--

--- Takes WKT string, converts it to NTS-geom and uses GeomMfdFromNTS to convert it to MFD-geom
FUNCTION GeomWktNtsMfd(@wkt VARCHAR) GEOM
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomWktNtsMfd';

FUNCTION GeomToBytes(@geom GEOM) VARBINARY
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomToBytes';


FUNCTION GeomFromBytes(@geombytes VARBINARY) GEOM
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomFromBytes';

FUNCTION GeomBytesToFile(@geom GEOM, @path VARCHAR) VARBINARY
  AS SCRIPT FILE 'OnionTopologySuite.dll' ENTRY 'Script.GeomBytesToFile';

