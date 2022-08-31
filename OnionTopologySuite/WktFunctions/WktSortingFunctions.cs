using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTSortingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTSortByLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByLength(g);
        return result.ToString();
    }


    public static string WKTSortByArea(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByArea(g);
        return result.ToString();
    }


    public static string WKTSortByHilbertCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByHilbertCode(g);
        return result.ToString();
    }

    public static string WKTSortByMortonCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByMortonCode(g);
        return result.ToString();
    }

}

