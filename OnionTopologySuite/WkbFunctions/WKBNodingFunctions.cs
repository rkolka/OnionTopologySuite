using System.Collections.Generic;
using System.Linq;
using NetTopologySuite.Algorithm;
using NetTopologySuite.Geometries;
using NetTopologySuite.Geometries.Utilities;
using NetTopologySuite.Noding;
using NetTopologySuite.Noding.Snapround;
using NetTopologySuite.Precision;
using NetTopologySuite.Utilities;

using Open.Topology.TestRunner.Functions;

public static class WKBNodingFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static bool WKBIsNodingValid(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        bool result = NodingFunctions.IsNodingValid(geom);
        return result;
    }

    public static bool WKBIsSegmentNodingValid(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        bool result = NodingFunctions.IsSegmentNodingValid(geom);
        return result;
    }

    public static byte[] WKBFindOneNode(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindOneNode(geom);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBFindNodes(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindNodes(geom);
        return wKBWriter.Write(result);
    }


    public static byte[] WKBFindInteriorNodes(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.FindInteriorNodes(geom);
        return wKBWriter.Write(result);
    }

    public static int WKBIntersectionCount(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        int result = NodingFunctions.IntersectionCount(geom);
        return result;
    }
    public static int WKBInteriorIntersectionCount(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        int result = NodingFunctions.InteriorIntersectionCount(geom);
        return result;
    }

    public static byte[] WKBMCIndexNodingWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBMCIndexNoding(byte[] wKBGeom)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNoding(geom);
        return wKBWriter.Write(result);
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
    public static byte[] WKBSnapRoundWithPrecision(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.MCIndexNodingWithPrecision(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

    /// <summary>
    /// Runs a ScaledNoder on input.
    /// Input vertices should be rounded to precision model.
    /// </summary>
    /// <param name="geom"></param>
    /// <param name="scaleFactor"></param>
    /// <returns>The noded geometry</returns>
    public static byte[] WKBScaledNoding(byte[] wKBGeom, double scaleFactor)
    {
        Geometry geom = wKBReader.Read(wKBGeom);
        Geometry result = NodingFunctions.ScaledNoding(geom, scaleFactor);
        return wKBWriter.Write(result);
    }

}

