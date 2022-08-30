using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryDistanceFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static double TryDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.Distance(a, b);
        return result;
    }

    public static bool TryIsWithinDistance(byte[] wKBa, byte[] wKBb, double dist)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        bool result = DistanceFunctions.IsWithinDistance(a, b, dist);
        return result;
    }

    public static byte[] TryNearestPoints(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPoints(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DiscreteHausdorffDistanceLine(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDensifiedDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb, double frac)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DensifiedDiscreteHausdorffDistanceLine(a, b, frac);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDiscreteOrientedHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.DiscreteOrientedHausdorffDistanceLine(a, b);
        return wKBWriter.Write(result);
    }

    public static double TryDiscreteHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DiscreteHausdorffDistance(a, b);
        return result;
    }

    public static double TryDiscreteOrientedHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DiscreteOrientedHausdorffDistance(a, b);
        return result;
    }

    public static double TryDistanceIndexed(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        double result = DistanceFunctions.DistanceIndexed(a, b);
        return result;
    }

    public static byte[] TryNearestPointsIndexed(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPointsIndexed(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryNearestPointsIndexedAll(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = DistanceFunctions.NearestPointsIndexedAll(a, b);
        return wKBWriter.Write(result);
    }
}

