using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryLinearReferencingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryExtractPoint(byte[] wKBGeom, double index)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LinearReferencingFunctions.ExtractPoint(g, index);
        return wKBWriter.Write(result);
    }

    public static byte[] TryExtractLine(byte[] wKBGeom, double start, double end)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LinearReferencingFunctions.ExtractLine(g, start, end);
        return wKBWriter.Write(result);
    }

    public static byte[] TryProject(byte[] wKBGeom, byte[] wKBGeom2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LinearReferencingFunctions.Project(g, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryExtractLineByGeom(byte[] wKBGeom, byte[] wKBGeom2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LinearReferencingFunctions.ExtractLineByGeom(g, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryExtractLineByGeomBounds(byte[] wKBGeom, byte[] wKBGeom2, double b1, double b2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LinearReferencingFunctions.ExtractLineByGeomBounds(g, g2, b1, b2);
        return wKBWriter.Write(result);
    }
    public static double TryProjectIndex(byte[] wKBGeom, byte[] wKBGeom2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        double result = LinearReferencingFunctions.ProjectIndex(g, g2);
        return result;
    }
}

