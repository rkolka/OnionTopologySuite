using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKBLineHandlingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBMergeLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.MergeLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBSequenceLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.SequenceLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBExtractLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBExtractSegments(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractSegments(g);
        return wKBWriter.Write(result);
    }
    public static byte[] WKBExtractChains(byte[] wKBGeom, int maxChainSize)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractChains(g, maxChainSize);
        return wKBWriter.Write(result);
    }


    public static byte[] WKBDissolve(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.Dissolve(geom);
        return wKBWriter.Write(result);
    }
}
