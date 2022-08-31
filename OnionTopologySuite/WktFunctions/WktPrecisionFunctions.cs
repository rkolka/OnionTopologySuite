using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTPrecisionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTReducePrecisionPointwise(byte[] wKBGeom, double scaleFactor)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = PrecisionFunctions.ReducePrecisionPointwise(geom, scaleFactor);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}
