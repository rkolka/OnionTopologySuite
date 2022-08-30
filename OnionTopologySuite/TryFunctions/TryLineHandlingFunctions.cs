using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryLineHandlingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] TryMergeLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.MergeLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TrySequenceLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.SequenceLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryExtractLines(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractLines(g);
        return wKBWriter.Write(result);
    }

    public static byte[] TryExtractSegments(byte[] wKBGeom)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractSegments(g);
        return wKBWriter.Write(result);
    }
    public static byte[] TryExtractChains(byte[] wKBGeom, int maxChainSize)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.ExtractChains(g, maxChainSize);
        return wKBWriter.Write(result);
    }


    public static byte[] TryDissolve(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = LineHandlingFunctions.Dissolve(geom);
        return wKBWriter.Write(result);
    }
}
