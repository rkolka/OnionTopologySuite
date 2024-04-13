using NetTopologySuite.Geometries;
using NetTopologySuite.Simplify;

public static class WKTSimplificationFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTSimplifyDp(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = DouglasPeuckerSimplifier.Simplify(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSimplifyTp(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = TopologyPreservingSimplifier.Simplify(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSimplifyVW(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = VWSimplifier.Simplify(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}
