using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBSortingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBSortByLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByLength(g);
        return wKBWriter.Write(result);
    }


    public static byte[] WKBSortByArea(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByArea(g);
        return wKBWriter.Write(result);
    }


    public static byte[] WKBSortByHilbertCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByHilbertCode(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSortByMortonCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByMortonCode(g);
        return wKBWriter.Write(result);
    }

}

