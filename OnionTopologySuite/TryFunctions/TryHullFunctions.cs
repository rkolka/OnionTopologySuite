using NetTopologySuite.Geometries;
using NetTopologySuite.Algorithm.Hull;
using NetTopologySuite.Simplify;

public static class WKTHullFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static string WKTConcaveHullByLength(byte[] geomwkb, double maxLength, bool isHolesAllowed)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return ConcaveHull.ConcaveHullByLength(geometry, maxLength, isHolesAllowed).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTConcaveHullByLengthRatio(byte[] geomwkb, double lengthRatio, bool isHolesAllowed)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return ConcaveHull.ConcaveHullByLengthRatio(geometry, lengthRatio, isHolesAllowed).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTPolygonHull(byte[] geomwkb, bool isOuter, double vertexNumFraction)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return PolygonHullSimplifier.Hull(geometry, isOuter, vertexNumFraction).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTPolygonHullByAreaDelta(byte[] geomwkb, bool isOuter, double areaDeltaRatio)
    {
        try
        {
            Geometry geometry = wKBReader.Read(geomwkb);
            return PolygonHullSimplifier.HullByAreaDelta(geometry, isOuter, areaDeltaRatio).ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

