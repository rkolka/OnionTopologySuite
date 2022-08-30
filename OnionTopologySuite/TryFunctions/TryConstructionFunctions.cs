using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryConstructionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryOctagonalEnvelope(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.OctagonalEnvelope(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryMinimumDiameter(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumDiameter(g);
        return wKBWriter.Write(result);
    }
    public static double TryMinimumDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MinimumDiameterLength(g);
        return result;
    }

    public static byte[] TryMinimumRectangle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumRectangle(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryMinimumBoundingCircle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MinimumBoundingCircle(g);
        return wKBWriter.Write(result);
    }
    public static double TryMinimumBoundingCircleDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MinimumBoundingCircleDiameterLength(g);
        return result;
    }

    public static byte[] TryMaximumDiameter(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.MaximumDiameter(g);
        return wKBWriter.Write(result);
    }
    public static double TryMaximumDiameterLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = ConstructionFunctions.MaximumDiameterLength(g);
        return result;
    }

    public static byte[] TryConvexHull(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.ConvexHull(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryCentroid(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.Centroid(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryInteriorPoint(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.InteriorPoint(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDensify(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConstructionFunctions.Densify(g, distance);
        return wKBWriter.Write(result);
    }

}

