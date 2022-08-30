using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TryBoundaryFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] Tryboundary(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.Boundary(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryboundaryMod2(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMod2(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryboundaryEndpoint(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryEndpoint(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryboundaryMonoValentEnd(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMonoValentEnd(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryboundaryMultiValentEnd(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMultiValentEnd(g);
        return wKBWriter.Write(result);
    }

}
