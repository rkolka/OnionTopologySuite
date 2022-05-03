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

    // Everything is in WKB....Functions.cs 


}
