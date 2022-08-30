using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TrySpatialIndexFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryKdTreeQuery(byte[] wKBpts, byte[] wKBquery, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry query = wKBReader.Read(wKBquery);
        Geometry result = SpatialIndexFunctions.KdTreeQuery(pts, query, tolerance);
        return wKBWriter.Write(result);
    }

    public static byte[] TryKdTreeQueryRepeated(byte[] wKBpts, byte[] wKBqueryEnv, double tolerance)
    {
        Geometry pts = wKBReader.Read(wKBpts);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.KdTreeQueryRepeated(pts, queryEnv, tolerance);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySTRtreeBounds(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.STRtreeBounds(geoms);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySTRtreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.STRtreeQuery(geoms, queryEnv);
        return wKBWriter.Write(result);
    }

    public static byte[] TryStrTreeNN(byte[] wKBGeoms, byte[] wKBGeom)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNN(geoms, geom);
        return wKBWriter.Write(result);
    }

    public static byte[] TryStrTreeNNInSet(byte[] wKBGeoms)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry result = SpatialIndexFunctions.StrTreeNNInSet(geoms);
        return wKBWriter.Write(result);
    }

    public static byte[] TryStrTreeNNk(byte[] wKBGeoms, byte[] wKBGeom, int k)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.StrTreeNNk(geoms, geom, k);
        return wKBWriter.Write(result);
    }

    public static byte[] TryQuadTreeQuery(byte[] wKBGeoms, byte[] wKBqueryEnv)
    {
        Geometry geoms = wKBReader.Read(wKBGeoms);
        Geometry queryEnv = wKBReader.Read(wKBqueryEnv);
        Geometry result = SpatialIndexFunctions.QuadTreeQuery(geoms, queryEnv);
        return wKBWriter.Write(result);
    }

    public static byte[] TryMonotoneChains(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = SpatialIndexFunctions.MonotoneChains(geom);
        return wKBWriter.Write(result);
    }
}

