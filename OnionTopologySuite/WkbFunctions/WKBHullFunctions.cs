using NetTopologySuite.Geometries;
using NetTopologySuite.Algorithm.Hull;

public static class WKBHullFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static byte[] WKBConcaveHullByLength(byte[] geomwkb, double maxLength, bool isHolesAllowed)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return ConcaveHull.ConcaveHullByLength(geometry, maxLength, isHolesAllowed).ToBinary();
    }

    public static byte[] WKBConcaveHullByLengthRatio(byte[] geomwkb, double lengthRatio, bool isHolesAllowed)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return ConcaveHull.ConcaveHullByLengthRatio(geometry, lengthRatio, isHolesAllowed).ToBinary();
    }

    public static byte[] WKBPolygonHull(byte[] geomwkb, double vertexNumFraction)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return PolygonHull.Hull(geometry, vertexNumFraction).ToBinary();
    }

    public static byte[] WKBPolygonHullByAreaDelta(byte[] geomwkb, double areaDeltaRatio)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return PolygonHull.HullByAreaDelta(geometry, areaDeltaRatio).ToBinary();
    }

}

