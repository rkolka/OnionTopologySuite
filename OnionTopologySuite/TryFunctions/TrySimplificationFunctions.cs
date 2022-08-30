using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TrySimplificationFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TrySimplifyDp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyDp(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySimplifyTp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyTp(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySimplifyVW(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SimplificationFunctions.SimplifyVW(g, distance);
        return wKBWriter.Write(result);
    }
}
