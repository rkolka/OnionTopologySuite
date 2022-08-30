using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryPrecisionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryReducePrecisionPointwise(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = PrecisionFunctions.ReducePrecisionPointwise(geom, scaleFactor);
        return wKBWriter.Write(result);
    }
}
