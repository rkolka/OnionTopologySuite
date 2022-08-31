using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTSimplificationFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTSimplifyDp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyDp(g, distance);
        return result.ToString();
    }

    public static string WKTSimplifyTp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyTp(g, distance);
        return result.ToString();
    }

    public static string WKTSimplifyVW(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyVW(g, distance);
        return result.ToString();
    }
}
