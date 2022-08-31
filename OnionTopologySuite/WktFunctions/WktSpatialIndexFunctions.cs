using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TrySpatialIndexFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTKdTreeQuery(byte[] wKBpts, byte[] wKBquery, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry query = wKBReader.Read(wKBquery);
        Geometry result = SpatialIndexFunctions.KdTreeQuery(pts, query, tolerance);
        return result.ToString();
    }

    public static string WKTKdTreeQueryRepeated(byte[] wKBpts, byte[] wKBqueryEnv, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.KdTreeQueryRepeated(pts, queryEnv, tolerance);
        return result.ToString();
    }

    public static string WKTSTRtreeBounds(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.STRtreeBounds(geoms);
        return result.ToString();
    }

    public static string WKTSTRtreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.STRtreeQuery(geoms, queryEnv);
        return result.ToString();
    }

    public static string WKTStrTreeNN(byte[] wKBGeoms, byte[] wKBGeom)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNN(geoms, geom);
        return result.ToString();
    }

    public static string WKTStrTreeNNInSet(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.StrTreeNNInSet(geoms);
        return result.ToString();
    }

    public static string WKTStrTreeNNk(byte[] wKBGeoms, byte[] wKBGeom, int k)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNNk(geoms, geom, k);
        return result.ToString();
    }

    public static string WKTQuadTreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.QuadTreeQuery(geoms, queryEnv);
        return result.ToString();
    }

    public static string WKTMonotoneChains(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.MonotoneChains(geom);
        return result.ToString();
    }
}

