using NetTopologySuite.Algorithm.Construct;
using NetTopologySuite.Geometries;



/// <summary>
/// Experiments using NTS directly
/// ,Otherwise, look at folder WKBFunctions.
/// </summary>
public static class OnionTopologySuite
{



    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    // to write wkb, use Geometry.ToBinary(), but for some geometry types (GeometryCollection) it is not available.

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

    public static byte[] WKBConcaveHull(byte[] geomwkb, double tolerance)
    {
        Geometry geometry = wKBReader.Read(geomwkb);
        //return new ConcaveHull(geometry, tolerance).GetResult().ToBinary();
        return null; // not implemented in NTS
    }



}
