using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryConversionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryPointsToLine(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConversionFunctions.PointsToLine(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryLineToPolygon(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConversionFunctions.LineToPolygon(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryToPoints(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToPoints(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryToLines(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToLines(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryToGeometryCollection(byte[] wKBGeom, byte[] wKBGeom2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToGeometryCollection(g, g2);
        return wKBWriter.Write(result);
    }

}

