using NetTopologySuite.Geometries;
using NetTopologySuite.Algorithm.Construct;

public static class WKBMaximumCircleFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    /**
     * LargestEmptyCircle.cs
     * public static Point GetCenter(Geometry obstacles, double tolerance)
     * public static LineString GetRadiusLine(Geometry obstacles, double tolerance)
     * public Point GetCenter()
     * public Point GetRadiusPoint()
     * public LineString GetRadiusLine()
     * public int CompareTo(Cell o)
     * 
     * MaximumInscribedCircle.cs
     * public static Point GetCenter(Geometry polygonal, double tolerance)
     * public static LineString GetRadiusLine(Geometry polygonal, double tolerance)
     * public Point GetCenter()
     * public Point GetRadiusPoint()
     * public LineString GetRadiusLine()
     * public int CompareTo(Cell o)
     */

    public static byte[] WKBMaximumInscribedCircle(byte[] geomwkb, double tolerance)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return new MaximumInscribedCircle(geometry, tolerance).GetRadiusLine().ToBinary();
    }

    public static byte[] WKBLargestEmptyCircle(byte[] geomwkb, double tolerance)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return new LargestEmptyCircle(geometry, tolerance).GetRadiusLine().ToBinary();
    }
}

