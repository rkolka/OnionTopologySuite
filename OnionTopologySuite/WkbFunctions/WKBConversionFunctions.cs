using System.Collections.Generic;
using NetTopologySuite.Geometries;
using NetTopologySuite.Geometries.Utilities;
using NetTopologySuite.Utilities;

using Open.Topology.TestRunner.Functions;

public static class WKBConversionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBPointsToLine(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConversionFunctions.PointsToLine(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBLineToPolygon(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = ConversionFunctions.LineToPolygon(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBToPoints(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToPoints(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBToLines(byte[] wKBGeom1, byte[] wKBGeom2)
    {
        Geometry g1 = wKBReader.Read(wKBGeom1);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToLines(g1, g2);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBToGeometryCollection(byte[] wKBGeom, byte[] wKBGeom2)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry g2 = wKBReader.Read(wKBGeom2);
        Geometry result = ConversionFunctions.ToGeometryCollection(g, g2);
        return wKBWriter.Write(result);
    }

}

