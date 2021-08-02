using System.Collections.Generic;
using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;
using NetTopologySuite.Operation.Overlay.Snap;

using Open.Topology.TestRunner.Functions;

/// <summary>
/// Implementations for various geometry functions.
/// </summary>
/// <author>Martin Davis</author>
public static class WKBGeometryFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static double WKBLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = GeometryFunctions.Length(g);
        return result;
    }
    public static double WKBArea(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        double result = GeometryFunctions.Area(g);
        return result;
    }

    public static bool WKBIsCCW(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsCCW(g);
        return result;
    }

    public static bool WKBIsSimple(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsSimple(g);
        return result;
    }
    public static bool WKBIsValid(byte[] wKBGeom) {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsValid(g);
        return result;
    }
    public static bool WKBIsRectangle(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsRectangle(g);
        return result;
    }
    public static bool WKBIsClosed(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        bool result = GeometryFunctions.IsClosed(g);
        return result;
    }

    public static byte[] WKBEnvelope(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Envelope(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBReverse(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Reverse(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBNormalize(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.Normalize(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSnap(byte[] wKBGeom, byte[] wKBGeom2, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom); 
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = GeometryFunctions.Snap(g, g2, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBGetGeometryN(byte[] wKBGeom, int i)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetGeometryN(g, i);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBGetPolygonShell(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonShell(g);
        return wKBWriter.Write(result);
    }

   
    public static byte[] WKBGetPolygonHoles(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonHoles(geom);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBGetPolygonHoleN(byte[] wKBGeom, int i)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetPolygonHoleN(g, i);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBGetCoordinates(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = GeometryFunctions.GetCoordinates(g);
        return wKBWriter.Write(result);
    }
}

