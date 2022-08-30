using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TryTriangleFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryCircumcentre(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.Circumcentre(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryCircumcentreDD(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.CircumcentreDD(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryPerpendicularBisectors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.PerpendicularBisectors(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryInCentre(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.InCentre(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryAngleBisectors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.AngleBisectors(g);
        return wKBWriter.Write(result);
    }


}


