using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTConversionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTPointsToLine(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConversionFunctions.PointsToLine(g);
            return result.ToString();         }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTLineToPolygon(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConversionFunctions.LineToPolygon(g);
            return result.ToString();         }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTToPoints(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = ConversionFunctions.ToPoints(g1, g2);
            return result.ToString();         }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTToLines(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = ConversionFunctions.ToLines(g1, g2);
            return result.ToString();         }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTToGeometryCollection(byte[] wKBGeom, byte[] wKBGeom2)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = ConversionFunctions.ToGeometryCollection(g, g2);
            return result.ToString();         }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

