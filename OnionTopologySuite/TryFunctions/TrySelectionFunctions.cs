using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TrySelectionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryIntersects(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Intersects(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TryCovers(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Covers(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TryCoveredBy(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.CoveredBy(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDisjoint(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Disjoint(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TryValid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Valid(a);
        return wKBWriter.Write(result);
    }

    public static byte[] TryInvalid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Invalid(a);
        return wKBWriter.Write(result);
    }

    public static byte[] TryAreaGreater(byte[] wKBa, double minArea)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaGreater(a, minArea);
        return wKBWriter.Write(result);
    }

    public static byte[] TryAreaZero(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaZero(a);
        return wKBWriter.Write(result);
    }

    public static byte[] TryWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Within(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TryInteriorPointWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.InteriorPointWithin(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] TrywithinDistance(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistance(a, mask, maximumDistance);
        return wKBWriter.Write(result);
    }

    public static byte[] TrywithinDistanceIndexed(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistanceIndexed(a, mask, maximumDistance);
        return wKBWriter.Write(result);
    }

    public static byte[] TryFirstNComponents(byte[] wKBGeom, int n)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SelectionFunctions.FirstNComponents(g, n);
        return wKBWriter.Write(result);
    }
}

