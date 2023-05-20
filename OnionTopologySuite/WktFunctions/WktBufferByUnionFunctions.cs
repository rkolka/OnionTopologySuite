using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTBufferByUnionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();
    public static string WKTComponentBuffers(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferByUnionFunctions.ComponentBuffers(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferByComponents(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferByUnionFunctions.BufferByComponents(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    /// <summary>
    /// Buffer polygons by buffering the individual boundary segments and
    /// either unioning or differencing them.
    /// </summary>
    /// <param name="g"></param>
    /// <param name="distance"></param>
    /// <returns>The buffer geometry</returns>
    public static string WKTBufferBySegments(byte[] wKBGeom, double distance)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferByUnionFunctions.BufferBySegments(g, distance);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTBufferByChains(byte[] wKBGeom, double distance, int maxChainSize)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = BufferByUnionFunctions.BufferByChains(g, distance, maxChainSize);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }
}
