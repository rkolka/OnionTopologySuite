using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTConstructionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTOctagonalEnvelope(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.OctagonalEnvelope(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTMinimumDiameter(byte[] wKBGeom)
    {
        try
        {

            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.MinimumDiameter(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTMinimumDiameterLength(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            double result = ConstructionFunctions.MinimumDiameterLength(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTMinimumRectangle(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.MinimumRectangle(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTMinimumBoundingCircle(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.MinimumBoundingCircle(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTMinimumBoundingCircleDiameterLength(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            double result = ConstructionFunctions.MinimumBoundingCircleDiameterLength(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTMaximumDiameter(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.MaximumDiameter(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTMaximumDiameterLength(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            double result = ConstructionFunctions.MaximumDiameterLength(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTConvexHull(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.ConvexHull(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTCentroid(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.Centroid(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
    public static string WKTInteriorPoint(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.InteriorPoint(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTDensify(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = ConstructionFunctions.Densify(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

}

