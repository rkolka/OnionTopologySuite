using NetTopologySuite.Algorithm.Distance;
using NetTopologySuite.Geometries;
using NetTopologySuite.Operation.Distance;

using Open.Topology.TestRunner.Functions;

public static class WKBDistanceFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static double WKBDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.Distance(a, b);
        return result;
    }

    public static bool WKBIsWithinDistance(byte[] wKBa, byte[] wKBb, double dist)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        bool result = DistanceFunctions.IsWithinDistance(a, b, dist);
        return result;
    }

    public static byte[] WKBNearestPoints(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPoints(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DiscreteHausdorffDistanceLine(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDensifiedDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb, double frac)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DensifiedDiscreteHausdorffDistanceLine(a, b, frac);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDiscreteOrientedHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DiscreteOrientedHausdorffDistanceLine(a, b);
        return wKBWriter.Write(result);
    }

    public static double WKBDiscreteHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DiscreteHausdorffDistance(a, b);
        return result;
    }

    public static double WKBDiscreteOrientedHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DiscreteOrientedHausdorffDistance(a, b);
        return result;
    }

    public static double WKBDistanceIndexed(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DistanceIndexed(a, b);
        return result;
    }

    public static byte[] WKBNearestPointsIndexed(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPointsIndexed(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBNearestPointsIndexedAll(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPointsIndexedAll(a, b);
        return wKBWriter.Write(result);
    }
}

