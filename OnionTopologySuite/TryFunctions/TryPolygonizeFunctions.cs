using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTPolygonizeFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTPolygonize(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.Polygonize(g);
        return result.ToString();
    }

    public static string WKTPolygonizeValidPolygonal(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeValidPolygonal(g);
        return result.ToString();
    }

    public static string WKTPolygonizeDangles(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeDangles(g);
        return result.ToString();
    }

    public static string WKTPolygonizeCutEdges(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeCutEdges(g);
        return result.ToString();
    }

    public static string WKTPolygonizeInvalidRingLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeInvalidRingLines(g);
        return result.ToString();
    }

    public static string WKTPolygonizeAllErrors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeAllErrors(g);
        return result.ToString();
    }
}

