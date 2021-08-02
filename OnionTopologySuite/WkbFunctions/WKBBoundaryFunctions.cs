using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;
using NetTopologySuite.Operation;

using Open.Topology.TestRunner.Functions;

public class WKBBoundaryFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBboundary(byte[] wKBGeom) 
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.Boundary(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBboundaryMod2(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMod2(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBboundaryEndpoint(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryEndpoint(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBboundaryMonoValentEnd(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMonoValentEnd(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBboundaryMultiValentEnd(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BoundaryFunctions.BoundaryMultiValentEnd(g);
        return wKBWriter.Write(result);
    }

}
