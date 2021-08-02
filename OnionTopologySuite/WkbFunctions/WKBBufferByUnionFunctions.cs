using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;
using NetTopologySuite.Utilities;

using Open.Topology.TestRunner.Functions;

public static class WKBBufferByUnionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();
    public static byte[] WKBComponentBuffers(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.ComponentBuffers(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferByComponents(byte[] wKBGeom, double distance)
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
    public static byte[] WKBBufferBySegments(byte[] wKBGeom, double distance)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.BufferBySegments(g, distance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBBufferByChains(byte[] wKBGeom, double distance, int maxChainSize)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = BufferByUnionFunctions.BufferByChains(g, distance, maxChainSize);
        return wKBWriter.Write(result);
    }
}
