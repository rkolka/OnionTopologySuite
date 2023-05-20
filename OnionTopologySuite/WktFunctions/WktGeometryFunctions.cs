using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

/// <summary>
/// Implementations for various geometry functions.
/// </summary>
/// <author>Martin Davis</author>
public static class WKTGeometryFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static string WKTLength(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            double result = GeometryFunctions.Length(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTArea(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            double result = GeometryFunctions.Area(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTIsCCW(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            bool result = GeometryFunctions.IsCCW(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTIsSimple(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            bool result = GeometryFunctions.IsSimple(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTIsValid(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            bool result = GeometryFunctions.IsValid(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTIsRectangle(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            bool result = GeometryFunctions.IsRectangle(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTIsClosed(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            bool result = GeometryFunctions.IsClosed(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTEnvelope(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.Envelope(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTReverse(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.Reverse(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTNormalize(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.Normalize(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSnap(byte[] wKBGeom, byte[] wKBGeom2, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = GeometryFunctions.Snap(g, g2, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTGetGeometryN(byte[] wKBGeom, int i)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.GetGeometryN(g, i);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTGetPolygonShell(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.GetPolygonShell(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }


    public static string WKTGetPolygonHoles(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.GetPolygonHoles(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTGetPolygonHoleN(byte[] wKBGeom, int i)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.GetPolygonHoleN(g, i);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTGetCoordinates(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = GeometryFunctions.GetCoordinates(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}

