using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TrySortingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TrySortByLength(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByLength(g);
        return wKBWriter.Write(result);
    }


    public static byte[] TrySortByArea(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByArea(g);
        return wKBWriter.Write(result);
    }


    public static byte[] TrySortByHilbertCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByHilbertCode(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySortByMortonCode(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SortingFunctions.SortByMortonCode(g);
        return wKBWriter.Write(result);
    }

}

