using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class TryBufferByUnionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();
    public static byte[] TryComponentBuffers(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.ComponentBuffers(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] TryBufferByComponents(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.BufferByComponents(g, distance);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Buffer polygons by buffering the individual boundary segments and
    /// either unioning or differencing them.
    /// </summary>
    /// <param name="g"></param>
    /// <param name="distance"></param>
    /// <returns>The buffer geometry</returns>
    public static byte[] TryBufferBySegments(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.BufferBySegments(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] TryBufferByChains(byte[] wKBGeom, double distance, int maxChainSize)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.BufferByChains(g, distance, maxChainSize);
        return wKBWriter.Write(result);
    }
}
