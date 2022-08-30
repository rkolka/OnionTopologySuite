using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryPolygonizeFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryPolygonize(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.Polygonize(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPolygonizeValidPolygonal(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeValidPolygonal(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPolygonizeDangles(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeDangles(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPolygonizeCutEdges(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeCutEdges(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPolygonizeInvalidRingLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeInvalidRingLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPolygonizeAllErrors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = PolygonizeFunctions.PolygonizeAllErrors(g);
        return wKBWriter.Write(result);
    }
}

