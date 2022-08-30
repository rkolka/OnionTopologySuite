using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

/// <summary>
/// Implementations for various geometry functions.
/// </summary>
/// <author>Martin Davis</author>
public static class wKBGeometryFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static double TryLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = GeometryFunctions.Length(g);
        return result;
    }
    public static double TryArea(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = GeometryFunctions.Area(g);
        return result;
    }

    public static bool TryIsCCW(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsCCW(g);
        return result;
    }

    public static bool TryIsSimple(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsSimple(g);
        return result;
    }
    public static bool TryIsValid(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsValid(g);
        return result;
    }
    public static bool TryIsRectangle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsRectangle(g);
        return result;
    }
    public static bool TryIsClosed(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsClosed(g);
        return result;
    }

    public static byte[] TryEnvelope(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Envelope(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryReverse(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Reverse(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryNormalize(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Normalize(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySnap(byte[] wKBGeom, byte[] wKBGeom2, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = GeometryFunctions.Snap(g, g2, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] TryGetGeometryN(byte[] wKBGeom, int i)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetGeometryN(g, i);
        return wKBWriter.Write(result);
    }

    public static byte[] TryGetPolygonShell(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonShell(g);
        return wKBWriter.Write(result);
    }


    public static byte[] TryGetPolygonHoles(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonHoles(geom);
        return wKBWriter.Write(result);
    }

    public static byte[] TryGetPolygonHoleN(byte[] wKBGeom, int i)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonHoleN(g, i);
        return wKBWriter.Write(result);
    }

    public static byte[] TryGetCoordinates(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetCoordinates(g);
        return wKBWriter.Write(result);
    }
}

