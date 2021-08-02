using System.Collections.Generic;
using NetTopologySuite.Geometries;
using NetTopologySuite.Utilities;

using Open.Topology.TestRunner.Functions;

public static class WKBOverlayFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBIntersection(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Intersection(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBUnion(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Union(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSymDifference(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.SymDifference(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDifference(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.Difference(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDifferenceBa(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.DifferenceBa(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBUnaryUnion(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = OverlayFunctions.UnaryUnion(a);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBUnionUsingGeometryCollection(byte[] wKBa, byte[] wKBb)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry b = wKBReader.Read(wKBb);
        Geometry result = OverlayFunctions.UnionUsingGeometryCollection(a, b);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBClip(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = OverlayFunctions.Clip(a, mask);
        return wKBWriter.Write(result);
    }
}
