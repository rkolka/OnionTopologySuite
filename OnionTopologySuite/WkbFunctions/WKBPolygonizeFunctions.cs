using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBPolygonizeFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBPolygonize(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.Polygonize(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPolygonizeValidPolygonal(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeValidPolygonal(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPolygonizeDangles(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeDangles(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPolygonizeCutEdges(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeCutEdges(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPolygonizeInvalidRingLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeInvalidRingLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPolygonizeAllErrors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeAllErrors(g);
        return wKBWriter.Write(result);
    }
}

