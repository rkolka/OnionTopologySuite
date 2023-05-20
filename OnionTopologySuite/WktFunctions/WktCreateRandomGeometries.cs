using NetTopologySuite.Geometries;
using Open.Topology.TestRunner.Functions;
using System;

public static class WKTCreateRandomGeometryFunctions
{
    private static Random RND = new Random();


    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTRandomPointsInGrid(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomPointsInGrid(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomPoints(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomPoints(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomRadialPoints(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomRadialPoints(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    /// <summary>
    /// Create Halton points using bases 2 and 3.
    /// </summary>
    public static string WKTHaltonPoints(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.HaltonPoints(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    /// <summary>
    /// Create Halton points using bases 5 and 7.
    /// </summary>
    public static string WKTHaltonPoints57(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.HaltonPoints57(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    /// <summary>
    /// Create Halton points using provided bases.
    /// </summary>
    /// <param name="basei">Base 1</param>
    /// <param name="basej">Base 2</param>
    public static string WKTHaltonPointsWithBases(byte[] wKBGeom, int nPts, int basei, int basej)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.HaltonPointsWithBases(g, nPts, basei, basej);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomSegments(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomSegments(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomSegmentsInGrid(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomSegmentsInGrid(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomLineString(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomLineString(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

    public static string WKTRandomRectilinearWalk(byte[] wKBGeom, int nPts)
    {
        try
        {
            Geometry g = wKBReader.Read(wKBGeom);
            Geometry result = CreateRandomGeometryFunctions.RandomRectilinearWalk(g, nPts);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }

    }

}

