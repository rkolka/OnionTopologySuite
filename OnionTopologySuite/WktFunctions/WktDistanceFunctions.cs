using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTDistanceFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTDistance(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            double result = DistanceFunctions.Distance(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTIsWithinDistance(byte[] wKBa, byte[] wKBb, double dist)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            bool result = DistanceFunctions.IsWithinDistance(a, b, dist);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTNearestPoints(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.NearestPoints(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.DiscreteHausdorffDistanceLine(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDensifiedDiscreteHausdorffDistanceLine(byte[] wKBa, byte[] wKBb, double frac)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.DensifiedDiscreteHausdorffDistanceLine(a, b, frac);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiscreteOrientedHausdorffDistanceLine(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.DiscreteOrientedHausdorffDistanceLine(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiscreteHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            double result = DistanceFunctions.DiscreteHausdorffDistance(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDiscreteOrientedHausdorffDistance(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            double result = DistanceFunctions.DiscreteOrientedHausdorffDistance(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDistanceIndexed(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            double result = DistanceFunctions.DistanceIndexed(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTNearestPointsIndexed(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.NearestPointsIndexed(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTNearestPointsIndexedAll(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = DistanceFunctions.NearestPointsIndexedAll(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}

