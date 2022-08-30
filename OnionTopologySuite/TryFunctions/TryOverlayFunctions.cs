using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryOverlayFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryIntersection(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Intersection(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryUnion(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Union(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySymDifference(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.SymDifference(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDifference(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Difference(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryDifferenceBa(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.DifferenceBa(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryUnaryUnion(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = OverlayFunctions.UnaryUnion(a);
        return wKBWriter.Write(result);
    }

    public static byte[] TryUnionUsingGeometryCollection(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.UnionUsingGeometryCollection(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] TryClip(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = OverlayFunctions.Clip(a, mask);
        return wKBWriter.Write(result);
    }
}
