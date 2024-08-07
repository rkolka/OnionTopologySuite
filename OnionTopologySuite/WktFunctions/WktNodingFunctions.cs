﻿using NetTopologySuite.Geometries;

using Open.Topology.TestRunner.Functions;

public static class WKTNodingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static string WKTIsNodingValid(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            bool result = NodingFunctions.IsNodingValid(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTIsSegmentNodingValid(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            bool result = NodingFunctions.IsSegmentNodingValid(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTFindOneNode(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.FindOneNode(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTFindNodes(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.FindNodes(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }


    public static string WKTFindInteriorNodes(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.FindInteriorNodes(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTIntersectionCount(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            int result = NodingFunctions.IntersectionCount(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }
    public static string WKTInteriorIntersectionCount(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            int result = NodingFunctions.InteriorIntersectionCount(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTMCIndexNodingWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    public static string WKTMCIndexNoding(byte[] wKBGeom)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.MCIndexNoding(geom);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    /// <summary>
    /// Reduces precision pointwise, then snap-rounds.
    /// Note that output set may not contain non-unique linework
    /// (and thus cannot be used as input to Polygonizer directly).
    /// UnaryUnion is one way to make the linework unique.
    /// </summary>
    /// <param name="geom">A geometry containing linework to node</param>
    /// <param name="scaleFactor">The precision model scale factor to use</param>
    /// <returns>The noded, snap-rounded linework</returns>
    public static string WKTSnapRoundWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

    /// <summary>
    /// Runs a ScaledNoder on input.
    /// Input vertices should be rounded to precision model.
    /// </summary>
    /// <param name="geom"></param>
    /// <param name="scaleFactor"></param>
    /// <returns>The noded geometry</returns>
    public static string WKTScaledNoding(byte[] wKBGeom, double scaleFactor)
    {
        try
        {
            Geometry geom = wKBReader.Read(wKBGeom);
            Geometry result = NodingFunctions.ScaledNoding(geom, scaleFactor);
            return result.ToString();
        }
        catch (System.Exception e)
        {
            return e.ToString();
        }
    }

}

