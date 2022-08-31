using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTLineHandlingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTMergeLines(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.MergeLines(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTSequenceLines(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.SequenceLines(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTExtractLines(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.ExtractLines(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTExtractSegments(byte[] wKBGeom)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.ExtractSegments(g);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTExtractChains(byte[] wKBGeom, int maxChainSize)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.ExtractChains(g, maxChainSize);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }


    public static string WKTDissolve(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = LineHandlingFunctions.Dissolve(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
}
