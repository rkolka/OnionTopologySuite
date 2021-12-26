using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBConstructionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBOctagonalEnvelope(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.OctagonalEnvelope(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBMinimumDiameter(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumDiameter(g);
        return wKBWriter.Write(result);
    }
    public static double WKBMinimumDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MinimumDiameterLength(g);
        return result;
    }

    public static byte[] WKBMinimumRectangle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumRectangle(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBMinimumBoundingCircle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumBoundingCircle(g);
        return wKBWriter.Write(result);
    }
    public static double WKBMinimumBoundingCircleDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MinimumBoundingCircleDiameterLength(g);
        return result;
    }

    public static byte[] WKBMaximumDiameter(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MaximumDiameter(g);
        return wKBWriter.Write(result);
    }
    public static double WKBMaximumDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MaximumDiameterLength(g);
        return result;
    }

    public static byte[] WKBConvexHull(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.ConvexHull(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBCentroid(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.Centroid(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBInteriorPoint(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.InteriorPoint(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDensify(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.Densify(g, distance);
        return wKBWriter.Write(result);
    }

}

