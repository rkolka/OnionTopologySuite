using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public class TryLineSegmentFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTSegmentIntersects(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            bool result = LineSegmentFunctions.SegmentIntersects(g1, g2);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSegmentIntersection(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LineSegmentFunctions.SegmentIntersection(g1, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSegmentIntersectionDd(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LineSegmentFunctions.SegmentIntersectionDd(g1, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTLineIntersection(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LineSegmentFunctions.LineIntersection(g1, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTLineIntersectionDD(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LineSegmentFunctions.LineIntersectionDD(g1, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTReflectPoint(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        try
        {
            Geometry g1 = wKBReader.Read(wKBGeom1);
            Geometry g2 = wKBReader.Read(wKBGeom2);
            Geometry result = LineSegmentFunctions.ReflectPoint(g1, g2);
            return result.ToString();
                    }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}

