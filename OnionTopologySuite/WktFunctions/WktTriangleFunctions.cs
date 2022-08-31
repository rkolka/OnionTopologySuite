using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKTTriangleFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTCircumcentre(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TriangleFunctions.Circumcentre(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTCircumcentreDD(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TriangleFunctions.CircumcentreDD(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTPerpendicularBisectors(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TriangleFunctions.PerpendicularBisectors(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTInCentre(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TriangleFunctions.InCentre(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTAngleBisectors(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TriangleFunctions.AngleBisectors(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }


}


