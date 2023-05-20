using NetTopologySuite;
using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTOverlayFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader(new NtsGeometryServices(GeometryOverlay.NG));
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTIntersection(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.Intersection(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTUnion(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.Union(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSymDifference(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.SymDifference(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDifference(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.Difference(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTDifferenceBa(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.DifferenceBa(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTUnaryUnion(byte[] wKBa)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry result = OverlayFunctions.UnaryUnion(a);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTUnionUsingGeometryCollection(byte[] wKBa, byte[] wKBb)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry b = wKBReader.Read(wKBb);
            Geometry result = OverlayFunctions.UnionUsingGeometryCollection(a, b);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTClip(byte[] wKBa, byte[] wKBmask)
    {
        try
        {
            Geometry a = wKBReader.Read(wKBa);
            Geometry mask = wKBReader.Read(wKBmask);
            Geometry result = OverlayFunctions.Clip(a, mask);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}
