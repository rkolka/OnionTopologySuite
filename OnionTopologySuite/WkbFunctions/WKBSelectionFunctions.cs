using System;
using System.Collections.Generic;
using NetTopologySuite.Geometries;
using NetTopologySuite.Operation.Distance;

using Open.Topology.TestRunner.Functions;

public static class WKBSelectionFunctions
{
    private static readonly NetTopologySuite.IO.WKBReader wKBReader = new NetTopologySuite.IO.WKBReader();
    private static readonly NetTopologySuite.IO.WKBWriter wKBWriter = new NetTopologySuite.IO.WKBWriter();

    public static byte[] WKBIntersects(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Intersects(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBCovers(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Covers(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBCoveredBy(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.CoveredBy(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBDisjoint(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Disjoint(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBValid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Valid(a);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBInvalid(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.Invalid(a);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBAreaGreater(byte[] wKBa, double minArea)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaGreater(a, minArea);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBAreaZero(byte[] wKBa)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry result = SelectionFunctions.AreaZero(a);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.Within(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBInteriorPointWithin(byte[] wKBa, byte[] wKBmask)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.InteriorPointWithin(a, mask);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBwithinDistance(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistance(a, mask, maximumDistance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBwithinDistanceIndexed(byte[] wKBa, byte[] wKBmask, double maximumDistance)
    {
        Geometry a = wKBReader.Read(wKBa);
        Geometry mask = wKBReader.Read(wKBmask);
        Geometry result = SelectionFunctions.withinDistanceIndexed(a, mask, maximumDistance);
        return wKBWriter.Write(result);
    }

    public static byte[] WKBFirstNComponents(byte[] wKBGeom, int n)
    {
        Geometry g = wKBReader.Read(wKBGeom);
        Geometry result = SelectionFunctions.FirstNComponents(g, n);
        return wKBWriter.Write(result);
    }
}

