using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTSelectionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTIntersects(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Intersects(a, mask);
        return result.ToString();
    }

    public static string WKTCovers(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Covers(a, mask);
        return result.ToString();
    }

    public static string WKTCoveredBy(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.CoveredBy(a, mask);
        return result.ToString();
    }

    public static string WKTDisjoint(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Disjoint(a, mask);
        return result.ToString();
    }

    public static string WKTValid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Valid(a);
        return result.ToString();
    }

    public static string WKTInvalid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Invalid(a);
        return result.ToString();
    }

    public static string WKTAreaGreater(byte[] wKBa, double minArea)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaGreater(a, minArea);
        return result.ToString();
    }

    public static string WKTAreaZero(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaZero(a);
        return result.ToString();
    }

    public static string WKTWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Within(a, mask);
        return result.ToString();
    }

    public static string WKTInteriorPointWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.InteriorPointWithin(a, mask);
        return result.ToString();
    }

    public static string WKTwithinDistance(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistance(a, mask, maximumDistance);
        return result.ToString();
    }

    public static string WKTwithinDistanceIndexed(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistanceIndexed(a, mask, maximumDistance);
        return result.ToString();
    }

    public static string WKTFirstNComponents(byte[] wKBGeom, int n)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SelectionFunctions.FirstNComponents(g, n);
        return result.ToString();
    }
}

