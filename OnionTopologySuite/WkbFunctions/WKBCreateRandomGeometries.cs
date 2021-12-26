using NetTopologySuite.Geometries;
using Open.Topology.TestRunner.Functions;
using System;

public static class WKBCreateRandomGeometryFunctions
{
    private static Random RND = new Random();


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBRandomPointsInGrid(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomPointsInGrid(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomPoints(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomPoints(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomRadialPoints(byte[] wKBGeom, int nPts)
    {

        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomRadialPoints(g, nPts);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Create Halton points using bases 2 and 3.
    /// </summary>
    public static byte[] WKBHaltonPoints(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.HaltonPoints(g, nPts);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Create Halton points using bases 5 and 7.
    /// </summary>
    public static byte[] WKBHaltonPoints57(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.HaltonPoints57(g, nPts);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Create Halton points using provided bases.
    /// </summary>
    /// <param name="basei">Base 1</param>
    /// <param name="basej">Base 2</param>
    public static byte[] WKBHaltonPointsWithBases(byte[] wKBGeom, int nPts, int basei, int basej)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.HaltonPointsWithBases(g, nPts, basei, basej);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomSegments(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomSegments(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomSegmentsInGrid(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomSegmentsInGrid(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomLineString(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomLineString(g, nPts);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBRandomRectilinearWalk(byte[] wKBGeom, int nPts)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = CreateRandomGeometryFunctions.RandomRectilinearWalk(g, nPts);
        return wKBWriter.Write(result);
    }

}

