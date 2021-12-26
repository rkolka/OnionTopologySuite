using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class WKBTriangleFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBCircumcentre(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.Circumcentre(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBCircumcentreDD(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.CircumcentreDD(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBPerpendicularBisectors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.PerpendicularBisectors(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBInCentre(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.InCentre(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBAngleBisectors(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = TriangleFunctions.AngleBisectors(g);
        return wKBWriter.Write(result);
    }


}


