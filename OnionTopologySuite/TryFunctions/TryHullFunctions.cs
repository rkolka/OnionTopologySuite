using NetTopologySuite.Geometries;
using NetTopologySuite.Algorithm.Hull;
using NetTopologySuite.Simplify;

public static class TryHullFunctions
{


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();

    public static byte[] TryConcaveHullByLength(byte[] geomwkb, double maxLength, bool isHolesAllowed)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return ConcaveHull.ConcaveHullByLength(geometry, maxLength, isHolesAllowed).ToBinary();
    }

    public static byte[] TryConcaveHullByLengthRatio(byte[] geomwkb, double lengthRatio, bool isHolesAllowed)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return ConcaveHull.ConcaveHullByLengthRatio(geometry, lengthRatio, isHolesAllowed).ToBinary();
    }

    public static byte[] TryPolygonHull(byte[] geomwkb, bool isOuter, double vertexNumFraction)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return PolygonHullSimplifier.Hull(geometry, isOuter, vertexNumFraction).ToBinary();
    }

    public static byte[] TryPolygonHullByAreaDelta(byte[] geomwkb, bool isOuter, double areaDeltaRatio)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        return PolygonHullSimplifier.HullByAreaDelta(geometry, isOuter, areaDeltaRatio).ToBinary();
    }

}

