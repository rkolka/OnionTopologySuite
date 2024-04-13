using NetTopologySuite.Geometries;
using NetTopologySuite.Simplify;

public static class WKBSimplificationFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBSimplifyDp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = DouglasPeuckerSimplifier.Simplify(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSimplifyTp(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TopologyPreservingSimplifier.Simplify(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSimplifyVW(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = VWSimplifier.Simplify(g, distance);
        return wKBWriter.Write(result);
    }
}
