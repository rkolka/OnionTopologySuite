using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TryLineSegmentFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static bool TrySegmentIntersects(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        bool result = LineSegmentFunctions.SegmentIntersects(g1, g2);
        return result;
    }

    public static byte[] TrySegmentIntersection(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LineSegmentFunctions.SegmentIntersection(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySegmentIntersectionDd(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LineSegmentFunctions.SegmentIntersectionDd(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryLineIntersection(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LineSegmentFunctions.LineIntersection(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] TryLineIntersectionDD(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LineSegmentFunctions.LineIntersectionDD(g1, g2);
        return wKBWriter.Write(result);
    }
    public static byte[] TryReflectPoint(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = LineSegmentFunctions.ReflectPoint(g1, g2);
        return wKBWriter.Write(result);
    }
}

